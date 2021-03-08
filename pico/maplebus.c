/*
 * Copyright (c) 2021 Raul E Rangel
 *
 * SPDX-License-Identifier: GPL-2.0-or-later
 */

#include "hardware/clocks.h"
#include "hardware/gpio.h"
#include "maplebus.h"

#include <stdio.h>

void maplebus_tx_program_init(PIO pio, uint sm, uint offset, uint pin_sdcka, uint pin_sdckb) {
    pio_sm_config c = maplebus_tx_program_get_default_config(offset);

    // IO mapping
    sm_config_set_set_pins(&c, pin_sdcka, 1);
    sm_config_set_sideset_pins(&c, pin_sdckb);
    sm_config_set_out_pins(&c, pin_sdckb, 1);

    // We need to clock out the MSB first, so we need to shift
    // to the left.
    sm_config_set_out_shift(&c, false, true, 8);

    // TODO: Remove the 1000 when we have a large pull-up.
    float div = (float)clock_get_hz(clk_sys) / (25000000) * 1000; 
    sm_config_set_clkdiv(&c, div);

    uint32_t both_pins = (1u << pin_sdcka) | (1u << pin_sdckb);
    pio_sm_set_pins_with_mask(pio, sm, 0, both_pins);
    pio_sm_set_pindirs_with_mask(pio, sm, both_pins, both_pins);
    pio_gpio_init(pio, pin_sdcka);
    gpio_set_oeover(pin_sdcka, GPIO_OVERRIDE_INVERT);
    pio_gpio_init(pio, pin_sdckb);
    gpio_set_oeover(pin_sdckb, GPIO_OVERRIDE_INVERT);

    gpio_pull_up(pin_sdcka);
    gpio_pull_up(pin_sdckb);

    // Clear IRQ flag before starting
    hw_clear_bits(&pio->inte0, 1u << sm);
    hw_clear_bits(&pio->inte1, 1u << sm);
    pio->irq = 1u << sm;

    // Configure and start SM
    pio_sm_init(pio, sm, offset + maplebus_tx_offset_entry_point, &c);
    pio_sm_set_enabled(pio, sm, true);
}

int pio_maplebus_tx_blocking(PIO pio, uint sm, uint8_t *buffer, size_t n) {
	uint32_t header = 0;
	header |= (0x3U << 28);
	header |= n * 8 / 2 - 1; // 4 cycles per byte
	pio_sm_put_blocking(pio, sm, header);

	for (size_t i = 0; i < n; ++i)
		pio_sm_put_blocking(pio, sm, (uint32_t)buffer[i] << 24);
}

void maplebus_rx_program_init(PIO pio, uint sm, uint offset, uint pin_sdcka, uint pin_sdckb) {
    assert(pin_sdcka == pin_sdckb + 1);
    pio_sm_set_consecutive_pindirs(pio, sm, pin_sdckb, 2, false);
    pio_sm_config c = maplebus_rx_program_get_default_config(offset);

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

    // Debug pin
    sm_config_set_sideset_pins(&c, 4); //debug pin
    pio_sm_set_consecutive_pindirs(pio, sm, 4, 1, true);
    pio_gpio_init(pio, 4);

    gpio_pull_up(pin_sdcka);
    gpio_pull_up(pin_sdckb);

    // Clear IRQ flag before starting
    hw_clear_bits(&pio->inte0, 1u << sm);
    hw_clear_bits(&pio->inte1, 1u << sm);
    pio->irq = 1u << sm;

    // Configure and start SM
    pio_sm_init(pio, sm, offset + maplebus_rx_offset_entry_point, &c);
    pio_sm_set_enabled(pio, sm, true);
}

int pio_maplebus_rx_blocking(PIO pio, uint sm, uint8_t *buffer, size_t n) {
	uint32_t val, header;
	if (n < 1)
		return -1;

	printf("Waiting for val\n");
	val = pio_sm_get_blocking(pio, sm);
	printf("RX: Got frame: %#x\n", val);

	if (val == 0xFFFFFFF0) { // Start frame w/ CRC
		val = pio_sm_get_blocking(pio, sm);
		// Update the expected number of bytes to 1
		pio_sm_exec(pio, sm, pio_encode_set(pio_y, 0));
		printf("HDR: %#x\n", val);

		val = pio_sm_get_blocking(pio, sm);
		printf("CRC: %#x\n", val);

		// We need to manually reset the PC
		pio_sm_exec(pio, sm, pio_encode_jmp(0));
	} else {
		pio_sm_put_blocking(pio, sm, 0);
		printf("RX: Unknown start frame: %#x\n", val);
	}
}

