#include <linux/interrupt.h>
#include <linux/dmaengine.h>
#include <linux/amba/xilinx_dma.h>

#include "core.h"

#ifndef __LINUX_MAPLE_BUS_DMA_H
#define __LINUX_MAPLE_BUS_DMA_H

int maple_bus_find_dma_channels(struct maple_bus_global *gp, u32 device_id);
void maple_bus_free_dma_channels(struct maple_bus_global *gp);

#endif /* __LINUX_MAPLE_BUS_DMA_H */