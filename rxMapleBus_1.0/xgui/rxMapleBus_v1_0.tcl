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
	set C_M_AXIS_RX_TDATA_WIDTH [ipgui::add_param $IPINST -parent $Page0 -name C_M_AXIS_RX_TDATA_WIDTH]
	set_property tooltip {Width of S_AXIS address bus. The slave accepts the read and write addresses of width C_M_AXIS_TDATA_WIDTH.} $C_M_AXIS_RX_TDATA_WIDTH
	set C_M_AXIS_RX_START_COUNT [ipgui::add_param $IPINST -parent $Page0 -name C_M_AXIS_RX_START_COUNT]
	set_property tooltip {Start count is the numeber of clock cycles the master will wait before initiating/issuing any transaction.} $C_M_AXIS_RX_START_COUNT
	set C_S_AXIS_TX_TDATA_WIDTH [ipgui::add_param $IPINST -parent $Page0 -name C_S_AXIS_TX_TDATA_WIDTH]
	set_property tooltip {AXI4Stream sink: Data Width} $C_S_AXIS_TX_TDATA_WIDTH
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

proc update_PARAM_VALUE.C_M_AXIS_RX_TDATA_WIDTH { PARAM_VALUE.C_M_AXIS_RX_TDATA_WIDTH } {
	# Procedure called to update C_M_AXIS_RX_TDATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_M_AXIS_RX_TDATA_WIDTH { PARAM_VALUE.C_M_AXIS_RX_TDATA_WIDTH } {
	# Procedure called to validate C_M_AXIS_RX_TDATA_WIDTH
	return true
}

proc update_PARAM_VALUE.C_M_AXIS_RX_START_COUNT { PARAM_VALUE.C_M_AXIS_RX_START_COUNT } {
	# Procedure called to update C_M_AXIS_RX_START_COUNT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_M_AXIS_RX_START_COUNT { PARAM_VALUE.C_M_AXIS_RX_START_COUNT } {
	# Procedure called to validate C_M_AXIS_RX_START_COUNT
	return true
}

proc update_PARAM_VALUE.C_S_AXIS_TX_TDATA_WIDTH { PARAM_VALUE.C_S_AXIS_TX_TDATA_WIDTH } {
	# Procedure called to update C_S_AXIS_TX_TDATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S_AXIS_TX_TDATA_WIDTH { PARAM_VALUE.C_S_AXIS_TX_TDATA_WIDTH } {
	# Procedure called to validate C_S_AXIS_TX_TDATA_WIDTH
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

proc update_MODELPARAM_VALUE.C_M_AXIS_RX_TDATA_WIDTH { MODELPARAM_VALUE.C_M_AXIS_RX_TDATA_WIDTH PARAM_VALUE.C_M_AXIS_RX_TDATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_M_AXIS_RX_TDATA_WIDTH}] ${MODELPARAM_VALUE.C_M_AXIS_RX_TDATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_M_AXIS_RX_START_COUNT { MODELPARAM_VALUE.C_M_AXIS_RX_START_COUNT PARAM_VALUE.C_M_AXIS_RX_START_COUNT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_M_AXIS_RX_START_COUNT}] ${MODELPARAM_VALUE.C_M_AXIS_RX_START_COUNT}
}

proc update_MODELPARAM_VALUE.C_S_AXIS_TX_TDATA_WIDTH { MODELPARAM_VALUE.C_S_AXIS_TX_TDATA_WIDTH PARAM_VALUE.C_S_AXIS_TX_TDATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S_AXIS_TX_TDATA_WIDTH}] ${MODELPARAM_VALUE.C_S_AXIS_TX_TDATA_WIDTH}
}

