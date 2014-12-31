#include <linux/kernel.h>
#include <linux/io.h>
#include "core.h"

#ifndef __LINUX_MAPLE_BUS_HW_H
#define __LINUX_MAPLE_BUS_HW_H

#define MAPLE_BUS_MAGIC_NUMBER 0xB82FD918
#define MAPLE_BUS_MAX_RESET_WAIT_TIME 5000

#define MAPLE_BUS_CONTROL_REG   4*0
#define MAPLE_BUS_STATUS_REG    4*1
#define MAPLE_BUS_TX_COUNT_REG  4*2
#define MAPLE_BUS_RX_COUNT_REG  4*3
#define MAPLE_BUS_MAGIC_REG     4*7


#define MAPLE_BUS_ENABLE_TX         1 << 0
#define MAPLE_BUS_ENABLE_RX         1 << 1
#define MAPLE_BUS_ENABLE_LOOPBACK   1 << 2
#define MAPLE_BUS_RESET_TX          1 << 3
#define MAPLE_BUS_RESET_RX          1 << 4
#define MAPLE_BUS_ENABLE_TX_IRQ     1 << 5
#define MAPLE_BUS_ENABLE_RX_IRQ     1 << 6

// Due to a verilog error we can only clear both irqs at once
#define MAPLE_BUS_CLEAR_IRQ         1 << 0
#define MAPLE_BUS_TX_IRQ_STATUS     1 << 1
#define MAPLE_BUS_RX_IRQ_STATUS     1 << 0

struct maple_bus_chan_count {
  u16 packets;
  u16 length;
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

static void maple_bus_get_count(struct maple_bus_local *lp, u32 reg, struct maple_bus_chan_count *count) {
  u32 value = maple_bus_read(lp, reg);
  count->packets = (value >> 16);
  count->length = (value & 0x0000FFFF);
}

static void maple_bus_set_flag(struct maple_bus_local *lp, u32 reg, u32 flags) {
  unsigned long irq_flags;
  u32 value;

  spin_lock_irqsave(&lp->cmd_lock, irq_flags);

  value = maple_bus_read(lp, reg);
  value |= flags;
  maple_bus_write(lp, reg, value);

  spin_unlock_irqrestore(&lp->cmd_lock, irq_flags);
}

static void maple_bus_unset_flag(struct maple_bus_local *lp, u32 reg, u32 flags) {
  unsigned long irq_flags;
  u32 value;
  
  spin_lock_irqsave(&lp->cmd_lock, irq_flags);

  value = maple_bus_read(lp, reg);
  value &= ~flags;
  maple_bus_write(lp, reg, value);

  spin_unlock_irqrestore(&lp->cmd_lock, irq_flags);
}

static int maple_bus_verify_magic(struct maple_bus_local *lp) {
  dev_info(lp->dev, "maple_bus: verifying magic number");
  if (maple_bus_read(lp, MAPLE_BUS_MAGIC_REG) == MAPLE_BUS_MAGIC_NUMBER) {
    dev_info(lp->dev, "maple_bus: magic number matched");
    return 0;
  } else {
    dev_err(lp->dev, "maple_bus: magic number did not match");
    return -ENODEV;
  }
}

static void maple_bus_reset_hw(struct maple_bus_local *lp) {
  unsigned i;
  u32 control;
  struct maple_bus_chan_count count;
  unsigned long flags;

  dev_info(lp->dev, "maple_bus: resetting hardware");

  spin_lock_irqsave(&lp->cmd_lock, flags);

  control = MAPLE_BUS_RESET_RX | MAPLE_BUS_RESET_TX;
  maple_bus_write(lp, MAPLE_BUS_CONTROL_REG, control);

  // Clear IRQs
  maple_bus_write(lp, MAPLE_BUS_STATUS_REG, 0xFFFFFFFF);
  for (i = 0; i < MAPLE_BUS_MAX_RESET_WAIT_TIME; ++i) {
    maple_bus_get_count(lp, MAPLE_BUS_TX_COUNT_REG, &count);
    if (count.packets || count.length)
      continue;

    maple_bus_get_count(lp, MAPLE_BUS_RX_COUNT_REG, &count);
    if (count.packets || count.length)
      continue;

    break;
  }

  control = MAPLE_BUS_ENABLE_TX | MAPLE_BUS_ENABLE_RX | MAPLE_BUS_ENABLE_LOOPBACK;
  maple_bus_write(lp, MAPLE_BUS_CONTROL_REG, control);

  spin_unlock_irqrestore(&lp->cmd_lock, flags);

  dev_info(lp->dev, "maple_bus: hardware reset");
}


#endif /* __LINUX_MAPLE_BUS_HW_H */