/*
 * Copyright (c) 2021 Raul E Rangel
 *
 * SPDX-License-Identifier: GPL-2.0-or-later
 */

#ifndef _TUSB_CONFIG_H_
#define _TUSB_CONFIG_H_

//--------------------------------------------------------------------
// CONFIGURATION
//--------------------------------------------------------------------

#define CFG_TUSB_RHPORT0_MODE		(OPT_MODE_HOST | OPT_MODE_FULL_SPEED)

#define CFG_TUH_HUB                 0
#define CFG_TUH_HID                 0
#define CFG_TUH_HID_KEYBOARD        0
#define CFG_TUH_HID_MOUSE           0
#define CFG_TUSB_HOST_HID_GENERIC   0
#define CFG_TUH_MSC                 0
#define CFG_TUH_CDC                 0
#define CFG_TUH_XPAD				4

#define CFG_TUSB_HOST_DEVICE_MAX    (CFG_TUH_HUB ? 5 : 1) // normal hub has 4 ports

#endif /* _TUSB_CONFIG_H_ */
