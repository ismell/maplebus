#include <linux/netdevice.h>


#ifndef __LINUX_MAPLE_BUS_UTILS_H
#define __LINUX_MAPLE_BUS_UTILS_H

struct net_device *devm_alloc_netdev(struct device *dev, int sizeof_priv, const char *name,
    void (*setup)(struct net_device *));

int devm_register_netdev(struct device *dev, struct net_device *netdev);

#endif /* __LINUX_MAPLE_BUS_UTILS_H */