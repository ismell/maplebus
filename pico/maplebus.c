/*
 * Copyright (c) 2021 Raul E Rangel
 *
 * SPDX-License-Identifier: GPL-2.0-or-later
 */

#include <stdio.h>

#include "pico/stdlib.h"
#include "maplebus.pio.h"

#define PIN_HEARTBEAT 4
#define PIN_SDCKA 3
#define PIN_SDCKB 2

/* Device Info Request */
uint8_t buffer[] = {
	0x01, 0x23, 0x45, 0x67, 0x89
	//0x00, 0x00, 0x20, 0x01, 0x21
};

uint8_t rx_buffer[0x10];

int main() {
	stdio_init_all();

	printf("Maplebus starting!\n");

	// gpio_init(PIN_HEARTBEAT);
	// gpio_set_dir(PIN_HEARTBEAT, GPIO_OUT);

	uint sm = 0;
	uint offset = pio_add_program(pio0, &maplebus_tx_program);
	maplebus_tx_program_init(pio0, sm, offset, PIN_SDCKA, PIN_SDCKB);

	offset = pio_add_program(pio1, &maplebus_rx_program);
	maplebus_rx_program_init(pio1, sm, offset, PIN_SDCKA, PIN_SDCKB);

	uint iteration = 0;

	while (true) {
		printf("Maplebus iteration %u\n", iteration);

		//gpio_put(PIN_HEARTBEAT, 1);
		pio_maplebus_tx_blocking(pio0, sm, buffer, sizeof(buffer));
		pio_maplebus_rx_blocking(pio1, sm, rx_buffer, sizeof(rx_buffer));
		//gpio_put(PIN_HEARTBEAT, 0);

		iteration++;

		sleep_ms(1000);
	}

	return 0;
}
