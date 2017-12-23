#include "utils.h"

/*
 * Device resource management aware netdev request/free implementation.
 */
struct netdev_devres {
  struct net_device *netdev;
};

static void devm_netdev_release(struct device *dev, void *res)
{
  struct netdev_devres *dr = res;

  printk(KERN_ALERT "freeing netdev 0x%p\n", dr->netdev);
  free_netdev(dr->netdev);
}

struct net_device *devm_alloc_netdev(struct device *dev, int sizeof_priv, const char *name,
            void (*setup)(struct net_device *))
{
  struct netdev_devres *dr = NULL;

  dr = devres_alloc(devm_netdev_release, sizeof(*dr), GFP_ATOMIC);
  if (!dr)
    return NULL;

  dr->netdev = alloc_netdev(sizeof_priv, name, setup);
  
  if (dr->netdev) {
    devres_add(dev, dr);
  } else {
    devres_free(dr);
    return ERR_PTR(-ENOMEM);
  }

  SET_NETDEV_DEV(dr->netdev, dev);

  return dr->netdev;
}


static void devm_register_netdev_release(struct device *dev, void *res)
{
  struct netdev_devres *dr = res;

  printk(KERN_ALERT "releasing netdev 0x%p\n", dr->netdev);
  unregister_netdev(dr->netdev);
}

int devm_register_netdev(struct device *dev, struct net_device *netdev)
{
  struct netdev_devres *dr = NULL;
  int err;

  dr = devres_alloc(devm_register_netdev_release, sizeof(*dr), GFP_ATOMIC);
  if (!dr)
    return -ENOMEM;

  dr->netdev = netdev;

  if ((err = register_netdev(netdev))) {
    devres_free(dr);
    return err;
  } else {
    devres_add(dev, dr);
  }

  return 0;
}