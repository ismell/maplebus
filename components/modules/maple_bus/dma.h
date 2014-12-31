#include <linux/interrupt.h>
#include <linux/dmaengine.h>
#include <linux/amba/xilinx_dma.h>

#include "core.h"

#ifndef __LINUX_MAPLE_BUS_DMA_H
#define __LINUX_MAPLE_BUS_DMA_H

static bool xdma_filter(struct dma_chan *chan, void *param);
static int maple_bus_find_dma_channels(struct maple_bus_global *gp, u32 device_id);

#endif /* __LINUX_MAPLE_BUS_DMA_H */