/*
 * Copyright (c) 2022 Raul E Rangel
 *
 * SPDX-License-Identifier: BSD-3-Clause
 */

#ifndef _FUTURES_H
#define _FUTURES_H

#include "pico/types.h"

enum future_state {
    FUTURE_PENDING,
    FUTURE_DONE,
};

struct wait_context {
    /* TODO */
};

struct future {
    enum future_state (*poll)(struct future *future, struct wait_context *ctx);
};

void complete_future(struct future *future);

#endif /* _FUTURES_H */
