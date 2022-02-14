/*
 * Copyright (c) 2022 Raul E Rangel
 *
 * SPDX-License-Identifier: BSD-3-Clause
 */

#include <futures.h>
#include <pico/platform.h>

static inline enum future_state future_complete(
    __unused struct future *future, __unused struct wait_context *ctx)
{
  return FUTURE_DONE;
}

void complete_future(struct future *future)
{
	future->poll = future_complete;
}