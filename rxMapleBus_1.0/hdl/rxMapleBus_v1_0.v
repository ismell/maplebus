
`timescale 1 ps / 1 ps

module rxMapleBus_v1_0 #
  (
    // Parameters of Axi Slave Bus Interface S_AXI_CRTL
    parameter integer C_S_AXI_CRTL_DATA_WIDTH   = 32,
    parameter integer C_S_AXI_CRTL_ADDR_WIDTH   = 5,

    // Parameters of Axi Bus Interface
    parameter integer C_AXIS_TDATA_WIDTH = 8
  )
  (
    input wire aclk,
    input wire aresetn,

    // Ports of Axi Slave Bus Interface S_AXI_CRTL
    input wire [C_S_AXI_CRTL_ADDR_WIDTH-1 : 0] s_axi_crtl_awaddr,
    input wire [2 : 0] s_axi_crtl_awprot,
    input wire  s_axi_crtl_awvalid,
    output wire  s_axi_crtl_awready,
    input wire [C_S_AXI_CRTL_DATA_WIDTH-1 : 0] s_axi_crtl_wdata,
    input wire [(C_S_AXI_CRTL_DATA_WIDTH/8)-1 : 0] s_axi_crtl_wstrb,
    input wire  s_axi_crtl_wvalid,
    output wire  s_axi_crtl_wready,
    output wire [1 : 0] s_axi_crtl_bresp,
    output wire  s_axi_crtl_bvalid,
    input wire  s_axi_crtl_bready,
    input wire [C_S_AXI_CRTL_ADDR_WIDTH-1 : 0] s_axi_crtl_araddr,
    input wire [2 : 0] s_axi_crtl_arprot,
    input wire  s_axi_crtl_arvalid,
    output wire  s_axi_crtl_arready,
    output wire [C_S_AXI_CRTL_DATA_WIDTH-1 : 0] s_axi_crtl_rdata,
    output wire [1 : 0] s_axi_crtl_rresp,
    output wire  s_axi_crtl_rvalid,
    input wire  s_axi_crtl_rready,

    // Ports of Axi Slave Bus Interface S_AXIS_TX
    output wire  s_axis_tx_tready,
    input wire [C_AXIS_TDATA_WIDTH-1 : 0] s_axis_tx_tdata,
    input wire [(C_AXIS_TDATA_WIDTH/8)-1 : 0] s_axis_tx_tstrb,
    input wire [(C_AXIS_TDATA_WIDTH/8)-1 : 0] s_axis_tx_tkeep,
    input wire  s_axis_tx_tlast,
    input wire  s_axis_tx_tvalid,

    // Ports of Axi Master Bus Interface M_AXIS_RX
    output wire  m_axis_rx_tvalid,
    output wire [C_AXIS_TDATA_WIDTH-1 : 0] m_axis_rx_tdata,
    output wire [(C_AXIS_TDATA_WIDTH/8)-1 : 0] m_axis_rx_tstrb,
    output wire [(C_AXIS_TDATA_WIDTH/8)-1 : 0] m_axis_rx_tkeep,
    output wire  m_axis_rx_tlast,
    input wire  m_axis_rx_tready,
    inout wire sdcka, sdckb
  );

  wire  axis_tx_tvalid, axis_rx_tvalid;
  wire [C_AXIS_TDATA_WIDTH-1 : 0] axis_tx_tdata, axis_rx_tdata;
  wire [(C_AXIS_TDATA_WIDTH/8)-1 : 0] axis_tx_tstrb, axis_rx_tstrb;
  wire [(C_AXIS_TDATA_WIDTH/8)-1 : 0] axis_tx_tkeep, axis_rx_tkeep;
  wire  axis_tx_tlast, axis_rx_tlast;
  wire  axis_tx_tready, axis_rx_tready;
  wire  [10:0] axis_rx_data_count;
  wire  [10:0] axis_tx_data_count;

  wire enable_tx, enable_rx, enable_loopback, reset_tx, reset_rx;

  wire sdcka_tx, sdckb_tx, transmitting, receiving;
  reg sdcka_in, sdckb_in, sdcka_out, sdckb_out;

  assign sdcka = sdcka_out,
         sdckb = sdckb_out;

  // Instantiation of Axi Bus Interface S_AXI_CRTL
  rxMapleBus_v1_0_S_AXI_CRTL # (
    .C_S_AXI_DATA_WIDTH(C_S_AXI_CRTL_DATA_WIDTH),
    .C_S_AXI_ADDR_WIDTH(C_S_AXI_CRTL_ADDR_WIDTH)
  ) rxMapleBus_v1_0_S_AXI_CRTL_inst (
    .S_AXI_ACLK(aclk),
    .S_AXI_ARESETN(aresetn),
    .S_AXI_AWADDR(s_axi_crtl_awaddr),
    .S_AXI_AWPROT(s_axi_crtl_awprot),
    .S_AXI_AWVALID(s_axi_crtl_awvalid),
    .S_AXI_AWREADY(s_axi_crtl_awready),
    .S_AXI_WDATA(s_axi_crtl_wdata),
    .S_AXI_WSTRB(s_axi_crtl_wstrb),
    .S_AXI_WVALID(s_axi_crtl_wvalid),
    .S_AXI_WREADY(s_axi_crtl_wready),
    .S_AXI_BRESP(s_axi_crtl_bresp),
    .S_AXI_BVALID(s_axi_crtl_bvalid),
    .S_AXI_BREADY(s_axi_crtl_bready),
    .S_AXI_ARADDR(s_axi_crtl_araddr),
    .S_AXI_ARPROT(s_axi_crtl_arprot),
    .S_AXI_ARVALID(s_axi_crtl_arvalid),
    .S_AXI_ARREADY(s_axi_crtl_arready),
    .S_AXI_RDATA(s_axi_crtl_rdata),
    .S_AXI_RRESP(s_axi_crtl_rresp),
    .S_AXI_RVALID(s_axi_crtl_rvalid),
    .S_AXI_RREADY(s_axi_crtl_rready),
    .RX_DATA_COUNT(axis_rx_data_count),
    .TX_DATA_COUNT(axis_tx_data_count),
    .ENABLE_TX(enable_tx),
    .ENABLE_RX(enable_rx),
    .ENABLE_LOOPBACK(enable_loopback),
    .RESET_TX(reset_tx),
    .RESET_RX(reset_rx)
  );

  // Instantiation of Axi Bus Interface S_AXIS_TX
  fifo_generator_0 tx_fifo (
    .s_aclk(aclk),                      // input wire s_aclk
    .s_aresetn(aresetn && !reset_tx),   // input wire s_aresetn
    
    .s_axis_tvalid(s_axis_tx_tvalid),   // input wire s_axis_tvalid
    .s_axis_tready(s_axis_tx_tready),   // output wire s_axis_tready
    .s_axis_tdata(s_axis_tx_tdata),     // input wire [7 : 0] s_axis_tdata
    .s_axis_tstrb(s_axis_tx_tstrb),     // input wire [0 : 0] s_axis_tstrb
    .s_axis_tkeep(s_axis_tx_tkeep),     // input wire [0 : 0] s_axis_tkeep
    .s_axis_tlast(s_axis_tx_tlast),     // input wire s_axis_tlast
    
    .m_axis_tvalid(axis_tx_tvalid),     // output wire m_axis_tvalid
    .m_axis_tready(axis_tx_tready),     // input wire m_axis_tready
    .m_axis_tdata(axis_tx_tdata),       // output wire [7 : 0] m_axis_tdata
    .m_axis_tstrb(axis_tx_tstrb),       // output wire [0 : 0] m_axis_tstrb
    .m_axis_tkeep(axis_tx_tkeep),       // output wire [0 : 0] m_axis_tkeep
    .m_axis_tlast(axis_tx_tlast),       // output wire m_axis_tlast
    
    .axis_data_count(axis_tx_data_count)    // output wire [10 : 0] axis_data_count
  );

  transmitter t(
    .S_AXIS_ACLK(aclk),                 // input wire s_aclk
    .S_AXIS_ARESETN(aresetn),           // input wire s_aresetn
    .S_AXIS_TREADY(axis_tx_tready),     // output wire s_axis_tready
    .S_AXIS_TDATA(axis_tx_tdata),       // input wire [7 : 0] s_axis_tdata
    .S_AXIS_TSTRB(axis_tx_tstrb),       // input wire [0 : 0] s_axis_tstrb
    .S_AXIS_TKEEP(axis_tx_tkeep),       // input wire [0 : 0] s_axis_tkeep
    .S_AXIS_TLAST(axis_tx_tlast),       // input wire s_axis_tlast
    .S_AXIS_TVALID(axis_tx_tvalid),     // input wire s_axis_tvalid
    .SDCKA(sdcka_tx),
    .SDCKB(sdckb_tx),
    .ENABLE(enable_tx && !receiving),   // enabled and we are not receiving
    .TRANSMITTING(transmitting) // Output the signal
  );

  always @(*)
  begin : ASSIGN_SDCKX_IN
    if (enable_loopback) begin
      // When loopback is enabled we don't ever read anything from the wire 
      sdcka_in = sdcka_tx;
      sdckb_in = sdckb_tx;
    end else begin
      if (transmitting) begin
        sdcka_in = 1'b1;
        sdckb_in = 1'b1;
      end else begin
        sdcka_in = sdcka;
        sdckb_in = sdckb;
      end
    end
  end

  always @(*)
  begin : ASSIGN_SDCKX_OUT
    if (enable_loopback) begin
      // When loopback is enabled we don't ever output anything on the wire
      sdcka_out = 1'bz;
      sdckb_out = 1'bz;
    end else begin
      if (transmitting) begin
        // We want to allow the pull up resistor to drive the high signal
        // while we only drive the low signal.
        sdcka_out = sdcka_tx ? 1'bz : 1'b0;
        sdckb_out = sdckb_tx ? 1'bz : 1'b0;
      end else begin
        sdcka_out = 1'bz;
        sdckb_out = 1'bz;
      end
    end
  end

  // Instantiation of Maple Bus Receiver
  receiver r(
    .SDCKA(sdcka_in),
    .SDCKB(sdckb_in),

    .M_AXIS_ACLK(aclk),                 // input wire s_aclk
    .M_AXIS_ARESETN(aresetn),           // input wire s_aresetn
    .M_AXIS_TREADY(axis_rx_tready),     // input wire m_axis_tready
    .M_AXIS_TDATA(axis_rx_tdata),       // output wire [7 : 0] m_axis_tdata
    .M_AXIS_TSTRB(axis_rx_tstrb),       // output wire [0 : 0] m_axis_tstrb
    .M_AXIS_TKEEP(axis_rx_tkeep),       // output wire [0 : 0] m_axis_tkeep
    .M_AXIS_TLAST(axis_rx_tlast),       // output wire m_axis_tlast
    .M_AXIS_TVALID(axis_rx_tvalid),     // output wire m_axis_tvalid

    .ENABLE(enable_rx),   // Enable the receiver
    .RECEIVING(receiving) // A packet is being received
  );

  // Instantiation of Axi Bus Interface M_AXIS_RX
  fifo_generator_0 rx_fifo (
    .s_aclk(aclk),                      // input wire s_aclk
    .s_aresetn(aresetn && !reset_rx),   // input wire s_aresetn
    
    .s_axis_tvalid(axis_rx_tvalid),     // input wire s_axis_tvalid
    .s_axis_tready(axis_rx_tready),     // output wire s_axis_tready
    .s_axis_tdata(axis_rx_tdata),       // input wire [7 : 0] s_axis_tdata
    .s_axis_tstrb(axis_rx_tstrb),       // input wire [0 : 0] s_axis_tstrb
    .s_axis_tkeep(axis_rx_tkeep),       // input wire [0 : 0] s_axis_tkeep
    .s_axis_tlast(axis_rx_tlast),       // input wire s_axis_tlast
    
    .m_axis_tvalid(m_axis_rx_tvalid),   // output wire m_axis_tvalid
    .m_axis_tready(m_axis_rx_tready),   // input wire m_axis_tready
    .m_axis_tdata(m_axis_rx_tdata),     // output wire [7 : 0] m_axis_tdata
    .m_axis_tstrb(m_axis_rx_tstrb),     // output wire [0 : 0] m_axis_tstrb
    .m_axis_tkeep(m_axis_rx_tkeep),     // output wire [0 : 0] m_axis_tkeep
    .m_axis_tlast(m_axis_rx_tlast),     // output wire m_axis_tlast
    .axis_data_count(axis_rx_data_count)    // output wire [10 : 0] axis_data_count
  );

endmodule
