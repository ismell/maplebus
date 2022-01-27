# Copyright (c) 2021 Raul E Rangel
#
# SPDX-License-Identifier: GPL-2.0-or-later

cmake_minimum_required(VERSION 3.13)

set(PICO_SDK_PATH ../../pico-sdk)
include(pico_sdk_import.cmake)

project(x360)

pico_sdk_init()

add_executable(x360)
target_include_directories(x360 PRIVATE ${CMAKE_CURRENT_LIST_DIR})

pico_enable_stdio_uart(x360 1)

target_sources(x360 PRIVATE
        main.c
        )

target_link_libraries(x360 PRIVATE pico_stdlib tinyusb_host tinyusb_board)
pico_add_extra_outputs(x360)

