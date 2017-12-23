#include <linux/kernel.h>

#ifndef __LINUX_MAPLE_BUS_CORE_H
#define __LINUX_MAPLE_BUS_CORE_H

#define MAPLE_BUS_ALEN      1             /* Octets in one maple bus addr. */
#define MAPLE_BUS_HLEN      4             /* Total octets in header.       */
#define MAPLE_BUS_DATA_LEN  4 + 1024 + 2  /* Max. octets in payload.       */

#define ETH_P_MAPLE_BUS     0x00F8    /* Maple Bus protocol  */

/*
 *  This is a maple bus frame header.
 */

struct maple_bus_header {
  unsigned char command;                /* destination eth addr */
  unsigned char dest[MAPLE_BUS_ALEN];   /* destination maple bus addr */
  unsigned char source[MAPLE_BUS_ALEN]; /* source maple bus addr  */
  u8 words;                             /* additional words in frame */
} __attribute__((packed));

struct maple_bus_global {
  spinlock_t rx_chan_lock;
  struct dma_chan *rx_chan;

  spinlock_t tx_chan_lock;
  struct dma_chan *tx_chan;

  unsigned pause;
  unsigned loopback;

  spinlock_t lock;
};

struct maple_bus_local {
  /* Begin: frequently used values: keep adjacent for cache effect */
  u32 msg_enable        ____cacheline_aligned;

  unsigned magic;
  #define MAPLE_BUS_LOCAL_MAGIC 0x5007C0DE
  struct maple_bus_global *global;

  void __iomem *base_addr;
  int irq;

  struct tasklet_struct tasklet;  /* Cleanup work after irq */

  spinlock_t rx_lock;
  int pending_rx;
  int total_rx;
  
  spinlock_t cmd_lock;
  struct device *dev;
  enum dma_transfer_direction direction;

#ifdef MAPLE_CHAR
  struct cdev cdev;
  int nreaders, nwriters;
#endif
};

#endif /* __LINUX_MAPLE_BUS_CORE_H */