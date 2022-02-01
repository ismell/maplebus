# Copyright (c) 2021 Raul E Rangel
#
# SPDX-License-Identifier: GPL-2.0-or-later

cmake_minimum_required(VERSION 3.13)

set(PICO_SDK_PATH ../../pico-sdk)
include(pico_sdk_import.cmake)

add_subdirectory(../futures build-futures)

project(maplebus)

pico_sdk_init()

add_executable(maplebus)

pico_enable_stdio_uart(maplebus 1)

pico_generate_pio_header(maplebus ${CMAKE_CURRENT_LIST_DIR}/maplebus.pio)

target_sources(maplebus PRIVATE
        main.c
        maplebus.c
        )

target_link_libraries(maplebus PRIVATE pico_stdlib hardware_pio futures)
target_compile_options(maplebus PRIVATE -Wall -Wextra -Wconversion -Werror)
target_compile_definitions(maplebus PRIVATE
        PARAM_ASSERTIONS_ENABLE_ALL=1 # want to check all the assertions for compilation warnings
)

pico_add_extra_outputs(maplebus)

