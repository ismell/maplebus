# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
	set Page0 [ipgui::add_page $IPINST -name "Page 0" -layout vertical]
	set Component_Name [ipgui::add_param $IPINST -parent $Page0 -name Component_Name]
	set C_S_AXI_CRTL_DATA_WIDTH [ipgui::add_param $IPINST -parent $Page0 -name C_S_AXI_CRTL_DATA_WIDTH]
	set_property tooltip {Width of S_AXI data bus} $C_S_AXI_CRTL_DATA_WIDTH
	set C_S_AXI_CRTL_ADDR_WIDTH [ipgui::add_param $IPINST -parent $Page0 -name C_S_AXI_CRTL_ADDR_WIDTH]
	set_property tooltip {Width of S_AXI address bus} $C_S_AXI_CRTL_ADDR_WIDTH
	set C_S_AXI_CRTL_BASEADDR [ipgui::add_param $IPINST -parent $Page0 -name C_S_AXI_CRTL_BASEADDR]
	set C_S_AXI_CRTL_HIGHADDR [ipgui::add_param $IPINST -parent $Page0 -name C_S_AXI_CRTL_HIGHADDR]
	set C_AXIS_TDATA_WIDTH [ipgui::add_param $IPINST -parent $Page0 -name C_AXIS_TDATA_WIDTH]
}

proc update_PARAM_VALUE.C_S_AXI_CRTL_DATA_WIDTH { PARAM_VALUE.C_S_AXI_CRTL_DATA_WIDTH } {
	# Procedure called to update C_S_AXI_CRTL_DATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S_AXI_CRTL_DATA_WIDTH { PARAM_VALUE.C_S_AXI_CRTL_DATA_WIDTH } {
	# Procedure called to validate C_S_AXI_CRTL_DATA_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S_AXI_CRTL_ADDR_WIDTH { PARAM_VALUE.C_S_AXI_CRTL_ADDR_WIDTH } {
	# Procedure called to update C_S_AXI_CRTL_ADDR_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S_AXI_CRTL_ADDR_WIDTH { PARAM_VALUE.C_S_AXI_CRTL_ADDR_WIDTH } {
	# Procedure called to validate C_S_AXI_CRTL_ADDR_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S_AXI_CRTL_BASEADDR { PARAM_VALUE.C_S_AXI_CRTL_BASEADDR } {
	# Procedure called to update C_S_AXI_CRTL_BASEADDR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S_AXI_CRTL_BASEADDR { PARAM_VALUE.C_S_AXI_CRTL_BASEADDR } {
	# Procedure called to validate C_S_AXI_CRTL_BASEADDR
	return true
}

proc update_PARAM_VALUE.C_S_AXI_CRTL_HIGHADDR { PARAM_VALUE.C_S_AXI_CRTL_HIGHADDR } {
	# Procedure called to update C_S_AXI_CRTL_HIGHADDR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S_AXI_CRTL_HIGHADDR { PARAM_VALUE.C_S_AXI_CRTL_HIGHADDR } {
	# Procedure called to validate C_S_AXI_CRTL_HIGHADDR
	return true
}

proc update_PARAM_VALUE.C_AXIS_TDATA_WIDTH { PARAM_VALUE.C_AXIS_TDATA_WIDTH } {
	# Procedure called to update C_AXIS_TDATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_AXIS_TDATA_WIDTH { PARAM_VALUE.C_AXIS_TDATA_WIDTH } {
	# Procedure called to validate C_AXIS_TDATA_WIDTH
	return true
}


proc update_MODELPARAM_VALUE.C_S_AXI_CRTL_DATA_WIDTH { MODELPARAM_VALUE.C_S_AXI_CRTL_DATA_WIDTH PARAM_VALUE.C_S_AXI_CRTL_DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S_AXI_CRTL_DATA_WIDTH}] ${MODELPARAM_VALUE.C_S_AXI_CRTL_DATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_S_AXI_CRTL_ADDR_WIDTH { MODELPARAM_VALUE.C_S_AXI_CRTL_ADDR_WIDTH PARAM_VALUE.C_S_AXI_CRTL_ADDR_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S_AXI_CRTL_ADDR_WIDTH}] ${MODELPARAM_VALUE.C_S_AXI_CRTL_ADDR_WIDTH}
}

proc update_MODELPARAM_VALUE.C_AXIS_TDATA_WIDTH { MODELPARAM_VALUE.C_AXIS_TDATA_WIDTH PARAM_VALUE.C_AXIS_TDATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_AXIS_TDATA_WIDTH}] ${MODELPARAM_VALUE.C_AXIS_TDATA_WIDTH}
}

