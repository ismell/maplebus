/*
 * Copyright (c) 2021 Raul E Rangel
 *
 * SPDX-License-Identifier: GPL-2.0-or-later
 */

#include <stdio.h>

#include "pico/stdlib.h"
#include "maplebus.h"

#define PIN_HEARTBEAT 4
#define PIN_SDCKA 3
#define PIN_SDCKB 2

struct {
	struct maplebus_header header;
	// Max number of additional frames
	uint32_t data[255];
} rx_buffer;

_Static_assert (sizeof(rx_buffer) == 1024, "rx_buffer is not 1024 bytes long");

struct maplebus_header device_info_request = {
	.command = 0x01,
	.destination = 0x20,
	.source = 0x00,
	.length = 0x00,
};

struct test_packet {
	struct maplebus_header header;
	uint32_t data[4];
} test_packet = {
	.header = {
		.command = 0x99,
		.destination = 0x88,
		.source = 0x77,
		.length = sizeof(struct test_packet) / 4 - 1,
	},
	.data = {
		0x66 << 0,
		0x55 << 8,
		0x44 << 16,
		0x33 << 24
	}
};

int main() {
	stdio_init_all();

	printf("Maple Bus starting!\n");

	// gpio_init(PIN_HEARTBEAT);
	// gpio_set_dir(PIN_HEARTBEAT, GPIO_OUT);

	maplebus_tx_id_t tx_id;
	maplebus_rx_id_t rx_id;

	struct future tx_future;

	maplebus_tx_pio_init(pio0);
	maplebus_rx_pio_init(pio1);

	tx_id = maplebus_tx_init(PIN_SDCKA, PIN_SDCKB);
	rx_id = maplebus_rx_init(PIN_SDCKA, PIN_SDCKB);

	uint iteration = 0;
	enum maplebus_return ret;

	while (true) {
		printf("Maple Bus iteration %u\n", iteration);

		//gpio_put(PIN_HEARTBEAT, 1);
		maplebux_tx(tx_id, &tx_future, &test_packet.header, sizeof(test_packet));
		while (tx_future.poll(&tx_future, NULL) != FUTURE_DONE) {
			printf(".");
		}
		printf("\n");
		ret = pio_maplebus_rx_blocking(rx_id, &rx_buffer.header, sizeof(rx_buffer));

		switch (ret) {
		case MAPLEBUS_OK:
			maplebus_print(&rx_buffer.header);
			break;
		case MAPLEBUS_UNKNOWN_FRAME_TYPE:
			printf("invalid frame type\n");
			break;
		case MAPLEBUS_INVALID_ARGS:
			printf("invalid args\n");
			break;
		case MAPLEBUS_CRC_ERROR:
			printf("crc error\n");
			break;
		case MAPLEBUS_MESSAGE_TRUNCATED:
			printf("rx timeout\n");
			break;
		case MAPLEBUS_TIMEOUT:
			printf("rx timeout\n");
			break;
		default:
			printf("Unknown return code %d\n", ret);
		}
		//gpio_put(PIN_HEARTBEAT, 0);

		iteration++;

		sleep_ms(1000);
	}

	return 0;
}
