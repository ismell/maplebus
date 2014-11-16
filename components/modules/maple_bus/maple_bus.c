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

struct maple_bus_local {
  unsigned magic;
  #define MAPLE_BUS_LOCAL_MAGIC 0x5007C0DE
	unsigned long mem_start;
	unsigned long mem_end;
	void __iomem *base_addr;
  struct device *dev;
  struct dma_chan *rx_chan;
  struct dma_pool *rx_pool;

  struct dma_chan *tx_chan;
  struct dma_pool *tx_pool;
  struct cdev cdev;

  struct mutex mutex;
  int nreaders, nwriters;
};

/* IO accessors */
static inline void maple_bus_write(struct maple_bus_local *lp, u32 reg, u32 val)
{
	iowrite32(val, lp->base_addr + reg);
}

static inline u32 maple_bus_read(struct maple_bus_local *lp, u32 reg)
{
	return ioread32(lp->base_addr + reg);
}

static void maple_bus_slave_tx_callback(void *completion)
{
  complete(completion);
}

static bool xdma_filter(struct dma_chan *chan, void *param)
{
	pr_err("dmatest: Private is %x\n", *((int *)chan->private));

	if (*((int *)chan->private) == *(int *)param)
		return true;

	return false;
}

static int find_dma_channels(struct maple_bus_local *lp)
{
	dma_cap_mask_t mask;
	int err = 0;

	/* JZ for slave transfer channels */
	enum dma_data_direction direction;
	u32 match, device_id = 0;

	dma_cap_zero(mask);
	dma_cap_set(DMA_SLAVE | DMA_PRIVATE, mask);

  direction = DMA_MEM_TO_DEV;
  // TODO: We should find a way to find the one linked to the maple bus
  match = (direction & 0xFF) | XILINX_DMA_IP_DMA |
      (device_id << XILINX_DMA_DEVICE_ID_SHIFT);

  lp->tx_chan = dma_request_channel(mask, xdma_filter, (void *)&match);

  if (lp->tx_chan)
    dev_info(lp->dev, "Found TX DMA Channel");
  else
    dev_info(lp->dev, "Could not find a TX DMA channel");

  direction = DMA_DEV_TO_MEM;
  match = (direction & 0xFF) | XILINX_DMA_IP_DMA |
      (device_id << XILINX_DMA_DEVICE_ID_SHIFT);
  lp->rx_chan = dma_request_channel(mask, xdma_filter, &match);

  if (lp->rx_chan)
    dev_info(lp->dev, "Found RX DMA Channel");
  else
    dev_info(lp->dev, "Could not find a RX DMA channel");

  if (lp->rx_chan && lp->rx_chan) {
    err = 0;
  } else {
    if (lp->tx_chan) {
      dma_release_channel(lp->tx_chan);
      lp->tx_chan = NULL;
    }

    if (lp->rx_chan) {
      dma_release_channel(lp->rx_chan);
      lp->rx_chan = NULL;
    }
    err = -1;
  }

	return err;
}

static int alloc_dma_pools(struct maple_bus_local *lp)
{
  dev_info(lp->dev, "Creating DMA Pools");
  lp->tx_pool = dma_pool_create("maple_bus_tx_pool", lp->dev, PAGE_SIZE * 8, lp->tx_chan->device->copy_align, 0);
  if (!lp->tx_pool) {
    dev_info(lp->dev, "Failed to create TX DMA Pool");
    return -1;
  }

  lp->rx_pool = dma_pool_create("maple_bus_rx_pool", lp->dev, PAGE_SIZE * 8, lp->rx_chan->device->copy_align, 0);
  if (!lp->rx_pool) {
    dev_info(lp->dev, "Failed to create RX DMA Pool");
    dma_pool_destroy(lp->tx_pool);
    lp->tx_pool = NULL;

    return -1;
  }

  return 0;
}

static void free_dma_pools(struct maple_bus_local *lp)
{
  dev_info(lp->dev, "Freeing DMA Pools");
  if (lp->tx_pool) {
    dev_info(lp->dev, "Freeing TX DMA pool");
    dma_pool_destroy(lp->tx_pool);
    lp->tx_pool = NULL;
  }

  if (lp->rx_pool) {
    dev_info(lp->dev, "Freeing RX DMA pool");
    dma_pool_destroy(lp->rx_pool);
    lp->rx_pool = NULL;
  }
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
  printk(KERN_ALERT "Maple bus read called\n");
  return -EFAULT;
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
  //struct resource *r_irq; /* Interrupt resources */
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

  dev_info(dev, "Looking for DMA Channels");
  if (find_dma_channels(lp)) {
		dev_err(dev, "Failed to find tx and rx DMA channels");
		rc = -EIO;
		goto free_mem_region;
  }
  dev_info(dev, "Found DMA Channels");

  if (alloc_dma_pools(lp)) {
    rc = -EIO;
    goto free_dma;
  }

  mutex_init(&lp->mutex);

  if (maple_bus_init_cdev(lp)) {
    dev_err(dev, "Failed to create character device");
    rc = -EIO;
    goto free_dma_pools;
  }

	dev_info(dev,"maple_bus at 0x%08x mapped to 0x%08x with major %d and minor %d",
		(unsigned int __force)lp->mem_start,
		(unsigned int __force)lp->base_addr,
    MAJOR(lp->cdev.dev),
    MINOR(lp->cdev.dev)
    );

  if (maple_bus_read(lp, 4*7) == 0xB82FD918) {
    dev_info(dev, "maple_bus magic number matched");
  } else {
    dev_err(dev, "maple_bus magic number did not match");
  }

  dev_info(dev, "maple_bus current config 0x%08x", maple_bus_read(lp, 0));
  dev_info(dev, "maple_bus tx, rx count 0x%08x", maple_bus_read(lp, 4));

  control = 0;

  if (!pause) {
    dev_info(dev, "maple_bus enabling tx/rx");
    control |= 1 << 0; // Enable TX
    control |= 1 << 1; // Enable RX
  }

  if (loopback) {
    dev_info(dev, "maple_bus enabling loopback");
    control |= 1 << 2; // Loopback enable
  }

  maple_bus_write(lp, 0, control);

  dev_info(dev, "maple_bus new config 0x%x", maple_bus_read(lp, 0));

	return 0;

free_dma_pools:
  free_dma_pools(lp);
free_dma:
  if (lp->rx_chan)
    dma_release_channel(lp->rx_chan);

  if (lp->tx_chan)
    dma_release_channel(lp->tx_chan);
free_mem_region:
	release_mem_region(lp->mem_start, lp->mem_end - lp->mem_start + 1);
free_drv:
  lp->magic = 0;
	kfree(lp);
	dev_set_drvdata(dev, NULL);
	return rc;
}

static int maple_bus_remove(struct platform_device *pdev)
{
	struct device *dev = &pdev->dev;
	struct maple_bus_local *lp = dev_get_drvdata(dev);

  free_dma_pools(lp);

  if (lp->rx_chan)
    dma_release_channel(lp->rx_chan);

  if (lp->tx_chan)
    dma_release_channel(lp->tx_chan);

  maple_bus_free_cdev(lp);

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

	return platform_driver_register(&maple_bus_driver);
}

static void __exit maple_bus_exit(void)
{
	platform_driver_unregister(&maple_bus_driver);

	printk(KERN_ALERT "Goodbye module world.\n");
}

module_init(maple_bus_init);
module_exit(maple_bus_exit);

