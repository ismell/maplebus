/*
 * Copyright (c) 2021 Raul E Rangel
 *
 * SPDX-License-Identifier: GPL-2.0-or-later
 */

#include <stdio.h>

#include "pico/stdlib.h"
#include "maplebus.pio.h"

#define PIN_SDCKA 2
#define PIN_SDCKB 3
#define PIN_HEARTBEAT 4

/* Device Info Request */
uint8_t buffer[] = {
	0x00, 0x00, 0x20, 0x01, 0x21
};

int main() {
	stdio_init_all();

	printf("Maplebus starting\n");

	gpio_init(PIN_HEARTBEAT);
	gpio_set_dir(PIN_HEARTBEAT, GPIO_OUT);

	PIO pio = pio0;
	uint sm = 0;
	uint offset = pio_add_program(pio, &maplebus_tx_program);
	maplebus_program_init(pio, sm, offset, PIN_SDCKA, PIN_SDCKB);

	uint iteration = 0;

	while (true) {
		printf("Maplebus iteration %u\n", iteration);

		gpio_put(PIN_HEARTBEAT, 1);
		pio_maplebus_tx_blocking(pio, sm, buffer, sizeof(buffer));
		gpio_put(PIN_HEARTBEAT, 0);

		iteration++;

		sleep_ms(1000);
	}

	return 0;
}
