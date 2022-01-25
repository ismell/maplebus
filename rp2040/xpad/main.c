/*
 * Copyright (c) 2021 Raul E Rangel
 *
 * SPDX-License-Identifier: GPL-2.0-or-later
 */

#include <stdio.h>

#include "bsp/board.h"
#include "pico/stdlib.h"
#include "tusb.h"

int main() {
	stdio_init_all();
	board_init(); /* Not really needed */

	printf("xpad starting!\n");

	tusb_init();

	printf("tusb_init done!\n");

    while (1) {
        // tinyusb host task
        // printf("tuh_task!\n");
        tuh_task();
        // led_blinking_task();

#if CFG_TUH_HID_KEYBOARD || CFG_TUH_HID_MOUSE
        hid_task();
#endif
    }

	return 0;
}
