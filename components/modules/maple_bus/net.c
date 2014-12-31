/*  maple_bus.c - The simplest kernel module.
 */
#include <linux/kernel.h>
#include <linux/init.h>
#include <linux/module.h>
#include <linux/slab.h>
#include <linux/io.h>
#include <linux/interrupt.h>
#include <linux/dmaengine.h>
#include <linux/dma-contiguous.h>
#include <linux/amba/xilinx_dma.h>

#include <linux/netdevice.h>
#include <linux/if_arp.h>

#include <linux/of_address.h>
#include <linux/of_device.h>
#include <linux/of_platform.h>

#include <asm/uaccess.h>
#include <linux/cdev.h>
#include <linux/spinlock.h>
#include <linux/fs.h>       /* everything... */

#include "hw.h"
#include "utils.h"
#include "dma.h"

/* Standard module information, edit as appropriate */
MODULE_LICENSE("GPL");
MODULE_AUTHOR
    ("Raul Rangel - ismell.org <ismell@ismell.org>");
MODULE_DESCRIPTION
    ("maple_bus - Sega Dreamcast Maple Bus Driver");

#define DRIVER_NAME "maple_bus"

/* Simple example of how to receive command line parameters to your module.
   Delete if you don't need them */
unsigned pause = 0x0;
unsigned loopback = 0x1;
char *mystr = "default";

module_param(pause, int, S_IRUGO);
module_param(loopback, int, S_IRUGO);
module_param(mystr, charp, S_IRUGO);

// Module Globals
static struct maple_bus_global *gp;

static int maple_bus_start_rx(struct net_device *netdev);

static void maple_bus_print_status(struct maple_bus_local *lp) {
  u32 control, status;
  struct maple_bus_chan_count rx_count, tx_count;
  control = maple_bus_read(lp, MAPLE_BUS_CONTROL_REG);
  status = maple_bus_read(lp, MAPLE_BUS_STATUS_REG);
  maple_bus_get_count(lp, MAPLE_BUS_TX_COUNT_REG, &tx_count);
  maple_bus_get_count(lp, MAPLE_BUS_RX_COUNT_REG, &rx_count);

  dev_err(lp->dev,
      "Control Register: 0x%08x\n"
      "  TX Enabled: %d, RX Enabled: %d, Loopback Enabled: %d\n"
      "  Reset TX: %d, Reset RX: %d\n"
      "  TX IRQ Enabled: %d, RX IRQ Enabled: %d\n",
      control,
      !!(control & MAPLE_BUS_ENABLE_TX),
      !!(control & MAPLE_BUS_ENABLE_RX),
      !!(control & MAPLE_BUS_ENABLE_LOOPBACK),
      !!(control & MAPLE_BUS_RESET_TX),
      !!(control & MAPLE_BUS_RESET_RX),
      !!(control & MAPLE_BUS_ENABLE_TX_IRQ),
      !!(control & MAPLE_BUS_ENABLE_RX_IRQ)
  );
  dev_err(lp->dev,
      "Status Register: 0x%08x\n"
      "  TX IRQ: %d, RX IRQ: %d\n"
      "  TX Buffered Packets: %d, TX Buffer Length: %d\n"
      "  RX Buffered Packets: %d, RX Buffer Length: %d\n",
      status,
      !!(status & MAPLE_BUS_TX_IRQ_STATUS),
      !!(status & MAPLE_BUS_RX_IRQ_STATUS),
      tx_count.packets, tx_count.length,
      rx_count.packets, rx_count.length
  );
}

struct maple_bus_async_dma_desc {
  struct net_device *netdev;
  struct dma_async_tx_descriptor *txd;
  dma_cookie_t cookie;
  struct sg_table sgt;
  struct sk_buff *skb;
  enum dma_transfer_direction direction;
};

/* Maps a skb into a scatterlist
 *
 * returns the number of scatterlist entries
 */
static int maple_bus_sbk_to_sgt(struct net_device *netdev, struct sk_buff *skb,
    struct sg_table *sgt) {

  struct maple_bus_local *lp = netdev_priv(netdev);
  int sg_n = 0;
  struct scatterlist *sg;
  unsigned int i;
  struct skb_frag_struct *frag;

  dev_info(lp->dev, "Mapping scatter list for skb 0x%p\n", skb);
  //skb_has_frag_list
  sg_n = 1 + skb_shinfo(skb)->nr_frags;

  dev_err(lp->dev, "total number of sgs: %d\n", sg_n);
  
  if (sg_alloc_table(sgt, sg_n, GFP_ATOMIC)) {
    dev_err(lp->dev, "Failed to allocate scatterlist\n");
    return -ENOMEM;
  }

  for_each_sg(sgt->sgl, sg, sgt->orig_nents, i) {
    if (i == 0) {
      dev_err(lp->dev, "Setting buffer 0x%p with length %d\n", skb->data,
          sg_n == 1 ? skb->len : skb->data_len);
      sg_set_buf(sg, skb->data, sg_n == 1 ? skb->len : skb->data_len);
    } else {
      frag = &skb_shinfo(skb)->frags[i - 1];
      dev_err(lp->dev, "Setting page 0x%p with offset %d and size %d\n", skb_frag_page(frag),
          frag->page_offset, skb_frag_size(frag));
      sg_set_page(sg, skb_frag_page(frag), frag->page_offset, skb_frag_size(frag));
    }
  }

  dev_info(lp->dev, "Mapped scatter list for skb 0x%p\n", skb);

  return 0;
}

/* DMA map a scatter list.
 *
 */
static int maple_bus_map_sgt(struct net_device *netdev, struct sg_table *sgt,
    enum dma_transfer_direction direction) {
  struct maple_bus_local *lp = netdev_priv(netdev);
  struct device *dev;

  dev_info(lp->dev, "maple_bus_map_sgt starting\n");

  if (direction == DMA_MEM_TO_DEV)
    dev = lp->global->tx_chan->device->dev;
  else if (direction == DMA_DEV_TO_MEM)
    dev = lp->global->rx_chan->device->dev;
  else
    return -EINVAL;

  sgt->nents = dma_map_sg(dev, sgt->sgl, sgt->orig_nents, direction);

  dev_info(lp->dev, "maple_bus_map_sgt mapped %d ents\n", sgt->nents);

  return sgt->nents;
}

static int maple_bus_unmap_sgt(struct net_device *netdev, struct sg_table *sgt,
    enum dma_transfer_direction direction) {
  struct maple_bus_local *lp = netdev_priv(netdev);
  struct device *dev;

  dev_info(lp->dev, "maple_bus_unmap_sgt starting\n");

  if (direction == DMA_MEM_TO_DEV)
    dev = lp->global->tx_chan->device->dev;
  else if (direction == DMA_DEV_TO_MEM)
    dev = lp->global->rx_chan->device->dev;
  else
    return -EINVAL;

  //TODO: nents or orig_nents?
  dma_unmap_sg(dev, sgt->sgl, sgt->nents, direction);

  dev_info(lp->dev, "maple_bus_unmap_sgt unmapped\n");

  return 0;
}

static int maple_bus_submit_dmadesc(struct net_device *netdev,
    struct maple_bus_async_dma_desc *dmadesc) {
  struct maple_bus_local *lp = netdev_priv(netdev);
  int err;

  dev_info(lp->dev, "maple_bus_submit_dmadesc submitting txd 0x%p", dmadesc->txd);

  dmadesc->cookie = dmaengine_submit(dmadesc->txd);

  if ((err = dma_submit_error(dmadesc->cookie))) {
    dev_err(lp->dev, "maple_bus_submit_dmadesc failed to submit txd");
    return err;
  }

  dev_info(lp->dev, "maple_bus_submit_dmadesc submitted txd 0x%p", dmadesc->txd);

  return 0;
}

static int maple_bus_free_dmadesc(struct net_device *netdev, struct maple_bus_async_dma_desc *dmadesc) {
  struct maple_bus_local *lp = netdev_priv(netdev);
  int err;

  dev_info(lp->dev, "maple_bus_free_dmadesc starting\n");

  if ((err = maple_bus_unmap_sgt(netdev, &dmadesc->sgt, dmadesc->direction))) {
    dev_info(lp->dev, "maple_bus_free_dmadesc failed to unmap sgt\n");
    return err;
  }

  sg_free_table(&dmadesc->sgt);
  kfree(dmadesc);

  dev_info(lp->dev, "maple_bus_free_dmadesc complete\n");

  return 0;
}

// Create the DMA descriptor
static int maple_bus_alloc_dmadesc(struct maple_bus_async_dma_desc **dmadescp, struct net_device *netdev,
    struct sk_buff *skb, enum dma_transfer_direction direction, dma_async_tx_callback callback) {
  struct maple_bus_local *lp = netdev_priv(netdev);
  struct maple_bus_async_dma_desc *dmadesc;
  struct sg_table *sgt;
  int err = -EFAULT;
  struct dma_chan *chan;

  dev_info(lp->dev, "maple_bus_alloc_dmadesc starting\n");

  if (direction == DMA_MEM_TO_DEV)
    chan = lp->global->tx_chan;
  else if (direction == DMA_DEV_TO_MEM)
    chan = lp->global->rx_chan;
  else
    return -EINVAL;

  if (!(dmadesc = kzalloc(sizeof(*dmadesc), GFP_ATOMIC))) {
    dev_err(lp->dev, "Failed to allocate dma desc");
    return -ENOMEM;
  }

  dmadesc->netdev = netdev;
  dmadesc->skb = skb;
  dmadesc->direction = direction;

  sgt = &dmadesc->sgt;

  // Map SKB to scattertable
  if ((err = maple_bus_sbk_to_sgt(netdev, skb, sgt))) {
    goto free_dmadesc;
  }

  // DMA Map sg_table
  if ((err = maple_bus_map_sgt(netdev, &dmadesc->sgt, dmadesc->direction) <= 0)) {
    dev_err(lp->dev, "Failed to map dma desc");
    goto free_sgt;
  }

  // Allocate txd
  dev_err(lp->dev, "Prepping SG list");

  if (!(dmadesc->txd = dmaengine_prep_slave_sg(chan, sgt->sgl, sgt->nents,
      dmadesc->direction, DMA_CTRL_ACK | DMA_PREP_INTERRUPT))) {
    dev_err(lp->dev, "Failed to prep sg list");
    goto free_mapping; //TODO: I don't know how to free a list
  }

  dmadesc->txd->callback = callback;
  dmadesc->txd->callback_param = dmadesc;

  *dmadescp = dmadesc;

  return 0;

free_mapping:
  maple_bus_unmap_sgt(netdev, &dmadesc->sgt, dmadesc->direction);

free_sgt:
  sg_free_table(&dmadesc->sgt);

free_dmadesc:
  kfree(dmadesc);

  return err;
}

// @context tasklet
static void maple_bus_slave_rx_callback(void *arg)
{
  struct maple_bus_async_dma_desc *dmadesc = arg;
  struct net_device *netdev = dmadesc->netdev;
  struct maple_bus_local *lp = netdev_priv(netdev);
  struct sk_buff *skb = dmadesc->skb;
  enum dma_status status;

  dev_info(lp->dev, "maple_bus_slave_rx_callback starting\n");

  status = dma_async_is_tx_complete(lp->global->rx_chan, dmadesc->cookie, NULL, NULL);
  if (status != DMA_COMPLETE) {
    dev_err(lp->dev, "We got rx completion callback but status isn't complete!!");
    return;
  }

  //TODO: We don't have  way of calculating the total number of bytes actually transfered :(

  dev_info(lp->dev, "maple_bus_slave_rx_callback receive skb 0x%p with data 0x%p of size %d\n", skb,
      skb->data, skb->len);

  //skb->mac.raw = netdev->dev_addr;
  skb->pkt_type = PACKET_HOST;
  skb->protocol = htons(ETH_P_MAPLE_BUS);
  skb->ip_summed = CHECKSUM_UNNECESSARY; /* don't check it */

  // Increment Stats
  netdev->stats.rx_packets++;
  netdev->stats.rx_bytes += dmadesc->skb->len;

  netif_receive_skb(skb);

  dmadesc->skb = NULL;

  if (maple_bus_free_dmadesc(netdev, dmadesc)) {
    dev_info(lp->dev, "maple_bus_slave_rx_callback failed to unmap dmadesc\n");
  }

  spin_lock(&lp->irq_lock);
  lp->pending_rx--;
  maple_bus_start_rx(netdev);
  spin_unlock(&lp->irq_lock);

  dev_info(lp->dev, "maple_bus_slave_rx_callback complete\n");
}

static int maple_bus_enqueue_rx(struct net_device *netdev, int size) {
  struct maple_bus_local *lp = netdev_priv(netdev);
  struct sk_buff *skb;
  struct maple_bus_async_dma_desc *dmadesc;
  int err;

  dev_info(lp->dev, "maple_bus_enqueue_rx starting\n");

  skb = netdev_alloc_skb(netdev, size);
  if (!skb) {
    dev_info(lp->dev, "maple_bus_enqueue_rx failed to alloc skb\n");
    return -ENOMEM;
  }

  skb_put(skb, size);

  err = maple_bus_alloc_dmadesc(&dmadesc, netdev, skb, DMA_DEV_TO_MEM,
      maple_bus_slave_rx_callback);
  if (err) {
    dev_info(lp->dev, "maple_bus_enqueue_rx failed to alloc dmadesc\n");
    goto free_skb;
  }

  skb_tx_timestamp(skb);

  if ((err = maple_bus_submit_dmadesc(netdev, dmadesc))) {
    goto free_dmadesc;
  }

  dev_info(lp->dev, "maple_bus_enqueue_rx complete\n");

  return 0;

free_dmadesc:
  //TODO: I don't know how to free the txd
  maple_bus_free_dmadesc(netdev, dmadesc);

free_skb:
  kfree_skb(skb);

  return err;
}

// This is locked by the lp->irq_lock
// Enque all dma transactions
static int maple_bus_start_rx(struct net_device *netdev) {
  struct maple_bus_local *lp = netdev_priv(netdev);
  struct maple_bus_chan_count count;
  int i = 0, err = 0;
  
  dev_info(lp->dev, "maple_bus_start_rx starting\n");

  maple_bus_get_count(lp, MAPLE_BUS_RX_COUNT_REG, &count);

  dev_info(lp->dev, "maple_bus_start_rx buffer has %d packets of size %d\n", count.packets,
      count.length);
  for (i = lp->pending_rx; i < count.packets; ++i) {
    if ((err = maple_bus_enqueue_rx(netdev, count.length))) {
      dev_info(lp->dev, "maple_bus_start_rx failed to enqueue rx transaction\n");
      return err;
    }

    lp->pending_rx++;
  }

  dev_info(lp->dev, "maple_bus_start_rx done with %d pending rx transactions\n", lp->pending_rx);

  return 0;
}

static void maple_bus_slave_tx_callback(void *arg)
{
  struct maple_bus_async_dma_desc *dmadesc = arg;
  struct net_device *netdev = dmadesc->netdev;
  struct maple_bus_local *lp = netdev_priv(netdev);
  struct sg_table *sgt = &dmadesc->sgt;
  enum dma_status status;
  struct scatterlist *sg;
  int total_len = 0, i = 0;

  dev_info(lp->dev, "maple_bus_slave_tx_callback starting\n");

  //netif_printk(lp, tx_done, KERN_DEBUG, netdev,
  //    "cb[%d]->status = 0x%04X\n",
  //    (int)(((void*)cb - (void*)nic->cbs)/sizeof(struct cb)),
  //    cb->status);

  status = dma_async_is_tx_complete(lp->global->tx_chan, dmadesc->cookie, NULL, NULL);
  if (status != DMA_COMPLETE) {
    dev_err(lp->dev, "We got completion callback but status isn't complete!!");
    return;
  }

  for_each_sg(sgt->sgl, sg, sgt->orig_nents, i) {
    total_len += sg_dma_len(sg);
  }

  netdev->stats.tx_packets++;
  netdev->stats.tx_bytes += total_len;

  dev_info(lp->dev, "maple_bus_slave_tx_callback consume skb 0x%p\n", dmadesc->skb);
  dev_consume_skb_any(dmadesc->skb);

  dmadesc->skb = NULL;

  maple_bus_free_dmadesc(netdev, dmadesc);

  /* Recover from running out of Tx resources in xmit_frame */
  if (unlikely(netif_queue_stopped(netdev)))
    netif_wake_queue(netdev);

  maple_bus_print_status(lp);

  dev_info(lp->dev, "maple_bus_slave_tx_callback complete\n");
}

static int maple_bus_xmit_prepare(struct net_device *netdev, struct sk_buff *skb)
{
  struct maple_bus_local *lp = netdev_priv(netdev);
  struct maple_bus_async_dma_desc *dmadesc;
  int err;

  dev_info(lp->dev, "maple_bus_xmit_prepare starting\n");

  err = maple_bus_alloc_dmadesc(&dmadesc, netdev, skb, DMA_MEM_TO_DEV,
      maple_bus_slave_tx_callback);
  if (err) {
    dev_info(lp->dev, "maple_bus_xmit_prepare failed to alloc dmadesc\n");
    return err;
  }

  skb_tx_timestamp(skb);

  if ((err = maple_bus_submit_dmadesc(netdev, dmadesc))) {
    goto free_dmadesc;
  }

  dev_info(lp->dev, "maple_bus_xmit_prepare complete\n");

  return 0;

free_dmadesc:
  //TODO: I don't know how to free the txd
  maple_bus_free_dmadesc(netdev, dmadesc);

  return err;
}

static netdev_tx_t maple_bus_net_xmit_frame(struct sk_buff *skb,
           struct net_device *netdev)
{
  struct maple_bus_local *lp = netdev_priv(netdev);
  int err;

  err = maple_bus_xmit_prepare(netdev, skb);

  switch (err) {
  case 0:
    netif_printk(lp, tx_err, KERN_DEBUG, netdev,
        "Packet enqueued\n");
    break;
  case -ENOSPC:
    /* We queued the skb, but now we're out of space. */
    netif_printk(lp, tx_err, KERN_DEBUG, netdev,
           "No space for CB\n");
    netif_stop_queue(netdev);
    break;
  case -ENOMEM:
    /* This is a hard error - log it. */
    netif_printk(lp, tx_err, KERN_DEBUG, netdev,
           "Out of Tx resources, returning skb\n");
    netif_stop_queue(netdev);
    return NETDEV_TX_BUSY;
  default:
    netif_printk(lp, tx_err, KERN_DEBUG, netdev,
        "Could not enqueue packet for an unknown reason\n");
    netif_stop_queue(netdev);
    return NETDEV_TX_BUSY;
  }

  dma_async_issue_pending(lp->global->tx_chan);

  return NETDEV_TX_OK;
}

static irqreturn_t maple_bus_irq(int irq, void *args)
{
  struct net_device *netdev = args;
  struct maple_bus_local *lp = netdev_priv(netdev);
  u32 status, clear = 0;
  irqreturn_t rc = IRQ_NONE;

  dev_info(lp->dev, "maple_bus_irq starting\n");

  maple_bus_print_status(lp);
  
  spin_lock(&lp->irq_lock);

  status = maple_bus_read(lp, MAPLE_BUS_STATUS_REG);

  if (status & MAPLE_BUS_TX_IRQ_STATUS) {
    dev_info(lp->dev, "maple_bus_irq tx IRQ received\n");
    clear |= MAPLE_BUS_CLEAR_IRQ;
  }

  if (status & MAPLE_BUS_RX_IRQ_STATUS) {
    dev_info(lp->dev, "maple_bus_irq rx IRQ received\n");
    clear |= MAPLE_BUS_CLEAR_IRQ;
    //TODO: Move this into a tasklet
    maple_bus_start_rx(netdev);
  }

  if (clear) {
    dev_info(lp->dev, "maple_bus_irq clearing IRQ: 0x%08x\n", clear);
    maple_bus_write(lp, MAPLE_BUS_STATUS_REG, clear);
    rc = IRQ_HANDLED;
  }
  
  /* Unlock the device and we are done */
  spin_unlock(&lp->irq_lock);

  return rc;
}


static int maple_bus_up(struct net_device *netdev)
{
  struct maple_bus_local *lp = netdev_priv(netdev);
  int err;
  u32 control = 0;

  dev_info(lp->dev, "maple_bus_up starting\n");

  maple_bus_reset_hw(lp);

  dev_info(lp->dev, "maple_bus_up requesting irq %d\n", lp->irq);
  if ((err = request_irq(lp->irq, maple_bus_irq, 0, netdev->name, netdev))) {
    dev_err(lp->dev, "Could not allocate interrupt %d.\n", lp->irq);
    return -EBUSY;
  }
  
  control |= MAPLE_BUS_ENABLE_RX | MAPLE_BUS_ENABLE_TX;
  control |= MAPLE_BUS_ENABLE_TX_IRQ | MAPLE_BUS_ENABLE_RX_IRQ;

  if (lp->global->loopback) {
    control |= MAPLE_BUS_ENABLE_LOOPBACK;
  }

  maple_bus_write(lp, MAPLE_BUS_CONTROL_REG, control);

  maple_bus_print_status(lp);

  dev_info(lp->dev, "maple_bus_up starting queue\n");
  netif_wake_queue(netdev);

  dev_info(lp->dev, "maple_bus_up started\n");
  
  return 0;
}

static void maple_bus_down(struct net_device *netdev)
{
  struct maple_bus_local *lp = netdev_priv(netdev);

  dev_info(lp->dev, "maple_bus_down starting\n");

  netif_stop_queue(netdev);
  maple_bus_reset_hw(lp);
  dev_info(lp->dev, "maple_bus_down freeing irq %d\n", lp->irq);
  free_irq(lp->irq, netdev);
  //del_timer_sync(&nic->watchdog);
  netif_carrier_off(netdev);

  dev_info(lp->dev, "maple_bus_down done\n");
}

static int maple_bus_net_open(struct net_device *netdev)
{
  struct maple_bus_local *lp = netdev_priv(netdev);
  int err = 0;

  //netif_carrier_off(netdev); //TODO: We might need this once we get sense
  if ((err = maple_bus_up(netdev)))
    netif_err(lp, ifup, netdev, "Cannot open interface, aborting\n");
  return err;
}

static int maple_bus_net_stop(struct net_device *netdev)
{
  maple_bus_down(netdev);

  return 0;
}

static int maple_bus_net_validate_addr(struct net_device *netdev) {
  struct maple_bus_local *lp = netdev_priv(netdev);

  dev_info(lp->dev, "Validating mac address\n");

  return 0;
}

static const struct net_device_ops maple_bus_netdev_ops = {
  .ndo_open   = maple_bus_net_open,
  .ndo_stop   = maple_bus_net_stop,
  .ndo_start_xmit   = maple_bus_net_xmit_frame,
  .ndo_validate_addr  = maple_bus_net_validate_addr,
  //.ndo_set_rx_mode  = e100_set_multicast_list,
  //.ndo_set_mac_address  = e100_set_mac_address,
  //.ndo_change_mtu   = e100_change_mtu,
  //.ndo_do_ioctl   = e100_do_ioctl,
  //.ndo_tx_timeout   = e100_tx_timeout,
  //.ndo_poll_controller  = e100_netpoll,
  //.ndo_set_features = e100_set_features,
};

static void maple_bus_net_init(struct net_device *netdev) {  
  netdev->tx_queue_len = 10;
  netdev->mtu    = MAPLE_BUS_DATA_LEN;
  netdev->hard_header_len  = MAPLE_BUS_HLEN;
  netdev->addr_len         = MAPLE_BUS_ALEN;
  netdev->type             = ARPHRD_NONE;
  /* keep the default flags, just add NOARP */
  netdev->flags           |= IFF_NOARP;
  netdev->features        |= NETIF_F_HW_CSUM | NETIF_F_HIGHDMA; // | NETIF_F_SG
  netdev->netdev_ops       = &maple_bus_netdev_ops;
  //TODO(rrangel): netdev->header_ops   = &maple_bus_header_ops;
}

static int maple_bus_probe(struct platform_device *pdev)
{
  struct resource *r_irq; /* Interrupt resources */
	struct resource *r_mem; /* IO mem resources */
  int err;
	
  struct device *dev = &pdev->dev;
  struct net_device *netdev;
  struct maple_bus_local *lp;
	
	dev_info(dev, "Device Tree Probing\n");

  netdev = devm_alloc_netdev(dev, sizeof(*lp), "maplebus%d", maple_bus_net_init);
  if (IS_ERR(netdev))
    return PTR_ERR(netdev);

  memset(netdev->dev_addr, 0, MAPLE_BUS_ALEN);

  dev_set_drvdata(dev, netdev);

  lp = netdev_priv(netdev);
  lp->dev = dev;
  lp->magic = MAPLE_BUS_LOCAL_MAGIC;
  lp->global = gp;
  lp->msg_enable = 0xFFFF;
  spin_lock_init(&lp->cmd_lock);
  spin_lock_init(&lp->irq_lock);

  /* Get iospace for the device */
  if (!(r_mem = platform_get_resource(pdev, IORESOURCE_MEM, 0))) {
    dev_err(dev, "invalid address\n");
    return -ENODEV;
  }

  /* Remap IO for device */
  lp->base_addr = devm_ioremap_resource(dev, r_mem);
  if (IS_ERR(lp->base_addr)) {
    dev_info(dev, "Failed to remap IO\n");
    return PTR_ERR(lp->base_addr);
  }

  /* Make sure we have the correct device */
  if ((err = maple_bus_verify_magic(lp))) {
    dev_info(dev, "failed to validate hw magic\n");
    return err;
  }

  /* Get IRQ for the device */
  if (!(r_irq = platform_get_resource(pdev, IORESOURCE_IRQ, 0))) {
    dev_info(dev, "no IRQ found\n");
    return -ENODEV;
  }
	
  lp->irq = r_irq->start;

	dev_info(dev,"maple_bus at 0x%08x with irq %d",
  		(unsigned int __force)lp->base_addr,
      lp->irq
  );

  maple_bus_print_status(lp);

  if ((err = devm_register_netdev(dev, netdev))) {
    netif_err(lp, probe, netdev, "Cannot register net device, aborting\n");
    return err;
  }

	return 0;
}

static int maple_bus_remove(struct platform_device *pdev)
{
	struct device *dev = &pdev->dev;
	// All the freeing is handled by devm
	dev_set_drvdata(dev, NULL);
	return 0;
}

#ifdef CONFIG_OF
static struct of_device_id maple_bus_of_match[] = {
	{ .compatible = "ismell.org,rxMapleBus-1.0", },
	{ /* end of list */ },
};
MODULE_DEVICE_TABLE(of, maple_bus_of_match);
#else
# define maple_bus_of_match
#endif


static struct platform_driver maple_bus_driver = {
	.driver = {
		.name = DRIVER_NAME,
		.owner = THIS_MODULE,
		.of_match_table	= maple_bus_of_match,
	},
	.probe		= maple_bus_probe,
	.remove		= maple_bus_remove,
};

static int __init maple_bus_init(void)
{
  int err;
	printk("<1>Hello module world.\n");
	printk("<1>Module parameters were pause (0x%08x), loopback (0x%08x) and \"%s\"\n", pause, loopback,
	       mystr);

  gp = kzalloc(sizeof(*gp), GFP_ATOMIC);
  if (!gp) {
    printk(KERN_ALERT "Failed to alloc module buffer\n");
    return -EFAULT;
  }

  // TODO: We should find a way to find the DMA IP linked to the maple bus
  if ((err = maple_bus_find_dma_channels(gp, 0))) {
    printk(KERN_ALERT "Failed to find DMA channels\n");
    goto free_global;
  }

  gp->loopback = loopback;
  gp->pause = pause;

  if ((err = platform_driver_register(&maple_bus_driver))) {
    printk(KERN_ALERT "Failed to register maple_bus_driver\n");
    goto free_dma;
  }

	return 0;

free_dma:
  maple_bus_free_dma_channels(gp);

free_global:
  kfree(gp);
  gp = NULL;

  return -EFAULT;
}

static void __exit maple_bus_exit(void)
{
  printk(KERN_ALERT "Starting maple bus unload\n");
  if (gp) {
    printk(KERN_ALERT "unloading platform devices\n");
    platform_driver_unregister(&maple_bus_driver);

    printk(KERN_ALERT "Freeing DMA channels\n");
    maple_bus_free_dma_channels(gp);

    kfree(gp);
    gp = NULL;
  }

	printk(KERN_ALERT "Goodbye module world.\n");
}
module_init(maple_bus_init);
module_exit(maple_bus_exit);

