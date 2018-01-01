# Sega Dreamcast Maplebus Transceiver #

I started this project because my TV is too far away from my couch to use the wired controller. The Dreamcast controller also felt horrible in my hands. I really liked the XBOX 360 controller so I figured I would try making an adapter. I have never done any hardware, so there were a lot of failures.

[Video of it working!](https://drive.google.com/file/d/1nLXLF5z0leBjxTOpl1LVw67GhCSi6-Zy/view?usp=sharing)


### Cypress EZ-USB FX2 ###
My original design used a [Cypress EZ-USB FX2](http://www.cypress.com/products/ez-usb-fx2lp). A computer was required to act as the USB host for the Xbox 360 controller and the EZ-USB was used to convert the Dreamcast into a USB peripheral. I then wrote a C# app that connected to both USB devices and translated the requests between the controller and the Dreamcast. This design had polling issues. USB 2.0 takes at least 125 microseconds per transaction. When the Maplebus sends a command to a peripheral it expects a response in 1 millisecond or else it thinks the device has been disconnected. Since I was using a desktop running Windows hitting the 1 millisecond round trip deadline was challenging. The controller worked but would disconnect randomly. Another issue was that since the EZ-USB's FIFO is build for parallel protocols, and the Maplebus is serial I was only able to use 1 bit out of each byte. The EZ-USB has a 4K FIFO buffer so I was only able to send and receive packets <= 500 bytes. The Maplebus is capable of sending up to 1K packets so this wasn't going to work if I wanted to emulate a VMU.

I'll see if I can find the C# app and the EZ-USB code.

### Altera MAX V ###

The second design used an [Altera MAX V CPLD](https://www.altera.com/products/cpld/max-series/max-v/overview.html). I don't remember the specifics of this build. I think I was still going to use the EZ-USB and a desktop as the host, but I was going to use the CPLD to do the serial to paralell conversion. I think I had signal issues with this design. I had a bit flipping between the EZ-USB input and USB packet the host saw. It also suffered from the latency issues described above.

### Xilinx MicroZed 7010 ###

In order to fix the latency issue I decided that I needed a dedicated USB host for the Xbox controller. I settled on the [MicroZed 7010](http://zedboard.org/product/microzed). It is an SoC with an FPGA and an ARM processor. This thing is awesome and way overpowered for what I needed. The Vivado tool chain is super nice. The Maplebus transceiver exposes a bi-directional [AXI4 Stream](https://www.xilinx.com/support/documentation/ip_documentation/ug761_axi_reference_guide.pdf) that is used to send and receive the Maplebus frames, IRQs to notify the CPU when a packet has been received (no polling!), and a control register to configure the hardware. The Maplebus AXIS then connects to a AXI Interconnect that connects to the ARM CPU. This allows the hardware to do the DMA. It supports a loopback mode where the tx and rx are both connected to the same bus. You can see the hardware code [here](https://github.com/ismell/maplebus/tree/master/rxMapleBus/hdl). I've never done Verilog or hardware coding so if you see any bugs or things that are just plain wrong let me know.

 I was originally going to use an RTOS but at the time I couldn't find anything that would support being a USB host. I also didn't want to write a Xbox 360 USB Controller driver. So I decided to use [Petalinux](http://www.wiki.xilinx.com/PetaLinux). It comes with everything required to boot a full working machine and it also included a AXI DMA Driver. I started writing a [maplebus character driver](https://github.com/ismell/maplebus/blob/master/Petalinux/components/modules/maple_bus/char.c). I realized that a better fit would be a network driver since the maplebus deals in packets. So I instead wrote a [network driver](https://github.com/ismell/maplebus/blob/master/Petalinux/components/modules/maple_bus/net.c). When writing the driver I realized that the AXI DMA driver had some bugs and strange behavior it in. I forke the [module](https://github.com/ismell/maplebus/blob/master/Petalinux/components/modules/xilinx_axidma_debug/xilinx_axidma_debug.c) and added a lot of instrumentation and fixed some of the bugs.

 Now that I had a network driver and was able to `ifconfig up maplebus0` I needed something to actually read and write the packets. I wrote the [controller app](https://github.com/ismell/maplebus/blob/master/Petalinux/components/apps/base/base.c) that bridges the maplebus0 interface and the Xbox 360 Controller. The code is a bit hacky, but it works! There is a memory leak somewhere because it will crash after about 10 minutes. I haven't had a chance to look into it.

 In order to have a fast dev test cycle, I tftpboot the linux image from my dev machine. If I'm only changing the controller app I can build and copy that over and avoid a reboot.

 ### Wishlist ###

 - [ ] Rumble pack support
 - [ ] Memory card emulation

References:

* http://mc.pp.se/dc/maplewire.html
* http://mc.pp.se/dc/maplebus.html
* Maplebus patent