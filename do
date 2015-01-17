#!/bin/bash -e

#petalinux-build -c rootfs/xilinx_axidma_debug -v
cp /home/me/Projects/PetaLinux/HelloWorld/build/linux/rootfs/modules/xilinx_axidma_debug/xilinx_axidma_debug.ko /tftpboot/
#
#petalinux-build -c rootfs/axidmatest_debug -v
cp /home/me/Projects/PetaLinux/HelloWorld/build/linux/rootfs/modules/axidmatest_debug/axidmatest_debug.ko /tftpboot/
#
petalinux-build -c rootfs/base -v
cp /home/me/Projects/PetaLinux/HelloWorld/build/linux/rootfs/apps/base/base /tftpboot/

petalinux-build -c rootfs/maple_bus -v
cp /home/me/Projects/PetaLinux/HelloWorld/build/linux/rootfs/modules/maple_bus/maple_bus.ko /tftpboot/

