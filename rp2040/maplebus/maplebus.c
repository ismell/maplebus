/*
 * Copyright (c) 2021 Raul E Rangel
 *
 * SPDX-License-Identifier: GPL-2.0-or-later
 */

#include "hardware/clocks.h"
#include "hardware/gpio.h"
#include "maplebus.h"
#include <stdio.h>

struct maplebus_sm_dev {
	bool initialized;
	uint idx;
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

struct maplebus_buffer {
	union {
		struct maplebus_header header;
		uint32_t raw_header;
	};
	uint32_t data[];
} __attribute__ ((aligned (4)));

uint8_t compute_lrc(struct maplebus_buffer *buffer) {
	uint8_t lrc = 0;
	uint32_t *data = (uint32_t *)buffer;

	for (size_t i = 0; i < buffer->header.length + 1; ++i) {
		lrc ^= (data[i] >> 0) & 0xFF;
		lrc ^= (data[i] >> 8) & 0xFF;
		lrc ^= (data[i] >> 16) & 0xFF;
		lrc ^= (data[i] >> 24) & 0xFF;
	}

	return lrc;
}

void maplebus_tx_pio_init(PIO pio)
{
	assert(!tx_dev.initialized);
	tx_dev.pio = pio;
	tx_dev.program_offset = pio_add_program(tx_dev.pio, &maplebus_tx_program);
}

void maplebus_rx_pio_init(PIO pio)
{
	assert(!rx_dev.initialized);
	rx_dev.pio = pio;
	rx_dev.program_offset = pio_add_program(rx_dev.pio, &maplebus_rx_program);
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

	pio_sm_config c = maplebus_tx_program_get_default_config(tx_dev.program_offset);

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
	pio_gpio_init(pio, pin_sdcka); /* Do we swap this to avoid the glitch ? */
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
	pio_sm_init(pio, sm->idx, tx_dev.program_offset + maplebus_tx_offset_entry_point, &c);
	pio_sm_set_enabled(pio, sm->idx, true);

	struct maplebus_tx_id id = { .idx = sm->idx };

	return id;
}

int pio_maplebus_tx_blocking(PIO pio, uint sm, struct maplebus_header *data) {
	uint8_t lrc;
	uint32_t header = 0;
	struct maplebus_buffer *buffer = (struct maplebus_buffer *)data;
	size_t total_bytes = (1 + buffer->header.length) * sizeof(uint32_t) + 1;

	header |= (0x3U << 28); // Frame with CRC
	header |= total_bytes * 8 / 2 - 1; // 4 cycles per byte

	pio_sm_put_blocking(pio, sm, header);
	pio_sm_put_blocking(pio, sm, buffer->raw_header);

	for (size_t i = 0; i < buffer->header.length; ++i)
		pio_sm_put_blocking(pio, sm, buffer->data[i]);

	lrc = compute_lrc(buffer);
	pio_sm_put_blocking(pio, sm, ((uint32_t)lrc) << 24);
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
	pio_sm_config c = maplebus_rx_program_get_default_config(rx_dev.program_offset);

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
	pio_sm_init(pio, sm->idx, rx_dev.program_offset + maplebus_rx_offset_entry_point, &c);
	pio_sm_set_enabled(pio, sm->idx, true);

	struct maplebus_rx_id id = { .idx = sm->idx };

	return id;
}

enum maplebus_return pio_maplebus_rx_blocking(PIO pio, uint sm, struct maplebus_header *data, size_t n) {
	uint32_t frame_type, actual_crc, expected_crc;
	struct maplebus_buffer *buffer = (struct maplebus_buffer *)data;
	enum maplebus_return ret;

	if (n < sizeof(*data))
		return MAPLEBUS_INVALID_ARGS;

	printf("Waiting for frame_type\n");
	frame_type = pio_sm_get_blocking(pio, sm);

	if (frame_type == 0xFFFFFFF0) { // Start frame w/ CRC
		n -= sizeof(uint32_t);
		buffer->raw_header = pio_sm_get_blocking(pio, sm);

		for (size_t i = 0; i < buffer->header.length; ++i) {
			if (n < sizeof(uint32_t)) {
				ret = MAPLEBUS_MESSAGE_TRUNCATED;
				goto out;
			} else {
				n -= sizeof(uint32_t);
			}

			buffer->data[i] = pio_sm_get_blocking(pio, sm);
		}
		
		// Wait for a 1 byte CRC.
		pio_sm_exec(pio, sm, pio_encode_set(pio_y, 0));

		actual_crc = pio_sm_get_blocking(pio, sm);
		expected_crc = compute_lrc(buffer);
		if (actual_crc == expected_crc) {
			ret = MAPLEBUS_OK;
		} else {
			ret = MAPLEBUS_CRC_ERROR;
			printf("Actual CRC: %#x, Expected CRC: %#x\n", actual_crc, expected_crc);
		}
	} else {
		printf("RX: Unknown start frame: %#x\n", frame_type);
		ret = MAPLEBUS_UNKNOWN_FRAME_TYPE;
	}
out:
	// We need to manually reset the PC at the end of the frame.
	pio_sm_exec(pio, sm, pio_encode_jmp(0));
	return ret;
}

void maplebus_print(struct maplebus_header *header) {
	printf("Command: %#hhx\n", header->command);
	printf("Destination: %#hhx\n", header->destination);
	printf("Source: %#hhx\n", header->source);
	printf("Words: %#hhx\n", header->length);
}

