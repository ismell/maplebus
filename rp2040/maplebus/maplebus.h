/*
 * Copyright (c) 2021 Raul E Rangel
 *
 * SPDX-License-Identifier: GPL-2.0-or-later
 */
  
#ifndef MAPLEBUS_H
#define MAPLEBUS_H

#include <inttypes.h>
#include <futures.h>
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

/* Opaque struct for API clairty */
typedef struct maplebus_tx_id {
	uint idx;
} maplebus_tx_id_t;

typedef struct maplebus_rx_id {
	uint idx;
} maplebus_rx_id_t;

void maplebus_tx_pio_init(PIO pio);
void maplebus_rx_pio_init(PIO pio);

/**
 * Initializes a maplebus transmitter.
 * 
 * Must call this after maplebus_tx_pio_init.
 */
maplebus_tx_id_t maplebus_tx_init(uint pin_sdcka, uint pin_sdckb);

/**
 * Initializes a maplebus receiver.
 * 
 * Must call this after maplebus_rx_pio_init.
 * 
 * @id out parameter
 * @returns -1 on error
 */
maplebus_rx_id_t maplebus_rx_init(uint pin_sdcka, uint pin_sdckb);

void pio_maplebus_tx_blocking(maplebus_tx_id_t id, const struct maplebus_header *data, size_t size);

/**
 * Send data on the bus
 * 
 * @param future out - future handle
 */
void maplebux_tx(maplebus_tx_id_t id, struct future *future, const struct maplebus_header *data, size_t size);

/**
 * Receive a maplebus frame.
 * @n number of bytes in the @data buffer. Must be >=4.
 */
enum maplebus_return pio_maplebus_rx_blocking(maplebus_rx_id_t id, struct maplebus_header *data, size_t n);

void maplebus_print(struct maplebus_header *data);

#endif /* MAPLEBUS_H */
