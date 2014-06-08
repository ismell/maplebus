// Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2014.1 (win64) Build 881834 Fri Apr  4 14:15:54 MDT 2014
// Date        : Sat May 31 09:15:59 2014
// Host        : speedy running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/me/Projects/Zynq/ip_repo/rxMapleBus_1.0/src/fifo_generator_0/fifo_generator_0_funcsim.v
// Design      : fifo_generator_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v12_0,Vivado 2014.1" *) (* CHECK_LICENSE_TYPE = "fifo_generator_0,fifo_generator_v12_0,{}" *) 
(* core_generation_info = "fifo_generator_0,fifo_generator_v12_0,{x_ipProduct=Vivado 2014.1,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=fifo_generator,x_ipVersion=12.0,x_ipCoreRevision=0,x_ipLanguage=VERILOG,C_COMMON_CLOCK=1,C_COUNT_TYPE=0,C_DATA_COUNT_WIDTH=10,C_DEFAULT_VALUE=BlankString,C_DIN_WIDTH=8,C_DOUT_RST_VAL=0,C_DOUT_WIDTH=8,C_ENABLE_RLOCS=0,C_FAMILY=zynq,C_FULL_FLAGS_RST_VAL=0,C_HAS_ALMOST_EMPTY=0,C_HAS_ALMOST_FULL=0,C_HAS_BACKUP=0,C_HAS_DATA_COUNT=0,C_HAS_INT_CLK=0,C_HAS_MEMINIT_FILE=0,C_HAS_OVERFLOW=0,C_HAS_RD_DATA_COUNT=0,C_HAS_RD_RST=0,C_HAS_RST=1,C_HAS_SRST=0,C_HAS_UNDERFLOW=0,C_HAS_VALID=0,C_HAS_WR_ACK=0,C_HAS_WR_DATA_COUNT=0,C_HAS_WR_RST=0,C_IMPLEMENTATION_TYPE=0,C_INIT_WR_PNTR_VAL=0,C_MEMORY_TYPE=1,C_MIF_FILE_NAME=BlankString,C_OPTIMIZATION_MODE=0,C_OVERFLOW_LOW=0,C_PRELOAD_LATENCY=0,C_PRELOAD_REGS=1,C_PRIM_FIFO_TYPE=4kx4,C_PROG_EMPTY_THRESH_ASSERT_VAL=4,C_PROG_EMPTY_THRESH_NEGATE_VAL=5,C_PROG_EMPTY_TYPE=0,C_PROG_FULL_THRESH_ASSERT_VAL=1023,C_PROG_FULL_THRESH_NEGATE_VAL=1022,C_PROG_FULL_TYPE=0,C_RD_DATA_COUNT_WIDTH=10,C_RD_DEPTH=1024,C_RD_FREQ=1,C_RD_PNTR_WIDTH=10,C_UNDERFLOW_LOW=0,C_USE_DOUT_RST=0,C_USE_ECC=0,C_USE_EMBEDDED_REG=0,C_USE_PIPELINE_REG=0,C_POWER_SAVING_MODE=0,C_USE_FIFO16_FLAGS=0,C_USE_FWFT_DATA_COUNT=0,C_VALID_LOW=0,C_WR_ACK_LOW=0,C_WR_DATA_COUNT_WIDTH=10,C_WR_DEPTH=1024,C_WR_FREQ=1,C_WR_PNTR_WIDTH=10,C_WR_RESPONSE_LATENCY=1,C_MSGON_VAL=1,C_ENABLE_RST_SYNC=1,C_ERROR_INJECTION_TYPE=0,C_SYNCHRONIZER_STAGE=2,C_INTERFACE_TYPE=1,C_AXI_TYPE=1,C_HAS_AXI_WR_CHANNEL=1,C_HAS_AXI_RD_CHANNEL=1,C_HAS_SLAVE_CE=0,C_HAS_MASTER_CE=0,C_ADD_NGC_CONSTRAINT=0,C_USE_COMMON_OVERFLOW=0,C_USE_COMMON_UNDERFLOW=0,C_USE_DEFAULT_SETTINGS=0,C_AXI_ID_WIDTH=1,C_AXI_ADDR_WIDTH=32,C_AXI_DATA_WIDTH=64,C_AXI_LEN_WIDTH=8,C_AXI_LOCK_WIDTH=1,C_HAS_AXI_ID=0,C_HAS_AXI_AWUSER=0,C_HAS_AXI_WUSER=0,C_HAS_AXI_BUSER=0,C_HAS_AXI_ARUSER=0,C_HAS_AXI_RUSER=0,C_AXI_ARUSER_WIDTH=1,C_AXI_AWUSER_WIDTH=1,C_AXI_WUSER_WIDTH=1,C_AXI_BUSER_WIDTH=1,C_AXI_RUSER_WIDTH=1,C_HAS_AXIS_TDATA=1,C_HAS_AXIS_TID=0,C_HAS_AXIS_TDEST=0,C_HAS_AXIS_TUSER=0,C_HAS_AXIS_TREADY=1,C_HAS_AXIS_TLAST=1,C_HAS_AXIS_TSTRB=1,C_HAS_AXIS_TKEEP=0,C_AXIS_TDATA_WIDTH=8,C_AXIS_TID_WIDTH=1,C_AXIS_TDEST_WIDTH=1,C_AXIS_TUSER_WIDTH=1,C_AXIS_TSTRB_WIDTH=1,C_AXIS_TKEEP_WIDTH=1,C_WACH_TYPE=0,C_WDCH_TYPE=0,C_WRCH_TYPE=0,C_RACH_TYPE=0,C_RDCH_TYPE=0,C_AXIS_TYPE=0,C_IMPLEMENTATION_TYPE_WACH=2,C_IMPLEMENTATION_TYPE_WDCH=1,C_IMPLEMENTATION_TYPE_WRCH=2,C_IMPLEMENTATION_TYPE_RACH=2,C_IMPLEMENTATION_TYPE_RDCH=1,C_IMPLEMENTATION_TYPE_AXIS=1,C_APPLICATION_TYPE_WACH=0,C_APPLICATION_TYPE_WDCH=0,C_APPLICATION_TYPE_WRCH=0,C_APPLICATION_TYPE_RACH=0,C_APPLICATION_TYPE_RDCH=0,C_APPLICATION_TYPE_AXIS=1,C_PRIM_FIFO_TYPE_WACH=512x36,C_PRIM_FIFO_TYPE_WDCH=1kx36,C_PRIM_FIFO_TYPE_WRCH=512x36,C_PRIM_FIFO_TYPE_RACH=512x36,C_PRIM_FIFO_TYPE_RDCH=1kx36,C_PRIM_FIFO_TYPE_AXIS=1kx18,C_USE_ECC_WACH=0,C_USE_ECC_WDCH=0,C_USE_ECC_WRCH=0,C_USE_ECC_RACH=0,C_USE_ECC_RDCH=0,C_USE_ECC_AXIS=0,C_ERROR_INJECTION_TYPE_WACH=0,C_ERROR_INJECTION_TYPE_WDCH=0,C_ERROR_INJECTION_TYPE_WRCH=0,C_ERROR_INJECTION_TYPE_RACH=0,C_ERROR_INJECTION_TYPE_RDCH=0,C_ERROR_INJECTION_TYPE_AXIS=0,C_DIN_WIDTH_WACH=32,C_DIN_WIDTH_WDCH=64,C_DIN_WIDTH_WRCH=2,C_DIN_WIDTH_RACH=32,C_DIN_WIDTH_RDCH=64,C_DIN_WIDTH_AXIS=10,C_WR_DEPTH_WACH=16,C_WR_DEPTH_WDCH=1024,C_WR_DEPTH_WRCH=16,C_WR_DEPTH_RACH=16,C_WR_DEPTH_RDCH=1024,C_WR_DEPTH_AXIS=1024,C_WR_PNTR_WIDTH_WACH=4,C_WR_PNTR_WIDTH_WDCH=10,C_WR_PNTR_WIDTH_WRCH=4,C_WR_PNTR_WIDTH_RACH=4,C_WR_PNTR_WIDTH_RDCH=10,C_WR_PNTR_WIDTH_AXIS=10,C_HAS_DATA_COUNTS_WACH=0,C_HAS_DATA_COUNTS_WDCH=0,C_HAS_DATA_COUNTS_WRCH=0,C_HAS_DATA_COUNTS_RACH=0,C_HAS_DATA_COUNTS_RDCH=0,C_HAS_DATA_COUNTS_AXIS=1,C_HAS_PROG_FLAGS_WACH=0,C_HAS_PROG_FLAGS_WDCH=0,C_HAS_PROG_FLAGS_WRCH=0,C_HAS_PROG_FLAGS_RACH=0,C_HAS_PROG_FLAGS_RDCH=0,C_HAS_PROG_FLAGS_AXIS=0,C_PROG_FULL_TYPE_WACH=0,C_PROG_FULL_TYPE_WDCH=0,C_PROG_FULL_TYPE_WRCH=0,C_PROG_FULL_TYPE_RACH=0,C_PROG_FULL_TYPE_RDCH=0,C_PROG_FULL_TYPE_AXIS=0,C_PROG_FULL_THRESH_ASSERT_VAL_WACH=15,C_PROG_FULL_THRESH_ASSERT_VAL_WDCH=1023,C_PROG_FULL_THRESH_ASSERT_VAL_WRCH=15,C_PROG_FULL_THRESH_ASSERT_VAL_RACH=15,C_PROG_FULL_THRESH_ASSERT_VAL_RDCH=1023,C_PROG_FULL_THRESH_ASSERT_VAL_AXIS=1023,C_PROG_EMPTY_TYPE_WACH=0,C_PROG_EMPTY_TYPE_WDCH=0,C_PROG_EMPTY_TYPE_WRCH=0,C_PROG_EMPTY_TYPE_RACH=0,C_PROG_EMPTY_TYPE_RDCH=0,C_PROG_EMPTY_TYPE_AXIS=0,C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH=14,C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH=1022,C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH=14,C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH=14,C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH=1022,C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS=1022,C_REG_SLICE_MODE_WACH=0,C_REG_SLICE_MODE_WDCH=0,C_REG_SLICE_MODE_WRCH=0,C_REG_SLICE_MODE_RACH=0,C_REG_SLICE_MODE_RDCH=0,C_REG_SLICE_MODE_AXIS=0}" *) 
(* NotValidForBitStream *)
module fifo_generator_0
   (s_aclk,
    s_aresetn,
    s_axis_tvalid,
    s_axis_tready,
    s_axis_tdata,
    s_axis_tstrb,
    s_axis_tlast,
    m_axis_tvalid,
    m_axis_tready,
    m_axis_tdata,
    m_axis_tstrb,
    m_axis_tlast,
    axis_data_count);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 slave_aclk CLK" *) input s_aclk;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 slave_aresetn RST" *) input s_aresetn;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 S_AXIS TVALID" *) input s_axis_tvalid;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 S_AXIS TREADY" *) output s_axis_tready;
  input [7:0]s_axis_tdata;
  input [0:0]s_axis_tstrb;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 S_AXIS TLAST" *) input s_axis_tlast;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 M_AXIS TVALID" *) output m_axis_tvalid;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 M_AXIS TREADY" *) input m_axis_tready;
  output [7:0]m_axis_tdata;
  output [0:0]m_axis_tstrb;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 M_AXIS TLAST" *) output m_axis_tlast;
  output [10:0]axis_data_count;

  wire [10:0]axis_data_count;
  wire [7:0]m_axis_tdata;
  wire m_axis_tlast;
  wire m_axis_tready;
  wire [0:0]m_axis_tstrb;
  wire m_axis_tvalid;
  wire s_aclk;
  wire s_aresetn;
  wire [7:0]s_axis_tdata;
  wire s_axis_tlast;
  wire s_axis_tready;
  wire [0:0]s_axis_tstrb;
  wire s_axis_tvalid;
  wire NLW_U0_almost_empty_UNCONNECTED;
  wire NLW_U0_almost_full_UNCONNECTED;
  wire NLW_U0_axi_ar_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_ar_overflow_UNCONNECTED;
  wire NLW_U0_axi_ar_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_ar_prog_full_UNCONNECTED;
  wire NLW_U0_axi_ar_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_ar_underflow_UNCONNECTED;
  wire NLW_U0_axi_aw_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_aw_overflow_UNCONNECTED;
  wire NLW_U0_axi_aw_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_aw_prog_full_UNCONNECTED;
  wire NLW_U0_axi_aw_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_aw_underflow_UNCONNECTED;
  wire NLW_U0_axi_b_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_b_overflow_UNCONNECTED;
  wire NLW_U0_axi_b_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_b_prog_full_UNCONNECTED;
  wire NLW_U0_axi_b_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_b_underflow_UNCONNECTED;
  wire NLW_U0_axi_r_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_r_overflow_UNCONNECTED;
  wire NLW_U0_axi_r_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_r_prog_full_UNCONNECTED;
  wire NLW_U0_axi_r_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_r_underflow_UNCONNECTED;
  wire NLW_U0_axi_w_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_w_overflow_UNCONNECTED;
  wire NLW_U0_axi_w_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_w_prog_full_UNCONNECTED;
  wire NLW_U0_axi_w_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_w_underflow_UNCONNECTED;
  wire NLW_U0_axis_dbiterr_UNCONNECTED;
  wire NLW_U0_axis_overflow_UNCONNECTED;
  wire NLW_U0_axis_prog_empty_UNCONNECTED;
  wire NLW_U0_axis_prog_full_UNCONNECTED;
  wire NLW_U0_axis_sbiterr_UNCONNECTED;
  wire NLW_U0_axis_underflow_UNCONNECTED;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_empty_UNCONNECTED;
  wire NLW_U0_full_UNCONNECTED;
  wire NLW_U0_m_axi_arvalid_UNCONNECTED;
  wire NLW_U0_m_axi_awvalid_UNCONNECTED;
  wire NLW_U0_m_axi_bready_UNCONNECTED;
  wire NLW_U0_m_axi_rready_UNCONNECTED;
  wire NLW_U0_m_axi_wlast_UNCONNECTED;
  wire NLW_U0_m_axi_wvalid_UNCONNECTED;
  wire NLW_U0_overflow_UNCONNECTED;
  wire NLW_U0_prog_empty_UNCONNECTED;
  wire NLW_U0_prog_full_UNCONNECTED;
  wire NLW_U0_rd_rst_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire NLW_U0_underflow_UNCONNECTED;
  wire NLW_U0_valid_UNCONNECTED;
  wire NLW_U0_wr_ack_UNCONNECTED;
  wire NLW_U0_wr_rst_busy_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_wr_data_count_UNCONNECTED;
  wire [9:0]NLW_U0_data_count_UNCONNECTED;
  wire [7:0]NLW_U0_dout_UNCONNECTED;
  wire [31:0]NLW_U0_m_axi_araddr_UNCONNECTED;
  wire [1:0]NLW_U0_m_axi_arburst_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arcache_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_arid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_arlen_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_arlock_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_arprot_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arqos_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arregion_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_arsize_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_aruser_UNCONNECTED;
  wire [31:0]NLW_U0_m_axi_awaddr_UNCONNECTED;
  wire [1:0]NLW_U0_m_axi_awburst_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awcache_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_awlen_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awlock_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_awprot_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awqos_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awregion_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_awsize_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awuser_UNCONNECTED;
  wire [63:0]NLW_U0_m_axi_wdata_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_wid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_wstrb_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_wuser_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tdest_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tid_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tkeep_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tuser_UNCONNECTED;
  wire [9:0]NLW_U0_rd_data_count_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_buser_UNCONNECTED;
  wire [63:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_ruser_UNCONNECTED;
  wire [9:0]NLW_U0_wr_data_count_UNCONNECTED;

(* C_ADD_NGC_CONSTRAINT = "0" *) 
   (* C_APPLICATION_TYPE_AXIS = "1" *) 
   (* C_APPLICATION_TYPE_RACH = "0" *) 
   (* C_APPLICATION_TYPE_RDCH = "0" *) 
   (* C_APPLICATION_TYPE_WACH = "0" *) 
   (* C_APPLICATION_TYPE_WDCH = "0" *) 
   (* C_APPLICATION_TYPE_WRCH = "0" *) 
   (* C_AXIS_TDATA_WIDTH = "8" *) 
   (* C_AXIS_TDEST_WIDTH = "1" *) 
   (* C_AXIS_TID_WIDTH = "1" *) 
   (* C_AXIS_TKEEP_WIDTH = "1" *) 
   (* C_AXIS_TSTRB_WIDTH = "1" *) 
   (* C_AXIS_TUSER_WIDTH = "1" *) 
   (* C_AXIS_TYPE = "0" *) 
   (* C_AXI_ADDR_WIDTH = "32" *) 
   (* C_AXI_ARUSER_WIDTH = "1" *) 
   (* C_AXI_AWUSER_WIDTH = "1" *) 
   (* C_AXI_BUSER_WIDTH = "1" *) 
   (* C_AXI_DATA_WIDTH = "64" *) 
   (* C_AXI_ID_WIDTH = "1" *) 
   (* C_AXI_LEN_WIDTH = "8" *) 
   (* C_AXI_LOCK_WIDTH = "1" *) 
   (* C_AXI_RUSER_WIDTH = "1" *) 
   (* C_AXI_TYPE = "1" *) 
   (* C_AXI_WUSER_WIDTH = "1" *) 
   (* C_COMMON_CLOCK = "1" *) 
   (* C_COUNT_TYPE = "0" *) 
   (* C_DATA_COUNT_WIDTH = "10" *) 
   (* C_DEFAULT_VALUE = "BlankString" *) 
   (* C_DIN_WIDTH = "8" *) 
   (* C_DIN_WIDTH_AXIS = "10" *) 
   (* C_DIN_WIDTH_RACH = "32" *) 
   (* C_DIN_WIDTH_RDCH = "64" *) 
   (* C_DIN_WIDTH_WACH = "32" *) 
   (* C_DIN_WIDTH_WDCH = "64" *) 
   (* C_DIN_WIDTH_WRCH = "2" *) 
   (* C_DOUT_RST_VAL = "0" *) 
   (* C_DOUT_WIDTH = "8" *) 
   (* C_ENABLE_RLOCS = "0" *) 
   (* C_ENABLE_RST_SYNC = "1" *) 
   (* C_ERROR_INJECTION_TYPE = "0" *) 
   (* C_ERROR_INJECTION_TYPE_AXIS = "0" *) 
   (* C_ERROR_INJECTION_TYPE_RACH = "0" *) 
   (* C_ERROR_INJECTION_TYPE_RDCH = "0" *) 
   (* C_ERROR_INJECTION_TYPE_WACH = "0" *) 
   (* C_ERROR_INJECTION_TYPE_WDCH = "0" *) 
   (* C_ERROR_INJECTION_TYPE_WRCH = "0" *) 
   (* C_FAMILY = "zynq" *) 
   (* C_FULL_FLAGS_RST_VAL = "0" *) 
   (* C_HAS_ALMOST_EMPTY = "0" *) 
   (* C_HAS_ALMOST_FULL = "0" *) 
   (* C_HAS_AXIS_TDATA = "1" *) 
   (* C_HAS_AXIS_TDEST = "0" *) 
   (* C_HAS_AXIS_TID = "0" *) 
   (* C_HAS_AXIS_TKEEP = "0" *) 
   (* C_HAS_AXIS_TLAST = "1" *) 
   (* C_HAS_AXIS_TREADY = "1" *) 
   (* C_HAS_AXIS_TSTRB = "1" *) 
   (* C_HAS_AXIS_TUSER = "0" *) 
   (* C_HAS_AXI_ARUSER = "0" *) 
   (* C_HAS_AXI_AWUSER = "0" *) 
   (* C_HAS_AXI_BUSER = "0" *) 
   (* C_HAS_AXI_ID = "0" *) 
   (* C_HAS_AXI_RD_CHANNEL = "1" *) 
   (* C_HAS_AXI_RUSER = "0" *) 
   (* C_HAS_AXI_WR_CHANNEL = "1" *) 
   (* C_HAS_AXI_WUSER = "0" *) 
   (* C_HAS_BACKUP = "0" *) 
   (* C_HAS_DATA_COUNT = "0" *) 
   (* C_HAS_DATA_COUNTS_AXIS = "1" *) 
   (* C_HAS_DATA_COUNTS_RACH = "0" *) 
   (* C_HAS_DATA_COUNTS_RDCH = "0" *) 
   (* C_HAS_DATA_COUNTS_WACH = "0" *) 
   (* C_HAS_DATA_COUNTS_WDCH = "0" *) 
   (* C_HAS_DATA_COUNTS_WRCH = "0" *) 
   (* C_HAS_INT_CLK = "0" *) 
   (* C_HAS_MASTER_CE = "0" *) 
   (* C_HAS_MEMINIT_FILE = "0" *) 
   (* C_HAS_OVERFLOW = "0" *) 
   (* C_HAS_PROG_FLAGS_AXIS = "0" *) 
   (* C_HAS_PROG_FLAGS_RACH = "0" *) 
   (* C_HAS_PROG_FLAGS_RDCH = "0" *) 
   (* C_HAS_PROG_FLAGS_WACH = "0" *) 
   (* C_HAS_PROG_FLAGS_WDCH = "0" *) 
   (* C_HAS_PROG_FLAGS_WRCH = "0" *) 
   (* C_HAS_RD_DATA_COUNT = "0" *) 
   (* C_HAS_RD_RST = "0" *) 
   (* C_HAS_RST = "1" *) 
   (* C_HAS_SLAVE_CE = "0" *) 
   (* C_HAS_SRST = "0" *) 
   (* C_HAS_UNDERFLOW = "0" *) 
   (* C_HAS_VALID = "0" *) 
   (* C_HAS_WR_ACK = "0" *) 
   (* C_HAS_WR_DATA_COUNT = "0" *) 
   (* C_HAS_WR_RST = "0" *) 
   (* C_IMPLEMENTATION_TYPE = "0" *) 
   (* C_IMPLEMENTATION_TYPE_AXIS = "1" *) 
   (* C_IMPLEMENTATION_TYPE_RACH = "2" *) 
   (* C_IMPLEMENTATION_TYPE_RDCH = "1" *) 
   (* C_IMPLEMENTATION_TYPE_WACH = "2" *) 
   (* C_IMPLEMENTATION_TYPE_WDCH = "1" *) 
   (* C_IMPLEMENTATION_TYPE_WRCH = "2" *) 
   (* C_INIT_WR_PNTR_VAL = "0" *) 
   (* C_INTERFACE_TYPE = "1" *) 
   (* C_MEMORY_TYPE = "1" *) 
   (* C_MIF_FILE_NAME = "BlankString" *) 
   (* C_MSGON_VAL = "1" *) 
   (* C_OPTIMIZATION_MODE = "0" *) 
   (* C_OVERFLOW_LOW = "0" *) 
   (* C_POWER_SAVING_MODE = "0" *) 
   (* C_PRELOAD_LATENCY = "0" *) 
   (* C_PRELOAD_REGS = "1" *) 
   (* C_PRIM_FIFO_TYPE = "4kx4" *) 
   (* C_PRIM_FIFO_TYPE_AXIS = "1kx18" *) 
   (* C_PRIM_FIFO_TYPE_RACH = "512x36" *) 
   (* C_PRIM_FIFO_TYPE_RDCH = "1kx36" *) 
   (* C_PRIM_FIFO_TYPE_WACH = "512x36" *) 
   (* C_PRIM_FIFO_TYPE_WDCH = "1kx36" *) 
   (* C_PRIM_FIFO_TYPE_WRCH = "512x36" *) 
   (* C_PROG_EMPTY_THRESH_ASSERT_VAL = "4" *) 
   (* C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS = "1022" *) 
   (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH = "14" *) 
   (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH = "1022" *) 
   (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH = "14" *) 
   (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH = "1022" *) 
   (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH = "14" *) 
   (* C_PROG_EMPTY_THRESH_NEGATE_VAL = "5" *) 
   (* C_PROG_EMPTY_TYPE = "0" *) 
   (* C_PROG_EMPTY_TYPE_AXIS = "0" *) 
   (* C_PROG_EMPTY_TYPE_RACH = "0" *) 
   (* C_PROG_EMPTY_TYPE_RDCH = "0" *) 
   (* C_PROG_EMPTY_TYPE_WACH = "0" *) 
   (* C_PROG_EMPTY_TYPE_WDCH = "0" *) 
   (* C_PROG_EMPTY_TYPE_WRCH = "0" *) 
   (* C_PROG_FULL_THRESH_ASSERT_VAL = "1023" *) 
   (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "1023" *) 
   (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "15" *) 
   (* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) 
   (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "15" *) 
   (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
   (* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "15" *) 
   (* C_PROG_FULL_THRESH_NEGATE_VAL = "1022" *) 
   (* C_PROG_FULL_TYPE = "0" *) 
   (* C_PROG_FULL_TYPE_AXIS = "0" *) 
   (* C_PROG_FULL_TYPE_RACH = "0" *) 
   (* C_PROG_FULL_TYPE_RDCH = "0" *) 
   (* C_PROG_FULL_TYPE_WACH = "0" *) 
   (* C_PROG_FULL_TYPE_WDCH = "0" *) 
   (* C_PROG_FULL_TYPE_WRCH = "0" *) 
   (* C_RACH_TYPE = "0" *) 
   (* C_RDCH_TYPE = "0" *) 
   (* C_RD_DATA_COUNT_WIDTH = "10" *) 
   (* C_RD_DEPTH = "1024" *) 
   (* C_RD_FREQ = "1" *) 
   (* C_RD_PNTR_WIDTH = "10" *) 
   (* C_REG_SLICE_MODE_AXIS = "0" *) 
   (* C_REG_SLICE_MODE_RACH = "0" *) 
   (* C_REG_SLICE_MODE_RDCH = "0" *) 
   (* C_REG_SLICE_MODE_WACH = "0" *) 
   (* C_REG_SLICE_MODE_WDCH = "0" *) 
   (* C_REG_SLICE_MODE_WRCH = "0" *) 
   (* C_SYNCHRONIZER_STAGE = "2" *) 
   (* C_UNDERFLOW_LOW = "0" *) 
   (* C_USE_COMMON_OVERFLOW = "0" *) 
   (* C_USE_COMMON_UNDERFLOW = "0" *) 
   (* C_USE_DEFAULT_SETTINGS = "0" *) 
   (* C_USE_DOUT_RST = "0" *) 
   (* C_USE_ECC = "0" *) 
   (* C_USE_ECC_AXIS = "0" *) 
   (* C_USE_ECC_RACH = "0" *) 
   (* C_USE_ECC_RDCH = "0" *) 
   (* C_USE_ECC_WACH = "0" *) 
   (* C_USE_ECC_WDCH = "0" *) 
   (* C_USE_ECC_WRCH = "0" *) 
   (* C_USE_EMBEDDED_REG = "0" *) 
   (* C_USE_FIFO16_FLAGS = "0" *) 
   (* C_USE_FWFT_DATA_COUNT = "0" *) 
   (* C_USE_PIPELINE_REG = "0" *) 
   (* C_VALID_LOW = "0" *) 
   (* C_WACH_TYPE = "0" *) 
   (* C_WDCH_TYPE = "0" *) 
   (* C_WRCH_TYPE = "0" *) 
   (* C_WR_ACK_LOW = "0" *) 
   (* C_WR_DATA_COUNT_WIDTH = "10" *) 
   (* C_WR_DEPTH = "1024" *) 
   (* C_WR_DEPTH_AXIS = "1024" *) 
   (* C_WR_DEPTH_RACH = "16" *) 
   (* C_WR_DEPTH_RDCH = "1024" *) 
   (* C_WR_DEPTH_WACH = "16" *) 
   (* C_WR_DEPTH_WDCH = "1024" *) 
   (* C_WR_DEPTH_WRCH = "16" *) 
   (* C_WR_FREQ = "1" *) 
   (* C_WR_PNTR_WIDTH = "10" *) 
   (* C_WR_PNTR_WIDTH_AXIS = "10" *) 
   (* C_WR_PNTR_WIDTH_RACH = "4" *) 
   (* C_WR_PNTR_WIDTH_RDCH = "10" *) 
   (* C_WR_PNTR_WIDTH_WACH = "4" *) 
   (* C_WR_PNTR_WIDTH_WDCH = "10" *) 
   (* C_WR_PNTR_WIDTH_WRCH = "4" *) 
   (* C_WR_RESPONSE_LATENCY = "1" *) 
   fifo_generator_0fifo_generator_v12_0__parameterized0 U0
       (.almost_empty(NLW_U0_almost_empty_UNCONNECTED),
        .almost_full(NLW_U0_almost_full_UNCONNECTED),
        .axi_ar_data_count(NLW_U0_axi_ar_data_count_UNCONNECTED[4:0]),
        .axi_ar_dbiterr(NLW_U0_axi_ar_dbiterr_UNCONNECTED),
        .axi_ar_injectdbiterr(1'b0),
        .axi_ar_injectsbiterr(1'b0),
        .axi_ar_overflow(NLW_U0_axi_ar_overflow_UNCONNECTED),
        .axi_ar_prog_empty(NLW_U0_axi_ar_prog_empty_UNCONNECTED),
        .axi_ar_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_ar_prog_full(NLW_U0_axi_ar_prog_full_UNCONNECTED),
        .axi_ar_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_ar_rd_data_count(NLW_U0_axi_ar_rd_data_count_UNCONNECTED[4:0]),
        .axi_ar_sbiterr(NLW_U0_axi_ar_sbiterr_UNCONNECTED),
        .axi_ar_underflow(NLW_U0_axi_ar_underflow_UNCONNECTED),
        .axi_ar_wr_data_count(NLW_U0_axi_ar_wr_data_count_UNCONNECTED[4:0]),
        .axi_aw_data_count(NLW_U0_axi_aw_data_count_UNCONNECTED[4:0]),
        .axi_aw_dbiterr(NLW_U0_axi_aw_dbiterr_UNCONNECTED),
        .axi_aw_injectdbiterr(1'b0),
        .axi_aw_injectsbiterr(1'b0),
        .axi_aw_overflow(NLW_U0_axi_aw_overflow_UNCONNECTED),
        .axi_aw_prog_empty(NLW_U0_axi_aw_prog_empty_UNCONNECTED),
        .axi_aw_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_aw_prog_full(NLW_U0_axi_aw_prog_full_UNCONNECTED),
        .axi_aw_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_aw_rd_data_count(NLW_U0_axi_aw_rd_data_count_UNCONNECTED[4:0]),
        .axi_aw_sbiterr(NLW_U0_axi_aw_sbiterr_UNCONNECTED),
        .axi_aw_underflow(NLW_U0_axi_aw_underflow_UNCONNECTED),
        .axi_aw_wr_data_count(NLW_U0_axi_aw_wr_data_count_UNCONNECTED[4:0]),
        .axi_b_data_count(NLW_U0_axi_b_data_count_UNCONNECTED[4:0]),
        .axi_b_dbiterr(NLW_U0_axi_b_dbiterr_UNCONNECTED),
        .axi_b_injectdbiterr(1'b0),
        .axi_b_injectsbiterr(1'b0),
        .axi_b_overflow(NLW_U0_axi_b_overflow_UNCONNECTED),
        .axi_b_prog_empty(NLW_U0_axi_b_prog_empty_UNCONNECTED),
        .axi_b_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_b_prog_full(NLW_U0_axi_b_prog_full_UNCONNECTED),
        .axi_b_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_b_rd_data_count(NLW_U0_axi_b_rd_data_count_UNCONNECTED[4:0]),
        .axi_b_sbiterr(NLW_U0_axi_b_sbiterr_UNCONNECTED),
        .axi_b_underflow(NLW_U0_axi_b_underflow_UNCONNECTED),
        .axi_b_wr_data_count(NLW_U0_axi_b_wr_data_count_UNCONNECTED[4:0]),
        .axi_r_data_count(NLW_U0_axi_r_data_count_UNCONNECTED[10:0]),
        .axi_r_dbiterr(NLW_U0_axi_r_dbiterr_UNCONNECTED),
        .axi_r_injectdbiterr(1'b0),
        .axi_r_injectsbiterr(1'b0),
        .axi_r_overflow(NLW_U0_axi_r_overflow_UNCONNECTED),
        .axi_r_prog_empty(NLW_U0_axi_r_prog_empty_UNCONNECTED),
        .axi_r_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_r_prog_full(NLW_U0_axi_r_prog_full_UNCONNECTED),
        .axi_r_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_r_rd_data_count(NLW_U0_axi_r_rd_data_count_UNCONNECTED[10:0]),
        .axi_r_sbiterr(NLW_U0_axi_r_sbiterr_UNCONNECTED),
        .axi_r_underflow(NLW_U0_axi_r_underflow_UNCONNECTED),
        .axi_r_wr_data_count(NLW_U0_axi_r_wr_data_count_UNCONNECTED[10:0]),
        .axi_w_data_count(NLW_U0_axi_w_data_count_UNCONNECTED[10:0]),
        .axi_w_dbiterr(NLW_U0_axi_w_dbiterr_UNCONNECTED),
        .axi_w_injectdbiterr(1'b0),
        .axi_w_injectsbiterr(1'b0),
        .axi_w_overflow(NLW_U0_axi_w_overflow_UNCONNECTED),
        .axi_w_prog_empty(NLW_U0_axi_w_prog_empty_UNCONNECTED),
        .axi_w_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_w_prog_full(NLW_U0_axi_w_prog_full_UNCONNECTED),
        .axi_w_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_w_rd_data_count(NLW_U0_axi_w_rd_data_count_UNCONNECTED[10:0]),
        .axi_w_sbiterr(NLW_U0_axi_w_sbiterr_UNCONNECTED),
        .axi_w_underflow(NLW_U0_axi_w_underflow_UNCONNECTED),
        .axi_w_wr_data_count(NLW_U0_axi_w_wr_data_count_UNCONNECTED[10:0]),
        .axis_data_count(axis_data_count),
        .axis_dbiterr(NLW_U0_axis_dbiterr_UNCONNECTED),
        .axis_injectdbiterr(1'b0),
        .axis_injectsbiterr(1'b0),
        .axis_overflow(NLW_U0_axis_overflow_UNCONNECTED),
        .axis_prog_empty(NLW_U0_axis_prog_empty_UNCONNECTED),
        .axis_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axis_prog_full(NLW_U0_axis_prog_full_UNCONNECTED),
        .axis_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axis_rd_data_count(NLW_U0_axis_rd_data_count_UNCONNECTED[10:0]),
        .axis_sbiterr(NLW_U0_axis_sbiterr_UNCONNECTED),
        .axis_underflow(NLW_U0_axis_underflow_UNCONNECTED),
        .axis_wr_data_count(NLW_U0_axis_wr_data_count_UNCONNECTED[10:0]),
        .backup(1'b0),
        .backup_marker(1'b0),
        .clk(1'b0),
        .data_count(NLW_U0_data_count_UNCONNECTED[9:0]),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .din({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dout(NLW_U0_dout_UNCONNECTED[7:0]),
        .empty(NLW_U0_empty_UNCONNECTED),
        .full(NLW_U0_full_UNCONNECTED),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .int_clk(1'b0),
        .m_aclk(1'b0),
        .m_aclk_en(1'b0),
        .m_axi_araddr(NLW_U0_m_axi_araddr_UNCONNECTED[31:0]),
        .m_axi_arburst(NLW_U0_m_axi_arburst_UNCONNECTED[1:0]),
        .m_axi_arcache(NLW_U0_m_axi_arcache_UNCONNECTED[3:0]),
        .m_axi_arid(NLW_U0_m_axi_arid_UNCONNECTED[0]),
        .m_axi_arlen(NLW_U0_m_axi_arlen_UNCONNECTED[7:0]),
        .m_axi_arlock(NLW_U0_m_axi_arlock_UNCONNECTED[0]),
        .m_axi_arprot(NLW_U0_m_axi_arprot_UNCONNECTED[2:0]),
        .m_axi_arqos(NLW_U0_m_axi_arqos_UNCONNECTED[3:0]),
        .m_axi_arready(1'b0),
        .m_axi_arregion(NLW_U0_m_axi_arregion_UNCONNECTED[3:0]),
        .m_axi_arsize(NLW_U0_m_axi_arsize_UNCONNECTED[2:0]),
        .m_axi_aruser(NLW_U0_m_axi_aruser_UNCONNECTED[0]),
        .m_axi_arvalid(NLW_U0_m_axi_arvalid_UNCONNECTED),
        .m_axi_awaddr(NLW_U0_m_axi_awaddr_UNCONNECTED[31:0]),
        .m_axi_awburst(NLW_U0_m_axi_awburst_UNCONNECTED[1:0]),
        .m_axi_awcache(NLW_U0_m_axi_awcache_UNCONNECTED[3:0]),
        .m_axi_awid(NLW_U0_m_axi_awid_UNCONNECTED[0]),
        .m_axi_awlen(NLW_U0_m_axi_awlen_UNCONNECTED[7:0]),
        .m_axi_awlock(NLW_U0_m_axi_awlock_UNCONNECTED[0]),
        .m_axi_awprot(NLW_U0_m_axi_awprot_UNCONNECTED[2:0]),
        .m_axi_awqos(NLW_U0_m_axi_awqos_UNCONNECTED[3:0]),
        .m_axi_awready(1'b0),
        .m_axi_awregion(NLW_U0_m_axi_awregion_UNCONNECTED[3:0]),
        .m_axi_awsize(NLW_U0_m_axi_awsize_UNCONNECTED[2:0]),
        .m_axi_awuser(NLW_U0_m_axi_awuser_UNCONNECTED[0]),
        .m_axi_awvalid(NLW_U0_m_axi_awvalid_UNCONNECTED),
        .m_axi_bid(1'b0),
        .m_axi_bready(NLW_U0_m_axi_bready_UNCONNECTED),
        .m_axi_bresp({1'b0,1'b0}),
        .m_axi_buser(1'b0),
        .m_axi_bvalid(1'b0),
        .m_axi_rdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .m_axi_rid(1'b0),
        .m_axi_rlast(1'b0),
        .m_axi_rready(NLW_U0_m_axi_rready_UNCONNECTED),
        .m_axi_rresp({1'b0,1'b0}),
        .m_axi_ruser(1'b0),
        .m_axi_rvalid(1'b0),
        .m_axi_wdata(NLW_U0_m_axi_wdata_UNCONNECTED[63:0]),
        .m_axi_wid(NLW_U0_m_axi_wid_UNCONNECTED[0]),
        .m_axi_wlast(NLW_U0_m_axi_wlast_UNCONNECTED),
        .m_axi_wready(1'b0),
        .m_axi_wstrb(NLW_U0_m_axi_wstrb_UNCONNECTED[7:0]),
        .m_axi_wuser(NLW_U0_m_axi_wuser_UNCONNECTED[0]),
        .m_axi_wvalid(NLW_U0_m_axi_wvalid_UNCONNECTED),
        .m_axis_tdata(m_axis_tdata),
        .m_axis_tdest(NLW_U0_m_axis_tdest_UNCONNECTED[0]),
        .m_axis_tid(NLW_U0_m_axis_tid_UNCONNECTED[0]),
        .m_axis_tkeep(NLW_U0_m_axis_tkeep_UNCONNECTED[0]),
        .m_axis_tlast(m_axis_tlast),
        .m_axis_tready(m_axis_tready),
        .m_axis_tstrb(m_axis_tstrb),
        .m_axis_tuser(NLW_U0_m_axis_tuser_UNCONNECTED[0]),
        .m_axis_tvalid(m_axis_tvalid),
        .overflow(NLW_U0_overflow_UNCONNECTED),
        .prog_empty(NLW_U0_prog_empty_UNCONNECTED),
        .prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full(NLW_U0_prog_full_UNCONNECTED),
        .prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .rd_clk(1'b0),
        .rd_data_count(NLW_U0_rd_data_count_UNCONNECTED[9:0]),
        .rd_en(1'b0),
        .rd_rst(1'b0),
        .rd_rst_busy(NLW_U0_rd_rst_busy_UNCONNECTED),
        .rst(1'b0),
        .s_aclk(s_aclk),
        .s_aclk_en(1'b0),
        .s_aresetn(s_aresetn),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arid(1'b0),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlock(1'b0),
        .s_axi_arprot({1'b0,1'b0,1'b0}),
        .s_axi_arqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_aruser(1'b0),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awid(1'b0),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlock(1'b0),
        .s_axi_awprot({1'b0,1'b0,1'b0}),
        .s_axi_awqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awuser(1'b0),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_buser(NLW_U0_s_axi_buser_UNCONNECTED[0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[63:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_ruser(NLW_U0_s_axi_ruser_UNCONNECTED[0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wid(1'b0),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wuser(1'b0),
        .s_axi_wvalid(1'b0),
        .s_axis_tdata(s_axis_tdata),
        .s_axis_tdest(1'b0),
        .s_axis_tid(1'b0),
        .s_axis_tkeep(1'b0),
        .s_axis_tlast(s_axis_tlast),
        .s_axis_tready(s_axis_tready),
        .s_axis_tstrb(s_axis_tstrb),
        .s_axis_tuser(1'b0),
        .s_axis_tvalid(s_axis_tvalid),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .sleep(1'b0),
        .srst(1'b0),
        .underflow(NLW_U0_underflow_UNCONNECTED),
        .valid(NLW_U0_valid_UNCONNECTED),
        .wr_ack(NLW_U0_wr_ack_UNCONNECTED),
        .wr_clk(1'b0),
        .wr_data_count(NLW_U0_wr_data_count_UNCONNECTED[9:0]),
        .wr_en(1'b0),
        .wr_rst(1'b0),
        .wr_rst_busy(NLW_U0_wr_rst_busy_UNCONNECTED));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_generic_cstr" *) 
module fifo_generator_0blk_mem_gen_generic_cstr
   (D,
    s_aclk,
    WEA,
    I1,
    O5,
    O4,
    DIADI);
  output [9:0]D;
  input s_aclk;
  input [0:0]WEA;
  input I1;
  input [9:0]O5;
  input [9:0]O4;
  input [9:0]DIADI;

  wire [9:0]D;
  wire [9:0]DIADI;
  wire I1;
  wire [9:0]O4;
  wire [9:0]O5;
  wire [0:0]WEA;
  wire s_aclk;

fifo_generator_0blk_mem_gen_prim_width \ramloop[0].ram.r 
       (.D(D),
        .DIADI(DIADI),
        .I1(I1),
        .O4(O4),
        .O5(O5),
        .WEA(WEA),
        .s_aclk(s_aclk));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module fifo_generator_0blk_mem_gen_prim_width
   (D,
    s_aclk,
    WEA,
    I1,
    O5,
    O4,
    DIADI);
  output [9:0]D;
  input s_aclk;
  input [0:0]WEA;
  input I1;
  input [9:0]O5;
  input [9:0]O4;
  input [9:0]DIADI;

  wire [9:0]D;
  wire [9:0]DIADI;
  wire I1;
  wire [9:0]O4;
  wire [9:0]O5;
  wire [0:0]WEA;
  wire s_aclk;

fifo_generator_0blk_mem_gen_prim_wrapper \prim_noinit.ram 
       (.D(D),
        .DIADI(DIADI),
        .I1(I1),
        .O4(O4),
        .O5(O5),
        .WEA(WEA),
        .s_aclk(s_aclk));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper" *) 
module fifo_generator_0blk_mem_gen_prim_wrapper
   (D,
    s_aclk,
    WEA,
    I1,
    O5,
    O4,
    DIADI);
  output [9:0]D;
  input s_aclk;
  input [0:0]WEA;
  input I1;
  input [9:0]O5;
  input [9:0]O4;
  input [9:0]DIADI;

  wire [9:0]D;
  wire [9:0]DIADI;
  wire I1;
  wire [9:0]O4;
  wire [9:0]O5;
  wire [0:0]WEA;
  wire \n_16_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram ;
  wire \n_17_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram ;
  wire \n_18_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram ;
  wire \n_24_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram ;
  wire \n_25_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram ;
  wire \n_26_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram ;
  wire \n_34_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram ;
  wire \n_35_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram ;
  wire s_aclk;
  wire [15:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram_DOADO_UNCONNECTED ;
  wire [1:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram_DOPADOP_UNCONNECTED ;

(* box_type = "PRIMITIVE" *) 
   RAMB18E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(18'h00000),
    .INIT_B(18'h00000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(18),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("READ_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(18)) 
     \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram 
       (.ADDRARDADDR({O5,1'b0,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({O4,1'b0,1'b0,1'b0,1'b0}),
        .CLKARDCLK(s_aclk),
        .CLKBWRCLK(s_aclk),
        .DIADI({1'b0,1'b0,1'b0,DIADI[9:5],1'b0,1'b0,1'b0,DIADI[4:0]}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIPADIP({1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0}),
        .DOADO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram_DOADO_UNCONNECTED [15:0]),
        .DOBDO({\n_16_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram ,\n_17_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram ,\n_18_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram ,D[9:5],\n_24_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram ,\n_25_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram ,\n_26_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram ,D[4:0]}),
        .DOPADOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram_DOPADOP_UNCONNECTED [1:0]),
        .DOPBDOP({\n_34_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram ,\n_35_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram }),
        .ENARDEN(WEA),
        .ENBWREN(I1),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .WEA({WEA,WEA}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0}));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_top" *) 
module fifo_generator_0blk_mem_gen_top
   (D,
    s_aclk,
    WEA,
    I1,
    O5,
    O4,
    DIADI);
  output [9:0]D;
  input s_aclk;
  input [0:0]WEA;
  input I1;
  input [9:0]O5;
  input [9:0]O4;
  input [9:0]DIADI;

  wire [9:0]D;
  wire [9:0]DIADI;
  wire I1;
  wire [9:0]O4;
  wire [9:0]O5;
  wire [0:0]WEA;
  wire s_aclk;

fifo_generator_0blk_mem_gen_generic_cstr \valid.cstr 
       (.D(D),
        .DIADI(DIADI),
        .I1(I1),
        .O4(O4),
        .O5(O5),
        .WEA(WEA),
        .s_aclk(s_aclk));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_v8_2" *) 
module fifo_generator_0blk_mem_gen_v8_2__parameterized0
   (D,
    s_aclk,
    WEA,
    I1,
    O5,
    O4,
    DIADI);
  output [9:0]D;
  input s_aclk;
  input [0:0]WEA;
  input I1;
  input [9:0]O5;
  input [9:0]O4;
  input [9:0]DIADI;

  wire [9:0]D;
  wire [9:0]DIADI;
  wire I1;
  wire [9:0]O4;
  wire [9:0]O5;
  wire [0:0]WEA;
  wire s_aclk;

fifo_generator_0blk_mem_gen_v8_2_synth inst_blk_mem_gen
       (.D(D),
        .DIADI(DIADI),
        .I1(I1),
        .O4(O4),
        .O5(O5),
        .WEA(WEA),
        .s_aclk(s_aclk));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_v8_2_synth" *) 
module fifo_generator_0blk_mem_gen_v8_2_synth
   (D,
    s_aclk,
    WEA,
    I1,
    O5,
    O4,
    DIADI);
  output [9:0]D;
  input s_aclk;
  input [0:0]WEA;
  input I1;
  input [9:0]O5;
  input [9:0]O4;
  input [9:0]DIADI;

  wire [9:0]D;
  wire [9:0]DIADI;
  wire I1;
  wire [9:0]O4;
  wire [9:0]O5;
  wire [0:0]WEA;
  wire s_aclk;

fifo_generator_0blk_mem_gen_top \gnativebmg.native_blk_mem_gen 
       (.D(D),
        .DIADI(DIADI),
        .I1(I1),
        .O4(O4),
        .O5(O5),
        .WEA(WEA),
        .s_aclk(s_aclk));
endmodule

(* ORIG_REF_NAME = "compare" *) 
module fifo_generator_0compare
   (comp0,
    v1_reg);
  output comp0;
  input [4:0]v1_reg;

  wire comp0;
  wire \n_0_gmux.gm[3].gms.ms ;
  wire [4:0]v1_reg;
  wire [2:0]\NLW_gmux.gm[0].gm1.m1_CARRY4_CO_UNCONNECTED ;
  wire [3:0]\NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED ;
  wire [3:1]\NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED ;
  wire [3:1]\NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED ;
  wire [3:0]\NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED ;
  wire [3:1]\NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED ;

(* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
   (* box_type = "PRIMITIVE" *) 
   CARRY4 \gmux.gm[0].gm1.m1_CARRY4 
       (.CI(1'b0),
        .CO({\n_0_gmux.gm[3].gms.ms ,\NLW_gmux.gm[0].gm1.m1_CARRY4_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED [3:0]),
        .S(v1_reg[3:0]));
(* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
   (* box_type = "PRIMITIVE" *) 
   CARRY4 \gmux.gm[4].gms.ms_CARRY4 
       (.CI(\n_0_gmux.gm[3].gms.ms ),
        .CO({\NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED [3:1],comp0}),
        .CYINIT(1'b0),
        .DI({\NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED [3:1],1'b0}),
        .O(\NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED [3:0]),
        .S({\NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED [3:1],v1_reg[4]}));
endmodule

(* ORIG_REF_NAME = "compare" *) 
module fifo_generator_0compare_0
   (comp1,
    v1_reg_0);
  output comp1;
  input [4:0]v1_reg_0;

  wire comp1;
  wire \n_0_gmux.gm[3].gms.ms ;
  wire [4:0]v1_reg_0;
  wire [2:0]\NLW_gmux.gm[0].gm1.m1_CARRY4_CO_UNCONNECTED ;
  wire [3:0]\NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED ;
  wire [3:1]\NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED ;
  wire [3:1]\NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED ;
  wire [3:0]\NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED ;
  wire [3:1]\NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED ;

(* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
   (* box_type = "PRIMITIVE" *) 
   CARRY4 \gmux.gm[0].gm1.m1_CARRY4 
       (.CI(1'b0),
        .CO({\n_0_gmux.gm[3].gms.ms ,\NLW_gmux.gm[0].gm1.m1_CARRY4_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED [3:0]),
        .S(v1_reg_0[3:0]));
(* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
   (* box_type = "PRIMITIVE" *) 
   CARRY4 \gmux.gm[4].gms.ms_CARRY4 
       (.CI(\n_0_gmux.gm[3].gms.ms ),
        .CO({\NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED [3:1],comp1}),
        .CYINIT(1'b0),
        .DI({\NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED [3:1],1'b0}),
        .O(\NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED [3:0]),
        .S({\NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED [3:1],v1_reg_0[4]}));
endmodule

(* ORIG_REF_NAME = "compare" *) 
module fifo_generator_0compare_1
   (p_0_in,
    v1_reg_1);
  output p_0_in;
  input [4:0]v1_reg_1;

  wire \n_0_gmux.gm[3].gms.ms ;
  wire p_0_in;
  wire [4:0]v1_reg_1;
  wire [2:0]\NLW_gmux.gm[0].gm1.m1_CARRY4_CO_UNCONNECTED ;
  wire [3:0]\NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED ;
  wire [3:1]\NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED ;
  wire [3:1]\NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED ;
  wire [3:0]\NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED ;
  wire [3:1]\NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED ;

(* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
   (* box_type = "PRIMITIVE" *) 
   CARRY4 \gmux.gm[0].gm1.m1_CARRY4 
       (.CI(1'b0),
        .CO({\n_0_gmux.gm[3].gms.ms ,\NLW_gmux.gm[0].gm1.m1_CARRY4_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED [3:0]),
        .S(v1_reg_1[3:0]));
(* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
   (* box_type = "PRIMITIVE" *) 
   CARRY4 \gmux.gm[4].gms.ms_CARRY4 
       (.CI(\n_0_gmux.gm[3].gms.ms ),
        .CO({\NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED [3:1],p_0_in}),
        .CYINIT(1'b0),
        .DI({\NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED [3:1],1'b0}),
        .O(\NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED [3:0]),
        .S({\NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED [3:1],v1_reg_1[4]}));
endmodule

(* ORIG_REF_NAME = "compare" *) 
module fifo_generator_0compare_2
   (comp0,
    v1_reg);
  output comp0;
  input [4:0]v1_reg;

  wire comp0;
  wire \n_0_gmux.gm[3].gms.ms ;
  wire [4:0]v1_reg;
  wire [2:0]\NLW_gmux.gm[0].gm1.m1_CARRY4_CO_UNCONNECTED ;
  wire [3:0]\NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED ;
  wire [3:1]\NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED ;
  wire [3:1]\NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED ;
  wire [3:0]\NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED ;
  wire [3:1]\NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED ;

(* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
   (* box_type = "PRIMITIVE" *) 
   CARRY4 \gmux.gm[0].gm1.m1_CARRY4 
       (.CI(1'b0),
        .CO({\n_0_gmux.gm[3].gms.ms ,\NLW_gmux.gm[0].gm1.m1_CARRY4_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED [3:0]),
        .S(v1_reg[3:0]));
(* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
   (* box_type = "PRIMITIVE" *) 
   CARRY4 \gmux.gm[4].gms.ms_CARRY4 
       (.CI(\n_0_gmux.gm[3].gms.ms ),
        .CO({\NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED [3:1],comp0}),
        .CYINIT(1'b0),
        .DI({\NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED [3:1],1'b0}),
        .O(\NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED [3:0]),
        .S({\NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED [3:1],v1_reg[4]}));
endmodule

(* ORIG_REF_NAME = "compare" *) 
module fifo_generator_0compare_3
   (comp1,
    v1_reg_0);
  output comp1;
  input [4:0]v1_reg_0;

  wire comp1;
  wire \n_0_gmux.gm[3].gms.ms ;
  wire [4:0]v1_reg_0;
  wire [2:0]\NLW_gmux.gm[0].gm1.m1_CARRY4_CO_UNCONNECTED ;
  wire [3:0]\NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED ;
  wire [3:1]\NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED ;
  wire [3:1]\NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED ;
  wire [3:0]\NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED ;
  wire [3:1]\NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED ;

(* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
   (* box_type = "PRIMITIVE" *) 
   CARRY4 \gmux.gm[0].gm1.m1_CARRY4 
       (.CI(1'b0),
        .CO({\n_0_gmux.gm[3].gms.ms ,\NLW_gmux.gm[0].gm1.m1_CARRY4_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED [3:0]),
        .S(v1_reg_0[3:0]));
(* XILINX_LEGACY_PRIM = "(MUXCY,XORCY)" *) 
   (* box_type = "PRIMITIVE" *) 
   CARRY4 \gmux.gm[4].gms.ms_CARRY4 
       (.CI(\n_0_gmux.gm[3].gms.ms ),
        .CO({\NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED [3:1],comp1}),
        .CYINIT(1'b0),
        .DI({\NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED [3:1],1'b0}),
        .O(\NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED [3:0]),
        .S({\NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED [3:1],v1_reg_0[4]}));
endmodule

(* ORIG_REF_NAME = "fifo_generator_ramfifo" *) 
module fifo_generator_0fifo_generator_ramfifo
   (O1,
    O2,
    m_axis_tvalid,
    D,
    O3,
    E,
    axis_wr_eop,
    O4,
    s_axis_tready,
    O5,
    s_aclk,
    DIADI,
    I1,
    m_axis_tready,
    s_axis_tvalid,
    Q,
    axis_wr_eop_d1,
    I2,
    S,
    I3,
    I4,
    I5,
    I6,
    I7,
    CO,
    s_aresetn,
    I8);
  output O1;
  output [9:0]O2;
  output m_axis_tvalid;
  output [10:0]D;
  output [10:0]O3;
  output [0:0]E;
  output axis_wr_eop;
  output [0:0]O4;
  output s_axis_tready;
  output O5;
  input s_aclk;
  input [9:0]DIADI;
  input I1;
  input m_axis_tready;
  input s_axis_tvalid;
  input [8:0]Q;
  input axis_wr_eop_d1;
  input [8:0]I2;
  input [1:0]S;
  input [3:0]I3;
  input [2:0]I4;
  input [1:0]I5;
  input [3:0]I6;
  input [2:0]I7;
  input [0:0]CO;
  input s_aresetn;
  input I8;

  wire [0:0]CO;
  wire [10:0]D;
  wire [9:0]DIADI;
  wire [0:0]E;
  wire I1;
  wire [8:0]I2;
  wire [3:0]I3;
  wire [2:0]I4;
  wire [1:0]I5;
  wire [3:0]I6;
  wire [2:0]I7;
  wire I8;
  wire O1;
  wire [9:0]O2;
  wire [10:0]O3;
  wire [0:0]O4;
  wire O5;
  wire [8:0]Q;
  wire RD_RST;
  wire RST;
  wire [1:0]S;
  wire axis_almost_full;
  wire axis_wr_eop;
  wire axis_wr_eop_d1;
  wire [4:0]\grss.rsts/c1/v1_reg ;
  wire [4:0]\grss.rsts/c2/v1_reg ;
  wire \grss.rsts/comp0 ;
  wire \grss.rsts/comp1 ;
  wire m_axis_tready;
  wire m_axis_tvalid;
  wire \n_0_gntv_or_sync_fifo.mem ;
  wire \n_11_gntv_or_sync_fifo.mem ;
  wire \n_14_gntv_or_sync_fifo.gl0.wr ;
  wire \n_20_gntv_or_sync_fifo.gl0.rd ;
  wire \n_2_gntv_or_sync_fifo.gl0.wr ;
  wire \n_4_gntv_or_sync_fifo.gl0.rd ;
  wire \n_5_gntv_or_sync_fifo.gl0.rd ;
  wire n_5_rstblk;
  wire \n_6_gntv_or_sync_fifo.gl0.rd ;
  wire p_14_out_0;
  wire p_18_out;
  wire [9:0]p_20_out;
  wire p_8_out;
  wire [9:0]p_9_out;
  wire ram_full_i;
  wire [9:0]rd_pntr_plus1;
  wire rst_d2;
  wire rst_full_gen_i;
  wire s_aclk;
  wire s_aresetn;
  wire s_axis_tready;
  wire s_axis_tvalid;

fifo_generator_0rd_logic \gntv_or_sync_fifo.gl0.rd 
       (.D(D),
        .DI(\n_11_gntv_or_sync_fifo.mem ),
        .E(\n_5_gntv_or_sync_fifo.gl0.rd ),
        .I1(\n_14_gntv_or_sync_fifo.gl0.wr ),
        .I2(I1),
        .I3(Q[1]),
        .I4(O2[0]),
        .I5({I2[8:2],I2[0]}),
        .I6({S[1],\n_0_gntv_or_sync_fifo.mem ,S[0]}),
        .I7(I3),
        .I8(I4),
        .O1(\n_4_gntv_or_sync_fifo.gl0.rd ),
        .O2(\n_20_gntv_or_sync_fifo.gl0.rd ),
        .O3(rd_pntr_plus1),
        .O4(p_20_out),
        .Q({RD_RST,n_5_rstblk}),
        .S(\n_6_gntv_or_sync_fifo.gl0.rd ),
        .axis_wr_eop_d1(axis_wr_eop_d1),
        .comp0(\grss.rsts/comp0 ),
        .comp1(\grss.rsts/comp1 ),
        .m_axis_tready(m_axis_tready),
        .m_axis_tvalid(m_axis_tvalid),
        .p_14_out_0(p_14_out_0),
        .p_18_out(p_18_out),
        .p_8_out(p_8_out),
        .ram_full_i(ram_full_i),
        .s_aclk(s_aclk),
        .s_axis_tvalid(s_axis_tvalid),
        .v1_reg(\grss.rsts/c1/v1_reg ),
        .v1_reg_0(\grss.rsts/c2/v1_reg ));
fifo_generator_0wr_logic \gntv_or_sync_fifo.gl0.wr 
       (.AR(RST),
        .DIADI(DIADI[0]),
        .E(E),
        .I1(I1),
        .I2(p_20_out),
        .I3(rd_pntr_plus1),
        .I6(I6),
        .I7(I7),
        .O1(\n_2_gntv_or_sync_fifo.gl0.wr ),
        .O2(\n_20_gntv_or_sync_fifo.gl0.rd ),
        .O3(O3),
        .O4(\n_14_gntv_or_sync_fifo.gl0.wr ),
        .O5(p_9_out),
        .Q({Q[8:2],Q[0]}),
        .S({I5[1],\n_6_gntv_or_sync_fifo.gl0.rd ,I5[0]}),
        .axis_almost_full(axis_almost_full),
        .axis_wr_eop(axis_wr_eop),
        .comp0(\grss.rsts/comp0 ),
        .comp1(\grss.rsts/comp1 ),
        .m_axis_tready(m_axis_tready),
        .p_14_out_0(p_14_out_0),
        .p_18_out(p_18_out),
        .p_8_out(p_8_out),
        .ram_full_i(ram_full_i),
        .rst_d2(rst_d2),
        .rst_full_gen_i(rst_full_gen_i),
        .s_aclk(s_aclk),
        .s_axis_tready(s_axis_tready),
        .s_axis_tvalid(s_axis_tvalid),
        .v1_reg(\grss.rsts/c1/v1_reg ),
        .v1_reg_0(\grss.rsts/c2/v1_reg ));
fifo_generator_0memory \gntv_or_sync_fifo.mem 
       (.CO(CO),
        .DI(\n_11_gntv_or_sync_fifo.mem ),
        .DIADI(DIADI),
        .E(\n_5_gntv_or_sync_fifo.gl0.rd ),
        .I1(\n_4_gntv_or_sync_fifo.gl0.rd ),
        .I2(I1),
        .I3(I2[1]),
        .I6(\n_0_gntv_or_sync_fifo.mem ),
        .I8(I8),
        .O1(O4),
        .O2(O5),
        .O4(p_20_out),
        .O5(p_9_out),
        .Q(O2),
        .WEA(\n_2_gntv_or_sync_fifo.gl0.wr ),
        .axis_almost_full(axis_almost_full),
        .axis_wr_eop_d1(axis_wr_eop_d1),
        .m_axis_tready(m_axis_tready),
        .p_8_out(p_8_out),
        .s_aclk(s_aclk));
fifo_generator_0reset_blk_ramfifo rstblk
       (.AR(RST),
        .O1(O1),
        .Q({RD_RST,n_5_rstblk}),
        .rst_d2(rst_d2),
        .rst_full_gen_i(rst_full_gen_i),
        .s_aclk(s_aclk),
        .s_aresetn(s_aresetn));
endmodule

(* ORIG_REF_NAME = "fifo_generator_top" *) 
module fifo_generator_0fifo_generator_top
   (AR,
    O1,
    m_axis_tvalid,
    D,
    O2,
    E,
    axis_wr_eop,
    O3,
    s_axis_tready,
    O4,
    s_aclk,
    DIADI,
    I1,
    m_axis_tready,
    s_axis_tvalid,
    Q,
    axis_wr_eop_d1,
    I2,
    S,
    I3,
    I4,
    I5,
    I6,
    I7,
    CO,
    s_aresetn,
    I8);
  output [0:0]AR;
  output [9:0]O1;
  output m_axis_tvalid;
  output [10:0]D;
  output [10:0]O2;
  output [0:0]E;
  output axis_wr_eop;
  output [0:0]O3;
  output s_axis_tready;
  output O4;
  input s_aclk;
  input [9:0]DIADI;
  input I1;
  input m_axis_tready;
  input s_axis_tvalid;
  input [8:0]Q;
  input axis_wr_eop_d1;
  input [8:0]I2;
  input [1:0]S;
  input [3:0]I3;
  input [2:0]I4;
  input [1:0]I5;
  input [3:0]I6;
  input [2:0]I7;
  input [0:0]CO;
  input s_aresetn;
  input I8;

  wire [0:0]AR;
  wire [0:0]CO;
  wire [10:0]D;
  wire [9:0]DIADI;
  wire [0:0]E;
  wire I1;
  wire [8:0]I2;
  wire [3:0]I3;
  wire [2:0]I4;
  wire [1:0]I5;
  wire [3:0]I6;
  wire [2:0]I7;
  wire I8;
  wire [9:0]O1;
  wire [10:0]O2;
  wire [0:0]O3;
  wire O4;
  wire [8:0]Q;
  wire [1:0]S;
  wire axis_wr_eop;
  wire axis_wr_eop_d1;
  wire m_axis_tready;
  wire m_axis_tvalid;
  wire s_aclk;
  wire s_aresetn;
  wire s_axis_tready;
  wire s_axis_tvalid;

fifo_generator_0fifo_generator_ramfifo \grf.rf 
       (.CO(CO),
        .D(D),
        .DIADI(DIADI),
        .E(E),
        .I1(I1),
        .I2(I2),
        .I3(I3),
        .I4(I4),
        .I5(I5),
        .I6(I6),
        .I7(I7),
        .I8(I8),
        .O1(AR),
        .O2(O1),
        .O3(O2),
        .O4(O3),
        .O5(O4),
        .Q(Q),
        .S(S),
        .axis_wr_eop(axis_wr_eop),
        .axis_wr_eop_d1(axis_wr_eop_d1),
        .m_axis_tready(m_axis_tready),
        .m_axis_tvalid(m_axis_tvalid),
        .s_aclk(s_aclk),
        .s_aresetn(s_aresetn),
        .s_axis_tready(s_axis_tready),
        .s_axis_tvalid(s_axis_tvalid));
endmodule

(* ORIG_REF_NAME = "fifo_generator_v12_0" *) (* C_COMMON_CLOCK = "1" *) (* C_COUNT_TYPE = "0" *) 
(* C_DATA_COUNT_WIDTH = "10" *) (* C_DEFAULT_VALUE = "BlankString" *) (* C_DIN_WIDTH = "8" *) 
(* C_DOUT_RST_VAL = "0" *) (* C_DOUT_WIDTH = "8" *) (* C_ENABLE_RLOCS = "0" *) 
(* C_FAMILY = "zynq" *) (* C_FULL_FLAGS_RST_VAL = "0" *) (* C_HAS_ALMOST_EMPTY = "0" *) 
(* C_HAS_ALMOST_FULL = "0" *) (* C_HAS_BACKUP = "0" *) (* C_HAS_DATA_COUNT = "0" *) 
(* C_HAS_INT_CLK = "0" *) (* C_HAS_MEMINIT_FILE = "0" *) (* C_HAS_OVERFLOW = "0" *) 
(* C_HAS_RD_DATA_COUNT = "0" *) (* C_HAS_RD_RST = "0" *) (* C_HAS_RST = "1" *) 
(* C_HAS_SRST = "0" *) (* C_HAS_UNDERFLOW = "0" *) (* C_HAS_VALID = "0" *) 
(* C_HAS_WR_ACK = "0" *) (* C_HAS_WR_DATA_COUNT = "0" *) (* C_HAS_WR_RST = "0" *) 
(* C_IMPLEMENTATION_TYPE = "0" *) (* C_INIT_WR_PNTR_VAL = "0" *) (* C_MEMORY_TYPE = "1" *) 
(* C_MIF_FILE_NAME = "BlankString" *) (* C_OPTIMIZATION_MODE = "0" *) (* C_OVERFLOW_LOW = "0" *) 
(* C_PRELOAD_LATENCY = "0" *) (* C_PRELOAD_REGS = "1" *) (* C_PRIM_FIFO_TYPE = "4kx4" *) 
(* C_PROG_EMPTY_THRESH_ASSERT_VAL = "4" *) (* C_PROG_EMPTY_THRESH_NEGATE_VAL = "5" *) (* C_PROG_EMPTY_TYPE = "0" *) 
(* C_PROG_FULL_THRESH_ASSERT_VAL = "1023" *) (* C_PROG_FULL_THRESH_NEGATE_VAL = "1022" *) (* C_PROG_FULL_TYPE = "0" *) 
(* C_RD_DATA_COUNT_WIDTH = "10" *) (* C_RD_DEPTH = "1024" *) (* C_RD_FREQ = "1" *) 
(* C_RD_PNTR_WIDTH = "10" *) (* C_UNDERFLOW_LOW = "0" *) (* C_USE_DOUT_RST = "0" *) 
(* C_USE_ECC = "0" *) (* C_USE_EMBEDDED_REG = "0" *) (* C_USE_PIPELINE_REG = "0" *) 
(* C_POWER_SAVING_MODE = "0" *) (* C_USE_FIFO16_FLAGS = "0" *) (* C_USE_FWFT_DATA_COUNT = "0" *) 
(* C_VALID_LOW = "0" *) (* C_WR_ACK_LOW = "0" *) (* C_WR_DATA_COUNT_WIDTH = "10" *) 
(* C_WR_DEPTH = "1024" *) (* C_WR_FREQ = "1" *) (* C_WR_PNTR_WIDTH = "10" *) 
(* C_WR_RESPONSE_LATENCY = "1" *) (* C_MSGON_VAL = "1" *) (* C_ENABLE_RST_SYNC = "1" *) 
(* C_ERROR_INJECTION_TYPE = "0" *) (* C_SYNCHRONIZER_STAGE = "2" *) (* C_INTERFACE_TYPE = "1" *) 
(* C_AXI_TYPE = "1" *) (* C_HAS_AXI_WR_CHANNEL = "1" *) (* C_HAS_AXI_RD_CHANNEL = "1" *) 
(* C_HAS_SLAVE_CE = "0" *) (* C_HAS_MASTER_CE = "0" *) (* C_ADD_NGC_CONSTRAINT = "0" *) 
(* C_USE_COMMON_OVERFLOW = "0" *) (* C_USE_COMMON_UNDERFLOW = "0" *) (* C_USE_DEFAULT_SETTINGS = "0" *) 
(* C_AXI_ID_WIDTH = "1" *) (* C_AXI_ADDR_WIDTH = "32" *) (* C_AXI_DATA_WIDTH = "64" *) 
(* C_AXI_LEN_WIDTH = "8" *) (* C_AXI_LOCK_WIDTH = "1" *) (* C_HAS_AXI_ID = "0" *) 
(* C_HAS_AXI_AWUSER = "0" *) (* C_HAS_AXI_WUSER = "0" *) (* C_HAS_AXI_BUSER = "0" *) 
(* C_HAS_AXI_ARUSER = "0" *) (* C_HAS_AXI_RUSER = "0" *) (* C_AXI_ARUSER_WIDTH = "1" *) 
(* C_AXI_AWUSER_WIDTH = "1" *) (* C_AXI_WUSER_WIDTH = "1" *) (* C_AXI_BUSER_WIDTH = "1" *) 
(* C_AXI_RUSER_WIDTH = "1" *) (* C_HAS_AXIS_TDATA = "1" *) (* C_HAS_AXIS_TID = "0" *) 
(* C_HAS_AXIS_TDEST = "0" *) (* C_HAS_AXIS_TUSER = "0" *) (* C_HAS_AXIS_TREADY = "1" *) 
(* C_HAS_AXIS_TLAST = "1" *) (* C_HAS_AXIS_TSTRB = "1" *) (* C_HAS_AXIS_TKEEP = "0" *) 
(* C_AXIS_TDATA_WIDTH = "8" *) (* C_AXIS_TID_WIDTH = "1" *) (* C_AXIS_TDEST_WIDTH = "1" *) 
(* C_AXIS_TUSER_WIDTH = "1" *) (* C_AXIS_TSTRB_WIDTH = "1" *) (* C_AXIS_TKEEP_WIDTH = "1" *) 
(* C_WACH_TYPE = "0" *) (* C_WDCH_TYPE = "0" *) (* C_WRCH_TYPE = "0" *) 
(* C_RACH_TYPE = "0" *) (* C_RDCH_TYPE = "0" *) (* C_AXIS_TYPE = "0" *) 
(* C_IMPLEMENTATION_TYPE_WACH = "2" *) (* C_IMPLEMENTATION_TYPE_WDCH = "1" *) (* C_IMPLEMENTATION_TYPE_WRCH = "2" *) 
(* C_IMPLEMENTATION_TYPE_RACH = "2" *) (* C_IMPLEMENTATION_TYPE_RDCH = "1" *) (* C_IMPLEMENTATION_TYPE_AXIS = "1" *) 
(* C_APPLICATION_TYPE_WACH = "0" *) (* C_APPLICATION_TYPE_WDCH = "0" *) (* C_APPLICATION_TYPE_WRCH = "0" *) 
(* C_APPLICATION_TYPE_RACH = "0" *) (* C_APPLICATION_TYPE_RDCH = "0" *) (* C_APPLICATION_TYPE_AXIS = "1" *) 
(* C_PRIM_FIFO_TYPE_WACH = "512x36" *) (* C_PRIM_FIFO_TYPE_WDCH = "1kx36" *) (* C_PRIM_FIFO_TYPE_WRCH = "512x36" *) 
(* C_PRIM_FIFO_TYPE_RACH = "512x36" *) (* C_PRIM_FIFO_TYPE_RDCH = "1kx36" *) (* C_PRIM_FIFO_TYPE_AXIS = "1kx18" *) 
(* C_USE_ECC_WACH = "0" *) (* C_USE_ECC_WDCH = "0" *) (* C_USE_ECC_WRCH = "0" *) 
(* C_USE_ECC_RACH = "0" *) (* C_USE_ECC_RDCH = "0" *) (* C_USE_ECC_AXIS = "0" *) 
(* C_ERROR_INJECTION_TYPE_WACH = "0" *) (* C_ERROR_INJECTION_TYPE_WDCH = "0" *) (* C_ERROR_INJECTION_TYPE_WRCH = "0" *) 
(* C_ERROR_INJECTION_TYPE_RACH = "0" *) (* C_ERROR_INJECTION_TYPE_RDCH = "0" *) (* C_ERROR_INJECTION_TYPE_AXIS = "0" *) 
(* C_DIN_WIDTH_WACH = "32" *) (* C_DIN_WIDTH_WDCH = "64" *) (* C_DIN_WIDTH_WRCH = "2" *) 
(* C_DIN_WIDTH_RACH = "32" *) (* C_DIN_WIDTH_RDCH = "64" *) (* C_DIN_WIDTH_AXIS = "10" *) 
(* C_WR_DEPTH_WACH = "16" *) (* C_WR_DEPTH_WDCH = "1024" *) (* C_WR_DEPTH_WRCH = "16" *) 
(* C_WR_DEPTH_RACH = "16" *) (* C_WR_DEPTH_RDCH = "1024" *) (* C_WR_DEPTH_AXIS = "1024" *) 
(* C_WR_PNTR_WIDTH_WACH = "4" *) (* C_WR_PNTR_WIDTH_WDCH = "10" *) (* C_WR_PNTR_WIDTH_WRCH = "4" *) 
(* C_WR_PNTR_WIDTH_RACH = "4" *) (* C_WR_PNTR_WIDTH_RDCH = "10" *) (* C_WR_PNTR_WIDTH_AXIS = "10" *) 
(* C_HAS_DATA_COUNTS_WACH = "0" *) (* C_HAS_DATA_COUNTS_WDCH = "0" *) (* C_HAS_DATA_COUNTS_WRCH = "0" *) 
(* C_HAS_DATA_COUNTS_RACH = "0" *) (* C_HAS_DATA_COUNTS_RDCH = "0" *) (* C_HAS_DATA_COUNTS_AXIS = "1" *) 
(* C_HAS_PROG_FLAGS_WACH = "0" *) (* C_HAS_PROG_FLAGS_WDCH = "0" *) (* C_HAS_PROG_FLAGS_WRCH = "0" *) 
(* C_HAS_PROG_FLAGS_RACH = "0" *) (* C_HAS_PROG_FLAGS_RDCH = "0" *) (* C_HAS_PROG_FLAGS_AXIS = "0" *) 
(* C_PROG_FULL_TYPE_WACH = "0" *) (* C_PROG_FULL_TYPE_WDCH = "0" *) (* C_PROG_FULL_TYPE_WRCH = "0" *) 
(* C_PROG_FULL_TYPE_RACH = "0" *) (* C_PROG_FULL_TYPE_RDCH = "0" *) (* C_PROG_FULL_TYPE_AXIS = "0" *) 
(* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "15" *) (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) (* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "15" *) 
(* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "15" *) (* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "1023" *) 
(* C_PROG_EMPTY_TYPE_WACH = "0" *) (* C_PROG_EMPTY_TYPE_WDCH = "0" *) (* C_PROG_EMPTY_TYPE_WRCH = "0" *) 
(* C_PROG_EMPTY_TYPE_RACH = "0" *) (* C_PROG_EMPTY_TYPE_RDCH = "0" *) (* C_PROG_EMPTY_TYPE_AXIS = "0" *) 
(* C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH = "14" *) (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH = "1022" *) (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH = "14" *) 
(* C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH = "14" *) (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH = "1022" *) (* C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS = "1022" *) 
(* C_REG_SLICE_MODE_WACH = "0" *) (* C_REG_SLICE_MODE_WDCH = "0" *) (* C_REG_SLICE_MODE_WRCH = "0" *) 
(* C_REG_SLICE_MODE_RACH = "0" *) (* C_REG_SLICE_MODE_RDCH = "0" *) (* C_REG_SLICE_MODE_AXIS = "0" *) 
module fifo_generator_0fifo_generator_v12_0__parameterized0
   (backup,
    backup_marker,
    clk,
    rst,
    srst,
    wr_clk,
    wr_rst,
    rd_clk,
    rd_rst,
    din,
    wr_en,
    rd_en,
    prog_empty_thresh,
    prog_empty_thresh_assert,
    prog_empty_thresh_negate,
    prog_full_thresh,
    prog_full_thresh_assert,
    prog_full_thresh_negate,
    int_clk,
    injectdbiterr,
    injectsbiterr,
    sleep,
    dout,
    full,
    almost_full,
    wr_ack,
    overflow,
    empty,
    almost_empty,
    valid,
    underflow,
    data_count,
    rd_data_count,
    wr_data_count,
    prog_full,
    prog_empty,
    sbiterr,
    dbiterr,
    wr_rst_busy,
    rd_rst_busy,
    m_aclk,
    s_aclk,
    s_aresetn,
    m_aclk_en,
    s_aclk_en,
    s_axi_awid,
    s_axi_awaddr,
    s_axi_awlen,
    s_axi_awsize,
    s_axi_awburst,
    s_axi_awlock,
    s_axi_awcache,
    s_axi_awprot,
    s_axi_awqos,
    s_axi_awregion,
    s_axi_awuser,
    s_axi_awvalid,
    s_axi_awready,
    s_axi_wid,
    s_axi_wdata,
    s_axi_wstrb,
    s_axi_wlast,
    s_axi_wuser,
    s_axi_wvalid,
    s_axi_wready,
    s_axi_bid,
    s_axi_bresp,
    s_axi_buser,
    s_axi_bvalid,
    s_axi_bready,
    m_axi_awid,
    m_axi_awaddr,
    m_axi_awlen,
    m_axi_awsize,
    m_axi_awburst,
    m_axi_awlock,
    m_axi_awcache,
    m_axi_awprot,
    m_axi_awqos,
    m_axi_awregion,
    m_axi_awuser,
    m_axi_awvalid,
    m_axi_awready,
    m_axi_wid,
    m_axi_wdata,
    m_axi_wstrb,
    m_axi_wlast,
    m_axi_wuser,
    m_axi_wvalid,
    m_axi_wready,
    m_axi_bid,
    m_axi_bresp,
    m_axi_buser,
    m_axi_bvalid,
    m_axi_bready,
    s_axi_arid,
    s_axi_araddr,
    s_axi_arlen,
    s_axi_arsize,
    s_axi_arburst,
    s_axi_arlock,
    s_axi_arcache,
    s_axi_arprot,
    s_axi_arqos,
    s_axi_arregion,
    s_axi_aruser,
    s_axi_arvalid,
    s_axi_arready,
    s_axi_rid,
    s_axi_rdata,
    s_axi_rresp,
    s_axi_rlast,
    s_axi_ruser,
    s_axi_rvalid,
    s_axi_rready,
    m_axi_arid,
    m_axi_araddr,
    m_axi_arlen,
    m_axi_arsize,
    m_axi_arburst,
    m_axi_arlock,
    m_axi_arcache,
    m_axi_arprot,
    m_axi_arqos,
    m_axi_arregion,
    m_axi_aruser,
    m_axi_arvalid,
    m_axi_arready,
    m_axi_rid,
    m_axi_rdata,
    m_axi_rresp,
    m_axi_rlast,
    m_axi_ruser,
    m_axi_rvalid,
    m_axi_rready,
    s_axis_tvalid,
    s_axis_tready,
    s_axis_tdata,
    s_axis_tstrb,
    s_axis_tkeep,
    s_axis_tlast,
    s_axis_tid,
    s_axis_tdest,
    s_axis_tuser,
    m_axis_tvalid,
    m_axis_tready,
    m_axis_tdata,
    m_axis_tstrb,
    m_axis_tkeep,
    m_axis_tlast,
    m_axis_tid,
    m_axis_tdest,
    m_axis_tuser,
    axi_aw_injectsbiterr,
    axi_aw_injectdbiterr,
    axi_aw_prog_full_thresh,
    axi_aw_prog_empty_thresh,
    axi_aw_data_count,
    axi_aw_wr_data_count,
    axi_aw_rd_data_count,
    axi_aw_sbiterr,
    axi_aw_dbiterr,
    axi_aw_overflow,
    axi_aw_underflow,
    axi_aw_prog_full,
    axi_aw_prog_empty,
    axi_w_injectsbiterr,
    axi_w_injectdbiterr,
    axi_w_prog_full_thresh,
    axi_w_prog_empty_thresh,
    axi_w_data_count,
    axi_w_wr_data_count,
    axi_w_rd_data_count,
    axi_w_sbiterr,
    axi_w_dbiterr,
    axi_w_overflow,
    axi_w_underflow,
    axi_w_prog_full,
    axi_w_prog_empty,
    axi_b_injectsbiterr,
    axi_b_injectdbiterr,
    axi_b_prog_full_thresh,
    axi_b_prog_empty_thresh,
    axi_b_data_count,
    axi_b_wr_data_count,
    axi_b_rd_data_count,
    axi_b_sbiterr,
    axi_b_dbiterr,
    axi_b_overflow,
    axi_b_underflow,
    axi_b_prog_full,
    axi_b_prog_empty,
    axi_ar_injectsbiterr,
    axi_ar_injectdbiterr,
    axi_ar_prog_full_thresh,
    axi_ar_prog_empty_thresh,
    axi_ar_data_count,
    axi_ar_wr_data_count,
    axi_ar_rd_data_count,
    axi_ar_sbiterr,
    axi_ar_dbiterr,
    axi_ar_overflow,
    axi_ar_underflow,
    axi_ar_prog_full,
    axi_ar_prog_empty,
    axi_r_injectsbiterr,
    axi_r_injectdbiterr,
    axi_r_prog_full_thresh,
    axi_r_prog_empty_thresh,
    axi_r_data_count,
    axi_r_wr_data_count,
    axi_r_rd_data_count,
    axi_r_sbiterr,
    axi_r_dbiterr,
    axi_r_overflow,
    axi_r_underflow,
    axi_r_prog_full,
    axi_r_prog_empty,
    axis_injectsbiterr,
    axis_injectdbiterr,
    axis_prog_full_thresh,
    axis_prog_empty_thresh,
    axis_data_count,
    axis_wr_data_count,
    axis_rd_data_count,
    axis_sbiterr,
    axis_dbiterr,
    axis_overflow,
    axis_underflow,
    axis_prog_full,
    axis_prog_empty);
  input backup;
  input backup_marker;
  input clk;
  input rst;
  input srst;
  input wr_clk;
  input wr_rst;
  input rd_clk;
  input rd_rst;
  input [7:0]din;
  input wr_en;
  input rd_en;
  input [9:0]prog_empty_thresh;
  input [9:0]prog_empty_thresh_assert;
  input [9:0]prog_empty_thresh_negate;
  input [9:0]prog_full_thresh;
  input [9:0]prog_full_thresh_assert;
  input [9:0]prog_full_thresh_negate;
  input int_clk;
  input injectdbiterr;
  input injectsbiterr;
  input sleep;
  output [7:0]dout;
  output full;
  output almost_full;
  output wr_ack;
  output overflow;
  output empty;
  output almost_empty;
  output valid;
  output underflow;
  output [9:0]data_count;
  output [9:0]rd_data_count;
  output [9:0]wr_data_count;
  output prog_full;
  output prog_empty;
  output sbiterr;
  output dbiterr;
  output wr_rst_busy;
  output rd_rst_busy;
  input m_aclk;
  input s_aclk;
  input s_aresetn;
  input m_aclk_en;
  input s_aclk_en;
  input [0:0]s_axi_awid;
  input [31:0]s_axi_awaddr;
  input [7:0]s_axi_awlen;
  input [2:0]s_axi_awsize;
  input [1:0]s_axi_awburst;
  input [0:0]s_axi_awlock;
  input [3:0]s_axi_awcache;
  input [2:0]s_axi_awprot;
  input [3:0]s_axi_awqos;
  input [3:0]s_axi_awregion;
  input [0:0]s_axi_awuser;
  input s_axi_awvalid;
  output s_axi_awready;
  input [0:0]s_axi_wid;
  input [63:0]s_axi_wdata;
  input [7:0]s_axi_wstrb;
  input s_axi_wlast;
  input [0:0]s_axi_wuser;
  input s_axi_wvalid;
  output s_axi_wready;
  output [0:0]s_axi_bid;
  output [1:0]s_axi_bresp;
  output [0:0]s_axi_buser;
  output s_axi_bvalid;
  input s_axi_bready;
  output [0:0]m_axi_awid;
  output [31:0]m_axi_awaddr;
  output [7:0]m_axi_awlen;
  output [2:0]m_axi_awsize;
  output [1:0]m_axi_awburst;
  output [0:0]m_axi_awlock;
  output [3:0]m_axi_awcache;
  output [2:0]m_axi_awprot;
  output [3:0]m_axi_awqos;
  output [3:0]m_axi_awregion;
  output [0:0]m_axi_awuser;
  output m_axi_awvalid;
  input m_axi_awready;
  output [0:0]m_axi_wid;
  output [63:0]m_axi_wdata;
  output [7:0]m_axi_wstrb;
  output m_axi_wlast;
  output [0:0]m_axi_wuser;
  output m_axi_wvalid;
  input m_axi_wready;
  input [0:0]m_axi_bid;
  input [1:0]m_axi_bresp;
  input [0:0]m_axi_buser;
  input m_axi_bvalid;
  output m_axi_bready;
  input [0:0]s_axi_arid;
  input [31:0]s_axi_araddr;
  input [7:0]s_axi_arlen;
  input [2:0]s_axi_arsize;
  input [1:0]s_axi_arburst;
  input [0:0]s_axi_arlock;
  input [3:0]s_axi_arcache;
  input [2:0]s_axi_arprot;
  input [3:0]s_axi_arqos;
  input [3:0]s_axi_arregion;
  input [0:0]s_axi_aruser;
  input s_axi_arvalid;
  output s_axi_arready;
  output [0:0]s_axi_rid;
  output [63:0]s_axi_rdata;
  output [1:0]s_axi_rresp;
  output s_axi_rlast;
  output [0:0]s_axi_ruser;
  output s_axi_rvalid;
  input s_axi_rready;
  output [0:0]m_axi_arid;
  output [31:0]m_axi_araddr;
  output [7:0]m_axi_arlen;
  output [2:0]m_axi_arsize;
  output [1:0]m_axi_arburst;
  output [0:0]m_axi_arlock;
  output [3:0]m_axi_arcache;
  output [2:0]m_axi_arprot;
  output [3:0]m_axi_arqos;
  output [3:0]m_axi_arregion;
  output [0:0]m_axi_aruser;
  output m_axi_arvalid;
  input m_axi_arready;
  input [0:0]m_axi_rid;
  input [63:0]m_axi_rdata;
  input [1:0]m_axi_rresp;
  input m_axi_rlast;
  input [0:0]m_axi_ruser;
  input m_axi_rvalid;
  output m_axi_rready;
  input s_axis_tvalid;
  output s_axis_tready;
  input [7:0]s_axis_tdata;
  input [0:0]s_axis_tstrb;
  input [0:0]s_axis_tkeep;
  input s_axis_tlast;
  input [0:0]s_axis_tid;
  input [0:0]s_axis_tdest;
  input [0:0]s_axis_tuser;
  output m_axis_tvalid;
  input m_axis_tready;
  output [7:0]m_axis_tdata;
  output [0:0]m_axis_tstrb;
  output [0:0]m_axis_tkeep;
  output m_axis_tlast;
  output [0:0]m_axis_tid;
  output [0:0]m_axis_tdest;
  output [0:0]m_axis_tuser;
  input axi_aw_injectsbiterr;
  input axi_aw_injectdbiterr;
  input [3:0]axi_aw_prog_full_thresh;
  input [3:0]axi_aw_prog_empty_thresh;
  output [4:0]axi_aw_data_count;
  output [4:0]axi_aw_wr_data_count;
  output [4:0]axi_aw_rd_data_count;
  output axi_aw_sbiterr;
  output axi_aw_dbiterr;
  output axi_aw_overflow;
  output axi_aw_underflow;
  output axi_aw_prog_full;
  output axi_aw_prog_empty;
  input axi_w_injectsbiterr;
  input axi_w_injectdbiterr;
  input [9:0]axi_w_prog_full_thresh;
  input [9:0]axi_w_prog_empty_thresh;
  output [10:0]axi_w_data_count;
  output [10:0]axi_w_wr_data_count;
  output [10:0]axi_w_rd_data_count;
  output axi_w_sbiterr;
  output axi_w_dbiterr;
  output axi_w_overflow;
  output axi_w_underflow;
  output axi_w_prog_full;
  output axi_w_prog_empty;
  input axi_b_injectsbiterr;
  input axi_b_injectdbiterr;
  input [3:0]axi_b_prog_full_thresh;
  input [3:0]axi_b_prog_empty_thresh;
  output [4:0]axi_b_data_count;
  output [4:0]axi_b_wr_data_count;
  output [4:0]axi_b_rd_data_count;
  output axi_b_sbiterr;
  output axi_b_dbiterr;
  output axi_b_overflow;
  output axi_b_underflow;
  output axi_b_prog_full;
  output axi_b_prog_empty;
  input axi_ar_injectsbiterr;
  input axi_ar_injectdbiterr;
  input [3:0]axi_ar_prog_full_thresh;
  input [3:0]axi_ar_prog_empty_thresh;
  output [4:0]axi_ar_data_count;
  output [4:0]axi_ar_wr_data_count;
  output [4:0]axi_ar_rd_data_count;
  output axi_ar_sbiterr;
  output axi_ar_dbiterr;
  output axi_ar_overflow;
  output axi_ar_underflow;
  output axi_ar_prog_full;
  output axi_ar_prog_empty;
  input axi_r_injectsbiterr;
  input axi_r_injectdbiterr;
  input [9:0]axi_r_prog_full_thresh;
  input [9:0]axi_r_prog_empty_thresh;
  output [10:0]axi_r_data_count;
  output [10:0]axi_r_wr_data_count;
  output [10:0]axi_r_rd_data_count;
  output axi_r_sbiterr;
  output axi_r_dbiterr;
  output axi_r_overflow;
  output axi_r_underflow;
  output axi_r_prog_full;
  output axi_r_prog_empty;
  input axis_injectsbiterr;
  input axis_injectdbiterr;
  input [9:0]axis_prog_full_thresh;
  input [9:0]axis_prog_empty_thresh;
  output [10:0]axis_data_count;
  output [10:0]axis_wr_data_count;
  output [10:0]axis_rd_data_count;
  output axis_sbiterr;
  output axis_dbiterr;
  output axis_overflow;
  output axis_underflow;
  output axis_prog_full;
  output axis_prog_empty;

  wire \<const0> ;
  wire \<const1> ;
  wire axi_ar_injectdbiterr;
  wire axi_ar_injectsbiterr;
  wire [3:0]axi_ar_prog_empty_thresh;
  wire [3:0]axi_ar_prog_full_thresh;
  wire axi_aw_injectdbiterr;
  wire axi_aw_injectsbiterr;
  wire [3:0]axi_aw_prog_empty_thresh;
  wire [3:0]axi_aw_prog_full_thresh;
  wire axi_b_injectdbiterr;
  wire axi_b_injectsbiterr;
  wire [3:0]axi_b_prog_empty_thresh;
  wire [3:0]axi_b_prog_full_thresh;
  wire axi_r_injectdbiterr;
  wire axi_r_injectsbiterr;
  wire [9:0]axi_r_prog_empty_thresh;
  wire [9:0]axi_r_prog_full_thresh;
  wire axi_w_injectdbiterr;
  wire axi_w_injectsbiterr;
  wire [9:0]axi_w_prog_empty_thresh;
  wire [9:0]axi_w_prog_full_thresh;
  wire [10:0]axis_data_count;
  wire axis_injectdbiterr;
  wire axis_injectsbiterr;
  wire [9:0]axis_prog_empty_thresh;
  wire [9:0]axis_prog_full_thresh;
  wire backup;
  wire backup_marker;
  wire clk;
  wire [7:0]din;
  wire injectdbiterr;
  wire injectsbiterr;
  wire int_clk;
  wire m_aclk;
  wire m_aclk_en;
  wire m_axi_arready;
  wire m_axi_awready;
  wire [0:0]m_axi_bid;
  wire [1:0]m_axi_bresp;
  wire [0:0]m_axi_buser;
  wire m_axi_bvalid;
  wire [63:0]m_axi_rdata;
  wire [0:0]m_axi_rid;
  wire m_axi_rlast;
  wire [1:0]m_axi_rresp;
  wire [0:0]m_axi_ruser;
  wire m_axi_rvalid;
  wire m_axi_wready;
  wire [7:0]m_axis_tdata;
  wire m_axis_tlast;
  wire m_axis_tready;
  wire [0:0]m_axis_tstrb;
  wire m_axis_tvalid;
  wire [9:0]prog_empty_thresh;
  wire [9:0]prog_empty_thresh_assert;
  wire [9:0]prog_empty_thresh_negate;
  wire [9:0]prog_full_thresh;
  wire [9:0]prog_full_thresh_assert;
  wire [9:0]prog_full_thresh_negate;
  wire rd_clk;
  wire rd_en;
  wire rd_rst;
  wire rst;
  wire s_aclk;
  wire s_aclk_en;
  wire s_aresetn;
  wire [31:0]s_axi_araddr;
  wire [1:0]s_axi_arburst;
  wire [3:0]s_axi_arcache;
  wire [0:0]s_axi_arid;
  wire [7:0]s_axi_arlen;
  wire [0:0]s_axi_arlock;
  wire [2:0]s_axi_arprot;
  wire [3:0]s_axi_arqos;
  wire [3:0]s_axi_arregion;
  wire [2:0]s_axi_arsize;
  wire [0:0]s_axi_aruser;
  wire s_axi_arvalid;
  wire [31:0]s_axi_awaddr;
  wire [1:0]s_axi_awburst;
  wire [3:0]s_axi_awcache;
  wire [0:0]s_axi_awid;
  wire [7:0]s_axi_awlen;
  wire [0:0]s_axi_awlock;
  wire [2:0]s_axi_awprot;
  wire [3:0]s_axi_awqos;
  wire [3:0]s_axi_awregion;
  wire [2:0]s_axi_awsize;
  wire [0:0]s_axi_awuser;
  wire s_axi_awvalid;
  wire s_axi_bready;
  wire s_axi_rready;
  wire [63:0]s_axi_wdata;
  wire [0:0]s_axi_wid;
  wire s_axi_wlast;
  wire [7:0]s_axi_wstrb;
  wire [0:0]s_axi_wuser;
  wire s_axi_wvalid;
  wire [7:0]s_axis_tdata;
  wire [0:0]s_axis_tdest;
  wire [0:0]s_axis_tid;
  wire [0:0]s_axis_tkeep;
  wire s_axis_tlast;
  wire s_axis_tready;
  wire [0:0]s_axis_tstrb;
  wire [0:0]s_axis_tuser;
  wire s_axis_tvalid;
  wire srst;
  wire wr_clk;
  wire wr_en;
  wire wr_rst;

  assign almost_empty = \<const1> ;
  assign almost_full = \<const0> ;
  assign axi_ar_data_count[4] = \<const0> ;
  assign axi_ar_data_count[3] = \<const0> ;
  assign axi_ar_data_count[2] = \<const0> ;
  assign axi_ar_data_count[1] = \<const0> ;
  assign axi_ar_data_count[0] = \<const0> ;
  assign axi_ar_dbiterr = \<const0> ;
  assign axi_ar_overflow = \<const0> ;
  assign axi_ar_prog_empty = \<const1> ;
  assign axi_ar_prog_full = \<const0> ;
  assign axi_ar_rd_data_count[4] = \<const0> ;
  assign axi_ar_rd_data_count[3] = \<const0> ;
  assign axi_ar_rd_data_count[2] = \<const0> ;
  assign axi_ar_rd_data_count[1] = \<const0> ;
  assign axi_ar_rd_data_count[0] = \<const0> ;
  assign axi_ar_sbiterr = \<const0> ;
  assign axi_ar_underflow = \<const0> ;
  assign axi_ar_wr_data_count[4] = \<const0> ;
  assign axi_ar_wr_data_count[3] = \<const0> ;
  assign axi_ar_wr_data_count[2] = \<const0> ;
  assign axi_ar_wr_data_count[1] = \<const0> ;
  assign axi_ar_wr_data_count[0] = \<const0> ;
  assign axi_aw_data_count[4] = \<const0> ;
  assign axi_aw_data_count[3] = \<const0> ;
  assign axi_aw_data_count[2] = \<const0> ;
  assign axi_aw_data_count[1] = \<const0> ;
  assign axi_aw_data_count[0] = \<const0> ;
  assign axi_aw_dbiterr = \<const0> ;
  assign axi_aw_overflow = \<const0> ;
  assign axi_aw_prog_empty = \<const1> ;
  assign axi_aw_prog_full = \<const0> ;
  assign axi_aw_rd_data_count[4] = \<const0> ;
  assign axi_aw_rd_data_count[3] = \<const0> ;
  assign axi_aw_rd_data_count[2] = \<const0> ;
  assign axi_aw_rd_data_count[1] = \<const0> ;
  assign axi_aw_rd_data_count[0] = \<const0> ;
  assign axi_aw_sbiterr = \<const0> ;
  assign axi_aw_underflow = \<const0> ;
  assign axi_aw_wr_data_count[4] = \<const0> ;
  assign axi_aw_wr_data_count[3] = \<const0> ;
  assign axi_aw_wr_data_count[2] = \<const0> ;
  assign axi_aw_wr_data_count[1] = \<const0> ;
  assign axi_aw_wr_data_count[0] = \<const0> ;
  assign axi_b_data_count[4] = \<const0> ;
  assign axi_b_data_count[3] = \<const0> ;
  assign axi_b_data_count[2] = \<const0> ;
  assign axi_b_data_count[1] = \<const0> ;
  assign axi_b_data_count[0] = \<const0> ;
  assign axi_b_dbiterr = \<const0> ;
  assign axi_b_overflow = \<const0> ;
  assign axi_b_prog_empty = \<const1> ;
  assign axi_b_prog_full = \<const0> ;
  assign axi_b_rd_data_count[4] = \<const0> ;
  assign axi_b_rd_data_count[3] = \<const0> ;
  assign axi_b_rd_data_count[2] = \<const0> ;
  assign axi_b_rd_data_count[1] = \<const0> ;
  assign axi_b_rd_data_count[0] = \<const0> ;
  assign axi_b_sbiterr = \<const0> ;
  assign axi_b_underflow = \<const0> ;
  assign axi_b_wr_data_count[4] = \<const0> ;
  assign axi_b_wr_data_count[3] = \<const0> ;
  assign axi_b_wr_data_count[2] = \<const0> ;
  assign axi_b_wr_data_count[1] = \<const0> ;
  assign axi_b_wr_data_count[0] = \<const0> ;
  assign axi_r_data_count[10] = \<const0> ;
  assign axi_r_data_count[9] = \<const0> ;
  assign axi_r_data_count[8] = \<const0> ;
  assign axi_r_data_count[7] = \<const0> ;
  assign axi_r_data_count[6] = \<const0> ;
  assign axi_r_data_count[5] = \<const0> ;
  assign axi_r_data_count[4] = \<const0> ;
  assign axi_r_data_count[3] = \<const0> ;
  assign axi_r_data_count[2] = \<const0> ;
  assign axi_r_data_count[1] = \<const0> ;
  assign axi_r_data_count[0] = \<const0> ;
  assign axi_r_dbiterr = \<const0> ;
  assign axi_r_overflow = \<const0> ;
  assign axi_r_prog_empty = \<const1> ;
  assign axi_r_prog_full = \<const0> ;
  assign axi_r_rd_data_count[10] = \<const0> ;
  assign axi_r_rd_data_count[9] = \<const0> ;
  assign axi_r_rd_data_count[8] = \<const0> ;
  assign axi_r_rd_data_count[7] = \<const0> ;
  assign axi_r_rd_data_count[6] = \<const0> ;
  assign axi_r_rd_data_count[5] = \<const0> ;
  assign axi_r_rd_data_count[4] = \<const0> ;
  assign axi_r_rd_data_count[3] = \<const0> ;
  assign axi_r_rd_data_count[2] = \<const0> ;
  assign axi_r_rd_data_count[1] = \<const0> ;
  assign axi_r_rd_data_count[0] = \<const0> ;
  assign axi_r_sbiterr = \<const0> ;
  assign axi_r_underflow = \<const0> ;
  assign axi_r_wr_data_count[10] = \<const0> ;
  assign axi_r_wr_data_count[9] = \<const0> ;
  assign axi_r_wr_data_count[8] = \<const0> ;
  assign axi_r_wr_data_count[7] = \<const0> ;
  assign axi_r_wr_data_count[6] = \<const0> ;
  assign axi_r_wr_data_count[5] = \<const0> ;
  assign axi_r_wr_data_count[4] = \<const0> ;
  assign axi_r_wr_data_count[3] = \<const0> ;
  assign axi_r_wr_data_count[2] = \<const0> ;
  assign axi_r_wr_data_count[1] = \<const0> ;
  assign axi_r_wr_data_count[0] = \<const0> ;
  assign axi_w_data_count[10] = \<const0> ;
  assign axi_w_data_count[9] = \<const0> ;
  assign axi_w_data_count[8] = \<const0> ;
  assign axi_w_data_count[7] = \<const0> ;
  assign axi_w_data_count[6] = \<const0> ;
  assign axi_w_data_count[5] = \<const0> ;
  assign axi_w_data_count[4] = \<const0> ;
  assign axi_w_data_count[3] = \<const0> ;
  assign axi_w_data_count[2] = \<const0> ;
  assign axi_w_data_count[1] = \<const0> ;
  assign axi_w_data_count[0] = \<const0> ;
  assign axi_w_dbiterr = \<const0> ;
  assign axi_w_overflow = \<const0> ;
  assign axi_w_prog_empty = \<const1> ;
  assign axi_w_prog_full = \<const0> ;
  assign axi_w_rd_data_count[10] = \<const0> ;
  assign axi_w_rd_data_count[9] = \<const0> ;
  assign axi_w_rd_data_count[8] = \<const0> ;
  assign axi_w_rd_data_count[7] = \<const0> ;
  assign axi_w_rd_data_count[6] = \<const0> ;
  assign axi_w_rd_data_count[5] = \<const0> ;
  assign axi_w_rd_data_count[4] = \<const0> ;
  assign axi_w_rd_data_count[3] = \<const0> ;
  assign axi_w_rd_data_count[2] = \<const0> ;
  assign axi_w_rd_data_count[1] = \<const0> ;
  assign axi_w_rd_data_count[0] = \<const0> ;
  assign axi_w_sbiterr = \<const0> ;
  assign axi_w_underflow = \<const0> ;
  assign axi_w_wr_data_count[10] = \<const0> ;
  assign axi_w_wr_data_count[9] = \<const0> ;
  assign axi_w_wr_data_count[8] = \<const0> ;
  assign axi_w_wr_data_count[7] = \<const0> ;
  assign axi_w_wr_data_count[6] = \<const0> ;
  assign axi_w_wr_data_count[5] = \<const0> ;
  assign axi_w_wr_data_count[4] = \<const0> ;
  assign axi_w_wr_data_count[3] = \<const0> ;
  assign axi_w_wr_data_count[2] = \<const0> ;
  assign axi_w_wr_data_count[1] = \<const0> ;
  assign axi_w_wr_data_count[0] = \<const0> ;
  assign axis_dbiterr = \<const0> ;
  assign axis_overflow = \<const0> ;
  assign axis_prog_empty = \<const0> ;
  assign axis_prog_full = \<const0> ;
  assign axis_rd_data_count[10] = \<const0> ;
  assign axis_rd_data_count[9] = \<const0> ;
  assign axis_rd_data_count[8] = \<const0> ;
  assign axis_rd_data_count[7] = \<const0> ;
  assign axis_rd_data_count[6] = \<const0> ;
  assign axis_rd_data_count[5] = \<const0> ;
  assign axis_rd_data_count[4] = \<const0> ;
  assign axis_rd_data_count[3] = \<const0> ;
  assign axis_rd_data_count[2] = \<const0> ;
  assign axis_rd_data_count[1] = \<const0> ;
  assign axis_rd_data_count[0] = \<const0> ;
  assign axis_sbiterr = \<const0> ;
  assign axis_underflow = \<const0> ;
  assign axis_wr_data_count[10] = \<const0> ;
  assign axis_wr_data_count[9] = \<const0> ;
  assign axis_wr_data_count[8] = \<const0> ;
  assign axis_wr_data_count[7] = \<const0> ;
  assign axis_wr_data_count[6] = \<const0> ;
  assign axis_wr_data_count[5] = \<const0> ;
  assign axis_wr_data_count[4] = \<const0> ;
  assign axis_wr_data_count[3] = \<const0> ;
  assign axis_wr_data_count[2] = \<const0> ;
  assign axis_wr_data_count[1] = \<const0> ;
  assign axis_wr_data_count[0] = \<const0> ;
  assign data_count[9] = \<const0> ;
  assign data_count[8] = \<const0> ;
  assign data_count[7] = \<const0> ;
  assign data_count[6] = \<const0> ;
  assign data_count[5] = \<const0> ;
  assign data_count[4] = \<const0> ;
  assign data_count[3] = \<const0> ;
  assign data_count[2] = \<const0> ;
  assign data_count[1] = \<const0> ;
  assign data_count[0] = \<const0> ;
  assign dbiterr = \<const0> ;
  assign dout[7] = \<const0> ;
  assign dout[6] = \<const0> ;
  assign dout[5] = \<const0> ;
  assign dout[4] = \<const0> ;
  assign dout[3] = \<const0> ;
  assign dout[2] = \<const0> ;
  assign dout[1] = \<const0> ;
  assign dout[0] = \<const0> ;
  assign empty = \<const1> ;
  assign full = \<const0> ;
  assign m_axi_araddr[31] = \<const0> ;
  assign m_axi_araddr[30] = \<const0> ;
  assign m_axi_araddr[29] = \<const0> ;
  assign m_axi_araddr[28] = \<const0> ;
  assign m_axi_araddr[27] = \<const0> ;
  assign m_axi_araddr[26] = \<const0> ;
  assign m_axi_araddr[25] = \<const0> ;
  assign m_axi_araddr[24] = \<const0> ;
  assign m_axi_araddr[23] = \<const0> ;
  assign m_axi_araddr[22] = \<const0> ;
  assign m_axi_araddr[21] = \<const0> ;
  assign m_axi_araddr[20] = \<const0> ;
  assign m_axi_araddr[19] = \<const0> ;
  assign m_axi_araddr[18] = \<const0> ;
  assign m_axi_araddr[17] = \<const0> ;
  assign m_axi_araddr[16] = \<const0> ;
  assign m_axi_araddr[15] = \<const0> ;
  assign m_axi_araddr[14] = \<const0> ;
  assign m_axi_araddr[13] = \<const0> ;
  assign m_axi_araddr[12] = \<const0> ;
  assign m_axi_araddr[11] = \<const0> ;
  assign m_axi_araddr[10] = \<const0> ;
  assign m_axi_araddr[9] = \<const0> ;
  assign m_axi_araddr[8] = \<const0> ;
  assign m_axi_araddr[7] = \<const0> ;
  assign m_axi_araddr[6] = \<const0> ;
  assign m_axi_araddr[5] = \<const0> ;
  assign m_axi_araddr[4] = \<const0> ;
  assign m_axi_araddr[3] = \<const0> ;
  assign m_axi_araddr[2] = \<const0> ;
  assign m_axi_araddr[1] = \<const0> ;
  assign m_axi_araddr[0] = \<const0> ;
  assign m_axi_arburst[1] = \<const0> ;
  assign m_axi_arburst[0] = \<const0> ;
  assign m_axi_arcache[3] = \<const0> ;
  assign m_axi_arcache[2] = \<const0> ;
  assign m_axi_arcache[1] = \<const0> ;
  assign m_axi_arcache[0] = \<const0> ;
  assign m_axi_arid[0] = \<const0> ;
  assign m_axi_arlen[7] = \<const0> ;
  assign m_axi_arlen[6] = \<const0> ;
  assign m_axi_arlen[5] = \<const0> ;
  assign m_axi_arlen[4] = \<const0> ;
  assign m_axi_arlen[3] = \<const0> ;
  assign m_axi_arlen[2] = \<const0> ;
  assign m_axi_arlen[1] = \<const0> ;
  assign m_axi_arlen[0] = \<const0> ;
  assign m_axi_arlock[0] = \<const0> ;
  assign m_axi_arprot[2] = \<const0> ;
  assign m_axi_arprot[1] = \<const0> ;
  assign m_axi_arprot[0] = \<const0> ;
  assign m_axi_arqos[3] = \<const0> ;
  assign m_axi_arqos[2] = \<const0> ;
  assign m_axi_arqos[1] = \<const0> ;
  assign m_axi_arqos[0] = \<const0> ;
  assign m_axi_arregion[3] = \<const0> ;
  assign m_axi_arregion[2] = \<const0> ;
  assign m_axi_arregion[1] = \<const0> ;
  assign m_axi_arregion[0] = \<const0> ;
  assign m_axi_arsize[2] = \<const0> ;
  assign m_axi_arsize[1] = \<const0> ;
  assign m_axi_arsize[0] = \<const0> ;
  assign m_axi_aruser[0] = \<const0> ;
  assign m_axi_arvalid = \<const0> ;
  assign m_axi_awaddr[31] = \<const0> ;
  assign m_axi_awaddr[30] = \<const0> ;
  assign m_axi_awaddr[29] = \<const0> ;
  assign m_axi_awaddr[28] = \<const0> ;
  assign m_axi_awaddr[27] = \<const0> ;
  assign m_axi_awaddr[26] = \<const0> ;
  assign m_axi_awaddr[25] = \<const0> ;
  assign m_axi_awaddr[24] = \<const0> ;
  assign m_axi_awaddr[23] = \<const0> ;
  assign m_axi_awaddr[22] = \<const0> ;
  assign m_axi_awaddr[21] = \<const0> ;
  assign m_axi_awaddr[20] = \<const0> ;
  assign m_axi_awaddr[19] = \<const0> ;
  assign m_axi_awaddr[18] = \<const0> ;
  assign m_axi_awaddr[17] = \<const0> ;
  assign m_axi_awaddr[16] = \<const0> ;
  assign m_axi_awaddr[15] = \<const0> ;
  assign m_axi_awaddr[14] = \<const0> ;
  assign m_axi_awaddr[13] = \<const0> ;
  assign m_axi_awaddr[12] = \<const0> ;
  assign m_axi_awaddr[11] = \<const0> ;
  assign m_axi_awaddr[10] = \<const0> ;
  assign m_axi_awaddr[9] = \<const0> ;
  assign m_axi_awaddr[8] = \<const0> ;
  assign m_axi_awaddr[7] = \<const0> ;
  assign m_axi_awaddr[6] = \<const0> ;
  assign m_axi_awaddr[5] = \<const0> ;
  assign m_axi_awaddr[4] = \<const0> ;
  assign m_axi_awaddr[3] = \<const0> ;
  assign m_axi_awaddr[2] = \<const0> ;
  assign m_axi_awaddr[1] = \<const0> ;
  assign m_axi_awaddr[0] = \<const0> ;
  assign m_axi_awburst[1] = \<const0> ;
  assign m_axi_awburst[0] = \<const0> ;
  assign m_axi_awcache[3] = \<const0> ;
  assign m_axi_awcache[2] = \<const0> ;
  assign m_axi_awcache[1] = \<const0> ;
  assign m_axi_awcache[0] = \<const0> ;
  assign m_axi_awid[0] = \<const0> ;
  assign m_axi_awlen[7] = \<const0> ;
  assign m_axi_awlen[6] = \<const0> ;
  assign m_axi_awlen[5] = \<const0> ;
  assign m_axi_awlen[4] = \<const0> ;
  assign m_axi_awlen[3] = \<const0> ;
  assign m_axi_awlen[2] = \<const0> ;
  assign m_axi_awlen[1] = \<const0> ;
  assign m_axi_awlen[0] = \<const0> ;
  assign m_axi_awlock[0] = \<const0> ;
  assign m_axi_awprot[2] = \<const0> ;
  assign m_axi_awprot[1] = \<const0> ;
  assign m_axi_awprot[0] = \<const0> ;
  assign m_axi_awqos[3] = \<const0> ;
  assign m_axi_awqos[2] = \<const0> ;
  assign m_axi_awqos[1] = \<const0> ;
  assign m_axi_awqos[0] = \<const0> ;
  assign m_axi_awregion[3] = \<const0> ;
  assign m_axi_awregion[2] = \<const0> ;
  assign m_axi_awregion[1] = \<const0> ;
  assign m_axi_awregion[0] = \<const0> ;
  assign m_axi_awsize[2] = \<const0> ;
  assign m_axi_awsize[1] = \<const0> ;
  assign m_axi_awsize[0] = \<const0> ;
  assign m_axi_awuser[0] = \<const0> ;
  assign m_axi_awvalid = \<const0> ;
  assign m_axi_bready = \<const0> ;
  assign m_axi_rready = \<const0> ;
  assign m_axi_wdata[63] = \<const0> ;
  assign m_axi_wdata[62] = \<const0> ;
  assign m_axi_wdata[61] = \<const0> ;
  assign m_axi_wdata[60] = \<const0> ;
  assign m_axi_wdata[59] = \<const0> ;
  assign m_axi_wdata[58] = \<const0> ;
  assign m_axi_wdata[57] = \<const0> ;
  assign m_axi_wdata[56] = \<const0> ;
  assign m_axi_wdata[55] = \<const0> ;
  assign m_axi_wdata[54] = \<const0> ;
  assign m_axi_wdata[53] = \<const0> ;
  assign m_axi_wdata[52] = \<const0> ;
  assign m_axi_wdata[51] = \<const0> ;
  assign m_axi_wdata[50] = \<const0> ;
  assign m_axi_wdata[49] = \<const0> ;
  assign m_axi_wdata[48] = \<const0> ;
  assign m_axi_wdata[47] = \<const0> ;
  assign m_axi_wdata[46] = \<const0> ;
  assign m_axi_wdata[45] = \<const0> ;
  assign m_axi_wdata[44] = \<const0> ;
  assign m_axi_wdata[43] = \<const0> ;
  assign m_axi_wdata[42] = \<const0> ;
  assign m_axi_wdata[41] = \<const0> ;
  assign m_axi_wdata[40] = \<const0> ;
  assign m_axi_wdata[39] = \<const0> ;
  assign m_axi_wdata[38] = \<const0> ;
  assign m_axi_wdata[37] = \<const0> ;
  assign m_axi_wdata[36] = \<const0> ;
  assign m_axi_wdata[35] = \<const0> ;
  assign m_axi_wdata[34] = \<const0> ;
  assign m_axi_wdata[33] = \<const0> ;
  assign m_axi_wdata[32] = \<const0> ;
  assign m_axi_wdata[31] = \<const0> ;
  assign m_axi_wdata[30] = \<const0> ;
  assign m_axi_wdata[29] = \<const0> ;
  assign m_axi_wdata[28] = \<const0> ;
  assign m_axi_wdata[27] = \<const0> ;
  assign m_axi_wdata[26] = \<const0> ;
  assign m_axi_wdata[25] = \<const0> ;
  assign m_axi_wdata[24] = \<const0> ;
  assign m_axi_wdata[23] = \<const0> ;
  assign m_axi_wdata[22] = \<const0> ;
  assign m_axi_wdata[21] = \<const0> ;
  assign m_axi_wdata[20] = \<const0> ;
  assign m_axi_wdata[19] = \<const0> ;
  assign m_axi_wdata[18] = \<const0> ;
  assign m_axi_wdata[17] = \<const0> ;
  assign m_axi_wdata[16] = \<const0> ;
  assign m_axi_wdata[15] = \<const0> ;
  assign m_axi_wdata[14] = \<const0> ;
  assign m_axi_wdata[13] = \<const0> ;
  assign m_axi_wdata[12] = \<const0> ;
  assign m_axi_wdata[11] = \<const0> ;
  assign m_axi_wdata[10] = \<const0> ;
  assign m_axi_wdata[9] = \<const0> ;
  assign m_axi_wdata[8] = \<const0> ;
  assign m_axi_wdata[7] = \<const0> ;
  assign m_axi_wdata[6] = \<const0> ;
  assign m_axi_wdata[5] = \<const0> ;
  assign m_axi_wdata[4] = \<const0> ;
  assign m_axi_wdata[3] = \<const0> ;
  assign m_axi_wdata[2] = \<const0> ;
  assign m_axi_wdata[1] = \<const0> ;
  assign m_axi_wdata[0] = \<const0> ;
  assign m_axi_wid[0] = \<const0> ;
  assign m_axi_wlast = \<const0> ;
  assign m_axi_wstrb[7] = \<const0> ;
  assign m_axi_wstrb[6] = \<const0> ;
  assign m_axi_wstrb[5] = \<const0> ;
  assign m_axi_wstrb[4] = \<const0> ;
  assign m_axi_wstrb[3] = \<const0> ;
  assign m_axi_wstrb[2] = \<const0> ;
  assign m_axi_wstrb[1] = \<const0> ;
  assign m_axi_wstrb[0] = \<const0> ;
  assign m_axi_wuser[0] = \<const0> ;
  assign m_axi_wvalid = \<const0> ;
  assign m_axis_tdest[0] = \<const0> ;
  assign m_axis_tid[0] = \<const0> ;
  assign m_axis_tkeep[0] = \<const0> ;
  assign m_axis_tuser[0] = \<const0> ;
  assign overflow = \<const0> ;
  assign prog_empty = \<const1> ;
  assign prog_full = \<const0> ;
  assign rd_data_count[9] = \<const0> ;
  assign rd_data_count[8] = \<const0> ;
  assign rd_data_count[7] = \<const0> ;
  assign rd_data_count[6] = \<const0> ;
  assign rd_data_count[5] = \<const0> ;
  assign rd_data_count[4] = \<const0> ;
  assign rd_data_count[3] = \<const0> ;
  assign rd_data_count[2] = \<const0> ;
  assign rd_data_count[1] = \<const0> ;
  assign rd_data_count[0] = \<const0> ;
  assign rd_rst_busy = \<const0> ;
  assign s_axi_arready = \<const0> ;
  assign s_axi_awready = \<const0> ;
  assign s_axi_bid[0] = \<const0> ;
  assign s_axi_bresp[1] = \<const0> ;
  assign s_axi_bresp[0] = \<const0> ;
  assign s_axi_buser[0] = \<const0> ;
  assign s_axi_bvalid = \<const0> ;
  assign s_axi_rdata[63] = \<const0> ;
  assign s_axi_rdata[62] = \<const0> ;
  assign s_axi_rdata[61] = \<const0> ;
  assign s_axi_rdata[60] = \<const0> ;
  assign s_axi_rdata[59] = \<const0> ;
  assign s_axi_rdata[58] = \<const0> ;
  assign s_axi_rdata[57] = \<const0> ;
  assign s_axi_rdata[56] = \<const0> ;
  assign s_axi_rdata[55] = \<const0> ;
  assign s_axi_rdata[54] = \<const0> ;
  assign s_axi_rdata[53] = \<const0> ;
  assign s_axi_rdata[52] = \<const0> ;
  assign s_axi_rdata[51] = \<const0> ;
  assign s_axi_rdata[50] = \<const0> ;
  assign s_axi_rdata[49] = \<const0> ;
  assign s_axi_rdata[48] = \<const0> ;
  assign s_axi_rdata[47] = \<const0> ;
  assign s_axi_rdata[46] = \<const0> ;
  assign s_axi_rdata[45] = \<const0> ;
  assign s_axi_rdata[44] = \<const0> ;
  assign s_axi_rdata[43] = \<const0> ;
  assign s_axi_rdata[42] = \<const0> ;
  assign s_axi_rdata[41] = \<const0> ;
  assign s_axi_rdata[40] = \<const0> ;
  assign s_axi_rdata[39] = \<const0> ;
  assign s_axi_rdata[38] = \<const0> ;
  assign s_axi_rdata[37] = \<const0> ;
  assign s_axi_rdata[36] = \<const0> ;
  assign s_axi_rdata[35] = \<const0> ;
  assign s_axi_rdata[34] = \<const0> ;
  assign s_axi_rdata[33] = \<const0> ;
  assign s_axi_rdata[32] = \<const0> ;
  assign s_axi_rdata[31] = \<const0> ;
  assign s_axi_rdata[30] = \<const0> ;
  assign s_axi_rdata[29] = \<const0> ;
  assign s_axi_rdata[28] = \<const0> ;
  assign s_axi_rdata[27] = \<const0> ;
  assign s_axi_rdata[26] = \<const0> ;
  assign s_axi_rdata[25] = \<const0> ;
  assign s_axi_rdata[24] = \<const0> ;
  assign s_axi_rdata[23] = \<const0> ;
  assign s_axi_rdata[22] = \<const0> ;
  assign s_axi_rdata[21] = \<const0> ;
  assign s_axi_rdata[20] = \<const0> ;
  assign s_axi_rdata[19] = \<const0> ;
  assign s_axi_rdata[18] = \<const0> ;
  assign s_axi_rdata[17] = \<const0> ;
  assign s_axi_rdata[16] = \<const0> ;
  assign s_axi_rdata[15] = \<const0> ;
  assign s_axi_rdata[14] = \<const0> ;
  assign s_axi_rdata[13] = \<const0> ;
  assign s_axi_rdata[12] = \<const0> ;
  assign s_axi_rdata[11] = \<const0> ;
  assign s_axi_rdata[10] = \<const0> ;
  assign s_axi_rdata[9] = \<const0> ;
  assign s_axi_rdata[8] = \<const0> ;
  assign s_axi_rdata[7] = \<const0> ;
  assign s_axi_rdata[6] = \<const0> ;
  assign s_axi_rdata[5] = \<const0> ;
  assign s_axi_rdata[4] = \<const0> ;
  assign s_axi_rdata[3] = \<const0> ;
  assign s_axi_rdata[2] = \<const0> ;
  assign s_axi_rdata[1] = \<const0> ;
  assign s_axi_rdata[0] = \<const0> ;
  assign s_axi_rid[0] = \<const0> ;
  assign s_axi_rlast = \<const0> ;
  assign s_axi_rresp[1] = \<const0> ;
  assign s_axi_rresp[0] = \<const0> ;
  assign s_axi_ruser[0] = \<const0> ;
  assign s_axi_rvalid = \<const0> ;
  assign s_axi_wready = \<const0> ;
  assign sbiterr = \<const0> ;
  assign underflow = \<const0> ;
  assign valid = \<const0> ;
  assign wr_ack = \<const0> ;
  assign wr_data_count[9] = \<const0> ;
  assign wr_data_count[8] = \<const0> ;
  assign wr_data_count[7] = \<const0> ;
  assign wr_data_count[6] = \<const0> ;
  assign wr_data_count[5] = \<const0> ;
  assign wr_data_count[4] = \<const0> ;
  assign wr_data_count[3] = \<const0> ;
  assign wr_data_count[2] = \<const0> ;
  assign wr_data_count[1] = \<const0> ;
  assign wr_data_count[0] = \<const0> ;
  assign wr_rst_busy = \<const0> ;
GND GND
       (.G(\<const0> ));
VCC VCC
       (.P(\<const1> ));
fifo_generator_0fifo_generator_v12_0_synth inst_fifo_gen
       (.DIADI({s_axis_tdata,s_axis_tstrb,s_axis_tlast}),
        .Q({m_axis_tdata,m_axis_tstrb,m_axis_tlast}),
        .axis_data_count(axis_data_count),
        .m_axis_tready(m_axis_tready),
        .m_axis_tvalid(m_axis_tvalid),
        .s_aclk(s_aclk),
        .s_aresetn(s_aresetn),
        .s_axis_tready(s_axis_tready),
        .s_axis_tvalid(s_axis_tvalid));
endmodule

(* ORIG_REF_NAME = "fifo_generator_v12_0_synth" *) 
module fifo_generator_0fifo_generator_v12_0_synth
   (axis_data_count,
    Q,
    m_axis_tvalid,
    s_axis_tready,
    m_axis_tready,
    s_axis_tvalid,
    s_aclk,
    DIADI,
    s_aresetn);
  output [10:0]axis_data_count;
  output [9:0]Q;
  output m_axis_tvalid;
  output s_axis_tready;
  input m_axis_tready;
  input s_axis_tvalid;
  input s_aclk;
  input [9:0]DIADI;
  input s_aresetn;

  wire [9:0]DIADI;
  wire [9:0]Q;
  wire [10:0]axis_data_count;
  wire axis_wr_eop;
  wire axis_wr_eop_d1;
  wire clear;
  wire [10:0]\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 ;
  wire m_axis_tready;
  wire m_axis_tvalid;
  wire \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[10]_i_3 ;
  wire \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[10]_i_4 ;
  wire \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[10]_i_5 ;
  wire \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[3]_i_4 ;
  wire \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[3]_i_7 ;
  wire \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[7]_i_2 ;
  wire \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[7]_i_3 ;
  wire \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[7]_i_4 ;
  wire \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[7]_i_5 ;
  wire \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_10 ;
  wire \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_11 ;
  wire \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_3 ;
  wire \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_5 ;
  wire \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_8 ;
  wire \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_9 ;
  wire \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg ;
  wire \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_6 ;
  wire \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_7 ;
  wire \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[10]_i_4 ;
  wire \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[10]_i_5 ;
  wire \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[10]_i_6 ;
  wire \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[3]_i_4 ;
  wire \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[3]_i_7 ;
  wire \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[7]_i_2 ;
  wire \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[7]_i_3 ;
  wire \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[7]_i_4 ;
  wire \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[7]_i_5 ;
  wire \n_12_gaxis_fifo.gaxisf.axisf ;
  wire \n_13_gaxis_fifo.gaxisf.axisf ;
  wire \n_14_gaxis_fifo.gaxisf.axisf ;
  wire \n_15_gaxis_fifo.gaxisf.axisf ;
  wire \n_16_gaxis_fifo.gaxisf.axisf ;
  wire \n_17_gaxis_fifo.gaxisf.axisf ;
  wire \n_18_gaxis_fifo.gaxisf.axisf ;
  wire \n_19_gaxis_fifo.gaxisf.axisf ;
  wire \n_1_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_6 ;
  wire \n_1_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_7 ;
  wire \n_20_gaxis_fifo.gaxisf.axisf ;
  wire \n_21_gaxis_fifo.gaxisf.axisf ;
  wire \n_22_gaxis_fifo.gaxisf.axisf ;
  wire \n_23_gaxis_fifo.gaxisf.axisf ;
  wire \n_24_gaxis_fifo.gaxisf.axisf ;
  wire \n_25_gaxis_fifo.gaxisf.axisf ;
  wire \n_26_gaxis_fifo.gaxisf.axisf ;
  wire \n_27_gaxis_fifo.gaxisf.axisf ;
  wire \n_28_gaxis_fifo.gaxisf.axisf ;
  wire \n_29_gaxis_fifo.gaxisf.axisf ;
  wire \n_2_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_4 ;
  wire \n_2_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_6 ;
  wire \n_2_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_7 ;
  wire \n_30_gaxis_fifo.gaxisf.axisf ;
  wire \n_31_gaxis_fifo.gaxisf.axisf ;
  wire \n_32_gaxis_fifo.gaxisf.axisf ;
  wire \n_33_gaxis_fifo.gaxisf.axisf ;
  wire \n_34_gaxis_fifo.gaxisf.axisf ;
  wire \n_36_gaxis_fifo.gaxisf.axisf ;
  wire \n_38_gaxis_fifo.gaxisf.axisf ;
  wire \n_3_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_4 ;
  wire \n_3_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_6 ;
  wire \n_3_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_7 ;
  wire p_13_in;
  wire s_aclk;
  wire s_aresetn;
  wire s_axis_tready;
  wire s_axis_tvalid;
  wire [3:3]\NLW_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_4_CO_UNCONNECTED ;
  wire [3:0]\NLW_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_4_O_UNCONNECTED ;
  wire [3:0]\NLW_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_6_O_UNCONNECTED ;
  wire [3:0]\NLW_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_7_O_UNCONNECTED ;

fifo_generator_0fifo_generator_top \gaxis_fifo.gaxisf.axisf 
       (.AR(clear),
        .CO(p_13_in),
        .D({\n_12_gaxis_fifo.gaxisf.axisf ,\n_13_gaxis_fifo.gaxisf.axisf ,\n_14_gaxis_fifo.gaxisf.axisf ,\n_15_gaxis_fifo.gaxisf.axisf ,\n_16_gaxis_fifo.gaxisf.axisf ,\n_17_gaxis_fifo.gaxisf.axisf ,\n_18_gaxis_fifo.gaxisf.axisf ,\n_19_gaxis_fifo.gaxisf.axisf ,\n_20_gaxis_fifo.gaxisf.axisf ,\n_21_gaxis_fifo.gaxisf.axisf ,\n_22_gaxis_fifo.gaxisf.axisf }),
        .DIADI(DIADI),
        .E(\n_34_gaxis_fifo.gaxisf.axisf ),
        .I1(\n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg ),
        .I2(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [8:0]),
        .I3({\n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[7]_i_2 ,\n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[7]_i_3 ,\n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[7]_i_4 ,\n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[7]_i_5 }),
        .I4({\n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[10]_i_3 ,\n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[10]_i_4 ,\n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[10]_i_5 }),
        .I5({\n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[3]_i_4 ,\n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[3]_i_7 }),
        .I6({\n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[7]_i_2 ,\n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[7]_i_3 ,\n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[7]_i_4 ,\n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[7]_i_5 }),
        .I7({\n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[10]_i_4 ,\n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[10]_i_5 ,\n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[10]_i_6 }),
        .I8(\n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_3 ),
        .O1(Q),
        .O2({\n_23_gaxis_fifo.gaxisf.axisf ,\n_24_gaxis_fifo.gaxisf.axisf ,\n_25_gaxis_fifo.gaxisf.axisf ,\n_26_gaxis_fifo.gaxisf.axisf ,\n_27_gaxis_fifo.gaxisf.axisf ,\n_28_gaxis_fifo.gaxisf.axisf ,\n_29_gaxis_fifo.gaxisf.axisf ,\n_30_gaxis_fifo.gaxisf.axisf ,\n_31_gaxis_fifo.gaxisf.axisf ,\n_32_gaxis_fifo.gaxisf.axisf ,\n_33_gaxis_fifo.gaxisf.axisf }),
        .O3(\n_36_gaxis_fifo.gaxisf.axisf ),
        .O4(\n_38_gaxis_fifo.gaxisf.axisf ),
        .Q(axis_data_count[8:0]),
        .S({\n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[3]_i_4 ,\n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[3]_i_7 }),
        .axis_wr_eop(axis_wr_eop),
        .axis_wr_eop_d1(axis_wr_eop_d1),
        .m_axis_tready(m_axis_tready),
        .m_axis_tvalid(m_axis_tvalid),
        .s_aclk(s_aclk),
        .s_aresetn(s_aresetn),
        .s_axis_tready(s_axis_tready),
        .s_axis_tvalid(s_axis_tvalid));
LUT2 #(
    .INIT(4'h9)) 
     \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[10]_i_3 
       (.I0(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [9]),
        .I1(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [10]),
        .O(\n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[10]_i_3 ));
LUT2 #(
    .INIT(4'h9)) 
     \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[10]_i_4 
       (.I0(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [8]),
        .I1(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [9]),
        .O(\n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[10]_i_4 ));
LUT2 #(
    .INIT(4'h9)) 
     \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[10]_i_5 
       (.I0(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [7]),
        .I1(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [8]),
        .O(\n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[10]_i_5 ));
LUT2 #(
    .INIT(4'h9)) 
     \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[3]_i_4 
       (.I0(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [2]),
        .I1(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [3]),
        .O(\n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[3]_i_4 ));
LUT1 #(
    .INIT(2'h1)) 
     \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[3]_i_7 
       (.I0(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [0]),
        .O(\n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[3]_i_7 ));
LUT2 #(
    .INIT(4'h9)) 
     \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[7]_i_2 
       (.I0(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [6]),
        .I1(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [7]),
        .O(\n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[7]_i_2 ));
LUT2 #(
    .INIT(4'h9)) 
     \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[7]_i_3 
       (.I0(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [5]),
        .I1(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [6]),
        .O(\n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[7]_i_3 ));
LUT2 #(
    .INIT(4'h9)) 
     \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[7]_i_4 
       (.I0(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [4]),
        .I1(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [5]),
        .O(\n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[7]_i_4 ));
LUT2 #(
    .INIT(4'h9)) 
     \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[7]_i_5 
       (.I0(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [3]),
        .I1(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [4]),
        .O(\n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[7]_i_5 ));
(* counter = "5" *) 
   FDCE #(
    .INIT(1'b0)) 
     \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[0] 
       (.C(s_aclk),
        .CE(\n_36_gaxis_fifo.gaxisf.axisf ),
        .CLR(clear),
        .D(\n_22_gaxis_fifo.gaxisf.axisf ),
        .Q(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [0]));
(* counter = "5" *) 
   FDCE #(
    .INIT(1'b0)) 
     \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[10] 
       (.C(s_aclk),
        .CE(\n_36_gaxis_fifo.gaxisf.axisf ),
        .CLR(clear),
        .D(\n_12_gaxis_fifo.gaxisf.axisf ),
        .Q(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [10]));
(* counter = "5" *) 
   FDCE #(
    .INIT(1'b0)) 
     \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[1] 
       (.C(s_aclk),
        .CE(\n_36_gaxis_fifo.gaxisf.axisf ),
        .CLR(clear),
        .D(\n_21_gaxis_fifo.gaxisf.axisf ),
        .Q(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [1]));
(* counter = "5" *) 
   FDCE #(
    .INIT(1'b0)) 
     \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[2] 
       (.C(s_aclk),
        .CE(\n_36_gaxis_fifo.gaxisf.axisf ),
        .CLR(clear),
        .D(\n_20_gaxis_fifo.gaxisf.axisf ),
        .Q(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [2]));
(* counter = "5" *) 
   FDCE #(
    .INIT(1'b0)) 
     \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[3] 
       (.C(s_aclk),
        .CE(\n_36_gaxis_fifo.gaxisf.axisf ),
        .CLR(clear),
        .D(\n_19_gaxis_fifo.gaxisf.axisf ),
        .Q(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [3]));
(* counter = "5" *) 
   FDCE #(
    .INIT(1'b0)) 
     \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[4] 
       (.C(s_aclk),
        .CE(\n_36_gaxis_fifo.gaxisf.axisf ),
        .CLR(clear),
        .D(\n_18_gaxis_fifo.gaxisf.axisf ),
        .Q(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [4]));
(* counter = "5" *) 
   FDCE #(
    .INIT(1'b0)) 
     \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[5] 
       (.C(s_aclk),
        .CE(\n_36_gaxis_fifo.gaxisf.axisf ),
        .CLR(clear),
        .D(\n_17_gaxis_fifo.gaxisf.axisf ),
        .Q(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [5]));
(* counter = "5" *) 
   FDCE #(
    .INIT(1'b0)) 
     \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[6] 
       (.C(s_aclk),
        .CE(\n_36_gaxis_fifo.gaxisf.axisf ),
        .CLR(clear),
        .D(\n_16_gaxis_fifo.gaxisf.axisf ),
        .Q(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [6]));
(* counter = "5" *) 
   FDCE #(
    .INIT(1'b0)) 
     \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[7] 
       (.C(s_aclk),
        .CE(\n_36_gaxis_fifo.gaxisf.axisf ),
        .CLR(clear),
        .D(\n_15_gaxis_fifo.gaxisf.axisf ),
        .Q(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [7]));
(* counter = "5" *) 
   FDCE #(
    .INIT(1'b0)) 
     \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[8] 
       (.C(s_aclk),
        .CE(\n_36_gaxis_fifo.gaxisf.axisf ),
        .CLR(clear),
        .D(\n_14_gaxis_fifo.gaxisf.axisf ),
        .Q(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [8]));
(* counter = "5" *) 
   FDCE #(
    .INIT(1'b0)) 
     \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[9] 
       (.C(s_aclk),
        .CE(\n_36_gaxis_fifo.gaxisf.axisf ),
        .CLR(clear),
        .D(\n_13_gaxis_fifo.gaxisf.axisf ),
        .Q(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [9]));
LUT3 #(
    .INIT(8'h01)) 
     \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_10 
       (.I0(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [5]),
        .I1(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [4]),
        .I2(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [3]),
        .O(\n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_10 ));
LUT3 #(
    .INIT(8'h02)) 
     \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_11 
       (.I0(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [0]),
        .I1(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [2]),
        .I2(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [1]),
        .O(\n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_11 ));
LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
     \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_3 
       (.I0(\n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_5 ),
        .I1(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [6]),
        .I2(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [7]),
        .I3(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [8]),
        .I4(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [9]),
        .I5(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [10]),
        .O(\n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_3 ));
LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
     \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_5 
       (.I0(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [1]),
        .I1(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [2]),
        .I2(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [0]),
        .I3(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [5]),
        .I4(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [3]),
        .I5(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [4]),
        .O(\n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_5 ));
LUT2 #(
    .INIT(4'h1)) 
     \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_8 
       (.I0(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [9]),
        .I1(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [10]),
        .O(\n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_8 ));
LUT3 #(
    .INIT(8'h01)) 
     \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_9 
       (.I0(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [8]),
        .I1(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [7]),
        .I2(\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg__0 [6]),
        .O(\n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_9 ));
FDCE #(
    .INIT(1'b0)) 
     \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg 
       (.C(s_aclk),
        .CE(1'b1),
        .CLR(clear),
        .D(\n_38_gaxis_fifo.gaxisf.axisf ),
        .Q(\n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg ));
CARRY4 \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_4 
       (.CI(\n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_6 ),
        .CO({\NLW_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_4_CO_UNCONNECTED [3],p_13_in,\n_2_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_4 ,\n_3_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_4 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_4_O_UNCONNECTED [3:0]),
        .S({1'b0,1'b1,1'b1,1'b1}));
CARRY4 \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_6 
       (.CI(\n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_7 ),
        .CO({\n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_6 ,\n_1_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_6 ,\n_2_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_6 ,\n_3_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_6 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_6_O_UNCONNECTED [3:0]),
        .S({1'b1,1'b1,1'b1,1'b1}));
CARRY4 \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_7 
       (.CI(1'b0),
        .CO({\n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_7 ,\n_1_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_7 ,\n_2_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_7 ,\n_3_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_7 }),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_7_O_UNCONNECTED [3:0]),
        .S({\n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_8 ,\n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_9 ,\n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_10 ,\n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_11 }));
FDCE #(
    .INIT(1'b0)) 
     \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_wr_eop_d1_reg 
       (.C(s_aclk),
        .CE(1'b1),
        .CLR(clear),
        .D(axis_wr_eop),
        .Q(axis_wr_eop_d1));
LUT2 #(
    .INIT(4'h9)) 
     \gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[10]_i_4 
       (.I0(axis_data_count[9]),
        .I1(axis_data_count[10]),
        .O(\n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[10]_i_4 ));
LUT2 #(
    .INIT(4'h9)) 
     \gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[10]_i_5 
       (.I0(axis_data_count[8]),
        .I1(axis_data_count[9]),
        .O(\n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[10]_i_5 ));
LUT2 #(
    .INIT(4'h9)) 
     \gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[10]_i_6 
       (.I0(axis_data_count[7]),
        .I1(axis_data_count[8]),
        .O(\n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[10]_i_6 ));
LUT2 #(
    .INIT(4'h9)) 
     \gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[3]_i_4 
       (.I0(axis_data_count[2]),
        .I1(axis_data_count[3]),
        .O(\n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[3]_i_4 ));
LUT1 #(
    .INIT(2'h1)) 
     \gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[3]_i_7 
       (.I0(axis_data_count[0]),
        .O(\n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[3]_i_7 ));
LUT2 #(
    .INIT(4'h9)) 
     \gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[7]_i_2 
       (.I0(axis_data_count[6]),
        .I1(axis_data_count[7]),
        .O(\n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[7]_i_2 ));
LUT2 #(
    .INIT(4'h9)) 
     \gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[7]_i_3 
       (.I0(axis_data_count[5]),
        .I1(axis_data_count[6]),
        .O(\n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[7]_i_3 ));
LUT2 #(
    .INIT(4'h9)) 
     \gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[7]_i_4 
       (.I0(axis_data_count[4]),
        .I1(axis_data_count[5]),
        .O(\n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[7]_i_4 ));
LUT2 #(
    .INIT(4'h9)) 
     \gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[7]_i_5 
       (.I0(axis_data_count[3]),
        .I1(axis_data_count[4]),
        .O(\n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[7]_i_5 ));
(* counter = "6" *) 
   FDCE #(
    .INIT(1'b0)) 
     \gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[0] 
       (.C(s_aclk),
        .CE(\n_34_gaxis_fifo.gaxisf.axisf ),
        .CLR(clear),
        .D(\n_33_gaxis_fifo.gaxisf.axisf ),
        .Q(axis_data_count[0]));
(* counter = "6" *) 
   FDCE #(
    .INIT(1'b0)) 
     \gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[10] 
       (.C(s_aclk),
        .CE(\n_34_gaxis_fifo.gaxisf.axisf ),
        .CLR(clear),
        .D(\n_23_gaxis_fifo.gaxisf.axisf ),
        .Q(axis_data_count[10]));
(* counter = "6" *) 
   FDCE #(
    .INIT(1'b0)) 
     \gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[1] 
       (.C(s_aclk),
        .CE(\n_34_gaxis_fifo.gaxisf.axisf ),
        .CLR(clear),
        .D(\n_32_gaxis_fifo.gaxisf.axisf ),
        .Q(axis_data_count[1]));
(* counter = "6" *) 
   FDCE #(
    .INIT(1'b0)) 
     \gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[2] 
       (.C(s_aclk),
        .CE(\n_34_gaxis_fifo.gaxisf.axisf ),
        .CLR(clear),
        .D(\n_31_gaxis_fifo.gaxisf.axisf ),
        .Q(axis_data_count[2]));
(* counter = "6" *) 
   FDCE #(
    .INIT(1'b0)) 
     \gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[3] 
       (.C(s_aclk),
        .CE(\n_34_gaxis_fifo.gaxisf.axisf ),
        .CLR(clear),
        .D(\n_30_gaxis_fifo.gaxisf.axisf ),
        .Q(axis_data_count[3]));
(* counter = "6" *) 
   FDCE #(
    .INIT(1'b0)) 
     \gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[4] 
       (.C(s_aclk),
        .CE(\n_34_gaxis_fifo.gaxisf.axisf ),
        .CLR(clear),
        .D(\n_29_gaxis_fifo.gaxisf.axisf ),
        .Q(axis_data_count[4]));
(* counter = "6" *) 
   FDCE #(
    .INIT(1'b0)) 
     \gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[5] 
       (.C(s_aclk),
        .CE(\n_34_gaxis_fifo.gaxisf.axisf ),
        .CLR(clear),
        .D(\n_28_gaxis_fifo.gaxisf.axisf ),
        .Q(axis_data_count[5]));
(* counter = "6" *) 
   FDCE #(
    .INIT(1'b0)) 
     \gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[6] 
       (.C(s_aclk),
        .CE(\n_34_gaxis_fifo.gaxisf.axisf ),
        .CLR(clear),
        .D(\n_27_gaxis_fifo.gaxisf.axisf ),
        .Q(axis_data_count[6]));
(* counter = "6" *) 
   FDCE #(
    .INIT(1'b0)) 
     \gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[7] 
       (.C(s_aclk),
        .CE(\n_34_gaxis_fifo.gaxisf.axisf ),
        .CLR(clear),
        .D(\n_26_gaxis_fifo.gaxisf.axisf ),
        .Q(axis_data_count[7]));
(* counter = "6" *) 
   FDCE #(
    .INIT(1'b0)) 
     \gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[8] 
       (.C(s_aclk),
        .CE(\n_34_gaxis_fifo.gaxisf.axisf ),
        .CLR(clear),
        .D(\n_25_gaxis_fifo.gaxisf.axisf ),
        .Q(axis_data_count[8]));
(* counter = "6" *) 
   FDCE #(
    .INIT(1'b0)) 
     \gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[9] 
       (.C(s_aclk),
        .CE(\n_34_gaxis_fifo.gaxisf.axisf ),
        .CLR(clear),
        .D(\n_24_gaxis_fifo.gaxisf.axisf ),
        .Q(axis_data_count[9]));
endmodule

(* ORIG_REF_NAME = "memory" *) 
module fifo_generator_0memory
   (I6,
    Q,
    DI,
    O1,
    O2,
    s_aclk,
    WEA,
    I1,
    O5,
    O4,
    DIADI,
    I2,
    m_axis_tready,
    p_8_out,
    axis_wr_eop_d1,
    I3,
    CO,
    axis_almost_full,
    I8,
    E);
  output [0:0]I6;
  output [9:0]Q;
  output [0:0]DI;
  output [0:0]O1;
  output O2;
  input s_aclk;
  input [0:0]WEA;
  input I1;
  input [9:0]O5;
  input [9:0]O4;
  input [9:0]DIADI;
  input I2;
  input m_axis_tready;
  input p_8_out;
  input axis_wr_eop_d1;
  input [0:0]I3;
  input [0:0]CO;
  input axis_almost_full;
  input I8;
  input [0:0]E;

  wire [0:0]CO;
  wire [0:0]DI;
  wire [9:0]DIADI;
  wire [0:0]E;
  wire I1;
  wire I2;
  wire [0:0]I3;
  wire [0:0]I6;
  wire I8;
  wire [0:0]O1;
  wire O2;
  wire [9:0]O4;
  wire [9:0]O5;
  wire [9:0]Q;
  wire [0:0]WEA;
  wire axis_almost_full;
  wire axis_wr_eop_d1;
  wire [9:0]doutb;
  wire m_axis_tready;
  wire p_14_out;
  wire p_8_out;
  wire s_aclk;

LUT5 #(
    .INIT(32'hAAAA6AAA)) 
     \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[10]_i_1 
       (.I0(axis_wr_eop_d1),
        .I1(I2),
        .I2(m_axis_tready),
        .I3(Q[0]),
        .I4(p_8_out),
        .O(O1));
LUT5 #(
    .INIT(32'h5555D555)) 
     \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[3]_i_3 
       (.I0(axis_wr_eop_d1),
        .I1(Q[0]),
        .I2(m_axis_tready),
        .I3(I2),
        .I4(p_8_out),
        .O(DI));
LUT6 #(
    .INIT(64'hFF7F00000080FFFF)) 
     \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[3]_i_6 
       (.I0(I2),
        .I1(m_axis_tready),
        .I2(Q[0]),
        .I3(p_8_out),
        .I4(axis_wr_eop_d1),
        .I5(I3),
        .O(I6));
LUT5 #(
    .INIT(32'h55555504)) 
     \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_1 
       (.I0(p_14_out),
        .I1(axis_almost_full),
        .I2(p_8_out),
        .I3(I8),
        .I4(I2),
        .O(O2));
LUT6 #(
    .INIT(64'h0000400000000000)) 
     \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_2 
       (.I0(axis_wr_eop_d1),
        .I1(I2),
        .I2(m_axis_tready),
        .I3(Q[0]),
        .I4(p_8_out),
        .I5(CO),
        .O(p_14_out));
fifo_generator_0blk_mem_gen_v8_2__parameterized0 \gbm.gbmg.gbmga.ngecc.bmg 
       (.D(doutb),
        .DIADI(DIADI),
        .I1(I1),
        .O4(O4),
        .O5(O5),
        .WEA(WEA),
        .s_aclk(s_aclk));
FDRE #(
    .INIT(1'b0)) 
     \goreg_bm.dout_i_reg[0] 
       (.C(s_aclk),
        .CE(E),
        .D(doutb[0]),
        .Q(Q[0]),
        .R(1'b0));
FDRE #(
    .INIT(1'b0)) 
     \goreg_bm.dout_i_reg[1] 
       (.C(s_aclk),
        .CE(E),
        .D(doutb[1]),
        .Q(Q[1]),
        .R(1'b0));
FDRE #(
    .INIT(1'b0)) 
     \goreg_bm.dout_i_reg[2] 
       (.C(s_aclk),
        .CE(E),
        .D(doutb[2]),
        .Q(Q[2]),
        .R(1'b0));
FDRE #(
    .INIT(1'b0)) 
     \goreg_bm.dout_i_reg[3] 
       (.C(s_aclk),
        .CE(E),
        .D(doutb[3]),
        .Q(Q[3]),
        .R(1'b0));
FDRE #(
    .INIT(1'b0)) 
     \goreg_bm.dout_i_reg[4] 
       (.C(s_aclk),
        .CE(E),
        .D(doutb[4]),
        .Q(Q[4]),
        .R(1'b0));
FDRE #(
    .INIT(1'b0)) 
     \goreg_bm.dout_i_reg[5] 
       (.C(s_aclk),
        .CE(E),
        .D(doutb[5]),
        .Q(Q[5]),
        .R(1'b0));
FDRE #(
    .INIT(1'b0)) 
     \goreg_bm.dout_i_reg[6] 
       (.C(s_aclk),
        .CE(E),
        .D(doutb[6]),
        .Q(Q[6]),
        .R(1'b0));
FDRE #(
    .INIT(1'b0)) 
     \goreg_bm.dout_i_reg[7] 
       (.C(s_aclk),
        .CE(E),
        .D(doutb[7]),
        .Q(Q[7]),
        .R(1'b0));
FDRE #(
    .INIT(1'b0)) 
     \goreg_bm.dout_i_reg[8] 
       (.C(s_aclk),
        .CE(E),
        .D(doutb[8]),
        .Q(Q[8]),
        .R(1'b0));
FDRE #(
    .INIT(1'b0)) 
     \goreg_bm.dout_i_reg[9] 
       (.C(s_aclk),
        .CE(E),
        .D(doutb[9]),
        .Q(Q[9]),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "rd_bin_cntr" *) 
module fifo_generator_0rd_bin_cntr
   (Q,
    O4,
    E,
    s_aclk,
    I1);
  output [9:0]Q;
  output [9:0]O4;
  input [0:0]E;
  input s_aclk;
  input [0:0]I1;

  wire [0:0]E;
  wire [0:0]I1;
  wire [9:0]O4;
  wire [9:0]Q;
  wire \n_0_gc0.count[9]_i_2 ;
  wire [9:0]plusOp;
  wire s_aclk;

LUT1 #(
    .INIT(2'h1)) 
     \gc0.count[0]_i_1 
       (.I0(Q[0]),
        .O(plusOp[0]));
(* SOFT_HLUTNM = "soft_lutpair4" *) 
   LUT2 #(
    .INIT(4'h6)) 
     \gc0.count[1]_i_1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .O(plusOp[1]));
(* SOFT_HLUTNM = "soft_lutpair4" *) 
   LUT3 #(
    .INIT(8'h78)) 
     \gc0.count[2]_i_1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(Q[2]),
        .O(plusOp[2]));
(* SOFT_HLUTNM = "soft_lutpair1" *) 
   LUT4 #(
    .INIT(16'h7F80)) 
     \gc0.count[3]_i_1 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(Q[2]),
        .I3(Q[3]),
        .O(plusOp[3]));
(* SOFT_HLUTNM = "soft_lutpair1" *) 
   LUT5 #(
    .INIT(32'h7FFF8000)) 
     \gc0.count[4]_i_1 
       (.I0(Q[2]),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(Q[3]),
        .I4(Q[4]),
        .O(plusOp[4]));
LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
     \gc0.count[5]_i_1 
       (.I0(Q[3]),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(Q[2]),
        .I4(Q[4]),
        .I5(Q[5]),
        .O(plusOp[5]));
(* SOFT_HLUTNM = "soft_lutpair3" *) 
   LUT2 #(
    .INIT(4'h6)) 
     \gc0.count[6]_i_1 
       (.I0(\n_0_gc0.count[9]_i_2 ),
        .I1(Q[6]),
        .O(plusOp[6]));
(* SOFT_HLUTNM = "soft_lutpair3" *) 
   LUT3 #(
    .INIT(8'h78)) 
     \gc0.count[7]_i_1 
       (.I0(\n_0_gc0.count[9]_i_2 ),
        .I1(Q[6]),
        .I2(Q[7]),
        .O(plusOp[7]));
(* SOFT_HLUTNM = "soft_lutpair2" *) 
   LUT4 #(
    .INIT(16'h7F80)) 
     \gc0.count[8]_i_1 
       (.I0(Q[6]),
        .I1(\n_0_gc0.count[9]_i_2 ),
        .I2(Q[7]),
        .I3(Q[8]),
        .O(plusOp[8]));
(* SOFT_HLUTNM = "soft_lutpair2" *) 
   LUT5 #(
    .INIT(32'h7FFF8000)) 
     \gc0.count[9]_i_1 
       (.I0(Q[7]),
        .I1(\n_0_gc0.count[9]_i_2 ),
        .I2(Q[6]),
        .I3(Q[8]),
        .I4(Q[9]),
        .O(plusOp[9]));
LUT6 #(
    .INIT(64'h8000000000000000)) 
     \gc0.count[9]_i_2 
       (.I0(Q[5]),
        .I1(Q[3]),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(Q[2]),
        .I5(Q[4]),
        .O(\n_0_gc0.count[9]_i_2 ));
FDCE #(
    .INIT(1'b0)) 
     \gc0.count_d1_reg[0] 
       (.C(s_aclk),
        .CE(E),
        .CLR(I1),
        .D(Q[0]),
        .Q(O4[0]));
FDCE #(
    .INIT(1'b0)) 
     \gc0.count_d1_reg[1] 
       (.C(s_aclk),
        .CE(E),
        .CLR(I1),
        .D(Q[1]),
        .Q(O4[1]));
FDCE #(
    .INIT(1'b0)) 
     \gc0.count_d1_reg[2] 
       (.C(s_aclk),
        .CE(E),
        .CLR(I1),
        .D(Q[2]),
        .Q(O4[2]));
FDCE #(
    .INIT(1'b0)) 
     \gc0.count_d1_reg[3] 
       (.C(s_aclk),
        .CE(E),
        .CLR(I1),
        .D(Q[3]),
        .Q(O4[3]));
FDCE #(
    .INIT(1'b0)) 
     \gc0.count_d1_reg[4] 
       (.C(s_aclk),
        .CE(E),
        .CLR(I1),
        .D(Q[4]),
        .Q(O4[4]));
FDCE #(
    .INIT(1'b0)) 
     \gc0.count_d1_reg[5] 
       (.C(s_aclk),
        .CE(E),
        .CLR(I1),
        .D(Q[5]),
        .Q(O4[5]));
FDCE #(
    .INIT(1'b0)) 
     \gc0.count_d1_reg[6] 
       (.C(s_aclk),
        .CE(E),
        .CLR(I1),
        .D(Q[6]),
        .Q(O4[6]));
FDCE #(
    .INIT(1'b0)) 
     \gc0.count_d1_reg[7] 
       (.C(s_aclk),
        .CE(E),
        .CLR(I1),
        .D(Q[7]),
        .Q(O4[7]));
FDCE #(
    .INIT(1'b0)) 
     \gc0.count_d1_reg[8] 
       (.C(s_aclk),
        .CE(E),
        .CLR(I1),
        .D(Q[8]),
        .Q(O4[8]));
FDCE #(
    .INIT(1'b0)) 
     \gc0.count_d1_reg[9] 
       (.C(s_aclk),
        .CE(E),
        .CLR(I1),
        .D(Q[9]),
        .Q(O4[9]));
(* counter = "7" *) 
   FDPE #(
    .INIT(1'b1)) 
     \gc0.count_reg[0] 
       (.C(s_aclk),
        .CE(E),
        .D(plusOp[0]),
        .PRE(I1),
        .Q(Q[0]));
(* counter = "7" *) 
   FDCE #(
    .INIT(1'b0)) 
     \gc0.count_reg[1] 
       (.C(s_aclk),
        .CE(E),
        .CLR(I1),
        .D(plusOp[1]),
        .Q(Q[1]));
(* counter = "7" *) 
   FDCE #(
    .INIT(1'b0)) 
     \gc0.count_reg[2] 
       (.C(s_aclk),
        .CE(E),
        .CLR(I1),
        .D(plusOp[2]),
        .Q(Q[2]));
(* counter = "7" *) 
   FDCE #(
    .INIT(1'b0)) 
     \gc0.count_reg[3] 
       (.C(s_aclk),
        .CE(E),
        .CLR(I1),
        .D(plusOp[3]),
        .Q(Q[3]));
(* counter = "7" *) 
   FDCE #(
    .INIT(1'b0)) 
     \gc0.count_reg[4] 
       (.C(s_aclk),
        .CE(E),
        .CLR(I1),
        .D(plusOp[4]),
        .Q(Q[4]));
(* counter = "7" *) 
   FDCE #(
    .INIT(1'b0)) 
     \gc0.count_reg[5] 
       (.C(s_aclk),
        .CE(E),
        .CLR(I1),
        .D(plusOp[5]),
        .Q(Q[5]));
(* counter = "7" *) 
   FDCE #(
    .INIT(1'b0)) 
     \gc0.count_reg[6] 
       (.C(s_aclk),
        .CE(E),
        .CLR(I1),
        .D(plusOp[6]),
        .Q(Q[6]));
(* counter = "7" *) 
   FDCE #(
    .INIT(1'b0)) 
     \gc0.count_reg[7] 
       (.C(s_aclk),
        .CE(E),
        .CLR(I1),
        .D(plusOp[7]),
        .Q(Q[7]));
(* counter = "7" *) 
   FDCE #(
    .INIT(1'b0)) 
     \gc0.count_reg[8] 
       (.C(s_aclk),
        .CE(E),
        .CLR(I1),
        .D(plusOp[8]),
        .Q(Q[8]));
(* counter = "7" *) 
   FDCE #(
    .INIT(1'b0)) 
     \gc0.count_reg[9] 
       (.C(s_aclk),
        .CE(E),
        .CLR(I1),
        .D(plusOp[9]),
        .Q(Q[9]));
endmodule

(* ORIG_REF_NAME = "rd_fwft" *) 
module fifo_generator_0rd_fwft
   (O1,
    O2,
    E,
    S,
    m_axis_tvalid,
    D,
    O3,
    O4,
    s_aclk,
    Q,
    I2,
    m_axis_tready,
    I1,
    s_axis_tvalid,
    ram_full_i,
    I3,
    I4,
    axis_wr_eop_d1,
    I5,
    DI,
    I6,
    I7,
    I8);
  output O1;
  output O2;
  output [0:0]E;
  output [0:0]S;
  output m_axis_tvalid;
  output [10:0]D;
  output [0:0]O3;
  output [0:0]O4;
  input s_aclk;
  input [1:0]Q;
  input I2;
  input m_axis_tready;
  input I1;
  input s_axis_tvalid;
  input ram_full_i;
  input [0:0]I3;
  input [0:0]I4;
  input axis_wr_eop_d1;
  input [7:0]I5;
  input [0:0]DI;
  input [2:0]I6;
  input [3:0]I7;
  input [2:0]I8;

  wire [10:0]D;
  wire [0:0]DI;
  wire [0:0]E;
  wire I1;
  wire I2;
  wire [0:0]I3;
  wire [0:0]I4;
  wire [7:0]I5;
  wire [2:0]I6;
  wire [3:0]I7;
  wire [2:0]I8;
  wire O1;
  wire O2;
  wire [0:0]O3;
  wire [0:0]O4;
  wire [1:0]Q;
  wire [0:0]S;
  wire axis_wr_eop_d1;
  wire [0:0]curr_fwft_state;
  wire empty_fwft_fb;
  wire empty_fwft_i0;
  wire m_axis_tready;
  wire m_axis_tvalid;
  wire \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[3]_i_2 ;
  wire \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[3]_i_5 ;
  wire \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[3]_i_1 ;
  wire \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[7]_i_1 ;
  wire \n_0_gpregsm1.curr_fwft_state_reg[1] ;
  wire \n_1_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[3]_i_1 ;
  wire \n_1_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[7]_i_1 ;
  wire \n_2_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[10]_i_2 ;
  wire \n_2_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[3]_i_1 ;
  wire \n_2_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[7]_i_1 ;
  wire \n_3_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[10]_i_2 ;
  wire \n_3_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[3]_i_1 ;
  wire \n_3_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[7]_i_1 ;
  wire [1:0]next_fwft_state;
  wire ram_full_i;
  wire s_aclk;
  wire s_axis_tvalid;
  wire [3:2]\NLW_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[10]_i_2_CO_UNCONNECTED ;
  wire [3:3]\NLW_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[10]_i_2_O_UNCONNECTED ;

LUT6 #(
    .INIT(64'h000000007F777777)) 
     \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram_i_2 
       (.I0(\n_0_gpregsm1.curr_fwft_state_reg[1] ),
        .I1(curr_fwft_state),
        .I2(O1),
        .I3(I2),
        .I4(m_axis_tready),
        .I5(I1),
        .O(O2));
LUT6 #(
    .INIT(64'hABAAAAAA22222222)) 
     empty_fwft_fb_i_1
       (.I0(empty_fwft_fb),
        .I1(\n_0_gpregsm1.curr_fwft_state_reg[1] ),
        .I2(O1),
        .I3(I2),
        .I4(m_axis_tready),
        .I5(curr_fwft_state),
        .O(empty_fwft_i0));
(* equivalent_register_removal = "no" *) 
   FDPE #(
    .INIT(1'b1)) 
     empty_fwft_fb_reg
       (.C(s_aclk),
        .CE(1'b1),
        .D(empty_fwft_i0),
        .PRE(Q[1]),
        .Q(empty_fwft_fb));
(* equivalent_register_removal = "no" *) 
   FDPE #(
    .INIT(1'b1)) 
     empty_fwft_i_reg
       (.C(s_aclk),
        .CE(1'b1),
        .D(empty_fwft_i0),
        .PRE(Q[1]),
        .Q(O1));
LUT5 #(
    .INIT(32'hBFFF0000)) 
     \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[3]_i_2 
       (.I0(O1),
        .I1(I2),
        .I2(m_axis_tready),
        .I3(I4),
        .I4(axis_wr_eop_d1),
        .O(\n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[3]_i_2 ));
LUT6 #(
    .INIT(64'hBFFF00004000FFFF)) 
     \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[3]_i_5 
       (.I0(O1),
        .I1(I2),
        .I2(m_axis_tready),
        .I3(I4),
        .I4(axis_wr_eop_d1),
        .I5(I5[1]),
        .O(\n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[3]_i_5 ));
CARRY4 \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[10]_i_2 
       (.CI(\n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[7]_i_1 ),
        .CO({\NLW_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[10]_i_2_CO_UNCONNECTED [3:2],\n_2_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[10]_i_2 ,\n_3_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[10]_i_2 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,I5[7:6]}),
        .O({\NLW_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[10]_i_2_O_UNCONNECTED [3],D[10:8]}),
        .S({1'b0,I8}));
CARRY4 \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[3]_i_1 
       (.CI(1'b0),
        .CO({\n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[3]_i_1 ,\n_1_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[3]_i_1 ,\n_2_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[3]_i_1 ,\n_3_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[3]_i_1 }),
        .CYINIT(1'b0),
        .DI({I5[1],\n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[3]_i_2 ,DI,I5[0]}),
        .O(D[3:0]),
        .S({I6[2],\n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[3]_i_5 ,I6[1:0]}));
CARRY4 \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[7]_i_1 
       (.CI(\n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[3]_i_1 ),
        .CO({\n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[7]_i_1 ,\n_1_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[7]_i_1 ,\n_2_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[7]_i_1 ,\n_3_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[7]_i_1 }),
        .CYINIT(1'b0),
        .DI(I5[5:2]),
        .O(D[7:4]),
        .S(I7));
LUT5 #(
    .INIT(32'hFFFF08FF)) 
     \gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[3]_i_3 
       (.I0(m_axis_tready),
        .I1(I2),
        .I2(O1),
        .I3(s_axis_tvalid),
        .I4(ram_full_i),
        .O(O4));
LUT6 #(
    .INIT(64'h0000F700FFFF08FF)) 
     \gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[3]_i_6 
       (.I0(m_axis_tready),
        .I1(I2),
        .I2(O1),
        .I3(s_axis_tvalid),
        .I4(ram_full_i),
        .I5(I3),
        .O(S));
LUT6 #(
    .INIT(64'h0000000008FFFFFF)) 
     \gc0.count_d1[9]_i_1 
       (.I0(m_axis_tready),
        .I1(I2),
        .I2(O1),
        .I3(curr_fwft_state),
        .I4(\n_0_gpregsm1.curr_fwft_state_reg[1] ),
        .I5(I1),
        .O(O3));
LUT6 #(
    .INIT(64'h0000000008FF0000)) 
     \goreg_bm.dout_i[9]_i_1 
       (.I0(m_axis_tready),
        .I1(I2),
        .I2(O1),
        .I3(curr_fwft_state),
        .I4(\n_0_gpregsm1.curr_fwft_state_reg[1] ),
        .I5(Q[0]),
        .O(E));
(* SOFT_HLUTNM = "soft_lutpair0" *) 
   LUT5 #(
    .INIT(32'hEFFFAAAA)) 
     \gpregsm1.curr_fwft_state[0]_i_1 
       (.I0(\n_0_gpregsm1.curr_fwft_state_reg[1] ),
        .I1(O1),
        .I2(I2),
        .I3(m_axis_tready),
        .I4(curr_fwft_state),
        .O(next_fwft_state[0]));
LUT6 #(
    .INIT(64'hF7000000FFFFFFFF)) 
     \gpregsm1.curr_fwft_state[1]_i_1 
       (.I0(m_axis_tready),
        .I1(I2),
        .I2(O1),
        .I3(curr_fwft_state),
        .I4(\n_0_gpregsm1.curr_fwft_state_reg[1] ),
        .I5(I1),
        .O(next_fwft_state[1]));
(* equivalent_register_removal = "no" *) 
   FDCE #(
    .INIT(1'b0)) 
     \gpregsm1.curr_fwft_state_reg[0] 
       (.C(s_aclk),
        .CE(1'b1),
        .CLR(Q[1]),
        .D(next_fwft_state[0]),
        .Q(curr_fwft_state));
(* equivalent_register_removal = "no" *) 
   FDCE #(
    .INIT(1'b0)) 
     \gpregsm1.curr_fwft_state_reg[1] 
       (.C(s_aclk),
        .CE(1'b1),
        .CLR(Q[1]),
        .D(next_fwft_state[1]),
        .Q(\n_0_gpregsm1.curr_fwft_state_reg[1] ));
(* SOFT_HLUTNM = "soft_lutpair0" *) 
   LUT2 #(
    .INIT(4'h2)) 
     m_axis_tvalid_INST_0
       (.I0(I2),
        .I1(O1),
        .O(m_axis_tvalid));
endmodule

(* ORIG_REF_NAME = "rd_logic" *) 
module fifo_generator_0rd_logic
   (comp0,
    comp1,
    p_18_out,
    p_8_out,
    O1,
    E,
    S,
    m_axis_tvalid,
    D,
    p_14_out_0,
    O2,
    O3,
    O4,
    v1_reg,
    v1_reg_0,
    I1,
    s_aclk,
    Q,
    I2,
    m_axis_tready,
    s_axis_tvalid,
    ram_full_i,
    I3,
    I4,
    axis_wr_eop_d1,
    I5,
    DI,
    I6,
    I7,
    I8);
  output comp0;
  output comp1;
  output p_18_out;
  output p_8_out;
  output O1;
  output [0:0]E;
  output [0:0]S;
  output m_axis_tvalid;
  output [10:0]D;
  output p_14_out_0;
  output [0:0]O2;
  output [9:0]O3;
  output [9:0]O4;
  input [4:0]v1_reg;
  input [4:0]v1_reg_0;
  input I1;
  input s_aclk;
  input [1:0]Q;
  input I2;
  input m_axis_tready;
  input s_axis_tvalid;
  input ram_full_i;
  input [0:0]I3;
  input [0:0]I4;
  input axis_wr_eop_d1;
  input [7:0]I5;
  input [0:0]DI;
  input [2:0]I6;
  input [3:0]I7;
  input [2:0]I8;

  wire [10:0]D;
  wire [0:0]DI;
  wire [0:0]E;
  wire I1;
  wire I2;
  wire [0:0]I3;
  wire [0:0]I4;
  wire [7:0]I5;
  wire [2:0]I6;
  wire [3:0]I7;
  wire [2:0]I8;
  wire O1;
  wire [0:0]O2;
  wire [9:0]O3;
  wire [9:0]O4;
  wire [1:0]Q;
  wire [0:0]S;
  wire axis_wr_eop_d1;
  wire comp0;
  wire comp1;
  wire m_axis_tready;
  wire m_axis_tvalid;
  wire p_14_out_0;
  wire p_18_out;
  wire p_8_out;
  wire ram_full_i;
  wire s_aclk;
  wire s_axis_tvalid;
  wire [4:0]v1_reg;
  wire [4:0]v1_reg_0;

fifo_generator_0rd_fwft \gr1.rfwft 
       (.D(D),
        .DI(DI),
        .E(E),
        .I1(p_18_out),
        .I2(I2),
        .I3(I3),
        .I4(I4),
        .I5(I5),
        .I6(I6),
        .I7(I7),
        .I8(I8),
        .O1(p_8_out),
        .O2(O1),
        .O3(p_14_out_0),
        .O4(O2),
        .Q(Q),
        .S(S),
        .axis_wr_eop_d1(axis_wr_eop_d1),
        .m_axis_tready(m_axis_tready),
        .m_axis_tvalid(m_axis_tvalid),
        .ram_full_i(ram_full_i),
        .s_aclk(s_aclk),
        .s_axis_tvalid(s_axis_tvalid));
fifo_generator_0rd_status_flags_ss \grss.rsts 
       (.I1(I1),
        .Q(Q[1]),
        .comp0(comp0),
        .comp1(comp1),
        .p_18_out(p_18_out),
        .s_aclk(s_aclk),
        .v1_reg(v1_reg),
        .v1_reg_0(v1_reg_0));
fifo_generator_0rd_bin_cntr rpntr
       (.E(p_14_out_0),
        .I1(Q[1]),
        .O4(O4),
        .Q(O3),
        .s_aclk(s_aclk));
endmodule

(* ORIG_REF_NAME = "rd_status_flags_ss" *) 
module fifo_generator_0rd_status_flags_ss
   (comp0,
    comp1,
    p_18_out,
    v1_reg,
    v1_reg_0,
    I1,
    s_aclk,
    Q);
  output comp0;
  output comp1;
  output p_18_out;
  input [4:0]v1_reg;
  input [4:0]v1_reg_0;
  input I1;
  input s_aclk;
  input [0:0]Q;

  wire I1;
  wire [0:0]Q;
  wire comp0;
  wire comp1;
  wire p_18_out;
  wire s_aclk;
  wire [4:0]v1_reg;
  wire [4:0]v1_reg_0;

fifo_generator_0compare_2 c1
       (.comp0(comp0),
        .v1_reg(v1_reg));
fifo_generator_0compare_3 c2
       (.comp1(comp1),
        .v1_reg_0(v1_reg_0));
(* equivalent_register_removal = "no" *) 
   FDPE #(
    .INIT(1'b1)) 
     ram_empty_fb_i_reg
       (.C(s_aclk),
        .CE(1'b1),
        .D(I1),
        .PRE(Q),
        .Q(p_18_out));
endmodule

(* ORIG_REF_NAME = "reset_blk_ramfifo" *) 
module fifo_generator_0reset_blk_ramfifo
   (O1,
    rst_full_gen_i,
    AR,
    rst_d2,
    Q,
    s_aclk,
    s_aresetn);
  output O1;
  output rst_full_gen_i;
  output [0:0]AR;
  output rst_d2;
  output [1:0]Q;
  input s_aclk;
  input s_aresetn;

  wire [0:0]AR;
  wire O1;
  wire [1:0]Q;
  wire \n_0_ngwrdrst.grst.g7serrst.rd_rst_reg[2]_i_1 ;
  wire \n_0_ngwrdrst.grst.g7serrst.wr_rst_reg[1]_i_1 ;
  wire rd_rst_asreg;
  wire rd_rst_asreg_d1;
  wire rd_rst_asreg_d2;
  wire rst_d1;
  wire rst_d2;
  wire rst_d3;
  wire rst_full_gen_i;
  wire s_aclk;
  wire s_aresetn;
  wire wr_rst_asreg;
  wire wr_rst_asreg_d1;
  wire wr_rst_asreg_d2;

LUT1 #(
    .INIT(2'h1)) 
     \gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[10]_i_3 
       (.I0(s_aresetn),
        .O(O1));
FDCE #(
    .INIT(1'b0)) 
     \grstd1.grst_full.grst_f.RST_FULL_GEN_reg 
       (.C(s_aclk),
        .CE(1'b1),
        .CLR(O1),
        .D(rst_d3),
        .Q(rst_full_gen_i));
(* ASYNC_REG *) 
   (* msgon = "true" *) 
   FDPE #(
    .INIT(1'b1)) 
     \grstd1.grst_full.grst_f.rst_d1_reg 
       (.C(s_aclk),
        .CE(1'b1),
        .D(1'b0),
        .PRE(O1),
        .Q(rst_d1));
(* ASYNC_REG *) 
   (* msgon = "true" *) 
   FDPE #(
    .INIT(1'b1)) 
     \grstd1.grst_full.grst_f.rst_d2_reg 
       (.C(s_aclk),
        .CE(1'b1),
        .D(rst_d1),
        .PRE(O1),
        .Q(rst_d2));
(* ASYNC_REG *) 
   (* msgon = "true" *) 
   FDPE #(
    .INIT(1'b1)) 
     \grstd1.grst_full.grst_f.rst_d3_reg 
       (.C(s_aclk),
        .CE(1'b1),
        .D(rst_d2),
        .PRE(O1),
        .Q(rst_d3));
(* ASYNC_REG *) 
   (* msgon = "true" *) 
   FDRE #(
    .INIT(1'b0)) 
     \ngwrdrst.grst.g7serrst.rd_rst_asreg_d1_reg 
       (.C(s_aclk),
        .CE(1'b1),
        .D(rd_rst_asreg),
        .Q(rd_rst_asreg_d1),
        .R(1'b0));
(* ASYNC_REG *) 
   (* msgon = "true" *) 
   FDRE #(
    .INIT(1'b0)) 
     \ngwrdrst.grst.g7serrst.rd_rst_asreg_d2_reg 
       (.C(s_aclk),
        .CE(1'b1),
        .D(rd_rst_asreg_d1),
        .Q(rd_rst_asreg_d2),
        .R(1'b0));
(* ASYNC_REG *) 
   (* msgon = "true" *) 
   FDPE \ngwrdrst.grst.g7serrst.rd_rst_asreg_reg 
       (.C(s_aclk),
        .CE(rd_rst_asreg_d1),
        .D(1'b0),
        .PRE(O1),
        .Q(rd_rst_asreg));
LUT2 #(
    .INIT(4'h2)) 
     \ngwrdrst.grst.g7serrst.rd_rst_reg[2]_i_1 
       (.I0(rd_rst_asreg),
        .I1(rd_rst_asreg_d2),
        .O(\n_0_ngwrdrst.grst.g7serrst.rd_rst_reg[2]_i_1 ));
(* equivalent_register_removal = "no" *) 
   FDPE #(
    .INIT(1'b1)) 
     \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[0] 
       (.C(s_aclk),
        .CE(1'b1),
        .D(1'b0),
        .PRE(\n_0_ngwrdrst.grst.g7serrst.rd_rst_reg[2]_i_1 ),
        .Q(Q[0]));
(* equivalent_register_removal = "no" *) 
   FDPE #(
    .INIT(1'b1)) 
     \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2] 
       (.C(s_aclk),
        .CE(1'b1),
        .D(1'b0),
        .PRE(\n_0_ngwrdrst.grst.g7serrst.rd_rst_reg[2]_i_1 ),
        .Q(Q[1]));
(* ASYNC_REG *) 
   (* msgon = "true" *) 
   FDRE #(
    .INIT(1'b0)) 
     \ngwrdrst.grst.g7serrst.wr_rst_asreg_d1_reg 
       (.C(s_aclk),
        .CE(1'b1),
        .D(wr_rst_asreg),
        .Q(wr_rst_asreg_d1),
        .R(1'b0));
(* ASYNC_REG *) 
   (* msgon = "true" *) 
   FDRE #(
    .INIT(1'b0)) 
     \ngwrdrst.grst.g7serrst.wr_rst_asreg_d2_reg 
       (.C(s_aclk),
        .CE(1'b1),
        .D(wr_rst_asreg_d1),
        .Q(wr_rst_asreg_d2),
        .R(1'b0));
(* ASYNC_REG *) 
   (* msgon = "true" *) 
   FDPE \ngwrdrst.grst.g7serrst.wr_rst_asreg_reg 
       (.C(s_aclk),
        .CE(wr_rst_asreg_d1),
        .D(1'b0),
        .PRE(O1),
        .Q(wr_rst_asreg));
LUT2 #(
    .INIT(4'h2)) 
     \ngwrdrst.grst.g7serrst.wr_rst_reg[1]_i_1 
       (.I0(wr_rst_asreg),
        .I1(wr_rst_asreg_d2),
        .O(\n_0_ngwrdrst.grst.g7serrst.wr_rst_reg[1]_i_1 ));
(* equivalent_register_removal = "no" *) 
   FDPE #(
    .INIT(1'b1)) 
     \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[1] 
       (.C(s_aclk),
        .CE(1'b1),
        .D(1'b0),
        .PRE(\n_0_ngwrdrst.grst.g7serrst.wr_rst_reg[1]_i_1 ),
        .Q(AR));
endmodule

(* ORIG_REF_NAME = "wr_bin_cntr" *) 
module fifo_generator_0wr_bin_cntr
   (p_2_out_0,
    ram_full_comb,
    O4,
    v1_reg,
    Q,
    v1_reg_0,
    v1_reg_1,
    v1_reg_2,
    v1_reg_3,
    p_0_in,
    axis_almost_full,
    comp1_4,
    p_14_out_0,
    E,
    rst_full_gen_i,
    p_2_out,
    comp0_5,
    comp0,
    p_18_out,
    comp1,
    I2,
    I3,
    s_aclk,
    AR);
  output p_2_out_0;
  output ram_full_comb;
  output O4;
  output [4:0]v1_reg;
  output [9:0]Q;
  output [4:0]v1_reg_0;
  output [4:0]v1_reg_1;
  output [4:0]v1_reg_2;
  output [4:0]v1_reg_3;
  input p_0_in;
  input axis_almost_full;
  input comp1_4;
  input p_14_out_0;
  input [0:0]E;
  input rst_full_gen_i;
  input p_2_out;
  input comp0_5;
  input comp0;
  input p_18_out;
  input comp1;
  input [9:0]I2;
  input [9:0]I3;
  input s_aclk;
  input [0:0]AR;

  wire [0:0]AR;
  wire [0:0]E;
  wire [9:0]I2;
  wire [9:0]I3;
  wire O4;
  wire [9:0]Q;
  wire axis_almost_full;
  wire comp0;
  wire comp0_5;
  wire comp1;
  wire comp1_4;
  wire \n_0_gcc0.gc1.gsym.count[9]_i_2 ;
  wire p_0_in;
  wire p_14_out_0;
  wire p_18_out;
  wire p_2_out;
  wire p_2_out_0;
  wire [9:0]p_8_out_1;
  wire [9:0]plusOp__0;
  wire ram_full_comb;
  wire rst_full_gen_i;
  wire s_aclk;
  wire [4:0]v1_reg;
  wire [4:0]v1_reg_0;
  wire [4:0]v1_reg_1;
  wire [4:0]v1_reg_2;
  wire [4:0]v1_reg_3;
  wire [9:0]wr_pntr_plus2;

LUT6 #(
    .INIT(64'h00AA0000CCEE0CCC)) 
     \gaf.gaf0.ram_afull_i_i_1 
       (.I0(p_0_in),
        .I1(axis_almost_full),
        .I2(comp1_4),
        .I3(p_14_out_0),
        .I4(E),
        .I5(rst_full_gen_i),
        .O(p_2_out_0));
(* RETAIN_INVERTER *) 
   (* SOFT_HLUTNM = "soft_lutpair9" *) 
   LUT1 #(
    .INIT(2'h1)) 
     \gcc0.gc1.gsym.count[0]_i_1 
       (.I0(wr_pntr_plus2[0]),
        .O(plusOp__0[0]));
LUT2 #(
    .INIT(4'h6)) 
     \gcc0.gc1.gsym.count[1]_i_1 
       (.I0(wr_pntr_plus2[0]),
        .I1(wr_pntr_plus2[1]),
        .O(plusOp__0[1]));
(* SOFT_HLUTNM = "soft_lutpair9" *) 
   LUT3 #(
    .INIT(8'h78)) 
     \gcc0.gc1.gsym.count[2]_i_1 
       (.I0(wr_pntr_plus2[0]),
        .I1(wr_pntr_plus2[1]),
        .I2(wr_pntr_plus2[2]),
        .O(plusOp__0[2]));
(* SOFT_HLUTNM = "soft_lutpair7" *) 
   LUT4 #(
    .INIT(16'h7F80)) 
     \gcc0.gc1.gsym.count[3]_i_1 
       (.I0(wr_pntr_plus2[1]),
        .I1(wr_pntr_plus2[0]),
        .I2(wr_pntr_plus2[2]),
        .I3(wr_pntr_plus2[3]),
        .O(plusOp__0[3]));
(* SOFT_HLUTNM = "soft_lutpair7" *) 
   LUT5 #(
    .INIT(32'h7FFF8000)) 
     \gcc0.gc1.gsym.count[4]_i_1 
       (.I0(wr_pntr_plus2[2]),
        .I1(wr_pntr_plus2[0]),
        .I2(wr_pntr_plus2[1]),
        .I3(wr_pntr_plus2[3]),
        .I4(wr_pntr_plus2[4]),
        .O(plusOp__0[4]));
LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
     \gcc0.gc1.gsym.count[5]_i_1 
       (.I0(wr_pntr_plus2[3]),
        .I1(wr_pntr_plus2[1]),
        .I2(wr_pntr_plus2[0]),
        .I3(wr_pntr_plus2[2]),
        .I4(wr_pntr_plus2[4]),
        .I5(wr_pntr_plus2[5]),
        .O(plusOp__0[5]));
(* SOFT_HLUTNM = "soft_lutpair8" *) 
   LUT2 #(
    .INIT(4'h6)) 
     \gcc0.gc1.gsym.count[6]_i_1 
       (.I0(\n_0_gcc0.gc1.gsym.count[9]_i_2 ),
        .I1(wr_pntr_plus2[6]),
        .O(plusOp__0[6]));
(* SOFT_HLUTNM = "soft_lutpair8" *) 
   LUT3 #(
    .INIT(8'h78)) 
     \gcc0.gc1.gsym.count[7]_i_1 
       (.I0(\n_0_gcc0.gc1.gsym.count[9]_i_2 ),
        .I1(wr_pntr_plus2[6]),
        .I2(wr_pntr_plus2[7]),
        .O(plusOp__0[7]));
(* SOFT_HLUTNM = "soft_lutpair6" *) 
   LUT4 #(
    .INIT(16'h7F80)) 
     \gcc0.gc1.gsym.count[8]_i_1 
       (.I0(wr_pntr_plus2[6]),
        .I1(\n_0_gcc0.gc1.gsym.count[9]_i_2 ),
        .I2(wr_pntr_plus2[7]),
        .I3(wr_pntr_plus2[8]),
        .O(plusOp__0[8]));
(* SOFT_HLUTNM = "soft_lutpair6" *) 
   LUT5 #(
    .INIT(32'h7FFF8000)) 
     \gcc0.gc1.gsym.count[9]_i_1 
       (.I0(wr_pntr_plus2[7]),
        .I1(\n_0_gcc0.gc1.gsym.count[9]_i_2 ),
        .I2(wr_pntr_plus2[6]),
        .I3(wr_pntr_plus2[8]),
        .I4(wr_pntr_plus2[9]),
        .O(plusOp__0[9]));
LUT6 #(
    .INIT(64'h8000000000000000)) 
     \gcc0.gc1.gsym.count[9]_i_2 
       (.I0(wr_pntr_plus2[5]),
        .I1(wr_pntr_plus2[3]),
        .I2(wr_pntr_plus2[1]),
        .I3(wr_pntr_plus2[0]),
        .I4(wr_pntr_plus2[2]),
        .I5(wr_pntr_plus2[4]),
        .O(\n_0_gcc0.gc1.gsym.count[9]_i_2 ));
FDPE #(
    .INIT(1'b1)) 
     \gcc0.gc1.gsym.count_d1_reg[0] 
       (.C(s_aclk),
        .CE(E),
        .D(wr_pntr_plus2[0]),
        .PRE(AR),
        .Q(p_8_out_1[0]));
FDCE #(
    .INIT(1'b0)) 
     \gcc0.gc1.gsym.count_d1_reg[1] 
       (.C(s_aclk),
        .CE(E),
        .CLR(AR),
        .D(wr_pntr_plus2[1]),
        .Q(p_8_out_1[1]));
FDCE #(
    .INIT(1'b0)) 
     \gcc0.gc1.gsym.count_d1_reg[2] 
       (.C(s_aclk),
        .CE(E),
        .CLR(AR),
        .D(wr_pntr_plus2[2]),
        .Q(p_8_out_1[2]));
FDCE #(
    .INIT(1'b0)) 
     \gcc0.gc1.gsym.count_d1_reg[3] 
       (.C(s_aclk),
        .CE(E),
        .CLR(AR),
        .D(wr_pntr_plus2[3]),
        .Q(p_8_out_1[3]));
FDCE #(
    .INIT(1'b0)) 
     \gcc0.gc1.gsym.count_d1_reg[4] 
       (.C(s_aclk),
        .CE(E),
        .CLR(AR),
        .D(wr_pntr_plus2[4]),
        .Q(p_8_out_1[4]));
FDCE #(
    .INIT(1'b0)) 
     \gcc0.gc1.gsym.count_d1_reg[5] 
       (.C(s_aclk),
        .CE(E),
        .CLR(AR),
        .D(wr_pntr_plus2[5]),
        .Q(p_8_out_1[5]));
FDCE #(
    .INIT(1'b0)) 
     \gcc0.gc1.gsym.count_d1_reg[6] 
       (.C(s_aclk),
        .CE(E),
        .CLR(AR),
        .D(wr_pntr_plus2[6]),
        .Q(p_8_out_1[6]));
FDCE #(
    .INIT(1'b0)) 
     \gcc0.gc1.gsym.count_d1_reg[7] 
       (.C(s_aclk),
        .CE(E),
        .CLR(AR),
        .D(wr_pntr_plus2[7]),
        .Q(p_8_out_1[7]));
FDCE #(
    .INIT(1'b0)) 
     \gcc0.gc1.gsym.count_d1_reg[8] 
       (.C(s_aclk),
        .CE(E),
        .CLR(AR),
        .D(wr_pntr_plus2[8]),
        .Q(p_8_out_1[8]));
FDCE #(
    .INIT(1'b0)) 
     \gcc0.gc1.gsym.count_d1_reg[9] 
       (.C(s_aclk),
        .CE(E),
        .CLR(AR),
        .D(wr_pntr_plus2[9]),
        .Q(p_8_out_1[9]));
FDCE #(
    .INIT(1'b0)) 
     \gcc0.gc1.gsym.count_d2_reg[0] 
       (.C(s_aclk),
        .CE(E),
        .CLR(AR),
        .D(p_8_out_1[0]),
        .Q(Q[0]));
FDCE #(
    .INIT(1'b0)) 
     \gcc0.gc1.gsym.count_d2_reg[1] 
       (.C(s_aclk),
        .CE(E),
        .CLR(AR),
        .D(p_8_out_1[1]),
        .Q(Q[1]));
FDCE #(
    .INIT(1'b0)) 
     \gcc0.gc1.gsym.count_d2_reg[2] 
       (.C(s_aclk),
        .CE(E),
        .CLR(AR),
        .D(p_8_out_1[2]),
        .Q(Q[2]));
FDCE #(
    .INIT(1'b0)) 
     \gcc0.gc1.gsym.count_d2_reg[3] 
       (.C(s_aclk),
        .CE(E),
        .CLR(AR),
        .D(p_8_out_1[3]),
        .Q(Q[3]));
FDCE #(
    .INIT(1'b0)) 
     \gcc0.gc1.gsym.count_d2_reg[4] 
       (.C(s_aclk),
        .CE(E),
        .CLR(AR),
        .D(p_8_out_1[4]),
        .Q(Q[4]));
FDCE #(
    .INIT(1'b0)) 
     \gcc0.gc1.gsym.count_d2_reg[5] 
       (.C(s_aclk),
        .CE(E),
        .CLR(AR),
        .D(p_8_out_1[5]),
        .Q(Q[5]));
FDCE #(
    .INIT(1'b0)) 
     \gcc0.gc1.gsym.count_d2_reg[6] 
       (.C(s_aclk),
        .CE(E),
        .CLR(AR),
        .D(p_8_out_1[6]),
        .Q(Q[6]));
FDCE #(
    .INIT(1'b0)) 
     \gcc0.gc1.gsym.count_d2_reg[7] 
       (.C(s_aclk),
        .CE(E),
        .CLR(AR),
        .D(p_8_out_1[7]),
        .Q(Q[7]));
FDCE #(
    .INIT(1'b0)) 
     \gcc0.gc1.gsym.count_d2_reg[8] 
       (.C(s_aclk),
        .CE(E),
        .CLR(AR),
        .D(p_8_out_1[8]),
        .Q(Q[8]));
FDCE #(
    .INIT(1'b0)) 
     \gcc0.gc1.gsym.count_d2_reg[9] 
       (.C(s_aclk),
        .CE(E),
        .CLR(AR),
        .D(p_8_out_1[9]),
        .Q(Q[9]));
(* counter = "8" *) 
   FDCE #(
    .INIT(1'b0)) 
     \gcc0.gc1.gsym.count_reg[0] 
       (.C(s_aclk),
        .CE(E),
        .CLR(AR),
        .D(plusOp__0[0]),
        .Q(wr_pntr_plus2[0]));
(* counter = "8" *) 
   FDPE #(
    .INIT(1'b1)) 
     \gcc0.gc1.gsym.count_reg[1] 
       (.C(s_aclk),
        .CE(E),
        .D(plusOp__0[1]),
        .PRE(AR),
        .Q(wr_pntr_plus2[1]));
(* counter = "8" *) 
   FDCE #(
    .INIT(1'b0)) 
     \gcc0.gc1.gsym.count_reg[2] 
       (.C(s_aclk),
        .CE(E),
        .CLR(AR),
        .D(plusOp__0[2]),
        .Q(wr_pntr_plus2[2]));
(* counter = "8" *) 
   FDCE #(
    .INIT(1'b0)) 
     \gcc0.gc1.gsym.count_reg[3] 
       (.C(s_aclk),
        .CE(E),
        .CLR(AR),
        .D(plusOp__0[3]),
        .Q(wr_pntr_plus2[3]));
(* counter = "8" *) 
   FDCE #(
    .INIT(1'b0)) 
     \gcc0.gc1.gsym.count_reg[4] 
       (.C(s_aclk),
        .CE(E),
        .CLR(AR),
        .D(plusOp__0[4]),
        .Q(wr_pntr_plus2[4]));
(* counter = "8" *) 
   FDCE #(
    .INIT(1'b0)) 
     \gcc0.gc1.gsym.count_reg[5] 
       (.C(s_aclk),
        .CE(E),
        .CLR(AR),
        .D(plusOp__0[5]),
        .Q(wr_pntr_plus2[5]));
(* counter = "8" *) 
   FDCE #(
    .INIT(1'b0)) 
     \gcc0.gc1.gsym.count_reg[6] 
       (.C(s_aclk),
        .CE(E),
        .CLR(AR),
        .D(plusOp__0[6]),
        .Q(wr_pntr_plus2[6]));
(* counter = "8" *) 
   FDCE #(
    .INIT(1'b0)) 
     \gcc0.gc1.gsym.count_reg[7] 
       (.C(s_aclk),
        .CE(E),
        .CLR(AR),
        .D(plusOp__0[7]),
        .Q(wr_pntr_plus2[7]));
(* counter = "8" *) 
   FDCE #(
    .INIT(1'b0)) 
     \gcc0.gc1.gsym.count_reg[8] 
       (.C(s_aclk),
        .CE(E),
        .CLR(AR),
        .D(plusOp__0[8]),
        .Q(wr_pntr_plus2[8]));
(* counter = "8" *) 
   FDCE #(
    .INIT(1'b0)) 
     \gcc0.gc1.gsym.count_reg[9] 
       (.C(s_aclk),
        .CE(E),
        .CLR(AR),
        .D(plusOp__0[9]),
        .Q(wr_pntr_plus2[9]));
LUT4 #(
    .INIT(16'h9009)) 
     \gmux.gm[0].gm1.m1_i_1 
       (.I0(Q[0]),
        .I1(I2[0]),
        .I2(Q[1]),
        .I3(I2[1]),
        .O(v1_reg[0]));
LUT4 #(
    .INIT(16'h9009)) 
     \gmux.gm[0].gm1.m1_i_1__0 
       (.I0(Q[0]),
        .I1(I3[0]),
        .I2(Q[1]),
        .I3(I3[1]),
        .O(v1_reg_0[0]));
LUT4 #(
    .INIT(16'h9009)) 
     \gmux.gm[0].gm1.m1_i_1__1 
       (.I0(Q[0]),
        .I1(I2[0]),
        .I2(Q[1]),
        .I3(I2[1]),
        .O(v1_reg_1[0]));
LUT4 #(
    .INIT(16'h9009)) 
     \gmux.gm[0].gm1.m1_i_1__2 
       (.I0(p_8_out_1[0]),
        .I1(I2[0]),
        .I2(p_8_out_1[1]),
        .I3(I2[1]),
        .O(v1_reg_2[0]));
LUT4 #(
    .INIT(16'h9009)) 
     \gmux.gm[0].gm1.m1_i_1__3 
       (.I0(wr_pntr_plus2[0]),
        .I1(I2[0]),
        .I2(wr_pntr_plus2[1]),
        .I3(I2[1]),
        .O(v1_reg_3[0]));
LUT4 #(
    .INIT(16'h9009)) 
     \gmux.gm[1].gms.ms_i_1 
       (.I0(Q[2]),
        .I1(I2[2]),
        .I2(Q[3]),
        .I3(I2[3]),
        .O(v1_reg[1]));
LUT4 #(
    .INIT(16'h9009)) 
     \gmux.gm[1].gms.ms_i_1__0 
       (.I0(Q[2]),
        .I1(I3[2]),
        .I2(Q[3]),
        .I3(I3[3]),
        .O(v1_reg_0[1]));
LUT4 #(
    .INIT(16'h9009)) 
     \gmux.gm[1].gms.ms_i_1__1 
       (.I0(Q[2]),
        .I1(I2[2]),
        .I2(Q[3]),
        .I3(I2[3]),
        .O(v1_reg_1[1]));
LUT4 #(
    .INIT(16'h9009)) 
     \gmux.gm[1].gms.ms_i_1__2 
       (.I0(p_8_out_1[2]),
        .I1(I2[2]),
        .I2(p_8_out_1[3]),
        .I3(I2[3]),
        .O(v1_reg_2[1]));
LUT4 #(
    .INIT(16'h9009)) 
     \gmux.gm[1].gms.ms_i_1__3 
       (.I0(wr_pntr_plus2[2]),
        .I1(I2[2]),
        .I2(wr_pntr_plus2[3]),
        .I3(I2[3]),
        .O(v1_reg_3[1]));
LUT4 #(
    .INIT(16'h9009)) 
     \gmux.gm[2].gms.ms_i_1 
       (.I0(Q[4]),
        .I1(I2[4]),
        .I2(Q[5]),
        .I3(I2[5]),
        .O(v1_reg[2]));
LUT4 #(
    .INIT(16'h9009)) 
     \gmux.gm[2].gms.ms_i_1__0 
       (.I0(Q[4]),
        .I1(I3[4]),
        .I2(Q[5]),
        .I3(I3[5]),
        .O(v1_reg_0[2]));
LUT4 #(
    .INIT(16'h9009)) 
     \gmux.gm[2].gms.ms_i_1__1 
       (.I0(Q[4]),
        .I1(I2[4]),
        .I2(Q[5]),
        .I3(I2[5]),
        .O(v1_reg_1[2]));
LUT4 #(
    .INIT(16'h9009)) 
     \gmux.gm[2].gms.ms_i_1__2 
       (.I0(p_8_out_1[4]),
        .I1(I2[4]),
        .I2(p_8_out_1[5]),
        .I3(I2[5]),
        .O(v1_reg_2[2]));
LUT4 #(
    .INIT(16'h9009)) 
     \gmux.gm[2].gms.ms_i_1__3 
       (.I0(wr_pntr_plus2[4]),
        .I1(I2[4]),
        .I2(wr_pntr_plus2[5]),
        .I3(I2[5]),
        .O(v1_reg_3[2]));
LUT4 #(
    .INIT(16'h9009)) 
     \gmux.gm[3].gms.ms_i_1 
       (.I0(Q[6]),
        .I1(I2[6]),
        .I2(Q[7]),
        .I3(I2[7]),
        .O(v1_reg[3]));
LUT4 #(
    .INIT(16'h9009)) 
     \gmux.gm[3].gms.ms_i_1__0 
       (.I0(Q[6]),
        .I1(I3[6]),
        .I2(Q[7]),
        .I3(I3[7]),
        .O(v1_reg_0[3]));
LUT4 #(
    .INIT(16'h9009)) 
     \gmux.gm[3].gms.ms_i_1__1 
       (.I0(Q[6]),
        .I1(I2[6]),
        .I2(Q[7]),
        .I3(I2[7]),
        .O(v1_reg_1[3]));
LUT4 #(
    .INIT(16'h9009)) 
     \gmux.gm[3].gms.ms_i_1__2 
       (.I0(p_8_out_1[6]),
        .I1(I2[6]),
        .I2(p_8_out_1[7]),
        .I3(I2[7]),
        .O(v1_reg_2[3]));
LUT4 #(
    .INIT(16'h9009)) 
     \gmux.gm[3].gms.ms_i_1__3 
       (.I0(wr_pntr_plus2[6]),
        .I1(I2[6]),
        .I2(wr_pntr_plus2[7]),
        .I3(I2[7]),
        .O(v1_reg_3[3]));
LUT4 #(
    .INIT(16'h9009)) 
     \gmux.gm[4].gms.ms_i_1 
       (.I0(Q[8]),
        .I1(I2[8]),
        .I2(Q[9]),
        .I3(I2[9]),
        .O(v1_reg[4]));
LUT4 #(
    .INIT(16'h9009)) 
     \gmux.gm[4].gms.ms_i_1__0 
       (.I0(Q[8]),
        .I1(I3[8]),
        .I2(Q[9]),
        .I3(I3[9]),
        .O(v1_reg_0[4]));
LUT4 #(
    .INIT(16'h9009)) 
     \gmux.gm[4].gms.ms_i_1__1 
       (.I0(Q[8]),
        .I1(I2[8]),
        .I2(Q[9]),
        .I3(I2[9]),
        .O(v1_reg_1[4]));
LUT4 #(
    .INIT(16'h9009)) 
     \gmux.gm[4].gms.ms_i_1__2 
       (.I0(p_8_out_1[8]),
        .I1(I2[8]),
        .I2(p_8_out_1[9]),
        .I3(I2[9]),
        .O(v1_reg_2[4]));
LUT4 #(
    .INIT(16'h9009)) 
     \gmux.gm[4].gms.ms_i_1__3 
       (.I0(wr_pntr_plus2[8]),
        .I1(I2[8]),
        .I2(wr_pntr_plus2[9]),
        .I3(I2[9]),
        .O(v1_reg_3[4]));
LUT5 #(
    .INIT(32'h4444FCCC)) 
     ram_empty_fb_i_i_1
       (.I0(comp0),
        .I1(p_18_out),
        .I2(p_14_out_0),
        .I3(comp1),
        .I4(E),
        .O(O4));
LUT6 #(
    .INIT(64'h0088008800F8F0F8)) 
     ram_full_fb_i_i_1
       (.I0(comp1_4),
        .I1(E),
        .I2(p_2_out),
        .I3(p_14_out_0),
        .I4(comp0_5),
        .I5(rst_full_gen_i),
        .O(ram_full_comb));
endmodule

(* ORIG_REF_NAME = "wr_logic" *) 
module fifo_generator_0wr_logic
   (axis_almost_full,
    ram_full_i,
    O1,
    O3,
    O4,
    E,
    axis_wr_eop,
    s_axis_tready,
    v1_reg,
    O5,
    v1_reg_0,
    s_aclk,
    rst_d2,
    s_axis_tvalid,
    p_8_out,
    I1,
    m_axis_tready,
    Q,
    O2,
    S,
    I6,
    I7,
    p_14_out_0,
    rst_full_gen_i,
    comp0,
    p_18_out,
    comp1,
    DIADI,
    I2,
    I3,
    AR);
  output axis_almost_full;
  output ram_full_i;
  output O1;
  output [10:0]O3;
  output O4;
  output [0:0]E;
  output axis_wr_eop;
  output s_axis_tready;
  output [4:0]v1_reg;
  output [9:0]O5;
  output [4:0]v1_reg_0;
  input s_aclk;
  input rst_d2;
  input s_axis_tvalid;
  input p_8_out;
  input I1;
  input m_axis_tready;
  input [7:0]Q;
  input [0:0]O2;
  input [2:0]S;
  input [3:0]I6;
  input [2:0]I7;
  input p_14_out_0;
  input rst_full_gen_i;
  input comp0;
  input p_18_out;
  input comp1;
  input [0:0]DIADI;
  input [9:0]I2;
  input [9:0]I3;
  input [0:0]AR;

  wire [0:0]AR;
  wire [0:0]DIADI;
  wire [0:0]E;
  wire I1;
  wire [9:0]I2;
  wire [9:0]I3;
  wire [3:0]I6;
  wire [2:0]I7;
  wire O1;
  wire [0:0]O2;
  wire [10:0]O3;
  wire O4;
  wire [9:0]O5;
  wire [7:0]Q;
  wire [2:0]S;
  wire axis_almost_full;
  wire axis_wr_eop;
  wire [4:0]\c0/v1_reg ;
  wire [4:0]\c1/v1_reg ;
  wire comp0;
  wire comp0_1;
  wire comp1;
  wire comp1_0;
  wire [4:0]\gaf.c2/v1_reg ;
  wire m_axis_tready;
  wire p_0_in;
  wire p_14_out_0;
  wire p_18_out;
  wire p_2_out;
  wire p_2_out_2;
  wire p_8_out;
  wire ram_full_comb;
  wire ram_full_i;
  wire rst_d2;
  wire rst_full_gen_i;
  wire s_aclk;
  wire s_axis_tready;
  wire s_axis_tvalid;
  wire [4:0]v1_reg;
  wire [4:0]v1_reg_0;

fifo_generator_0wr_status_flags_ss \gwss.wsts 
       (.DIADI(DIADI),
        .E(O1),
        .I1(I1),
        .I6(I6),
        .I7(I7),
        .O1(ram_full_i),
        .O2(O2),
        .O3(O3),
        .O4(E),
        .Q(Q),
        .S(S),
        .axis_almost_full(axis_almost_full),
        .axis_wr_eop(axis_wr_eop),
        .comp0(comp0_1),
        .comp1(comp1_0),
        .m_axis_tready(m_axis_tready),
        .p_0_in(p_0_in),
        .p_2_out(p_2_out),
        .p_2_out_2(p_2_out_2),
        .p_8_out(p_8_out),
        .ram_full_comb(ram_full_comb),
        .rst_d2(rst_d2),
        .s_aclk(s_aclk),
        .s_axis_tready(s_axis_tready),
        .s_axis_tvalid(s_axis_tvalid),
        .v1_reg(\c0/v1_reg ),
        .v1_reg_0(\c1/v1_reg ),
        .v1_reg_1(\gaf.c2/v1_reg ));
fifo_generator_0wr_bin_cntr wpntr
       (.AR(AR),
        .E(O1),
        .I2(I2),
        .I3(I3),
        .O4(O4),
        .Q(O5),
        .axis_almost_full(axis_almost_full),
        .comp0(comp0),
        .comp0_5(comp0_1),
        .comp1(comp1),
        .comp1_4(comp1_0),
        .p_0_in(p_0_in),
        .p_14_out_0(p_14_out_0),
        .p_18_out(p_18_out),
        .p_2_out(p_2_out),
        .p_2_out_0(p_2_out_2),
        .ram_full_comb(ram_full_comb),
        .rst_full_gen_i(rst_full_gen_i),
        .s_aclk(s_aclk),
        .v1_reg(v1_reg),
        .v1_reg_0(v1_reg_0),
        .v1_reg_1(\c0/v1_reg ),
        .v1_reg_2(\c1/v1_reg ),
        .v1_reg_3(\gaf.c2/v1_reg ));
endmodule

(* ORIG_REF_NAME = "wr_status_flags_ss" *) 
module fifo_generator_0wr_status_flags_ss
   (comp0,
    comp1,
    p_0_in,
    p_2_out,
    axis_almost_full,
    O1,
    E,
    O3,
    O4,
    axis_wr_eop,
    s_axis_tready,
    v1_reg,
    v1_reg_0,
    v1_reg_1,
    ram_full_comb,
    s_aclk,
    rst_d2,
    p_2_out_2,
    s_axis_tvalid,
    p_8_out,
    I1,
    m_axis_tready,
    Q,
    O2,
    S,
    I6,
    I7,
    DIADI);
  output comp0;
  output comp1;
  output p_0_in;
  output p_2_out;
  output axis_almost_full;
  output O1;
  output [0:0]E;
  output [10:0]O3;
  output [0:0]O4;
  output axis_wr_eop;
  output s_axis_tready;
  input [4:0]v1_reg;
  input [4:0]v1_reg_0;
  input [4:0]v1_reg_1;
  input ram_full_comb;
  input s_aclk;
  input rst_d2;
  input p_2_out_2;
  input s_axis_tvalid;
  input p_8_out;
  input I1;
  input m_axis_tready;
  input [7:0]Q;
  input [0:0]O2;
  input [2:0]S;
  input [3:0]I6;
  input [2:0]I7;
  input [0:0]DIADI;

  wire [0:0]DIADI;
  wire [0:0]E;
  wire I1;
  wire [3:0]I6;
  wire [2:0]I7;
  wire O1;
  wire [0:0]O2;
  wire [10:0]O3;
  wire [0:0]O4;
  wire [7:0]Q;
  wire [2:0]S;
  wire axis_almost_full;
  wire axis_wr_eop;
  wire comp0;
  wire comp1;
  wire m_axis_tready;
  wire \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[3]_i_2 ;
  wire \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[3]_i_5 ;
  wire \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[3]_i_1 ;
  wire \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[7]_i_1 ;
  wire \n_1_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[3]_i_1 ;
  wire \n_1_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[7]_i_1 ;
  wire \n_2_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[10]_i_2 ;
  wire \n_2_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[3]_i_1 ;
  wire \n_2_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[7]_i_1 ;
  wire \n_3_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[10]_i_2 ;
  wire \n_3_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[3]_i_1 ;
  wire \n_3_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[7]_i_1 ;
  wire p_0_in;
  wire p_2_out;
  wire p_2_out_2;
  wire p_8_out;
  wire ram_full_comb;
  wire rst_d2;
  wire s_aclk;
  wire s_axis_tready;
  wire s_axis_tvalid;
  wire [4:0]v1_reg;
  wire [4:0]v1_reg_0;
  wire [4:0]v1_reg_1;
  wire [3:2]\NLW_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[10]_i_2_CO_UNCONNECTED ;
  wire [3:3]\NLW_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[10]_i_2_O_UNCONNECTED ;

LUT3 #(
    .INIT(8'h04)) 
     \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram_i_1 
       (.I0(O1),
        .I1(s_axis_tvalid),
        .I2(p_2_out),
        .O(E));
fifo_generator_0compare c0
       (.comp0(comp0),
        .v1_reg(v1_reg));
fifo_generator_0compare_0 c1
       (.comp1(comp1),
        .v1_reg_0(v1_reg_0));
fifo_generator_0compare_1 \gaf.c2 
       (.p_0_in(p_0_in),
        .v1_reg_1(v1_reg_1));
(* equivalent_register_removal = "no" *) 
   FDPE #(
    .INIT(1'b1)) 
     \gaf.gaf0.ram_afull_i_reg 
       (.C(s_aclk),
        .CE(1'b1),
        .D(p_2_out_2),
        .PRE(rst_d2),
        .Q(axis_almost_full));
LUT3 #(
    .INIT(8'h20)) 
     \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_wr_eop_d1_i_1 
       (.I0(DIADI),
        .I1(O1),
        .I2(s_axis_tvalid),
        .O(axis_wr_eop));
(* SOFT_HLUTNM = "soft_lutpair5" *) 
   LUT5 #(
    .INIT(32'h2D222222)) 
     \gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[10]_i_1 
       (.I0(s_axis_tvalid),
        .I1(O1),
        .I2(p_8_out),
        .I3(I1),
        .I4(m_axis_tready),
        .O(O4));
LUT5 #(
    .INIT(32'h40444444)) 
     \gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[3]_i_2 
       (.I0(O1),
        .I1(s_axis_tvalid),
        .I2(p_8_out),
        .I3(I1),
        .I4(m_axis_tready),
        .O(\n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[3]_i_2 ));
LUT6 #(
    .INIT(64'h40444444BFBBBBBB)) 
     \gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[3]_i_5 
       (.I0(O1),
        .I1(s_axis_tvalid),
        .I2(p_8_out),
        .I3(I1),
        .I4(m_axis_tready),
        .I5(Q[1]),
        .O(\n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[3]_i_5 ));
CARRY4 \gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[10]_i_2 
       (.CI(\n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[7]_i_1 ),
        .CO({\NLW_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[10]_i_2_CO_UNCONNECTED [3:2],\n_2_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[10]_i_2 ,\n_3_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[10]_i_2 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,Q[7:6]}),
        .O({\NLW_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[10]_i_2_O_UNCONNECTED [3],O3[10:8]}),
        .S({1'b0,I7}));
CARRY4 \gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[3]_i_1 
       (.CI(1'b0),
        .CO({\n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[3]_i_1 ,\n_1_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[3]_i_1 ,\n_2_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[3]_i_1 ,\n_3_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[3]_i_1 }),
        .CYINIT(1'b0),
        .DI({Q[1],\n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[3]_i_2 ,O2,Q[0]}),
        .O(O3[3:0]),
        .S({S[2],\n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[3]_i_5 ,S[1:0]}));
CARRY4 \gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[7]_i_1 
       (.CI(\n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[3]_i_1 ),
        .CO({\n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[7]_i_1 ,\n_1_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[7]_i_1 ,\n_2_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[7]_i_1 ,\n_3_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[7]_i_1 }),
        .CYINIT(1'b0),
        .DI(Q[5:2]),
        .O(O3[7:4]),
        .S(I6));
(* equivalent_register_removal = "no" *) 
   FDPE #(
    .INIT(1'b1)) 
     ram_full_fb_i_reg
       (.C(s_aclk),
        .CE(1'b1),
        .D(ram_full_comb),
        .PRE(rst_d2),
        .Q(p_2_out));
(* equivalent_register_removal = "no" *) 
   FDPE #(
    .INIT(1'b1)) 
     ram_full_i_reg
       (.C(s_aclk),
        .CE(1'b1),
        .D(ram_full_comb),
        .PRE(rst_d2),
        .Q(O1));
(* RETAIN_INVERTER *) 
   (* SOFT_HLUTNM = "soft_lutpair5" *) 
   LUT1 #(
    .INIT(2'h1)) 
     s_axis_tready_INST_0
       (.I0(O1),
        .O(s_axis_tready));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;

    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
