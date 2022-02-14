/* 
 * The MIT License (MIT)
 *
 * Copyright (c) 2022 Raul E Rangel
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 *
 * This file is part of the TinyUSB stack.
 */

#include "tusb_option.h"

#if (TUSB_OPT_HOST_ENABLED && CFG_TUH_X360)

#include "host/usbh.h"
#include "x360.h"

//--------------------------------------------------------------------+
// MACRO CONSTANT TYPEDEF
//--------------------------------------------------------------------+

typedef struct
{
  uint8_t itf_num;
  uint8_t ep_in_addr;
  uint8_t ep_out_addr;

  uint16_t epin_size;
  uint16_t epout_size;

  uint8_t epin_buf[64];
  uint8_t epout_buf[64];
} x360_interface_t;

typedef struct
{
  uint8_t inst_count;
  x360_interface_t instances[CFG_TUH_X360];
} x360_device_t;

static x360_device_t _x360_dev[CFG_TUSB_HOST_DEVICE_MAX];

//------------- Internal prototypes -------------//

// Get Gamepad device & interface
TU_ATTR_ALWAYS_INLINE static inline x360_device_t* get_dev(uint8_t dev_addr);
TU_ATTR_ALWAYS_INLINE static inline x360_interface_t* get_instance(uint8_t dev_addr, uint8_t instance);
static x360_interface_t *get_instance_id_by_itfnum(uint8_t dev_addr, uint8_t itf);
static x360_interface_t *get_instance_id_by_epaddr(uint8_t dev_addr, uint8_t ep_addr);

TU_ATTR_ALWAYS_INLINE static inline bool x360_get_report(uint8_t dev_addr, x360_interface_t* x360_itf)
{
  return usbh_edpt_xfer(dev_addr, x360_itf->ep_in_addr, x360_itf->epin_buf, x360_itf->epin_size);
}

//--------------------------------------------------------------------+
// Application API
//--------------------------------------------------------------------+

//--------------------------------------------------------------------+
// USBH API
//--------------------------------------------------------------------+
void x360_init(void)
{
  TU_LOG2("%s: start\r\n", __func__);
  tu_memclr(_x360_dev, sizeof(_x360_dev));
}

typedef __attribute__((packed)) struct
{
  uint8_t type;
  uint8_t msg_size;
  union {
    struct x360_report {
      struct {
        uint8_t up:1;
        uint8_t down:1;
        uint8_t left:1;
        uint8_t right:1;
        uint8_t start:1;
        uint8_t back:1;
        uint8_t l3:1;
        uint8_t r3:1;
      };
      struct {
        uint8_t left_bouncer:1;
        uint8_t right_bouncer:1;
        uint8_t xbox:1;
        uint8_t reserved_btn:1;
        uint8_t a:1;
        uint8_t b:1;
        uint8_t x:1;
        uint8_t y:1;
      };
      uint8_t left_trigger;
      uint8_t right_trigger;
      int16_t lx; /* Little-endien */
      int16_t ly; /* Little-endien */
      int16_t rx; /* Little-endien */
      int16_t ry; /* Little-endien */
      uint8_t reserved_end[6];
    } msg_0;
    struct {
      uint8_t unknown; /* 0x0E */
    } msg_1;
    struct {
      uint8_t unknown; /* 0x00 */
    } msg_2;
    struct {
      uint8_t unknown; /* 0x03 */
    } msg_3;
    struct {
      uint8_t unknown; /* 0x00 */
    } msg_8;
  };
} x360_rx_msg_t;

void x360_print_status(struct x360_report *report) {
  TU_LOG2(
      "up: %hhu, down: %hhu, left: %hhu, right: %hhu, start: %hhu, back: "
      "%hhu, l3: %hhu, r3: %hhu, left_bouncer: %hhu, right_bouncer: %hhu, "
      "xbox: %hhu, a: %hhu, b: %hhu, x: %hhu, y: %hhu\r\n",
      report->up, report->down, report->left, report->right, report->start,
      report->back, report->l3, report->r3, report->left_bouncer,
      report->right_bouncer, report->xbox, report->a, report->b,
      report->x, report->y);
  TU_LOG2(
      "left_trigger: %hhu, right_trigger: %hhu, lx: %hd, ly: %hd, rx: %hd, ry: "
      "%hd\r\n",
      report->left_trigger, report->right_trigger, report->lx, report->ly,
      report->rx, report->ry);
}

bool x360_xfer_cb(uint8_t dev_addr, uint8_t ep_addr, xfer_result_t result, uint32_t xferred_bytes)
{
  TU_LOG2("%s: start\r\n", __func__);

  x360_rx_msg_t *msg;
  x360_interface_t *x360_itf = get_instance_id_by_epaddr(dev_addr, ep_addr);

  TU_ASSERT(x360_itf);
  TU_ASSERT(result == XFER_RESULT_SUCCESS);
  TU_ASSERT(xferred_bytes >= 2);

  msg = (x360_rx_msg_t *)x360_itf->epin_buf;

  switch (msg->type) {
    case 0:
      TU_ASSERT((sizeof(msg->msg_0) + 2) == xferred_bytes);
      x360_print_status(&msg->msg_0);
      break;
    default:
      TU_LOG2("%s: Unknown msg type: %u\n", __func__, msg->type);
  }

  return x360_get_report(dev_addr, x360_itf);
}

void x360_close(uint8_t dev_addr)
{
  TU_LOG2("%s: start\r\n", __func__);
  x360_device_t *x360_dev = get_dev(dev_addr);

  tu_memclr(x360_dev, sizeof(*x360_dev));
}

//--------------------------------------------------------------------+
// Enumeration
//--------------------------------------------------------------------+

bool x360_open(uint8_t rhport, uint8_t dev_addr, tusb_desc_interface_t const *desc_itf, uint16_t *p_length)
{
  tusb_desc_t const *desc = (tusb_desc_t const *) desc_itf;
  tusb_desc_endpoint_t *desc_ep;

  TU_LOG2("%s: start\r\n", __func__);

  // TODO: We need to check the VID/PID of the device...
  if (desc_itf->bInterfaceClass == 255 && 
      desc_itf->bInterfaceSubClass == 93 &&
      desc_itf->bInterfaceProtocol == 1 &&
      desc_itf->bNumEndpoints == 2) {
    TU_LOG2("%s: Found XBOX 360 Wired Controller on interface %u\r\n", __func__, desc_itf->bInterfaceNumber);

    // The lack of bounds checking is concerning...

    // Undocumented "HID" descriptor
    desc = (tusb_desc_t*)tu_desc_next(desc);
    TU_ASSERT(0x21 == desc->bDescriptorType);

    // Verify IN endpoint
    desc_ep = (tusb_desc_endpoint_t *)tu_desc_next(desc);
    TU_VERIFY(TUSB_DESC_ENDPOINT == desc_ep->bDescriptorType);
    TU_VERIFY(0x81 == desc_ep->bEndpointAddress);
    TU_VERIFY(32 == desc_ep->wMaxPacketSize.size);
    TU_ASSERT(TUSB_XFER_INTERRUPT == desc_ep->bmAttributes.xfer);

    x360_device_t *x360_dev = get_dev(dev_addr);
    TU_ASSERT(x360_dev);

    x360_interface_t *x360_itf = get_instance(dev_addr, x360_dev->inst_count);
    TU_ASSERT(x360_itf);
    x360_dev->inst_count++;

    x360_itf->itf_num = desc_itf->bInterfaceNumber;
    x360_itf->ep_in_addr = desc_ep->bEndpointAddress;
    x360_itf->epin_size = desc_ep->wMaxPacketSize.size;

    TU_ASSERT(x360_itf->epin_size <= sizeof(x360_itf->epin_buf));

    // Open IN endpoint
    TU_ASSERT( usbh_edpt_open(rhport, dev_addr, desc_ep) );

    // Verify OUT endpoint
    desc_ep = (tusb_desc_endpoint_t *)tu_desc_next(desc_ep);
    TU_VERIFY(TUSB_DESC_ENDPOINT == desc_ep->bDescriptorType);
    TU_VERIFY(0x2 == desc_ep->bEndpointAddress);
    TU_VERIFY(32 == desc_ep->wMaxPacketSize.size);

    // Open OUT endpoint
    // Hrmm, we can't open an OUT interrupt endpoint...
    // TU_ASSERT( usbh_edpt_open(rhport, dev_addr, desc_ep) );

    *p_length = (uintptr_t)tu_desc_next(desc_ep) - (uintptr_t)desc_itf;
  } else {
    TU_LOG2("%s: Unknown interface descriptor\n", __func__);
    *p_length = sizeof(*desc_itf);
  }

  return true;
}

bool x360_set_config(uint8_t dev_addr, uint8_t itf_num)
{
  TU_LOG2("%s: start\r\n", __func__);

  x360_interface_t *x360_itf = get_instance_id_by_itfnum(dev_addr, itf_num);
  TU_ASSERT(x360_itf);

  return x360_get_report(dev_addr, x360_itf);
}

//--------------------------------------------------------------------+
// Report Descriptor Parser
//--------------------------------------------------------------------+

//--------------------------------------------------------------------+
// Helper
//--------------------------------------------------------------------+

// Get Device by address
TU_ATTR_ALWAYS_INLINE static inline x360_device_t* get_dev(uint8_t dev_addr)
{
  uint8_t idx;

  TU_ASSERT(dev_addr >= 1, NULL);
  
  idx = dev_addr - 1;

  TU_ASSERT(idx < TU_ARRAY_SIZE(_x360_dev), NULL);

  return &_x360_dev[idx];
}

// Get Interface by instance number
TU_ATTR_ALWAYS_INLINE static inline x360_interface_t* get_instance(uint8_t dev_addr, uint8_t instance)
{
  x360_device_t *dev = get_dev(dev_addr);

  TU_ASSERT(instance < TU_ARRAY_SIZE(dev->instances), NULL);

  return &dev->instances[instance];
}

// Get instance ID by interface number
static x360_interface_t *get_instance_id_by_itfnum(uint8_t dev_addr, uint8_t itf)
{
  x360_device_t *dev = get_dev(dev_addr);

  TU_ASSERT(dev, NULL);

  for ( unsigned int i = 0; i < TU_ARRAY_SIZE(dev->instances); i++ )
  {
    x360_interface_t *inst = &dev->instances[i];
    if ( (inst->itf_num == itf) && (inst->ep_in_addr || inst->ep_out_addr) )
      return inst;
  }

  return NULL;
}

// Get instance ID by endpoint address
static x360_interface_t *get_instance_id_by_epaddr(uint8_t dev_addr, uint8_t ep_addr)
{
  x360_device_t *dev = get_dev(dev_addr);

  TU_ASSERT(dev, NULL);

  for ( unsigned int i = 0; i < TU_ARRAY_SIZE(dev->instances); i++ )
  {
    x360_interface_t *inst = &dev->instances[i];
    if ( inst->ep_in_addr == ep_addr || inst->ep_out_addr == ep_addr )
      return inst;
  }

  return NULL;
}

#endif
