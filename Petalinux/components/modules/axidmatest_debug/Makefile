# 
# Makefile template for out of tree kernel modules
#

# PetaLinux-related stuff
ifndef PETALINUX
$(error You must source the petalinux/settings.sh script before working with PetaLinux)
endif

-include modules.common.mk

KERNEL_BUILD:=$(PROOT)/build/$(LINUX_KERNEL)

LOCALPWD=$(shell pwd)
obj-m += axidmatest_debug.o

all: build modules install

build:modules

.PHONY: build clean modules

clean:
	make INSTANCE=$(LINUX_KERNEL) -C $(KERNEL_BUILD) M=$(LOCALPWD) clean

modules:
	if [ ! -f "$(PROOT)/build/$(LINUX_KERNEL)/link-to-kernel-build/Module.symvers" ]; then \
		echo "ERROR: Failed to build module ${INSTANCE} because kernel hasn't been built."; \
		echo "ERROR: Please build kernel with petalinux-build -c kernel first."; \
		exit 255; \
	else \
		make INSTANCE=$(LINUX_KERNEL) -C $(KERNEL_BUILD) M=$(LOCALPWD) modules_only; \
	fi

install: $(addprefix $(DIR),$(subst .o,.ko,$(obj-m)))
	if [ ! -f "$(PROOT)/build/$(LINUX_KERNEL)/link-to-kernel-build/Module.symvers" ]; then \
		echo "ERROR: Failed to install module ${INSTANCE} because kernel hasn't been built."; \
		echo "ERROR: Please build kernel with petalinux-build -c kernel first."; \
		exit 255; \
	else \
		make INSTANCE=$(LINUX_KERNEL) -C $(KERNEL_BUILD) M=$(LOCALPWD) INSTALL_MOD_PATH=$(TARGETDIR) modules_install_only; \
	fi


help:
	@echo ""
	@echo "Quick reference for various supported build targets for $(INSTANCE)."
	@echo "----------------------------------------------------"
	@echo "  clean                  clean out build objects"
	@echo "  all                    build $(INSTANCE) and install to rootfs host copy"
	@echo "  build                  build subsystem"
	@echo "  install                install built objects to rootfs host copy"

