#************************************************************
# THIS IS A WIZARD-GENERATED FILE.                           
#
# Version 13.1.0 Build 162 10/23/2013 SJ Web Edition
#
#************************************************************

# Copyright (C) 1991-2013 Altera Corporation
# Your use of Altera Corporation's design tools, logic functions 
# and other software and tools, and its AMPP partner logic 
# functions, and any output files from any of the foregoing 
# (including device programming or simulation files), and any 
# associated documentation or information are expressly subject 
# to the terms and conditions of the Altera Program License 
# Subscription Agreement, Altera MegaCore Function License 
# Agreement, or other applicable license agreement, including, 
# without limitation, that your use is for the sole purpose of 
# programming logic devices manufactured by Altera and sold by 
# Altera or its authorized distributors.  Please refer to the 
# applicable agreement for further details.



# Clock constraints

create_clock -name "internal" -period 100.000ns [get_ports {clk}]


# Automatically constrain PLL and other generated clocks
derive_pll_clocks -create_base_clocks

# Automatically calculate clock uncertainty to jitter and other effects.
#derive_clock_uncertainty
# Not supported for family MAX V

# tsu/th constraints

set_input_delay -clock "internal" -max 87.3ns [get_ports {slrd}] 
set_input_delay -clock "internal" -min 3.700ns [get_ports {slrd}] 
set_input_delay -clock "internal" -max 87.9ns [get_ports {slwr}] 
set_input_delay -clock "internal" -min 3.600ns [get_ports {slwr}] 
set_input_delay -clock "internal" -max 96.8ns [get_ports {fdata[0] fdata[1] fdata[2] fdata[3] fdata[4] fdata[5] fdata[6] fdata[7]}] 
set_input_delay -clock "internal" -min 4.500ns [get_ports {fdata[0] fdata[1] fdata[2] fdata[3] fdata[4] fdata[5] fdata[6] fdata[7]}] 
set_input_delay -clock "internal" -max 91.4ns [get_ports {pkt_end}] 
set_input_delay -clock "internal" -min 2.500ns [get_ports {pkt_end}] 


# tco constraints

# tpd constraints

