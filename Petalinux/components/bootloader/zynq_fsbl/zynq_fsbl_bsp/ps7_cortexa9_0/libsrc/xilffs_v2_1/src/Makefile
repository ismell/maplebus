####################################/-*-Makefile-*- 
#
# Copyright (c) 2008 Xilinx, Inc.  All rights reserved.
#
# Xilinx, Inc.
#
# XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS" AS A 
# COURTESY TO YOU.  BY PROVIDING THIS DESIGN, CODE, OR INFORMATION AS
# ONE POSSIBLE   IMPLEMENTATION OF THIS FEATURE, APPLICATION OR 
# STANDARD, XILINX IS MAKING NO REPRESENTATION THAT THIS IMPLEMENTATION
# IS FREE FROM ANY CLAIMS OF INFRINGEMENT, AND YOU ARE RESPONSIBLE 
# FOR OBTAINING ANY RIGHTS YOU MAY REQUIRE FOR YOUR IMPLEMENTATION.  
# XILINX EXPRESSLY DISCLAIMS ANY WARRANTY WHATSOEVER WITH RESPECT TO 
# THE ADEQUACY OF THE IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO 
# ANY WARRANTIES OR REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE 
# FROM CLAIMS OF INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY 
# AND FITNESS FOR A PARTICULAR PURPOSE.
# 
######################################################

COMPILER=
ARCHIVER=
CP=cp
COMPILER_FLAGS=

ifeq ($(COMPILER) , arm-xilinx-eabi-gcc)
	EXTRA_ARCHIVE_FLAGS=rc
else
	EXTRA_ARCHIVE_FLAGS=--create
endif

ifeq ($(COMPILER) , mb-gcc)
	EXTRA_ARCHIVE_FLAGS=rc
endif

RELEASEDIR=../../../lib
INCLUDEDIR=../../../include
INCLUDES=-I./include/ -I${INCLUDEDIR} 
FATFS_DIR = .

LIB_SRCS = $(FATFS_DIR)/ff.c \
          $(FATFS_DIR)/diskio.c

          
# create FATFS_SRCS based on configured options

FATFS_SRCS = $(LIB_SRCS)

FATFS_OBJS = $(FATFS_SRCS:%.c=%.o)
          

EXPORT_INCLUDE_FILES = $(FATFS_DIR)/include/ff.h \
			$(FATFS_DIR)/include/ffconf.h \
			$(FATFS_DIR)/include/diskio.h \
			$(FATFS_DIR)/include/integer.h

			
libs: libxilffs.a
	cp libxilffs.a $(RELEASEDIR)
	make clean

include:
	@for i in $(EXPORT_INCLUDE_FILES); do \
	${CP} -r $$i ${INCLUDEDIR}; \
	done

clean:
	rm -rf obj/ff.o obj/diskio.o	
	rmdir obj
	rm libxilffs.a


libxilffs.a: obj_dir print_msg_fatfs_base $(FATFS_OBJS) 
	@echo "Creating archive $@"
	$(ARCHIVER) $(EXTRA_ARCHIVE_FLAGS) $@ obj/ff.o obj/diskio.o
	

obj_dir:
	mkdir obj

print_msg_fatfs_base:
	@echo "Compiling XilFFs Library"

.c.o:
	$(COMPILER) $(COMPILER_FLAGS) $(EXTRA_COMPILER_FLAGS) $(INCLUDES) -c $< -o obj/$(@F)
