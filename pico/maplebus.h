/*
 * Copyright (c) 2021 Raul E Rangel
 *
 * SPDX-License-Identifier: GPL-2.0-or-later
 */
  
#ifndef MAPLEBUS_H
#define MAPLEBUS_H

#include <inttypes.h>
#include "maplebus.pio.h"

struct maplebus_buffer {
	union {
		struct {
			uint8_t command;
			uint8_t destination;
			uint8_t source;
			// Number of additional words.
			uint8_t data_count;
		};
		uint32_t header;
	};
	uint32_t data[];
} __attribute__ ((aligned (4)));

enum maplebus_return {
	MAPLEBUS_OK,
	MAPLEBUS_UNKNOWN_FRAME_TYPE,
	MAPLEBUS_INVALID_ARGS,
	MAPLEBUS_CRC_ERROR,
	MAPLEBUS_BUFFER_TOO_SMALL,
	MAPLEBUS_TIMEOUT,
};

void maplebus_tx_program_init(PIO pio, uint sm, uint offset, uint pin_sdcka, uint pin_sdckb);
int pio_maplebus_tx_blocking(PIO pio, uint sm, uint8_t *buffer, size_t n);

void maplebus_rx_program_init(PIO pio, uint sm, uint offset, uint pin_sdcka, uint pin_sdckb);
/**
 * Receive a maplebus frame.
 * @n number of bytes in the @data buffer. Must be >=4.
 */
enum maplebus_return pio_maplebus_rx_blocking(PIO pio, uint sm, struct maplebus_buffer *buffer, size_t n);

void maplebus_print(struct maplebus_buffer *buffer);

#endif /* MAPLEBUS_H */
