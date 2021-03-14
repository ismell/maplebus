/*
 * Copyright (c) 2021 Raul E Rangel
 *
 * SPDX-License-Identifier: GPL-2.0-or-later
 */
  
#ifndef MAPLEBUS_H
#define MAPLEBUS_H

#include <inttypes.h>
#include "maplebus.pio.h"

/**
 * Maple Bus frame header.
 *
 * @length: The number of of additional dwords following the header.
 */
struct maplebus_header {
	uint8_t command;
	uint8_t destination;
	uint8_t source;
	uint8_t length;
};

enum maplebus_return {
	MAPLEBUS_OK,
	MAPLEBUS_UNKNOWN_FRAME_TYPE,
	MAPLEBUS_INVALID_ARGS,
	MAPLEBUS_CRC_ERROR,
	MAPLEBUS_MESSAGE_TRUNCATED,
	MAPLEBUS_TIMEOUT,
};

void maplebus_tx_program_init(PIO pio, uint sm, uint offset, uint pin_sdcka, uint pin_sdckb);
int pio_maplebus_tx_blocking(PIO pio, uint sm, struct maplebus_header *data);

void maplebus_rx_program_init(PIO pio, uint sm, uint offset, uint pin_sdcka, uint pin_sdckb);
/**
 * Receive a maplebus frame.
 * @n number of bytes in the @data buffer. Must be >=4.
 */
enum maplebus_return pio_maplebus_rx_blocking(PIO pio, uint sm, struct maplebus_header *data, size_t n);

void maplebus_print(struct maplebus_header *data);

#endif /* MAPLEBUS_H */
