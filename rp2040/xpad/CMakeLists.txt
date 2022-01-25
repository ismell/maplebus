# Copyright (c) 2021 Raul E Rangel
#
# SPDX-License-Identifier: GPL-2.0-or-later

cmake_minimum_required(VERSION 3.13)

include(pico_sdk_import.cmake)

project(xpad)

pico_sdk_init()

add_executable(xpad)
target_include_directories(xpad PRIVATE ${CMAKE_CURRENT_LIST_DIR})

pico_enable_stdio_uart(xpad 1)

target_sources(xpad PRIVATE
        main.c
        )

target_link_libraries(xpad PRIVATE pico_stdlib tinyusb_host tinyusb_board)
pico_add_extra_outputs(xpad)

