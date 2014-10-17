/*
 * Xilinx AXI DMA Engine support
 *
 * Copyright (C) 2012 - 2013 Xilinx, Inc. All rights reserved.
 *
 * Based on the Freescale DMA driver.
 *
 * Description:
 *  . Axi DMA engine, it does transfers between memory and device. It can be
 *    configured to have one channel or two channels. If configured as two
 *    channels, one is to transmit to a device and another is to receive from
 *    a device.
 *
 * This is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 */

#include <linux/amba/xilinx_dma.h>
#include <linux/dmapool.h>
#include <linux/init.h>
#include <linux/interrupt.h>
#include <linux/io.h>
#include <linux/irqdomain.h>
#include <linux/module.h>
#include <linux/of.h>
#include <linux/of_address.h>
#include <linux/of_irq.h>
#include <linux/of_platform.h>
#include <linux/platform_device.h>
#include <linux/slab.h>

/* Hw specific definitions */
#define XILINX_DMA_MAX_CHANS_PER_DEVICE	0x2 /* Max no of channels */
#define XILINX_DMA_MAX_TRANS_LEN	0x7FFFFF /* Max transfer length */

/* Register Offsets */
#define XILINX_DMA_CONTROL_OFFSET	0x00 /* Control Reg */
#define XILINX_DMA_STATUS_OFFSET	0x04 /* Status Reg */
#define XILINX_DMA_CDESC_OFFSET		0x08 /* Current descriptor Reg */
#define XILINX_DMA_TDESC_OFFSET		0x10 /* Tail descriptor Reg */
#define XILINX_DMA_SRCADDR_OFFSET	0x18 /* Source Address Reg */
#define XILINX_DMA_DSTADDR_OFFSET	0x20 /* Dest Address Reg */
#define XILINX_DMA_BTT_OFFSET		0x28 /* Bytes to transfer Reg */

/* General register bits definitions */
#define XILINX_DMA_CR_RESET_MASK	0x00000004 /* Reset DMA engine */
#define XILINX_DMA_CR_RUNSTOP_MASK	0x00000001 /* Start/stop DMA engine */

#define XILINX_DMA_SR_HALTED_MASK	0x00000001 /* DMA channel halted */
#define XILINX_DMA_SR_IDLE_MASK		0x00000002 /* DMA channel idle */

#define XILINX_DMA_XR_IRQ_IOC_MASK	0x00001000 /* Completion interrupt */
#define XILINX_DMA_XR_IRQ_DELAY_MASK	0x00002000 /* Delay interrupt */
#define XILINX_DMA_XR_IRQ_ERROR_MASK	0x00004000 /* Error interrupt */
#define XILINX_DMA_XR_IRQ_ALL_MASK	0x00007000 /* All interrupts */

#define XILINX_DMA_XR_DELAY_MASK	0xFF000000 /* Delay timeout counter */
#define XILINX_DMA_XR_COALESCE_MASK	0x00FF0000 /* Coalesce counter */

#define XILINX_DMA_DELAY_SHIFT		24 /* Delay timeout counter shift */
#define XILINX_DMA_COALESCE_SHIFT	16 /* Coalesce counter shift */

#define XILINX_DMA_DELAY_MAX		0xFF /* Maximum delay counter value */
#define XILINX_DMA_COALESCE_MAX		0xFF /* Max coalescing counter value */

#define XILINX_DMA_RX_CHANNEL_OFFSET	0x30 /* S2MM Channel Offset */

/* BD definitions for AXI Dma */
#define XILINX_DMA_BD_STS_ALL_MASK	0xF0000000
#define XILINX_DMA_BD_SOP		0x08000000 /* Start of packet bit */
#define XILINX_DMA_BD_EOP		0x04000000 /* End of packet bit */

/* Feature encodings */
#define XILINX_DMA_FTR_HAS_SG		0x00000100 /* Has SG */
#define XILINX_DMA_FTR_HAS_SG_SHIFT	8 /* Has SG shift */
/* Optional feature for dma */
#define XILINX_DMA_FTR_STSCNTRL_STRM	0x00010000


/* Delay loop counter to prevent hardware failure */
#define XILINX_DMA_RESET_LOOP		1000000
#define XILINX_DMA_HALT_LOOP		1000000

#if defined(CONFIG_XILINX_DMATEST) || defined(CONFIG_XILINX_DMATEST_MODULE)
# define TEST_DMA_WITH_LOOPBACK
#endif

/* Hardware descriptor */
struct xilinx_dma_desc_hw {
	u32 next_desc;	/* 0x00 */
	u32 pad1;	/* 0x04 */
	u32 buf_addr;	/* 0x08 */
	u32 pad2;	/* 0x0C */
	u32 pad3;	/* 0x10 */
	u32 pad4;	/* 0x14 */
	u32 control;	/* 0x18 */
	u32 status;	/* 0x1C */
	u32 app_0;	/* 0x20 */
	u32 app_1;	/* 0x24 */
	u32 app_2;	/* 0x28 */
	u32 app_3;	/* 0x2C */
	u32 app_4;	/* 0x30 */
} __aligned(64);

/* Software descriptor */
struct xilinx_dma_desc_sw {
	struct xilinx_dma_desc_hw hw;
	struct list_head node;
	struct list_head tx_list;
	struct dma_async_tx_descriptor async_tx;
} __aligned(64);

/* Per DMA specific operations should be embedded in the channel structure */
struct xilinx_dma_chan {
	void __iomem *regs;		/* Control status registers */
	dma_cookie_t completed_cookie;	/* The maximum cookie completed */
	dma_cookie_t cookie;		/* The current cookie */
	spinlock_t lock;		/* Descriptor operation lock */
	bool sg_waiting;		/* Scatter gather transfer waiting */
	struct list_head active_list;	/* Active descriptors */
	struct list_head pending_list;	/* Descriptors waiting */
	struct dma_chan common;		/* DMA common channel */
	struct dma_pool *desc_pool;	/* Descriptors pool */
	struct device *dev;		/* The dma device */
	int irq;			/* Channel IRQ */
	int id;				/* Channel ID */
	enum dma_transfer_direction direction;
					/* Transfer direction */
	int max_len;			/* Maximum data len per transfer */
	bool has_sg;			/* Support scatter transfers */
	bool has_dre;			/* Support unaligned transfers */
	int err;			/* Channel has errors */
	struct tasklet_struct tasklet;	/* Cleanup work after irq */
	u32 feature;			/* IP feature */
	u32 private;			/* Match info for channel request */
	void (*start_transfer)(struct xilinx_dma_chan *chan);
	struct xilinx_dma_config config;
					/* Device configuration info */
};

/* DMA Device Structure */
struct xilinx_dma_device {
	void __iomem *regs;
	struct device *dev;
	struct dma_device common;
	struct xilinx_dma_chan *chan[XILINX_DMA_MAX_CHANS_PER_DEVICE];
	u32 feature;
};

#define to_xilinx_chan(chan) \
	container_of(chan, struct xilinx_dma_chan, common)

/* IO accessors */
static inline void dma_write(struct xilinx_dma_chan *chan, u32 reg, u32 val)
{
	writel(val, chan->regs + reg);
}

static inline u32 dma_read(struct xilinx_dma_chan *chan, u32 reg)
{
	return readl(chan->regs + reg);
}

static void xilinx_dma_channel_debug(struct xilinx_dma_chan *chan) {
  unsigned int control, status;

  control = (unsigned int)dma_read(chan, XILINX_DMA_CONTROL_OFFSET);
  status = (unsigned int)dma_read(chan, XILINX_DMA_STATUS_OFFSET);

  dev_err(chan->dev,
    "Channel %d Control Register 0x%x\n"
    "  Start: %d, Reset: %d\n"
    "  Keyhole: %d, Cyclic BD En: %d\n"
    "  IOC IRQ En: %d, Delay IRQ En: %d, ERR IRQ En: %d\n"
    "  IRQ Threshold: %d, IRQ Delay: %d",
    chan->id,
    control,
		!!(control & XILINX_DMA_CR_RUNSTOP_MASK), // Start/Stop
		!!(control & XILINX_DMA_CR_RESET_MASK), // Reset
    !!(control & (1 << 3)), // Keyhole
    !!(control & (1 << 4)), // Cyclic BD En
    !!(control & (1 << 12)), // IOC IRQ En
    !!(control & (1 << 13)), // Delay IRQ En
    !!(control & (1 << 14)), // Err IRQ En
    (control & (0x00FF0000)) >> 16, // IRQ Threshold
    (control & (0xFF000000)) >> 24  // IRQ Delay
  );

  dev_err(chan->dev,
    "Channel %d Status Register 0x%x\n"
    "  Halted: %d, Idle: %d\n"
    "  SG Enabled: %d\n"
    "  DMA Internal Error: %d, DMA Slave Error: %d, DMA Decode Error: %d\n"
    "  SG Internal Error: %d, SG Slave Error: %d, SG Decode Error: %d\n"
    "  IOC IRQ: %d, Delay IRQ: %d, Error IRQ: %d\n"
    "  IRQ Threshold: %d, IRQ Delay: %d",
    chan->id,
    status,
		!!(status & XILINX_DMA_SR_HALTED_MASK), // Halted
		!!(status & XILINX_DMA_SR_IDLE_MASK), // Idle
    !!(status & (1 << 3)), // SG Enabled
    !!(status & (1 << 4)), // DMA Internal Error
    !!(status & (1 << 5)), // DMA Slave Error
    !!(status & (1 << 6)), // DMA Decode Error
    !!(status & (1 << 8)), // SG Internal Error
    !!(status & (1 << 9)), // SG Slave Error
    !!(status & (1 << 10)), // SG Decode Error
    !!(status & (1 << 12)), // IOC IRQ
    !!(status & (1 << 13)), // Delay IRQ
    !!(status & (1 << 14)), // Error IRQ
    (status & (0x00FF0000)) >> 16, // IRQ Threshold
    (status & (0xFF000000)) >> 24  // IRQ Delay
  );

  dev_err(chan->dev,
    "Channel %d Current Descriptor 0x%x, Tail Descriptor 0x%x",
    chan->id,
  	(unsigned int)dma_read(chan, XILINX_DMA_CDESC_OFFSET),
  	(unsigned int)dma_read(chan, XILINX_DMA_TDESC_OFFSET)
  );
}

static int xilinx_dma_alloc_chan_resources(struct dma_chan *dchan)
{
	struct xilinx_dma_chan *chan = to_xilinx_chan(dchan);
	dev_err(chan->dev, "Allocating resources for channel %d", chan->id);

	/* Has this channel already been allocated? */
	if (chan->desc_pool) {
	  dev_err(chan->dev, "Channel %d already allocated", chan->id);
		return 1;
  }

	/*
	 * We need the descriptor to be aligned to 64bytes
	 * for meeting Xilinx DMA specification requirement.
	 */
	dev_err(chan->dev, "Allocating DMA pool for channel %d", chan->id);
	chan->desc_pool =
		dma_pool_create("xilinx_dma_desc_pool", chan->dev,
				sizeof(struct xilinx_dma_desc_sw),
				__alignof__(struct xilinx_dma_desc_sw), 0);
	if (!chan->desc_pool) {
		dev_err(chan->dev,
			"unable to allocate channel %d descriptor pool\n",
			chan->id);
		return -ENOMEM;
	} else {
	  dev_err(chan->dev, "Allocated DMA pool for channel %d at 0x%p", chan->id, chan->desc_pool);
  }
  
  dev_err(chan->dev, "Allocated resources for channel %d", chan->id);

	chan->completed_cookie = 1;
	chan->cookie = 1;

	/* There is at least one descriptor free to be allocated */
	return 1;
}

static void xilinx_dma_free_desc_list(struct xilinx_dma_chan *chan,
				      struct list_head *list)
{
	struct xilinx_dma_desc_sw *desc, *_desc;

	list_for_each_entry_safe(desc, _desc, list, node) {
		list_del(&desc->node);
		dma_pool_free(chan->desc_pool, desc, desc->async_tx.phys);
	}
}

static void xilinx_dma_free_desc_list_reverse(struct xilinx_dma_chan *chan,
					      struct list_head *list)
{
	struct xilinx_dma_desc_sw *desc, *_desc;

	list_for_each_entry_safe_reverse(desc, _desc, list, node) {
		list_del(&desc->node);
		dma_pool_free(chan->desc_pool, desc, desc->async_tx.phys);
	}
}

static void xilinx_dma_free_chan_resources(struct dma_chan *dchan)
{
	struct xilinx_dma_chan *chan = to_xilinx_chan(dchan);
	unsigned long flags;

	dev_dbg(chan->dev, "Freeing resources for channel %d.\n", chan->id);
	spin_lock_irqsave(&chan->lock, flags);
	xilinx_dma_free_desc_list(chan, &chan->active_list);
	xilinx_dma_free_desc_list(chan, &chan->pending_list);
	spin_unlock_irqrestore(&chan->lock, flags);

	dev_dbg(chan->dev, "Destroying DMA pool for channel %d.\n", chan->id);
	dma_pool_destroy(chan->desc_pool);
	chan->desc_pool = NULL;
}

static enum dma_status xilinx_dma_desc_status(struct xilinx_dma_chan *chan,
					      struct xilinx_dma_desc_sw *desc)
{
	return dma_async_is_complete(desc->async_tx.cookie,
				     chan->completed_cookie,
				     chan->cookie);
}

static void xilinx_chan_desc_cleanup(struct xilinx_dma_chan *chan)
{
	struct xilinx_dma_desc_sw *desc, *_desc;
	unsigned long flags;
	
  dev_err(chan->dev, "Cleaning up channel %d", chan->id);
  
  xilinx_dma_channel_debug(chan);

	spin_lock_irqsave(&chan->lock, flags);

	list_for_each_entry_safe(desc, _desc, &chan->active_list, node) {
		dma_async_tx_callback callback;
		void *callback_param;
    unsigned int status;

    dma_sync_single_for_cpu(chan->dev, desc->async_tx.phys,
          sizeof(desc->hw),
          DMA_FROM_DEVICE);

    status = desc->hw.status;

	  dev_err(chan->dev, "Checking descriptor %p for channel %d with status 0x%x", desc, chan->id, status);

		if (xilinx_dma_desc_status(chan, desc) == DMA_IN_PROGRESS) {
	    dev_err(chan->dev, "Descriptor %p for channel %d is in progress, ABORT!", desc, chan->id);
			break;
    }

	  dev_err(chan->dev, "Removing descriptor %p from list of running transactions for channel %d", desc, chan->id);
		/* Remove from the list of running transactions */
		list_del(&desc->node);

		/* Run the link descriptor callback function */
		callback = desc->async_tx.callback;
		callback_param = desc->async_tx.callback_param;
		if (callback) {
	    dev_err(chan->dev, "Executing descriptor %p callback for channel %d", desc, chan->id);
			spin_unlock_irqrestore(&chan->lock, flags);
			callback(callback_param);
			spin_lock_irqsave(&chan->lock, flags);
		}

		/* Run any dependencies, then free the descriptor */
	  dev_err(chan->dev, "Running descriptor %p dependencies for channel %d", desc, chan->id);
		dma_run_dependencies(&desc->async_tx);
	  dev_err(chan->dev, "Freeing descriptor %p from pool %p for channel %d", desc, chan->desc_pool, chan->id);
		dma_pool_free(chan->desc_pool, desc, desc->async_tx.phys);
	}
	
  dev_err(chan->dev, "Channel %d has been cleaned", chan->id);

	spin_unlock_irqrestore(&chan->lock, flags);
}

static enum dma_status xilinx_tx_status(struct dma_chan *dchan,
					dma_cookie_t cookie,
					struct dma_tx_state *txstate)
{
	struct xilinx_dma_chan *chan = to_xilinx_chan(dchan);
	dma_cookie_t last_used;
	dma_cookie_t last_complete;


	xilinx_chan_desc_cleanup(chan);

	last_used = dchan->cookie;
	last_complete = chan->completed_cookie;

  dev_err(chan->dev, "Updating Transaction cookie from %d to %d for channel %d\n", last_used, last_complete, chan->id);

	dma_set_tx_state(txstate, last_complete, last_used, 0);

	return dma_async_is_complete(cookie, last_complete, last_used);
}

static int dma_is_running(struct xilinx_dma_chan *chan)
{
  dev_err(chan->dev, "Is channel %d running?\n", chan->id);
	return !(dma_read(chan, XILINX_DMA_STATUS_OFFSET) &
		 XILINX_DMA_SR_HALTED_MASK) &&
	       (dma_read(chan, XILINX_DMA_CONTROL_OFFSET) &
		XILINX_DMA_CR_RUNSTOP_MASK);
}

static int dma_is_idle(struct xilinx_dma_chan *chan)
{
  dev_err(chan->dev, "Is channel %d idle?\n", chan->id);

	return dma_read(chan, XILINX_DMA_STATUS_OFFSET) &
	       XILINX_DMA_SR_IDLE_MASK;
}

/* Stop the hardware, the ongoing transfer will be finished */
static void dma_halt(struct xilinx_dma_chan *chan)
{
	int loop = XILINX_DMA_HALT_LOOP;

  dev_err(chan->dev, "Halting DMA channel %d\n", chan->id);

	dma_write(chan, XILINX_DMA_CONTROL_OFFSET,
		  dma_read(chan, XILINX_DMA_CONTROL_OFFSET) &
		  ~XILINX_DMA_CR_RUNSTOP_MASK);

	/* Wait for the hardware to halt */
	while (loop) {
		if (!(dma_read(chan, XILINX_DMA_CONTROL_OFFSET) &
		      XILINX_DMA_CR_RUNSTOP_MASK))
			break;

		loop -= 1;
	}

  dev_err(chan->dev, "Channel %d halted\n", chan->id);

	if (!loop) {
		pr_debug("Cannot stop channel %x: %x\n",
			 (unsigned int)chan,
			 (unsigned int)dma_read(chan,
						XILINX_DMA_CONTROL_OFFSET));
		chan->err = 1;
	}
}

/* Start the hardware. Transfers are not started yet */
static void dma_start(struct xilinx_dma_chan *chan)
{
	int loop = XILINX_DMA_HALT_LOOP;

  dev_err(chan->dev, "Starting DMA channel %d\n", chan->id);

	dma_write(chan, XILINX_DMA_CONTROL_OFFSET,
		  dma_read(chan, XILINX_DMA_CONTROL_OFFSET) |
		  XILINX_DMA_CR_RUNSTOP_MASK);

	/* Wait for the hardware to start */
	while (loop) {
		if (dma_read(chan, XILINX_DMA_CONTROL_OFFSET) &
		    XILINX_DMA_CR_RUNSTOP_MASK)
			break;

		loop -= 1;
	}

  dev_err(chan->dev, "Channel %d started\n", chan->id);

	if (!loop) {
		pr_debug("Cannot start channel %x: %x\n",
			 (unsigned int)chan,
			 (unsigned int)dma_read(chan,
						XILINX_DMA_CONTROL_OFFSET));

		chan->err = 1;
	}
}

static void xilinx_dma_start_transfer(struct xilinx_dma_chan *chan)
{
	unsigned long flags;
	struct xilinx_dma_desc_sw *desch, *desct;
	struct xilinx_dma_desc_hw *hw;
	
  dev_err(chan->dev, "Starting DMA Transfer for channel %d\n", chan->id);

	if (chan->err) {
    dev_err(chan->dev, "Channel has an error, ABORT\n");
		return;
  }

	spin_lock_irqsave(&chan->lock, flags);

	if (list_empty(&chan->pending_list)) {
    dev_err(chan->dev, "No pending transactions on channel %d\n", chan->id);
		goto out_unlock;
  }

	/* If hardware is busy, cannot submit */
	if (dma_is_running(chan) && !dma_is_idle(chan)) {
		dev_err(chan->dev, "DMA channel %d still busy\n", chan->id);
		goto out_unlock;
	}

	/*
	 * If hardware is idle, then all descriptors on active list are
	 * done, start new transfers
	 */
	dma_halt(chan);

	if (chan->err) {
		dev_err(chan->dev, "DMA Channel error halting\n");
		goto out_unlock;
  }

	if (chan->has_sg) {
		dev_err(chan->dev, "We have scatter gather on channel %d\n", chan->id);
		desch = list_first_entry(&chan->pending_list,
					 struct xilinx_dma_desc_sw, node);

		desct = container_of(chan->pending_list.prev,
				     struct xilinx_dma_desc_sw, node);

		dev_err(chan->dev, "Setting Head Descriptor 0x%x on channel %d\n", desch->async_tx.phys, chan->id);

		dma_write(chan, XILINX_DMA_CDESC_OFFSET, desch->async_tx.phys);

		dev_err(chan->dev, "Starting SG DMA channel %d\n", chan->id);
		dma_start(chan);

		if (chan->err) {
		  dev_err(chan->dev, "Failed to start SG DMA channel %d\n", chan->id);
			goto out_unlock;
    }
		list_splice_tail_init(&chan->pending_list, &chan->active_list);

		/* Enable interrupts */
		dma_write(chan, XILINX_DMA_CONTROL_OFFSET,
			  dma_read(chan, XILINX_DMA_CONTROL_OFFSET) |
			  XILINX_DMA_XR_IRQ_ALL_MASK);

    xilinx_dma_channel_debug(chan);

		dev_err(chan->dev, "Setting Tail Descriptor 0x%x on channel %d\n", desct->async_tx.phys, chan->id);

		/* Update tail ptr register and start the transfer */
		dma_write(chan, XILINX_DMA_TDESC_OFFSET, desct->async_tx.phys);

    xilinx_dma_channel_debug(chan);
		goto out_unlock;
	}

	/* In simple mode */
	dev_err(chan->dev, "Channel %d is in Simple DMA mode\n", chan->id);
	dma_halt(chan);

	if (chan->err) {
	  dev_err(chan->dev, "Failed to halt simple channel\n");
		goto out_unlock;
  }

	pr_info("xilinx_dma_start_transfer::simple DMA mode\n");

	desch = list_first_entry(&chan->pending_list,
				 struct xilinx_dma_desc_sw, node);

	list_del(&desch->node);
	list_add_tail(&desch->node, &chan->active_list);

	dev_err(chan->dev, "Starting simple DMA channel %d\n", chan->id);
	dma_start(chan);

	if (chan->err) {
	  dev_err(chan->dev, "Error starting simple DMA channel %d\n", chan->id);
		goto out_unlock;
  }

	hw = &desch->hw;

	/* Enable interrupts */
	dma_write(chan, XILINX_DMA_CONTROL_OFFSET,
		  dma_read(chan, XILINX_DMA_CONTROL_OFFSET) |
		  XILINX_DMA_XR_IRQ_ALL_MASK);

	dma_write(chan, XILINX_DMA_SRCADDR_OFFSET, hw->buf_addr);
  
  xilinx_dma_channel_debug(chan);

	/* Start the transfer */
	dma_write(chan, XILINX_DMA_BTT_OFFSET,
		  hw->control & XILINX_DMA_MAX_TRANS_LEN);

out_unlock:
	dev_err(chan->dev, "Exiting start transfer for channel %d\n", chan->id);
	spin_unlock_irqrestore(&chan->lock, flags);
}

static void xilinx_dma_issue_pending(struct dma_chan *dchan)
{
	struct xilinx_dma_chan *chan = to_xilinx_chan(dchan);

	dev_err(chan->dev, "Issue pending transfers for channel %d\n", chan->id);

	xilinx_dma_start_transfer(chan);
}

/**
 * xilinx_dma_update_completed_cookie - Update the completed cookie.
 * @chan : xilinx DMA channel
 *
 * CONTEXT: hardirq
 */
static void xilinx_dma_update_completed_cookie(struct xilinx_dma_chan *chan)
{
	struct xilinx_dma_desc_sw *desc = NULL;
	struct xilinx_dma_desc_hw *hw = NULL;
	unsigned long flags;
	dma_cookie_t cookie = -EBUSY;
	unsigned int done = 0, bytes_transfered = 0, status = 0;

	spin_lock_irqsave(&chan->lock, flags);
	dev_err(chan->dev, "Updating completed cookie\n");

	if (list_empty(&chan->active_list)) {
		dev_err(chan->dev, "no running descriptors\n");
		goto out_unlock;
	}

	dev_err(chan->dev, "Looping Completed descriptors for channel %d\n", chan->id);

	/* Get the last completed descriptor, update the cookie to that */
	list_for_each_entry(desc, &chan->active_list, node) {
		if (chan->has_sg) {
			hw = &desc->hw;

      status = hw->status;

      dev_err(chan->dev, "Validating descriptor 0x%p with status 0x%x for channel %d\n", hw, status, chan->id);

			/* If a BD is not marked as complete then the hw has it */
			if (!(status & XILINX_DMA_BD_STS_ALL_MASK)) {
        dev_err(chan->dev, "ERROR: descriptor 0x%p for channel %d is not complete.\n", hw, chan->id);
				break;
			} else {
	      if (chan->direction == DMA_DEV_TO_MEM) { //S2MM Status register
          dev_err(chan->dev,
            "Channel %d Descriptor 0x%p\n"
            "  Bytes Transfered: %d\n"
            "  RX EOF: %d, RX SOF: %d\n"
            "  DMA Internal Error: %d, DMA Slave Error: %d, DMA Decode Error: %d\n",
            chan->id,
            hw,
            status & 0x007FFFFF, // Bytes Transfered
            !!(status & (1 << 26)), // RX EOF
            !!(status & (1 << 27)), // RX SOF
            !!(status & (1 << 28)), // DMA Internal Error
            !!(status & (1 << 29)), // DMA Slave Error
            !!(status & (1 << 30))  // DMA Decode Error
          );
        } else { // MM2S Status Register
          dev_err(chan->dev,
            "Channel %d Descriptor 0x%p\n"
            "  Bytes Transfered: %d\n"
            "  DMA Internal Error: %d, DMA Slave Error: %d, DMA Decode Error: %d\n",
            chan->id,
            hw,
            status & 0x007FFFFF, // Bytes Transfered
            !!(status & (1 << 28)), // DMA Internal Error
            !!(status & (1 << 29)), // DMA Slave Error
            !!(status & (1 << 30))  // DMA Decode Error
          );
        }
        bytes_transfered += status & 0x007FFFFF;

				done = 1;
				cookie = desc->async_tx.cookie;
			}
		} else {
			/* In non-SG mode, all active entries are done */
			done = 1;
			cookie = desc->async_tx.cookie;
		}
	}

	dev_err(chan->dev, "Transfered %d bytes on channel %d\n", bytes_transfered, chan->id);

	if (done) {
	  dev_err(chan->dev, "Transaction is complete, setting completed cookie for channel %d\n", chan->id);
		chan->completed_cookie = cookie;
  } else {
	  dev_err(chan->dev, "We are still not done, no cookie for channel %d\n", chan->id);
  }

out_unlock:
	dev_err(chan->dev, "Exiting complete cookie handler\n");
	spin_unlock_irqrestore(&chan->lock, flags);
}

/* Reset hardware */
static int dma_reset(struct xilinx_dma_chan *chan)
{
	int loop = XILINX_DMA_RESET_LOOP;
	u32 tmp;
	
	dev_err(chan->dev, "Starting channel reset\n");

	dma_write(chan, XILINX_DMA_CONTROL_OFFSET,
		  dma_read(chan, XILINX_DMA_CONTROL_OFFSET) |
		  XILINX_DMA_CR_RESET_MASK);

	dev_err(chan->dev, "Wrote reset flag\n");

	tmp = dma_read(chan, XILINX_DMA_CONTROL_OFFSET) &
	      XILINX_DMA_CR_RESET_MASK;

	dev_err(chan->dev, "Reading control register\n");

	/* Wait for the hardware to finish reset */
	while (loop && tmp) {
		dev_err(chan->dev, "Reading control register %d\n", loop);
		tmp = dma_read(chan, XILINX_DMA_CONTROL_OFFSET) &
		      XILINX_DMA_CR_RESET_MASK;
		loop -= 1;
	}

	if (!loop) {
		dev_err(chan->dev, "reset timeout, cr %x, sr %x\n",
			dma_read(chan, XILINX_DMA_CONTROL_OFFSET),
			dma_read(chan, XILINX_DMA_STATUS_OFFSET));
		return -EBUSY;
	}
	
	dev_err(chan->dev, "Channel has been reset\n");

	return 0;
}

static irqreturn_t dma_intr_handler(int irq, void *data)
{
	struct xilinx_dma_chan *chan = data;
	int update_cookie = 0;
	int to_transfer = 0;
	u32 stat, reg;
	
  dev_err(chan->dev, "We got a IRQ request from channel %d\n", chan->id);
  
  xilinx_dma_channel_debug(chan);

	reg = dma_read(chan, XILINX_DMA_CONTROL_OFFSET);
  
  dev_err(chan->dev, "Disabling IRQ for channel %d\n", chan->id);

	/* Disable intr */
	dma_write(chan, XILINX_DMA_CONTROL_OFFSET,
		  reg & ~XILINX_DMA_XR_IRQ_ALL_MASK);

	stat = dma_read(chan, XILINX_DMA_STATUS_OFFSET);
	if (!(stat & XILINX_DMA_XR_IRQ_ALL_MASK)) {
    dev_err(chan->dev, "No IRQ for channel %d, false alarm\n", chan->id);
		return IRQ_NONE;
  }

	/* Ack the interrupts */
	dma_write(chan, XILINX_DMA_STATUS_OFFSET,
		  XILINX_DMA_XR_IRQ_ALL_MASK);

  dev_err(chan->dev, "ACK IRQ for channel %d\n", chan->id);
  dev_err(chan->dev, "IRQ Stat 0x%x, IRQ Control 0x%x for channel %d\n", stat, reg, chan->id);

	/* Check for only the interrupts which are enabled */
	stat &= (reg & XILINX_DMA_XR_IRQ_ALL_MASK);

  dev_err(chan->dev, "IRQ Stat 0x%x, IRQ Control 0x%x for channel %d\n", stat, reg, chan->id);

	if (stat & XILINX_DMA_XR_IRQ_ERROR_MASK) {
		dev_err(chan->dev,
			"Channel %x has errors %x, cdr %x tdr %x\n",
			(unsigned int)chan,
			(unsigned int)dma_read(chan, XILINX_DMA_STATUS_OFFSET),
			(unsigned int)dma_read(chan, XILINX_DMA_CDESC_OFFSET),
			(unsigned int)dma_read(chan, XILINX_DMA_TDESC_OFFSET));
		chan->err = 1;
	}

	/*
	 * Device takes too long to do the transfer when user requires
	 * responsiveness
	 */
	if (stat & XILINX_DMA_XR_IRQ_DELAY_MASK)
		dev_err(chan->dev, "Inter-packet latency too long on channel %d\n", chan->id);

	if (stat & XILINX_DMA_XR_IRQ_IOC_MASK) {
		update_cookie = 1;
		to_transfer = 1;
	}

	if (update_cookie) {
    dev_err(chan->dev, "Starting Update cookie for channel %d\n", chan->id);
		xilinx_dma_update_completed_cookie(chan);
  }

	if (to_transfer) {
    dev_err(chan->dev, "Starting transfer for channel %d\n", chan->id);
		chan->start_transfer(chan);
  }

	tasklet_schedule(&chan->tasklet);
  xilinx_dma_channel_debug(chan);
  dev_err(chan->dev, "IRQ Handled on channel %d\n", chan->id);
	return IRQ_HANDLED;
}

static void dma_do_tasklet(unsigned long data)
{
	struct xilinx_dma_chan *chan = (struct xilinx_dma_chan *)data;

	xilinx_chan_desc_cleanup(chan);
}

/* Append the descriptor list to the pending list */
static void append_desc_queue(struct xilinx_dma_chan *chan,
			      struct xilinx_dma_desc_sw *desc)
{
	struct xilinx_dma_desc_sw *tail =
		container_of(chan->pending_list.prev,
			     struct xilinx_dma_desc_sw, node);
	struct xilinx_dma_desc_hw *hw;

	if (list_empty(&chan->pending_list))
		goto out_splice;

	/*
	 * Add the hardware descriptor to the chain of hardware descriptors
	 * that already exists in memory.
	 */
	hw = &(tail->hw);
	hw->next_desc = (u32)desc->async_tx.phys;

	/*
	 * Add the software descriptor and all children to the list
	 * of pending transactions
	 */
out_splice:
	list_splice_tail_init(&desc->tx_list, &chan->pending_list);
}

/*
 * Assign cookie to each descriptor, and append the descriptors to the pending
 * list
 */
static dma_cookie_t xilinx_dma_tx_submit(struct dma_async_tx_descriptor *tx)
{
	struct xilinx_dma_chan *chan = to_xilinx_chan(tx->chan);
	struct xilinx_dma_desc_sw *desc;
	struct xilinx_dma_desc_sw *child;
	unsigned long flags;
	dma_cookie_t cookie = -EBUSY;
  
  dev_err(chan->dev, "Submitting Transaction 0x%p on channel %d\n", tx, chan->id);

	desc = container_of(tx, struct xilinx_dma_desc_sw, async_tx);

	if (chan->err) {
    dev_err(chan->dev, "Channel %d is in error state, trying reset\n", chan->id);
		/*
		 * If reset fails, need to hard reset the system.
		 * Channel is no longer functional
		 */
		if (!dma_reset(chan)) {
      dev_err(chan->dev, "Reset channel %d successfully\n", chan->id);
			chan->err = 0;
    }	else {
      dev_err(chan->dev, "Reset failed, HARD reset is required\n");
			return cookie;
    }
	}

	spin_lock_irqsave(&chan->lock, flags);

	/*
	 * Assign cookies to all of the software descriptors
	 * that make up this transaction
	 */
	cookie = chan->cookie;
  dev_err(chan->dev, "Assiging cookie %d to all descriptors in channel %d\n", cookie, chan->id);
	list_for_each_entry(child, &desc->tx_list, node) {
		cookie++;
		if (cookie < 0)
			cookie = DMA_MIN_COOKIE;

		child->async_tx.cookie = cookie;
	}

	chan->cookie = cookie;

	/* Put this transaction onto the tail of the pending queue */
  dev_err(chan->dev, "Putting channel %d transaction in pending queue\n", chan->id);
	append_desc_queue(chan, desc);

	spin_unlock_irqrestore(&chan->lock, flags);

  dev_err(chan->dev, "Transaction 0x%p on channel %d has been submitted\n", tx, chan->id);

	return cookie;
}

static struct
xilinx_dma_desc_sw *xilinx_dma_alloc_descriptor(struct xilinx_dma_chan *chan)
{
	struct xilinx_dma_desc_sw *desc;
	dma_addr_t pdesc;
  dev_err(chan->dev, "Allocating DMA Descriptor from pool %p for channel %d\n", chan->desc_pool, chan->id);

	desc = dma_pool_alloc(chan->desc_pool, GFP_ATOMIC, &pdesc);
	if (!desc) {
		dev_dbg(chan->dev, "out of memory for desc\n");
		return NULL;
	}

	memset(desc, 0, sizeof(*desc));
	INIT_LIST_HEAD(&desc->tx_list);
	dma_async_tx_descriptor_init(&desc->async_tx, &chan->common);
	desc->async_tx.tx_submit = xilinx_dma_tx_submit;
	desc->async_tx.phys = pdesc;

  dev_err(chan->dev, "Allocated descriptor at 0x%p from pool 0x%p for channel %d\n", desc, chan->desc_pool, chan->id);

	return desc;
}

/**
 * xilinx_dma_prep_slave_sg - prepare descriptors for a DMA_SLAVE transaction
 * @chan: DMA channel
 * @sgl: scatterlist to transfer to/from
 * @sg_len: number of entries in @scatterlist
 * @direction: DMA direction
 * @flags: transfer ack flags
 */
static struct dma_async_tx_descriptor *xilinx_dma_prep_slave_sg(
	struct dma_chan *dchan, struct scatterlist *sgl, unsigned int sg_len,
	enum dma_transfer_direction direction, unsigned long flags,
	void *context)
{
	struct xilinx_dma_chan *chan;
	struct xilinx_dma_desc_sw *first = NULL, *prev = NULL, *new = NULL;
	struct xilinx_dma_desc_hw *hw = NULL, *prev_hw = NULL;

	size_t copy;

	int i;
	struct scatterlist *sg;
	size_t sg_used;
	dma_addr_t dma_src;

#ifdef TEST_DMA_WITH_LOOPBACK
	int total_len;
#endif
	if (!dchan)
		return NULL;

	chan = to_xilinx_chan(dchan);
	dev_err(chan->dev, "Preparing Transfer Descriptor for channel %d\n", chan->id);

	if (chan->direction != direction) {
    dev_err(chan->dev, "Incorrect direction for channel %d\n", chan->id);
		return NULL;
  }

#ifdef TEST_DMA_WITH_LOOPBACK
	total_len = 0;

  dev_err(chan->dev, "Preparing Loopback for channel %d\n", chan->id);

	for_each_sg(sgl, sg, sg_len, i) {
		total_len += sg_dma_len(sg);
	}
#endif
	/* Build transactions using information in the scatter gather list */
	dev_err(chan->dev, "Looping SG List for channel %d\n", chan->id);
	for_each_sg(sgl, sg, sg_len, i) {
		sg_used = 0;
		dev_err(chan->dev, "Setting up SG descriptor %d for channel %d\n", i, chan->id);

		/* Loop until the entire scatterlist entry is used */
		while (sg_used < sg_dma_len(sg)) {
			dev_err(chan->dev, "Setting up SG Entry %d for channel %d\n", sg_used, chan->id);

			/* Allocate the link descriptor from DMA pool */
			new = xilinx_dma_alloc_descriptor(chan);
			if (!new) {
				dev_err(chan->dev,
					"No free memory for link descriptor\n");
				goto fail;
			}

			/*
			 * Calculate the maximum number of bytes to transfer,
			 * making sure it is less than the hw limit
			 */
			copy = min((size_t)(sg_dma_len(sg) - sg_used),
				   (size_t)chan->max_len);
			dev_err(chan->dev, "Number of bytes to copy %d\n", copy);
			hw = &(new->hw);

			dma_src = sg_dma_address(sg) + sg_used;

			dev_err(chan->dev, "DMA SRC %x\n", dma_src);

			if (!chan->has_dre) {
				dev_err(chan->dev, "Channel %d does not have DRE, validating address %x\n", chan->id, dma_src);
				if (dma_src & (8 - 1)) {
				  dev_err(chan->dev, "Channel %d ERROR, Address %x IS NOT 8 word aligned\n", chan->id, dma_src);
        }
			}

			hw->buf_addr = dma_src;

			/* Fill in the descriptor */
			hw->control = copy;

			/*
			 * If this is not the first descriptor, chain the
			 * current descriptor after the previous descriptor
			 *
			 * For the first DMA_MEM_TO_DEV transfer, set SOP
			 */
			if (!first) {
        dev_err(chan->dev, "We are the first descriptor 0x%p\n", hw);
				first = new;
				if (direction == DMA_MEM_TO_DEV) {
          dev_err(chan->dev, "Setting TXSOF");
					hw->control |= XILINX_DMA_BD_SOP;
#ifdef TEST_DMA_WITH_LOOPBACK
					hw->app_4 = total_len;
#endif
				}
			} else {
        dev_err(chan->dev, "We are NOT the first descriptor 0x%p\n", hw);
				prev_hw = &(prev->hw);
				prev_hw->next_desc = new->async_tx.phys;
			}

			new->async_tx.cookie = 0;
			async_tx_ack(&new->async_tx);

			prev = new;
			sg_used += copy;

			/* Insert the link descriptor into the LD ring */
      dev_err(chan->dev, "Inserting descriptor 0x%p into the LD Ring\n", hw);
			list_add_tail(&new->node, &first->tx_list);
		}
	}
  dev_err(chan->dev, "Looped SG List\n");

	/* Link the last BD with the first BD */
  dev_err(chan->dev, "Pointing next desc for last bd 0x%p to descriptor 0x%x\n", hw, first->async_tx.phys);
	hw->next_desc = first->async_tx.phys;

	if (direction == DMA_MEM_TO_DEV) {
    dev_err(chan->dev, "Setting TXEOF on descriptor 0x%p\n", hw);
		hw->control |= XILINX_DMA_BD_EOP;
  }

	/* All scatter gather list entries has length == 0 */
	if (!first || !new) {
    dev_err(chan->dev, "SG List entried have a length of 0\n");
		return NULL;
  }

	new->async_tx.flags = flags;
	new->async_tx.cookie = -EBUSY;

  if (0) { // if MicroDMA Mode
    /* Set EOP to the last link descriptor of new list */
    hw->control |= XILINX_DMA_BD_EOP;
    dev_err(chan->dev, "Setting EOP to last descriptor in list\n");
  }

	return &first->async_tx;

fail:
  dev_err(chan->dev, "Failed setting up TX descriptor\n");
	/*
	 * If first was not set, then we failed to allocate the very first
	 * descriptor, and we're done
	 */
	if (!first)
		return NULL;

	/*
	 * First is set, so all of the descriptors we allocated have been added
	 * to first->tx_list, INCLUDING "first" itself. Therefore we
	 * must traverse the list backwards freeing each descriptor in turn
	 */
  dev_err(chan->dev, "Freeing descriptor list\n");
	xilinx_dma_free_desc_list_reverse(chan, &first->tx_list);

	return NULL;
}

/* Run-time device configuration for Axi DMA */
static int xilinx_dma_device_control(struct dma_chan *dchan,
				     enum dma_ctrl_cmd cmd, unsigned long arg)
{
	struct xilinx_dma_chan *chan;
	unsigned long flags;

	if (!dchan)
		return -EINVAL;

	chan = to_xilinx_chan(dchan);

	if (cmd == DMA_TERMINATE_ALL) {
    dev_err(chan->dev, "Halting DMA engine\n");
		/* Halt the DMA engine */
		dma_halt(chan);

		spin_lock_irqsave(&chan->lock, flags);

		/* Remove and free all of the descriptors in the lists */
		xilinx_dma_free_desc_list(chan, &chan->pending_list);
		xilinx_dma_free_desc_list(chan, &chan->active_list);

		spin_unlock_irqrestore(&chan->lock, flags);
    dev_err(chan->dev, "DMA Engine Halted\n");
		return 0;
	} else if (cmd == DMA_SLAVE_CONFIG) {
		/*
		 * Configure interrupt coalescing and delay counter
		 * Use value XILINX_DMA_NO_CHANGE to signal no change
		 */
		struct xilinx_dma_config *cfg = (struct xilinx_dma_config *)arg;
		u32 reg = dma_read(chan, XILINX_DMA_CONTROL_OFFSET);
    dev_err(chan->dev, "Configure Slave config for channel %d\n", chan->id);
    dev_err(chan->dev, "Current Control register for channel %d: 0x%x\n", chan->id, reg);

		if (cfg->coalesc <= XILINX_DMA_COALESCE_MAX) {
			reg &= ~XILINX_DMA_XR_COALESCE_MASK;
			reg |= cfg->coalesc << XILINX_DMA_COALESCE_SHIFT;

			chan->config.coalesc = cfg->coalesc;
      dev_err(chan->dev, "Set coalesc to %x for channel %d\n", chan->config.coalesc, chan->id);
		}

		if (cfg->delay <= XILINX_DMA_DELAY_MAX) {
			reg &= ~XILINX_DMA_XR_DELAY_MASK;
			reg |= cfg->delay << XILINX_DMA_DELAY_SHIFT;
			chan->config.delay = cfg->delay;
      dev_err(chan->dev, "Set delay to %x for channel %d\n", chan->config.coalesc, chan->id);
		}

		dma_write(chan, XILINX_DMA_CONTROL_OFFSET, reg);

    xilinx_dma_channel_debug(chan);
    dev_err(chan->dev, "New Control register for channel %d: 0x%x\n", chan->id, reg);

		return 0;
	} else
		return -ENXIO;
}

static void xilinx_dma_free_channels(struct xilinx_dma_device *xdev)
{
	int i;
  dev_err(xdev->dev, "Freeing DMA channels\n");

	for (i = 0; i < XILINX_DMA_MAX_CHANS_PER_DEVICE; i++) {
    dev_err(xdev->dev, "Freeing DMA channel %d\n", i);
		list_del(&xdev->chan[i]->common.device_node);
		tasklet_kill(&xdev->chan[i]->tasklet);
		irq_dispose_mapping(xdev->chan[i]->irq);
	}
}

/*
 * Probing channels
 *
 * . Get channel features from the device tree entry
 * . Initialize special channel handling routines
 */
static int xilinx_dma_chan_probe(struct xilinx_dma_device *xdev,
				 struct device_node *node, u32 feature)
{
	struct xilinx_dma_chan *chan;
	int err;
	u32 device_id, value, width = 0;

	/* alloc channel */
	dev_err(xdev->dev, "<1>Probing DMA Channel\n");
	chan = devm_kzalloc(xdev->dev, sizeof(*chan), GFP_KERNEL);
	if (!chan)
		return -ENOMEM;

	chan->feature = feature;
	chan->max_len = XILINX_DMA_MAX_TRANS_LEN;

	dev_err(xdev->dev, "Reading include-dre\n");
	chan->has_dre = of_property_read_bool(node, "xlnx,include-dre");
	dev_err(xdev->dev, "Read DRE value of %d\n", chan->has_dre);

	dev_err(xdev->dev, "<1>Reading datawidth\n");
	err = of_property_read_u32(node, "xlnx,datawidth", &value);
	if (err) {
		dev_err(xdev->dev, "unable to read data width property");
		return err;
	} else {
		dev_err(xdev->dev, "<1>We read a value of %d\n", value);
		width = value >> 3; /* convert bits to bytes */

		/* If data width is greater than 8 bytes, DRE is not in hw */
		if (width > 8)
			chan->has_dre = 0;

		chan->feature |= width - 1;
	}

	dev_err(xdev->dev, "<1>Reading Device ID\n");
	err = of_property_read_u32(node, "xlnx,device-id", &device_id);
	if (err) {
		dev_err(xdev->dev, "unable to read device id property");
		return err;
	}

	chan->has_sg = (xdev->feature & XILINX_DMA_FTR_HAS_SG) >>
		       XILINX_DMA_FTR_HAS_SG_SHIFT;

	chan->start_transfer = xilinx_dma_start_transfer;

	if (of_device_is_compatible(node, "xlnx,axi-dma-mm2s-channel")) {
	  dev_err(xdev->dev, "<1>Mem to Dev channel, mm2s\n");
		chan->direction = DMA_MEM_TO_DEV;
  }

	if (of_device_is_compatible(node, "xlnx,axi-dma-s2mm-channel")) {
	  dev_err(xdev->dev, "<1>Dev to Mem channel, s2mm\n");
		chan->direction = DMA_DEV_TO_MEM;
  }

	chan->regs = xdev->regs;

	if (chan->direction == DMA_DEV_TO_MEM) {
		chan->regs = (xdev->regs + XILINX_DMA_RX_CHANNEL_OFFSET);
		chan->id = 1;
	}

	/*
	 * Used by dmatest channel matching in slave transfers
	 * Can change it to be a structure to have more matching information
	 */
	chan->private = (chan->direction & 0xFF) | XILINX_DMA_IP_DMA |
			(device_id << XILINX_DMA_DEVICE_ID_SHIFT);
	chan->common.private = (void *)&(chan->private);

	if (!chan->has_dre) {
		xdev->common.copy_align = 3; //fls(width - 1);
	  dev_err(xdev->dev, "Device is missing DRE, setting copy align to 2^%d\n", xdev->common.copy_align);
  } else {
	  dev_err(xdev->dev, "Device has DRE skip setting copy_align\n");
  }

	chan->dev = xdev->dev;
	xdev->chan[chan->id] = chan;

	/* Initialize the channel */
	dev_err(xdev->dev, "<1>Starting DMA channel\n");
	err = dma_reset(chan);
	if (err) {
		dev_err(xdev->dev, "Reset channel failed\n");
		return err;
	}

	dev_err(xdev->dev, "<1>Init Spinlock\n");
	spin_lock_init(&chan->lock);
	INIT_LIST_HEAD(&chan->pending_list);
	INIT_LIST_HEAD(&chan->active_list);

	chan->common.device = &xdev->common;
	dev_err(xdev->dev, "<1>Looking for IRQ node\n");

	/* find the IRQ line, if it exists in the device tree */
	chan->irq = irq_of_parse_and_map(node, 0);
	err = devm_request_irq(xdev->dev, chan->irq, dma_intr_handler,
			       IRQF_SHARED,
			       "xilinx-dma-controller", chan);
	if (err) {
		dev_err(xdev->dev, "unable to request IRQ\n");
		return err;
	}
	dev_err(xdev->dev, "<1>IRQ Found for channel %d: %d\n", chan->id, chan->irq);

	tasklet_init(&chan->tasklet, dma_do_tasklet, (unsigned long)chan);

	dev_err(xdev->dev, "<1>Adding channel %d to device list\n", chan->id);
	/* Add the channel to DMA device channel list */
	list_add_tail(&chan->common.device_node, &xdev->common.channels);

  xilinx_dma_channel_debug(chan);

	dev_err(xdev->dev, "<1>Channel %d Registered\n", chan->id);

	return 0;
}

static int xilinx_dma_probe(struct platform_device *pdev)
{
	struct xilinx_dma_device *xdev;
	struct device_node *child, *node;
	struct resource *res;
	int ret;
	u32 value;
	
	dev_err(&pdev->dev, "<1>Trying to allocate memory\n");

	xdev = devm_kzalloc(&pdev->dev, sizeof(*xdev), GFP_KERNEL);
	if (!xdev) {
		dev_err(&pdev->dev, "<1>Allocation failed!\n");
		return -ENOMEM;
	}

	xdev->dev = &(pdev->dev);
	INIT_LIST_HEAD(&xdev->common.channels);

	node = pdev->dev.of_node;

	/* iomap registers */
	dev_err(&pdev->dev, "<1>IO Mapping Registers\n");
	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
	xdev->regs = devm_ioremap_resource(&pdev->dev, res);
	if (IS_ERR(xdev->regs)) {
		dev_err(&pdev->dev, "<1>Memory Remap failed\n");
		return PTR_ERR(xdev->regs);
	}

	/* Check if SG is enabled */
	dev_err(&pdev->dev, "<1>Checking for SG support\n");
	value = of_property_read_bool(node, "xlnx,include-sg");
	if (value) {
		dev_err(&pdev->dev, "<1>SG Support is enabled\n");
		xdev->feature |= XILINX_DMA_FTR_HAS_SG;
	} else {
		dev_err(&pdev->dev, "<1>SG Support is disabled\n");
	}

	/* Check if status control streams are enabled */
	dev_err(&pdev->dev, "<1>Checking for Control Stream\n");
	value = of_property_read_bool(node,
				      "xlnx,sg-include-stscntrl-strm");
	if (value) {
		dev_err(&pdev->dev, "<1>Control Stream exists\n");
		xdev->feature |= XILINX_DMA_FTR_STSCNTRL_STRM;
	} else {
		dev_err(&pdev->dev, "<1>Control Stream is disabled\n");
	}

	/* Axi DMA only do slave transfers */
	dev_err(&pdev->dev, "<1>Setting up Local DMA Device Struct\n");
	dma_cap_set(DMA_SLAVE, xdev->common.cap_mask);
	dma_cap_set(DMA_PRIVATE, xdev->common.cap_mask);
	xdev->common.device_prep_slave_sg = xilinx_dma_prep_slave_sg;
	xdev->common.device_control = xilinx_dma_device_control;
	xdev->common.device_issue_pending = xilinx_dma_issue_pending;
	xdev->common.device_alloc_chan_resources =
		xilinx_dma_alloc_chan_resources;
	xdev->common.device_free_chan_resources =
		xilinx_dma_free_chan_resources;
	xdev->common.device_tx_status = xilinx_tx_status;
	xdev->common.dev = &pdev->dev;

	dev_err(&pdev->dev, "<1>Setting Local Device Struct\n");
	platform_set_drvdata(pdev, xdev);

	dev_err(&pdev->dev, "<1>Looping child nodes\n");
	for_each_child_of_node(node, child) {
		dev_err(&pdev->dev, "<1>Processing Child\n");
		ret = xilinx_dma_chan_probe(xdev, child, xdev->feature);
		if (ret) {
			dev_err(&pdev->dev, "Probing channels failed\n");
			goto free_chan_resources;
		} else {
			dev_err(&pdev->dev, "<1>Probing succeeded\n");
		}
	}
	dev_err(&pdev->dev, "<1>Looping children done\n");

	dev_err(&pdev->dev, "<1>Register Async DMA\n");
	ret = dma_async_device_register(&xdev->common);
	if (ret) {
		dev_err(&pdev->dev, "DMA device registration failed\n");
		goto free_chan_resources;
	}

	dev_info(&pdev->dev, "Probing xilinx axi dma engine...Successful\n");

	return 0;

free_chan_resources:
	xilinx_dma_free_channels(xdev);

	return ret;
}

static int xilinx_dma_remove(struct platform_device *pdev)
{
	struct xilinx_dma_device *xdev;
	dev_info(&pdev->dev, "Removing xilinx axi dma engine...\n");

	xdev = platform_get_drvdata(pdev);
	dma_async_device_unregister(&xdev->common);

	xilinx_dma_free_channels(xdev);

	dev_info(&pdev->dev, "Removing xilinx axi dma engine...Successful\n");

	return 0;
}

static const struct of_device_id xilinx_dma_of_match[] = {
	{ .compatible = "xlnx,axi-dma", },
	{}
};
MODULE_DEVICE_TABLE(of, xilinx_dma_of_match);

static struct platform_driver xilinx_dma_driver = {
	.driver = {
		.name = "xilinx-dma",
		.owner = THIS_MODULE,
		.of_match_table = xilinx_dma_of_match,
	},
	.probe = xilinx_dma_probe,
	.remove = xilinx_dma_remove,
};

module_platform_driver(xilinx_dma_driver);

MODULE_AUTHOR("Xilinx, Inc.");
MODULE_DESCRIPTION("Xilinx DMA driver");
MODULE_LICENSE("GPL v2");
