#include "dma.h"

static bool xdma_filter(struct dma_chan *chan, void *param)
{
  pr_err("dmatest: Private is %x\n", *((int *)chan->private));

  if (*((int *)chan->private) == *(int *)param)
    return true;

  return false;
}

static void maple_bus_free_dma_channels(struct maple_bus_global *gp)
{
  if (gp->rx_chan) {
    dma_release_channel(gp->rx_chan);
    gp->rx_chan = NULL;
  }

  if (gp->tx_chan) {
    dma_release_channel(gp->tx_chan);
    gp->tx_chan = NULL;
  }
}


static int maple_bus_find_dma_channel(enum dma_data_direction direction, u32 device_id, struct dma_chan **chan) {
  u32 match;
  dma_cap_mask_t mask;
  int err = 0;
  struct xilinx_dma_config config = {
    .coalesc = 1,
    .delay = 0
  };

  dma_cap_zero(mask);
  dma_cap_set(DMA_SLAVE | DMA_PRIVATE, mask);

  match = (direction & 0xFF) | XILINX_DMA_IP_DMA |
      (device_id << XILINX_DMA_DEVICE_ID_SHIFT);

  *chan = dma_request_channel(mask, xdma_filter, (void *)&match);

  if (!*chan) {
    printk(KERN_INFO "Could not find a DMA channel");
    return -ENODEV;
  }

  if ((err = dmaengine_device_control(*chan, DMA_SLAVE_CONFIG, (unsigned long)&config))) {
    printk(KERN_INFO "Failed to set DMA config");
    goto free_chan;
  }

  return 0;

free_chan:
  dma_release_channel(*chan);
  *chan = NULL;

  return err;
}

static int maple_bus_find_dma_channels(struct maple_bus_global *gp, u32 device_id)
{
  int err = 0;

  printk(KERN_INFO "Looking for maple bus DMA Channels");

  if ((err = maple_bus_find_dma_channel(DMA_MEM_TO_DEV, device_id, &gp->tx_chan))) {
    printk(KERN_INFO "Failed to find TX DMA Channel");
    return err;
  }

  printk(KERN_INFO "Found TX DMA Channel");

  if ((err = maple_bus_find_dma_channel(DMA_DEV_TO_MEM, device_id, &gp->rx_chan))) {
    printk(KERN_INFO "Failed to find RX DMA Channel");
    goto free_tx;
  }

  printk(KERN_INFO "Found RX DMA Channel");

  return 0;

free_tx:
  dma_release_channel(gp->tx_chan);
  gp->tx_chan = NULL;

  return err;
}