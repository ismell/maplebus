/* 
 * The MIT License (MIT)
 *
 * Copyright (c) 2020, Ha Thach (tinyusb.org)
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

#if TUSB_OPT_HOST_ENABLED

#include "tusb.h"
#include "usbh_hcd.h"

enum
{
  STAGE_SETUP,
  STAGE_DATA,
  STAGE_ACK
};

typedef struct
{
  tusb_control_request_t request TU_ATTR_ALIGNED(4);

  uint8_t stage;
  uint8_t* buffer;
  tuh_control_complete_cb_t complete_cb;
} usbh_control_xfer_t;

static usbh_control_xfer_t _ctrl_xfer;

//CFG_TUSB_MEM_SECTION CFG_TUSB_MEM_ALIGN
//static uint8_t _tuh_ctrl_buf[CFG_TUH_ENUMERATION_BUFSZIE];

//--------------------------------------------------------------------+
// MACRO TYPEDEF CONSTANT ENUM DECLARATION
//--------------------------------------------------------------------+

bool tuh_control_xfer (uint8_t dev_addr, tusb_control_request_t const* request, void* buffer, tuh_control_complete_cb_t complete_cb)
{
  // TODO need to claim the endpoint first

  usbh_device_t* dev = &_usbh_devices[dev_addr];
  const uint8_t rhport = dev->rhport;

  _ctrl_xfer.request     = (*request);
  _ctrl_xfer.buffer      = buffer;
  _ctrl_xfer.stage       = STAGE_SETUP;
  _ctrl_xfer.complete_cb = complete_cb;

  TU_LOG2("Control Setup: ");
  switch (request->bmRequestType_bit.recipient) {
  case TUSB_REQ_RCPT_DEVICE:
    TU_LOG2("R: DEVICE, ");
    break;
  case TUSB_REQ_RCPT_INTERFACE:
    TU_LOG2("R: INTERFACE, ");
    break;
  case TUSB_REQ_RCPT_ENDPOINT:
    TU_LOG2("R: ENDPOINT, ");
    break;
  case TUSB_REQ_RCPT_OTHER:
    TU_LOG2("R: OTHER, ");
    break;
  default:
    TU_LOG2("R: Unknown, ");
  }

  switch(request->bmRequestType_bit.type) {
  case TUSB_REQ_TYPE_STANDARD:
    TU_LOG2("T: STANDARD, ");
    break;
  case TUSB_REQ_TYPE_CLASS:
    TU_LOG2("T: CLASS, ");
    break;
  case TUSB_REQ_TYPE_VENDOR:
    TU_LOG2("T: VENDOR, ");
    break;
  case TUSB_REQ_TYPE_INVALID:
    TU_LOG2("T: INVALID, ");
    break;
  default:
    TU_LOG2("T: Unknown, ");
  }

  switch(request->bmRequestType_bit.direction) {
  case TUSB_DIR_OUT:
    TU_LOG2("D: OUT, ");
    break;
  case TUSB_DIR_IN:
    TU_LOG2("D: IN, ");
    break;
  default:
    TU_LOG2("D: Unknown, ");
  }

  switch(request->bRequest) {
  case TUSB_REQ_GET_STATUS:
    TU_LOG2("R: GET_STATUS, ");
    break;
  case TUSB_REQ_CLEAR_FEATURE:
    TU_LOG2("R: CLEAR_FEATURE, ");
    break;
  case TUSB_REQ_RESERVED:
    TU_LOG2("R: RESERVED, ");
    break;
  case TUSB_REQ_SET_FEATURE:
    TU_LOG2("R: SET_FEATURE, ");
    break;
  case TUSB_REQ_RESERVED2:
    TU_LOG2("R: RESERVED2, ");
    break;
  case TUSB_REQ_SET_ADDRESS:
    TU_LOG2("R: SET_ADDRESS, ");
    break;
  case TUSB_REQ_GET_DESCRIPTOR:
    TU_LOG2("R: GET_DESCRIPTOR, ");
    break;
  case TUSB_REQ_SET_DESCRIPTOR:
    TU_LOG2("R: SET_DESCRIPTOR, ");
    break;
  case TUSB_REQ_GET_CONFIGURATION:
    TU_LOG2("R: GET_CONFIGURATION, ");
    break;
  case TUSB_REQ_SET_CONFIGURATION:
    TU_LOG2("R: SET_CONFIGURATION, ");
    break;
  case TUSB_REQ_GET_INTERFACE:
    TU_LOG2("R: GET_INTERFACE, ");
    break;
  case TUSB_REQ_SET_INTERFACE:
    TU_LOG2("R: SET_INTERFACE, ");
    break;
  case TUSB_REQ_SYNCH_FRAME:
    TU_LOG2("R: SYNCH_FRAME, ");
    break;
  default:
    TU_LOG2("R: Unknown, ");
  }

  switch(request->bRequest) {
    case TUSB_REQ_GET_DESCRIPTOR:
    case TUSB_REQ_SET_DESCRIPTOR:
      switch(request->wValue >> 8) {
        case TUSB_DESC_DEVICE:
          TU_LOG2("V: DEVICE, ");
          break;
        case TUSB_DESC_CONFIGURATION:
          TU_LOG2("V: CONFIGURATION, ");
          break;
        case TUSB_DESC_STRING:
          TU_LOG2("V: STRING, ");
          break;
        case TUSB_DESC_INTERFACE:
          TU_LOG2("V: INTERFACE, ");
          break;
        case TUSB_DESC_ENDPOINT:
          TU_LOG2("V: ENDPOINT, ");
          break;
        case TUSB_DESC_DEVICE_QUALIFIER:
          TU_LOG2("V: DEVICE_QUALIFIER, ");
          break;
        case TUSB_DESC_OTHER_SPEED_CONFIG:
          TU_LOG2("V: OTHER_SPEED_CONFIG, ");
          break;
        case TUSB_DESC_INTERFACE_POWER:
          TU_LOG2("V: INTERFACE_POWER, ");
          break;
        case TUSB_DESC_OTG:
          TU_LOG2("V: OTG, ");
          break;
        case TUSB_DESC_DEBUG:
          TU_LOG2("V: DEBUG, ");
          break;
        case TUSB_DESC_INTERFACE_ASSOCIATION:
          TU_LOG2("V: INTERFACE_ASSOCIATION, ");
          break;
      }
      TU_LOG2("DescIdx: %#x, ", request->wValue & 0xFF);
      break;
    default:
      TU_LOG2("Val: %#x, ", request->wValue);
  }

  TU_LOG2("Idx: %#x, ", request->wIndex);
  TU_LOG2("Len: %d\r\n", request->wLength);

  TU_LOG2_VAR(request);
  TU_LOG2("\r\n");

  // Send setup packet
  TU_ASSERT( hcd_setup_send(rhport, dev_addr, (uint8_t const*) &_ctrl_xfer.request) );

  return true;
}

static void _xfer_complete(uint8_t dev_addr, xfer_result_t result)
{
  TU_LOG2("\r\n");
  if (_ctrl_xfer.complete_cb) _ctrl_xfer.complete_cb(dev_addr, &_ctrl_xfer.request, result);
}

bool usbh_control_xfer_cb (uint8_t dev_addr, uint8_t ep_addr, xfer_result_t result, uint32_t xferred_bytes)
{
  (void) ep_addr;
  (void) xferred_bytes;

  usbh_device_t* dev = &_usbh_devices[dev_addr];
  const uint8_t rhport = dev->rhport;

  tusb_control_request_t const * request = &_ctrl_xfer.request;

  if (XFER_RESULT_SUCCESS != result)
  {
    TU_LOG2("Control failed: result = %d\r\n", result);

    // terminate transfer if any stage failed
    _xfer_complete(dev_addr, result);
  }else
  {
    switch(_ctrl_xfer.stage)
    {
      case STAGE_SETUP:
        _ctrl_xfer.stage = STAGE_DATA;
        if (request->wLength)
        {
          // DATA stage: initial data toggle is always 1
          hcd_edpt_xfer(rhport, dev_addr, tu_edpt_addr(0, request->bmRequestType_bit.direction), _ctrl_xfer.buffer, request->wLength);
          return true;
        }
        __attribute__((fallthrough));

      case STAGE_DATA:
        _ctrl_xfer.stage = STAGE_ACK;

        if (request->wLength)
        {
          TU_LOG2("Control data:\r\n");
          TU_LOG2_MEM(_ctrl_xfer.buffer, request->wLength, 2);
        }

        // ACK stage: toggle is always 1
        hcd_edpt_xfer(rhport, dev_addr, tu_edpt_addr(0, 1-request->bmRequestType_bit.direction), NULL, 0);
      break;

      case STAGE_ACK:
        _xfer_complete(dev_addr, result);
      break;

      default: return false;
    }
  }

  return true;
}

#endif
