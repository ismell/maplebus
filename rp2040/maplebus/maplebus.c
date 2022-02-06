/*
 * Copyright (c) 2021 Raul E Rangel
 *
 * SPDX-License-Identifier: GPL-2.0-or-later
 */

#include "hardware/clocks.h"
#include "hardware/gpio.h"
#include "maplebus.h"
#include <stdio.h>

/* TODO: Move into header? */
#define ARRAY_SIZE(array) (sizeof(array) / sizeof(*array))

enum maplebus_header_type {
	FRAME_WITH_CRC = 0x3,
};

struct maplebus_buffer {
	union {
		struct maplebus_header header;
		uint32_t raw_header;
	};
	uint32_t data[];
} __attribute__((aligned(4)));

struct maplebus_sm_dev {
	bool initialized;
	uint idx;

	struct future *future;
	const struct maplebus_buffer *tx_buffer;
	uint buffer_size;
	enum {
		TX_STATE_SEND_FRAME_HEADER,
		TX_STATE_SEND_PACKET_HEADER,
		TX_STATE_SEND_DATA,
		TX_STATE_SEND_CRC,
		TX_STATE_SEND_DONE
	} tx_state;
	uint data_sent;

	struct maplebus_rx_future *rx_future;
	struct maplebus_buffer *rx_buffer;
	enum maplebus_rx_state {
		RX_STATE_WAIT_FOR_FRAME_TYPE,
		RX_STATE_WAIT_FOR_FRAME_HEADER,
		RX_STATE_WAIT_FOR_DATA,
		RX_STATE_WAIT_FOR_CRC,
		RX_STATE_DONE,
	} rx_state;
	uint available_data;
	uint data_received;
};

struct maplebus_pio_dev {
	PIO pio;
	bool initialized;
	uint program_offset;
	uint free_idx;

	struct maplebus_sm_dev sms[4];
};

static struct maplebus_pio_dev tx_dev;
static struct maplebus_pio_dev rx_dev;

static struct maplebus_sm_dev *get_tx_dev(maplebus_tx_id_t id)
{
	struct maplebus_sm_dev *dev;
	assert(tx_dev.initialized);
	assert(id.idx < ARRAY_SIZE(tx_dev.sms));

	dev = &tx_dev.sms[id.idx];

	assert(dev->initialized);
	assert(dev->idx == id.idx);

	return dev;
}

static struct maplebus_sm_dev *get_tx_dev_from_future(struct future *future)
{
	struct maplebus_sm_dev *dev;
	for (uint i = 0; i < ARRAY_SIZE(tx_dev.sms); ++i) {
		dev = &tx_dev.sms[i];
		if (dev->future == future)
			return dev;
	}

	assert(false);

	return NULL;
}

static struct maplebus_sm_dev *get_rx_dev(maplebus_rx_id_t id)
{
	struct maplebus_sm_dev *dev;
	assert(rx_dev.initialized);
	assert(id.idx < ARRAY_SIZE(rx_dev.sms));

	dev = &rx_dev.sms[id.idx];

	assert(dev->initialized);
	assert(dev->idx == id.idx);

	return dev;
}

static struct maplebus_sm_dev *get_rx_dev_from_future(struct future *future)
{
	struct maplebus_sm_dev *dev;
	for (uint i = 0; i < ARRAY_SIZE(rx_dev.sms); ++i) {
		dev = &rx_dev.sms[i];
		if (&dev->rx_future->future == future)
			return dev;
	}

	assert(false);

	return NULL;
}

uint8_t compute_lrc(const struct maplebus_buffer *buffer)
{
	uint8_t lrc = 0;
	uint32_t *data = (uint32_t *)buffer;

	for (size_t i = 0; i < buffer->header.length + 1U; ++i) {
		lrc ^= (uint8_t)((data[i] >> 0) & 0xFF);
		lrc ^= (uint8_t)((data[i] >> 8) & 0xFF);
		lrc ^= (uint8_t)((data[i] >> 16) & 0xFF);
		lrc ^= (uint8_t)((data[i] >> 24) & 0xFF);
	}

	return lrc;
}

void maplebus_tx_pio_init(PIO pio)
{
	assert(!tx_dev.initialized);
	tx_dev.pio = pio;
	tx_dev.program_offset =
		pio_add_program(tx_dev.pio, &maplebus_tx_program);
	tx_dev.initialized = true;
}

void maplebus_rx_pio_init(PIO pio)
{
	assert(!rx_dev.initialized);
	rx_dev.pio = pio;
	rx_dev.program_offset =
		pio_add_program(rx_dev.pio, &maplebus_rx_program);
	rx_dev.initialized = true;
}

maplebus_tx_id_t maplebus_tx_init(uint pin_sdcka, uint pin_sdckb)
{
	struct maplebus_sm_dev *sm;

	assert(tx_dev.initialized);
	assert(tx_dev.free_idx < ARRAY_SIZE(tx_dev.sms));

	{
		uint idx = tx_dev.free_idx++;

		sm = &tx_dev.sms[idx];
		sm->idx = idx;
		sm->initialized = true;
	}

	PIO pio = tx_dev.pio;

	pio_sm_config c =
		maplebus_tx_program_get_default_config(tx_dev.program_offset);

	// IO mapping
	sm_config_set_set_pins(&c, pin_sdcka, 1);
	sm_config_set_sideset_pins(&c, pin_sdckb);
	sm_config_set_out_pins(&c, pin_sdckb, 1);

	// We need to clock out the MSB first, so we need to shift
	// to the left. Disable autopull.
	sm_config_set_out_shift(&c, false, false, 0);

	// TODO: Remove the 1000 when we have a large pull-up.
	float div = (float)clock_get_hz(clk_sys) / (25000000) * 1000;
	sm_config_set_clkdiv(&c, div);

	uint32_t both_pins = (1u << pin_sdcka) | (1u << pin_sdckb);
	pio_sm_set_pins_with_mask(pio, sm->idx, 0, both_pins);
	/* Set all pins to OUT */
	pio_sm_set_pindirs_with_mask(pio, sm->idx, both_pins, both_pins);
	pio_gpio_init(pio,
		      pin_sdcka); /* Do we swap this to avoid the glitch ? */
	gpio_set_oeover(pin_sdcka, GPIO_OVERRIDE_INVERT);
	pio_gpio_init(pio, pin_sdckb);
	gpio_set_oeover(pin_sdckb, GPIO_OVERRIDE_INVERT);

	gpio_pull_up(pin_sdcka);
	gpio_pull_up(pin_sdckb);

	// Clear IRQ flag before starting
	hw_clear_bits(&pio->inte0, 1u << sm->idx);
	hw_clear_bits(&pio->inte1, 1u << sm->idx);
	pio->irq = 1u << sm->idx;

	// Configure and start SM
	pio_sm_init(pio, sm->idx,
		    tx_dev.program_offset + maplebus_tx_offset_entry_point, &c);
	pio_sm_set_enabled(pio, sm->idx, true);

	struct maplebus_tx_id id = { .idx = sm->idx };

	return id;
}

uint32_t maplebus_tx_header(uint8_t frame_type, uint total_bytes)
{
	uint32_t header = 0;

	assert(total_bytes);

	header |= ((uint32_t)frame_type << 28);
	header |= total_bytes * 8 / 2 - 1; // 4 cycles per byte

	return header;
}

void pio_maplebus_tx_blocking(maplebus_tx_id_t id,
			      const struct maplebus_header *data, size_t size)
{
	assert(size);
	assert((size % 4) == 0);
	assert((1u + data->length) * sizeof(uint32_t) == size);
	assert(tx_dev.initialized);

	PIO pio = tx_dev.pio;
	struct maplebus_sm_dev *dev = get_tx_dev(id);

	const struct maplebus_buffer *buffer = (struct maplebus_buffer *)data;
	size_t total_bytes = size + 1 /* CRC Byte */;
	uint8_t lrc = compute_lrc(buffer);

	pio_sm_put_blocking(pio, dev->idx,
			    maplebus_tx_header(FRAME_WITH_CRC, total_bytes));
	pio_sm_put_blocking(pio, dev->idx, buffer->raw_header);

	for (size_t i = 0; i < buffer->header.length; ++i)
		pio_sm_put_blocking(pio, dev->idx, buffer->data[i]);

	pio_sm_put_blocking(pio, dev->idx, ((uint32_t)lrc) << 24);
}

static enum future_state maplebus_tx_poll(struct future *future,
					  __unused struct wait_context *ctx)
{
	PIO pio = tx_dev.pio;
	struct maplebus_sm_dev *dev = get_tx_dev_from_future(future);
	size_t total_bytes;
	uint32_t frame_header;
	uint8_t lrc;

	while (!pio_sm_is_tx_fifo_full(pio, dev->idx)) {
		switch (dev->tx_state) {
		case TX_STATE_SEND_FRAME_HEADER:
			total_bytes = dev->buffer_size + 1 /* CRC Byte */;
			frame_header =
				maplebus_tx_header(FRAME_WITH_CRC, total_bytes);

			pio_sm_put(pio, dev->idx, frame_header);
			dev->tx_state = TX_STATE_SEND_PACKET_HEADER;
			break;
		case TX_STATE_SEND_PACKET_HEADER:
			pio_sm_put(pio, dev->idx, dev->tx_buffer->raw_header);
			dev->tx_state = TX_STATE_SEND_DATA;
			break;
		case TX_STATE_SEND_DATA:
			if (dev->data_sent < dev->tx_buffer->header.length) {
				pio_sm_put(pio, dev->idx,
					   dev->tx_buffer->data[dev->data_sent]);
				dev->data_sent++;
				break;
			}

			dev->tx_state = TX_STATE_SEND_CRC;
			break;
		case TX_STATE_SEND_CRC:
			lrc = compute_lrc(dev->tx_buffer);

			pio_sm_put(pio, dev->idx, ((uint32_t)lrc) << 24);

			dev->future = NULL;
			dev->tx_buffer = NULL;
			dev->buffer_size = 0;
			dev->data_sent = 0;
			dev->tx_state = TX_STATE_SEND_DONE;
			complete_future(future);

			return FUTURE_DONE;
		default:
			assert(false);
		}
	}

	return FUTURE_PENDING;
}

void maplebux_tx(maplebus_tx_id_t id, struct future *future,
		 const struct maplebus_header *data, size_t size)
{
	assert(size);
	assert((size % 4) == 0);
	assert((1u + data->length) * sizeof(uint32_t) == size);
	assert(tx_dev.initialized);

	struct maplebus_sm_dev *dev = get_tx_dev(id);
	const struct maplebus_buffer *buffer = (struct maplebus_buffer *)data;

	assert(dev->future == NULL);

	dev->future = future;
	dev->tx_buffer = buffer;
	dev->buffer_size = size;
	dev->data_sent = 0;
	dev->tx_state = TX_STATE_SEND_FRAME_HEADER;
	future->poll = maplebus_tx_poll;
}

maplebus_rx_id_t maplebus_rx_init(uint pin_sdcka, uint pin_sdckb)
{
	struct maplebus_sm_dev *sm;

	assert(rx_dev.initialized);
	assert(rx_dev.free_idx < ARRAY_SIZE(rx_dev.sms));
	assert(pin_sdcka == pin_sdckb + 1);

	{
		uint idx = rx_dev.free_idx++;

		sm = &rx_dev.sms[idx];
		sm->idx = idx;
		sm->initialized = true;
	}

	PIO pio = rx_dev.pio;

	pio_sm_set_consecutive_pindirs(pio, sm->idx, pin_sdckb, 2, false);
	pio_sm_config c =
		maplebus_rx_program_get_default_config(rx_dev.program_offset);

	// IO mapping
	sm_config_set_in_pins(&c, pin_sdckb);
	sm_config_set_jmp_pin(&c, pin_sdcka);

	// We use the OSR as a temp register
	sm_config_set_out_shift(&c, true, false, 0);
	sm_config_set_in_shift(&c, false, false, 0);

	// We need to run fast so we can leave enough wiggle room for the
	// CPU to decide how much data it wants to read.
	float div = 1.0f;
	sm_config_set_clkdiv(&c, div);

	gpio_pull_up(pin_sdcka);
	gpio_pull_up(pin_sdckb);

	// Clear IRQ flag before starting
	hw_clear_bits(&pio->inte0, 1u << sm->idx);
	hw_clear_bits(&pio->inte1, 1u << sm->idx);
	pio->irq = 1u << sm->idx;

	// Configure and start SM
	pio_sm_init(pio, sm->idx,
		    rx_dev.program_offset + maplebus_rx_offset_entry_point, &c);
	pio_sm_set_enabled(pio, sm->idx, true);

	struct maplebus_rx_id id = { .idx = sm->idx };

	return id;
}

enum maplebus_return pio_maplebus_rx_blocking(maplebus_rx_id_t id,
					      struct maplebus_header *data,
					      size_t n)
{
	uint32_t frame_type, actual_crc;
	uint8_t expected_crc;
	struct maplebus_buffer *buffer = (struct maplebus_buffer *)data;
	enum maplebus_return ret;
	PIO pio = rx_dev.pio;
	struct maplebus_sm_dev *dev = get_rx_dev(id);

	if (n < sizeof(*data))
		return MAPLEBUS_INVALID_ARGS;

	printf("Waiting for frame_type\n");
	frame_type = pio_sm_get_blocking(pio, dev->idx);

	if (frame_type == 0xFFFFFFF0) { // Start frame w/ CRC
		n -= sizeof(uint32_t);
		buffer->raw_header = pio_sm_get_blocking(pio, dev->idx);

		for (size_t i = 0; i < buffer->header.length; ++i) {
			if (n < sizeof(uint32_t)) {
				ret = MAPLEBUS_MESSAGE_TRUNCATED;
				goto out;
			} else {
				n -= sizeof(uint32_t);
			}

			buffer->data[i] = pio_sm_get_blocking(pio, dev->idx);
		}

		// Wait for a 1 byte CRC.
		pio_sm_exec(pio, dev->idx, pio_encode_set(pio_y, 0));

		actual_crc = pio_sm_get_blocking(pio, dev->idx);
		expected_crc = compute_lrc(buffer);
		if (actual_crc == expected_crc) {
			ret = MAPLEBUS_OK;
		} else {
			ret = MAPLEBUS_CRC_ERROR;
			printf("Actual CRC: %#" PRIx32
			       ", Expected CRC: %#" PRIx8 "\n",
			       actual_crc, expected_crc);
		}
	} else {
		printf("RX: Unknown start frame: %#" PRIx32 "\n", frame_type);
		ret = MAPLEBUS_UNKNOWN_FRAME_TYPE;
	}
out:
	// We need to manually reset the PC at the end of the frame.
	pio_sm_exec(pio, dev->idx, pio_encode_jmp(0));
	return ret;
}


static void maplebus_complete_rx_future(struct maplebus_sm_dev *dev, enum maplebus_return status)
{
	dev->rx_future->status = status;
	complete_future(&dev->rx_future->future);	

	dev->rx_future = NULL;
	dev->rx_buffer = NULL;
	dev->rx_state = RX_STATE_DONE;

	// We need to manually reset the PC at the end of the frame.
	pio_sm_exec(rx_dev.pio, dev->idx, pio_encode_jmp(0));
}
static enum future_state maplebus_rx_poll(struct future *future,
					  __unused struct wait_context *ctx)
{
	PIO pio = rx_dev.pio;
	struct maplebus_sm_dev *dev = get_rx_dev_from_future(future);
	uint32_t frame_type, actual_crc;
	uint8_t expected_crc;

	while (!pio_sm_is_rx_fifo_empty(pio, dev->idx)) {
		switch (dev->rx_state) {
		case RX_STATE_WAIT_FOR_FRAME_TYPE:
			frame_type = pio_sm_get(pio, dev->idx);
			if (frame_type == 0xFFFFFFF0) { // Start frame w/ CRC
				dev->rx_state = RX_STATE_WAIT_FOR_FRAME_HEADER;
			} else {
				printf("RX: Unknown start frame: %#" PRIx32 "\n", frame_type);
				maplebus_complete_rx_future(dev, MAPLEBUS_UNKNOWN_FRAME_TYPE);
				return FUTURE_DONE;
			}
			break;
		case RX_STATE_WAIT_FOR_FRAME_HEADER:
			dev->rx_buffer->raw_header = pio_sm_get(pio, dev->idx);
			
			if (dev->rx_buffer->header.length == 0) {
				// No data, wait for CRC
				// This is time critical
				pio_sm_exec(pio, dev->idx, pio_encode_set(pio_y, 0));	
				dev->rx_state = RX_STATE_WAIT_FOR_CRC;
			} else if (dev->rx_buffer->header.length > dev->available_data) {
				printf("RX: RX buffer too small: %" PRId8 " > %d\n",
					dev->rx_buffer->header.length, dev->available_data);
				maplebus_complete_rx_future(dev, MAPLEBUS_MESSAGE_TRUNCATED);
				return FUTURE_DONE;
			} else {
				dev->data_received = 0;
				dev->rx_state = RX_STATE_WAIT_FOR_DATA;
			}
			
			break;
		case RX_STATE_WAIT_FOR_DATA:
			dev->rx_buffer->data[dev->data_received] = pio_sm_get(pio, dev->idx);
			dev->data_received++;
			if (dev->data_received >= dev->rx_buffer->header.length) {
				// No data, wait for CRC
				// This is time critical
				pio_sm_exec(pio, dev->idx, pio_encode_set(pio_y, 0));	
				dev->rx_state = RX_STATE_WAIT_FOR_CRC;
			}
			break;
		case RX_STATE_WAIT_FOR_CRC:
			actual_crc = pio_sm_get(pio, dev->idx);
			expected_crc = compute_lrc(dev->rx_buffer);
			if (actual_crc == expected_crc) {
				maplebus_complete_rx_future(dev, MAPLEBUS_OK);
				return FUTURE_DONE;
			} else {
				printf("Actual CRC: %#" PRIx32
				       ", Expected CRC: %#" PRIx8 "\n",
				       actual_crc, expected_crc);
				maplebus_complete_rx_future(dev, MAPLEBUS_CRC_ERROR);
				return FUTURE_DONE;
			}
		case RX_STATE_DONE:
			// Should never happen
			assert(false);
			break;
		}
	}

	return FUTURE_PENDING;
}

void maplebus_rx(maplebus_rx_id_t id, struct maplebus_rx_future *future,
		 struct maplebus_header *data, size_t size)
{
	assert(size);
	assert((size % 4) == 0);
	assert(rx_dev.initialized);
	assert(size >= sizeof(*data));

	struct maplebus_sm_dev *dev = get_rx_dev(id);
	struct maplebus_buffer *buffer = (struct maplebus_buffer *)data;

	assert(dev->future == NULL);

	dev->rx_future = future;
	dev->rx_buffer = buffer;
	dev->available_data = (size - sizeof(*data)) / sizeof(uint32_t);
	dev->data_received = 0;
	dev->rx_state = RX_STATE_WAIT_FOR_FRAME_TYPE;
	future->future.poll = maplebus_rx_poll;
}

void maplebus_print(struct maplebus_header *header)
{
	struct maplebus_buffer *buffer = (struct maplebus_buffer *)header;

	printf("Command: %#hhx\n", header->command);
	printf("Destination: %#hhx\n", header->destination);
	printf("Source: %#hhx\n", header->source);
	printf("Words: %#hhx\n", header->length);

	for (uint i = 0; i < header->length; ++i)
		printf("Word %u: %#" PRIx32 "\n", i, buffer->data[i]);
}
