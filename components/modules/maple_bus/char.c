/*  maple_bus.c - The simplest kernel module.
 */
#include <linux/kernel.h>
#include <linux/init.h>
#include <linux/module.h>
#include <linux/slab.h>
#include <linux/io.h>
#include <linux/interrupt.h>
#include <linux/dmaengine.h>
#include <linux/dmapool.h>
#include <linux/dma-contiguous.h>
#include <linux/amba/xilinx_dma.h>

#include <linux/of_address.h>
#include <linux/of_device.h>
#include <linux/of_platform.h>

#include <asm/uaccess.h>
#include <linux/cdev.h>
#include <linux/spinlock.h>
#include <linux/fs.h>       /* everything... */

#include "hw.h"

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


static void maple_bus_print_status(struct maple_bus_local *lp) {
  u32 config, status;
  struct maple_bus_chan_count rx_count, tx_count;
  config = maple_bus_read(lp, MAPLE_BUS_CONTROL_REG);
  status = maple_bus_read(lp, MAPLE_BUS_STATUS_REG);
  maple_bus_get_count(lp, MAPLE_BUS_TX_COUNT_REG, &tx_count);
  maple_bus_get_count(lp, MAPLE_BUS_RX_COUNT_REG, &rx_count);

  dev_err(lp->dev,
      "Control Register: 0x%8x\n"
      "  TX Enabled: %d, RX Enabled: %d\n, Loopback Enabled: %d\n"
      "  Reset TX: %d, Reset RX: %d\n"
      "  TX IRQ Enabled: %d, RX IRQ Enabled: %d\n"
      "Status Register: 0x%8x\n"
      "  TX IRQ: %d, RX IRQ: %d\n"
      "TX Buffered Packets: %d, TX Buffer Length: %d\n"
      "RX Buffered Packets: %d, RX Buffer Length: %d\n",
      control,
      !!(control & MAPLE_BUS_ENABLE_TX),
      !!(control & MAPLE_BUS_ENABLE_RX),
      !!(control & MAPLE_BUS_ENABLE_LOOPBACK),
      !!(control & MAPLE_BUS_RESET_TX),
      !!(control & MAPLE_BUS_RESET_RX),
      !!(control & MAPLE_BUS_ENABLE_TX_IRQ),
      !!(control & MAPLE_BUS_ENABLE_RX_IRQ),
      status,
      !!(status & MAPLE_BUS_TX_IRQ_STATUS),
      !!(status & MAPLE_BUS_RX_IRQ_STATUS),
      tx_count.packets, tx_count.length,
      rx_count.packets, rx_count.length
  )
}

/*
 * Open the device; in fact, there's nothing to do here.
 */
static int maple_bus_op_open (struct inode *inode, struct file *filp)
{
  struct maple_bus_local *lp;

  printk(KERN_ALERT "Maple bus open called\n");

  lp = container_of(inode->i_cdev, struct maple_bus_local, cdev);
  if (lp->magic != MAPLE_BUS_LOCAL_MAGIC) {
    printk(KERN_ALERT "Maple bus open called failed. Magic number did not match.\n");
    return -EFAULT;
  }
  
  filp->private_data = lp;

  if (mutex_lock_interruptible(&lp->mutex))
    return -ERESTARTSYS;

  /* use f_mode,not  f_flags: it's cleaner (fs/open.c tells why) */
  if (filp->f_mode & FMODE_READ)
    lp->nreaders++;
  if (filp->f_mode & FMODE_WRITE)
    lp->nwriters++;

  mutex_unlock(&lp->mutex);

  return nonseekable_open(inode, filp);
}


/*
 * Closing is just as simpler.
 */
static int maple_bus_op_release(struct inode *inode, struct file *filp)
{
  struct maple_bus_local *lp = filp->private_data;

  printk(KERN_ALERT "Maple bus release called\n");

  if (lp->magic != MAPLE_BUS_LOCAL_MAGIC)
    return -EFAULT;

  mutex_lock(&lp->mutex);
  if (filp->f_mode & FMODE_READ)
    lp->nreaders--;
  if (filp->f_mode & FMODE_WRITE)
    lp->nwriters--;
  mutex_unlock(&lp->mutex);

  return 0;
}

/*
 * Data management: read and write
 */

static ssize_t maple_bus_op_read (struct file *filp, char __user *buf, size_t count,
                loff_t *f_pos)
{
  struct maple_bus_local *lp = filp->private_data;
  struct dma_device *rx_dev;
  void *buffer;
  struct scatterlist *sgl;
  dma_addr_t dma_handle;
  struct xilinx_dma_config config;
  struct dma_async_tx_descriptor *txd = NULL;
  enum dma_ctrl_flags flags;
  struct completion rx_cmp;
  dma_cookie_t tx_cookie;
  enum dma_status status;
  unsigned long tx_tmo = msecs_to_jiffies(10000);
  ssize_t rc = -EFAULT;

  printk(KERN_ALERT "Maple bus read called\n");

  if (lp->magic != MAPLE_BUS_LOCAL_MAGIC)
    return -EFAULT;

  rx_dev = lp->rx_chan->device;

  buffer = kmalloc(count, GFP_KERNEL);
  if (!buffer) {
    dev_err(lp->dev, "Failed to alloc rx buffer");
    return -EFAULT;
  }

  sgl = kzalloc(sizeof(*sgl)*1, GFP_KERNEL);
  if (!sgl) {
    dev_err(lp->dev, "Failed to allocate rx sgl\n");
    goto free_buffer;
  }

  sg_init_table(sgl, 1);

  dma_handle = dma_map_single(lp->dev, buffer, count, DMA_DEV_TO_MEM);
  if (dma_mapping_error(lp->dev, dma_handle)) {
    dev_err(lp->dev, "Failed to map rx buffer\n");
    goto free_sgl;
  }

  sg_dma_address(&sgl[0]) = dma_handle;
  sg_dma_len(&sgl[0]) = count;
  
  config.coalesc = 1;
  config.delay = 0;
  rx_dev->device_control(lp->rx_chan, DMA_SLAVE_CONFIG,
      (unsigned long)&config);

  dev_err(lp->dev, "Prepping rx SG list");

  flags = DMA_CTRL_ACK | DMA_PREP_INTERRUPT;

  txd = rx_dev->device_prep_slave_sg(lp->rx_chan, sgl, 1,
        DMA_DEV_TO_MEM, flags, NULL);

  if (!txd) {
    dev_err(lp->dev, "Failed to prep rx sg list");
    goto free_mapping;
  }

  init_completion(&rx_cmp);
  txd->callback = maple_bus_slave_rx_callback;
  txd->callback_param = &rx_cmp;
  tx_cookie = txd->tx_submit(txd);

  if (dma_submit_error(tx_cookie)) {
    dev_err(lp->dev, "Failed to submit cookie");
    goto free_mapping;
  }

  dma_async_issue_pending(lp->rx_chan);

  tx_tmo = wait_for_completion_timeout(&rx_cmp, tx_tmo);

  status = dma_async_is_tx_complete(lp->rx_chan, tx_cookie,
            NULL, NULL);

  if (tx_tmo == 0) {
    dev_err(lp->dev, "We timed out!!");
  } else if (status != DMA_COMPLETE) {
    dev_err(lp->dev, "We got completion callback but status isn't complete!!");
  }

  dev_err(lp->dev, "We received some data!");

  if (copy_to_user(buf, buffer, count)) {
    printk(KERN_ALERT "Failed to copy buffer\n");
    goto free_mapping;
  }

  rc = count;

free_mapping:
  dma_unmap_single(lp->dev, dma_handle, count, DMA_DEV_TO_MEM);

free_sgl:
  kfree(sgl);

free_buffer:
  kfree(buffer);

  return rc;
}

static ssize_t maple_bus_op_write(struct file *filp, const char __user *buf, size_t count,
                loff_t *f_pos)
{

  struct maple_bus_local *lp = filp->private_data;
  struct dma_device *tx_dev;
  void *buffer;
  struct scatterlist *sgl;
  dma_addr_t dma_handle;
  struct xilinx_dma_config config;
  struct dma_async_tx_descriptor *txd = NULL;
  enum dma_ctrl_flags flags;
  struct completion tx_cmp;
  dma_cookie_t tx_cookie;
  enum dma_status status;
  unsigned long tx_tmo = msecs_to_jiffies(10000);
  ssize_t rc = -EFAULT;

  printk(KERN_ALERT "Maple bus write called\n");

  if (lp->magic != MAPLE_BUS_LOCAL_MAGIC)
    return -EFAULT;

  tx_dev = lp->tx_chan->device;

  buffer = kmalloc(count, GFP_KERNEL);
  if (!buffer) {
    printk(KERN_ALERT "Failed to alloc buffer\n");
    return -EFAULT;
  }

  if (copy_from_user(buffer, buf, count)) {
    printk(KERN_ALERT "Failed to copy buffer\n");
    goto free_buffer;
  }

  sgl = kzalloc(sizeof(*sgl)*1, GFP_KERNEL);
  if (!sgl) {
    printk(KERN_ALERT "Failed to allocate sgl\n");
    goto free_buffer;
  }

  sg_init_table(sgl, 1);

  dma_handle = dma_map_single(lp->dev, buffer, count, DMA_MEM_TO_DEV);
  if (dma_mapping_error(lp->dev, dma_handle)) {
    printk(KERN_ALERT "Failed to map buffer\n");
    goto free_sgl;
  }

  sg_dma_address(&sgl[0]) = dma_handle;
  sg_dma_len(&sgl[0]) = count;
  
  config.coalesc = 1;
  config.delay = 0;
  tx_dev->device_control(lp->tx_chan, DMA_SLAVE_CONFIG,
      (unsigned long)&config);

  dev_err(lp->dev, "Prepping SG list");

  flags = DMA_CTRL_ACK | DMA_PREP_INTERRUPT;

  txd = tx_dev->device_prep_slave_sg(lp->tx_chan, sgl, 1,
        DMA_MEM_TO_DEV, flags, NULL);

  if (!txd) {
    dev_err(lp->dev, "Failed to prep sg list");
    goto free_mapping;
  }

  init_completion(&tx_cmp);
  txd->callback = maple_bus_slave_tx_callback;
  txd->callback_param = &tx_cmp;
  tx_cookie = txd->tx_submit(txd);

  if (dma_submit_error(tx_cookie)) {
    dev_err(lp->dev, "Failed to submit cookie");
    goto free_mapping;
  }

  dma_async_issue_pending(lp->tx_chan);

  tx_tmo = wait_for_completion_timeout(&tx_cmp, tx_tmo);

  status = dma_async_is_tx_complete(lp->tx_chan, tx_cookie,
            NULL, NULL);

  if (tx_tmo == 0) {
    dev_err(lp->dev, "We timed out!!");
  } else if (status != DMA_COMPLETE) {
    dev_err(lp->dev, "We got completion callback but status isn't complete!!");
  }

  dev_err(lp->dev, "We Sent!");

  rc = count;

free_mapping:
  dma_unmap_single(lp->dev, dma_handle, count, DMA_MEM_TO_DEV);

free_sgl:
  kfree(sgl);

free_buffer:
  kfree(buffer);

  return rc;
}

static unsigned int maple_bus_op_poll(struct file *filp, struct poll_table_struct *wait)
{
  printk(KERN_ALERT "Maple bus poll called\n");
  return -EFAULT;
}


struct file_operations maple_bus_fops = {
  .owner =  THIS_MODULE,
  .llseek = no_llseek,
  .read =   maple_bus_op_read,
  .write =  maple_bus_op_write,
  .poll =   maple_bus_op_poll,
  .open =   maple_bus_op_open,
  .release =  maple_bus_op_release
};

static int maple_bus_init_cdev(struct maple_bus_local *lp)
{
  int err;
  dev_t devno;

  err = alloc_chrdev_region(&devno, 0, 1, DRIVER_NAME);
  if (err < 0) {
    dev_err(lp->dev, "Error 0x%x, Couldn't allocate maple bus major number", err);
    goto fail;
  }

  cdev_init(&lp->cdev, &maple_bus_fops);
  
  err = cdev_add(&lp->cdev, devno, 1);
  if (err) {
    dev_err(lp->dev, "Couldn't add char device %d with error 0x%x", devno, err);
    goto free_cdev;
  }
  
  return 0;

free_cdev:
  cdev_del(&lp->cdev);

//free_devno:
  unregister_chrdev_region(devno, 1);

fail:
  return err;
}

static void maple_bus_free_cdev(struct maple_bus_local *lp)
{
  dev_t devno;
  unsigned count;
  
  devno = lp->cdev.dev;
  count = lp->cdev.count;

  cdev_del(&lp->cdev);
  unregister_chrdev_region(devno, count);
}

static int maple_bus_probe(struct platform_device *pdev)
{
  struct resource *r_irq; /* Interrupt resources */
	struct resource *r_mem; /* IO mem resources */
	struct device *dev = &pdev->dev;
	struct maple_bus_local *lp = NULL;
  unsigned int control = 0;

	int rc = 0;
	
	dev_info(dev, "Device Tree Probing\n");

	/* Get iospace for the device */
	r_mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
	if (!r_mem) {
		dev_err(dev, "invalid address\n");
		return -ENODEV;
	}
	
	lp = (struct maple_bus_local *) kzalloc(sizeof(struct maple_bus_local), GFP_KERNEL);
	if (!lp) {
		dev_err(dev, "Cound not allocate maple_bus device\n");
		return -ENOMEM;
	}

  lp->magic = MAPLE_BUS_LOCAL_MAGIC;
	
	dev_set_drvdata(dev, lp);
	
  lp->global = gp;
  lp->dev = dev;
	lp->mem_start = r_mem->start;
	lp->mem_end = r_mem->end;

	if (!request_mem_region(lp->mem_start,
				lp->mem_end - lp->mem_start + 1,
				DRIVER_NAME)) {
		dev_err(dev, "Couldn't lock memory region at %p\n",
			(void *)lp->mem_start);
		rc = -EBUSY;
		goto free_drv;
	}

	lp->base_addr = ioremap(lp->mem_start, lp->mem_end - lp->mem_start + 1);
	if (!lp->base_addr) {
		dev_err(dev, "maple_bus: Could not allocate iomem\n");
		rc = -EIO;
		goto free_mem_region;
	}

  if (maple_bus_read(lp, MAPLE_BUS_MAGIC_REG) == MAPLE_BUS_MAGIC_NUMBER) {
    dev_info(dev, "maple_bus: magic number matched");
  } else {
    dev_err(dev, "maple_bus: magic number did not match");
    goto free_remap;
  }

  dev_info(dev, "maple_bus: resetting hardware");
  maple_bus_reset_hw(lp);

  mutex_init(&lp->mutex);

  if (maple_bus_init_cdev(lp)) {
    dev_err(dev, "Failed to create character device");
    rc = -EIO;
    goto free_remap;
  }

  /* Get IRQ for the device */
  r_irq = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
  if (!r_irq) {
    dev_info(dev, "no IRQ found\n");
    rc = -EIO;
    goto free_cdev;
  } 
  lp->irq = r_irq->start;
  
  rc = request_irq(lp->irq, &maple_bus_irq, 0, DRIVER_NAME, lp);
  if (rc) {
    dev_err(dev, "Could not allocate interrupt %d.\n",
      lp->irq);
    goto free_cdev;
  }

	dev_info(dev,"maple_bus at 0x%08x mapped to 0x%08x with irq %d, major %d and minor %d",
  		(unsigned int __force)lp->mem_start,
  		(unsigned int __force)lp->base_addr,
      lp->irq,
      MAJOR(lp->cdev.dev),
      MINOR(lp->cdev.dev)
  );

  control = 0;

  if (lp->global->loopback) {
    control |= MAPLE_BUS_ENABLE_LOOPBACK;
  }

  maple_bus_write(lp, MAPLE_BUS_CONTROL_REG, control);

  maple_bus_print_status(lp);

	return 0;

free_cdev:
  maple_bus_free_cdev(lp);
free_remap:
  iounmap(lp->base_addr);
free_mem_region:
	release_mem_region(lp->mem_start, lp->mem_end - lp->mem_start + 1);
free_drv:
  lp->magic = 0;
	kfree(lp);
	dev_set_drvdata(dev, NULL);
	return rc;
}

static irqreturn_t maple_bus_irq(int irq, void *lp)
{
  printk("maple_bus interrupt\n");
  return IRQ_HANDLED;
}


static int maple_bus_remove(struct platform_device *pdev)
{
	struct device *dev = &pdev->dev;
	struct maple_bus_local *lp = dev_get_drvdata(dev);

  free_irq(lp->irq, lp);
  maple_bus_free_cdev(lp);
  iounmap(lp->base_addr);
	release_mem_region(lp->mem_start, lp->mem_end - lp->mem_start + 1);
  lp->magic = 0;
	kfree(lp);
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
	printk("<1>Hello module world.\n");
	printk("<1>Module parameters were pause (0x%08x), loopback (0x%08x) and \"%s\"\n", pause, loopback,
	       mystr);

  gp = kzalloc(sizeof(*gp), GFP_KERNEL);
  if (!gp) {
    printk(KERN_ALERT "Failed to alloc module buffer\n");
    return -EFAULT;
  }

  if (maple_bus_find_dma_channels(gp)) {
    goto free_global;
  }

  if (maple_bus_alloc_dma_pools(gp)) {
    goto free_dma;
  }

  gp->loopback = loopback;
  gp->pause = pause;

	return platform_driver_register(&maple_bus_driver);

free_dma:
  maple_bus_free_dma_channels(gp);

free_global:
  kfree(gp);
  gp = NULL;

  return -EFAULT;
}

static void __exit maple_bus_exit(void)
{
  if (gp) {
    platform_driver_unregister(&maple_bus_driver);
    maple_bus_free_dma_pools(gp);
    maple_bus_free_dma_channels(gp);

    kfree(gp);
    gp = NULL;
  }

	printk(KERN_ALERT "Goodbye module world.\n");
}

module_init(maple_bus_init);
module_exit(maple_bus_exit);

