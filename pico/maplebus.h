/*
 * Copyright (c) 2021 Raul E Rangel
 *
 * SPDX-License-Identifier: GPL-2.0-or-later
 */
  
#ifndef MAPLEBUS_H
#define MAPLEBUS_H

#include <inttypes.h>
#include "maplebus.pio.h"

void maplebus_tx_program_init(PIO pio, uint sm, uint offset, uint pin_sdcka, uint pin_sdckb);
int pio_maplebus_tx_blocking(PIO pio, uint sm, uint8_t *buffer, size_t n);

void maplebus_rx_program_init(PIO pio, uint sm, uint offset, uint pin_sdcka, uint pin_sdckb);
int pio_maplebus_rx_blocking(PIO pio, uint sm, uint8_t *buffer, size_t n);

#endif /* MAPLEBUS_H */
