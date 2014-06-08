

proc generate {drv_handle} {
	xdefine_include_file $drv_handle "xparameters.h" "rxMapleBus" "NUM_INSTANCES" "DEVICE_ID"  "C_S_AXI_CRTL_BASEADDR" "C_S_AXI_CRTL_HIGHADDR"
}
