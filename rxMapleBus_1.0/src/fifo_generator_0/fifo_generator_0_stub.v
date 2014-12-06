// Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2014.2 (lin64) Build 932637 Wed Jun 11 13:08:52 MDT 2014
// Date        : Sat Dec  6 08:06:07 2014
// Host        : aida-ipod.ad.ismell.org running 64-bit CentOS Linux release 7.0.1406 (Core)
// Command     : write_verilog -force -mode synth_stub
//               /home/me/Projects/ip_repo/rxMapleBus_1.0/src/fifo_generator_0/fifo_generator_0_stub.v
// Design      : fifo_generator_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "fifo_generator_v12_0,Vivado 2014.2" *)
module fifo_generator_0(s_aclk, s_aresetn, s_axis_tvalid, s_axis_tready, s_axis_tdata, s_axis_tstrb, s_axis_tkeep, s_axis_tlast, s_axis_tuser, m_axis_tvalid, m_axis_tready, m_axis_tdata, m_axis_tstrb, m_axis_tkeep, m_axis_tlast, m_axis_tuser, axis_data_count)
/* synthesis syn_black_box black_box_pad_pin="s_aclk,s_aresetn,s_axis_tvalid,s_axis_tready,s_axis_tdata[7:0],s_axis_tstrb[0:0],s_axis_tkeep[0:0],s_axis_tlast,s_axis_tuser[1:0],m_axis_tvalid,m_axis_tready,m_axis_tdata[7:0],m_axis_tstrb[0:0],m_axis_tkeep[0:0],m_axis_tlast,m_axis_tuser[1:0],axis_data_count[10:0]" */;
  input s_aclk;
  input s_aresetn;
  input s_axis_tvalid;
  output s_axis_tready;
  input [7:0]s_axis_tdata;
  input [0:0]s_axis_tstrb;
  input [0:0]s_axis_tkeep;
  input s_axis_tlast;
  input [1:0]s_axis_tuser;
  output m_axis_tvalid;
  input m_axis_tready;
  output [7:0]m_axis_tdata;
  output [0:0]m_axis_tstrb;
  output [0:0]m_axis_tkeep;
  output m_axis_tlast;
  output [1:0]m_axis_tuser;
  output [10:0]axis_data_count;
endmodule
