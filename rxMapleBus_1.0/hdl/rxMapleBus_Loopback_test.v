`timescale 1 ns / 1 ps
`default_nettype none

// lib IP_Integrator_Lib
module rxMapleBusLoopBackTest #
  (
    // Parameters of Axi Slave Bus Interface S_AXI_CRTL
    parameter integer C_S_AXI_CRTL_DATA_WIDTH   = 32,
    parameter integer C_S_AXI_CRTL_ADDR_WIDTH   = 5,

    // Parameters of Axi Bus Interface
    parameter integer C_AXIS_TDATA_WIDTH = 8
  );
  reg ACLK;
  reg ARESETN;

  // Ports AXI Slave Bus S_AXI_CTRL
  reg [C_S_AXI_CRTL_ADDR_WIDTH-1 : 0] s_axi_crtl_awaddr;
  reg [2 : 0] s_axi_crtl_awprot;
  reg  s_axi_crtl_awvalid;
  wire  s_axi_crtl_awready;
  reg [C_S_AXI_CRTL_DATA_WIDTH-1 : 0] s_axi_crtl_wdata;
  reg [(C_S_AXI_CRTL_DATA_WIDTH/8)-1 : 0] s_axi_crtl_wstrb;
  reg  s_axi_crtl_wvalid;
  wire  s_axi_crtl_wready;
  wire [1 : 0] s_axi_crtl_bresp;
  wire  s_axi_crtl_bvalid;
  reg  s_axi_crtl_bready;
  reg [C_S_AXI_CRTL_ADDR_WIDTH-1 : 0] s_axi_crtl_araddr;
  reg [2 : 0] s_axi_crtl_arprot;
  reg  s_axi_crtl_arvalid;
  wire  s_axi_crtl_arready;
  wire [C_S_AXI_CRTL_DATA_WIDTH-1 : 0] s_axi_crtl_rdata;
  wire [1 : 0] s_axi_crtl_rresp;
  wire  s_axi_crtl_rvalid;
  reg  s_axi_crtl_rready;

  // Ports for AXI Slave Bus Interface S_AXIS_TX
  wire  s_axis_tx_tready;
  wire [C_AXIS_TDATA_WIDTH-1:0] s_axis_tx_tdata;
  wire [(C_AXIS_TDATA_WIDTH/8)-1:0] s_axis_tx_tstrb;
  wire [(C_AXIS_TDATA_WIDTH/8)-1:0] s_axis_tx_tkeep;
  wire  s_axis_tx_tlast;
  reg  s_axis_tx_tvalid;

  // Ports for AXI Master Bus Interface M_AXIS_RX
  wire  m_axis_rx_tready;
  wire [C_AXIS_TDATA_WIDTH-1:0] m_axis_rx_tdata;
  wire [(C_AXIS_TDATA_WIDTH/8)-1:0] m_axis_rx_tstrb;
  wire [(C_AXIS_TDATA_WIDTH/8)-1:0] m_axis_rx_tkeep;
  wire  m_axis_rx_tlast;
  wire  m_axis_rx_tvalid;

  // Ports for SDCKX (These should be Z when loopback is enabled)
  tri1 sdcka;
  tri1 sdckb;

  rxMapleBus_v1_0 DUT(
    .aclk(ACLK),
    .aresetn(ARESETN),

    // S_AXI_CRTL
    .s_axi_crtl_awaddr(s_axi_crtl_awaddr),
    .s_axi_crtl_awprot(s_axi_crtl_awprot),
    .s_axi_crtl_awvalid(s_axi_crtl_awvalid),
    .s_axi_crtl_awready(s_axi_crtl_awready),
    .s_axi_crtl_wdata(s_axi_crtl_wdata),
    .s_axi_crtl_wstrb(s_axi_crtl_wstrb),
    .s_axi_crtl_wvalid(s_axi_crtl_wvalid),
    .s_axi_crtl_wready(s_axi_crtl_wready),
    .s_axi_crtl_bresp(s_axi_crtl_bresp),
    .s_axi_crtl_bvalid(s_axi_crtl_bvalid),
    .s_axi_crtl_bready(s_axi_crtl_bready),
    .s_axi_crtl_araddr(s_axi_crtl_araddr),
    .s_axi_crtl_arprot(s_axi_crtl_arprot),
    .s_axi_crtl_arvalid(s_axi_crtl_arvalid),
    .s_axi_crtl_arready(s_axi_crtl_arready),
    .s_axi_crtl_rdata(s_axi_crtl_rdata),
    .s_axi_crtl_rresp(s_axi_crtl_rresp),
    .s_axi_crtl_rvalid(s_axi_crtl_rvalid),
    .s_axi_crtl_rready(s_axi_crtl_rready),

    // S_AXIS_TX
    .s_axis_tx_tready(s_axis_tx_tready),
    .s_axis_tx_tdata(s_axis_tx_tdata),
    .s_axis_tx_tstrb(s_axis_tx_tstrb),
    .s_axis_tx_tkeep(s_axis_tx_tkeep),
    .s_axis_tx_tlast(s_axis_tx_tlast),
    .s_axis_tx_tvalid(s_axis_tx_tvalid),

    // M_AXIS_RX
    .m_axis_rx_tvalid(m_axis_rx_tvalid),   // output wire m_axis_tvalid
    .m_axis_rx_tready(m_axis_rx_tready),   // input wire m_axis_tready
    .m_axis_rx_tdata(m_axis_rx_tdata),     // output wire [7 : 0] m_axis_tdata
    .m_axis_rx_tstrb(m_axis_rx_tstrb),     // output wire [0 : 0] m_axis_tstrb
    .m_axis_rx_tkeep(m_axis_rx_tkeep),     // output wire [0 : 0] m_axis_tkeep
    .m_axis_rx_tlast(m_axis_rx_tlast),      // output wire m_axis_tlast

    // SDCKX
    .sdcka(sdcka),
    .sdckb(sdckb)
  );

  initial begin
    ACLK = 1'b0;
    forever begin
      ACLK = #5 ~ACLK; // Simulate a 100MHz source
    end
  end

  initial begin
    ARESETN = 1'b0;
    repeat (16) @(posedge ACLK);
    #1;
    ARESETN = 1'b1;
    repeat (1000) @(posedge ACLK);
    $finish;
  end

  assign m_axis_rx_tready = ARESETN;

  //=============Internal Constants======================
  parameter SIZE = 3;
  parameter IDLE = 3'b001, WRITING = 3'b010, DONE = 3'b100;
  //=============Internal Variables======================
  reg   [SIZE-1:0]          current_state;
  reg   [SIZE-1:0]          next_state;
  reg   [7:0]               count;

  always @ (posedge ACLK) begin: FSM_SEQ
    if (ARESETN == 1'b0) begin
      current_state <= IDLE;
    end else begin
      current_state <= next_state;
    end
  end

  always @(*) begin: FSM_COMBO
    case (current_state)
      IDLE:
        next_state = WRITING;
      WRITING:
        if (count < 4)
          next_state = WRITING;
        else
          next_state = DONE;
      DONE:
        next_state = DONE;
      default:
        next_state = IDLE;
    endcase
  end

  assign s_axis_tx_tstrb = 1;
  assign s_axis_tx_tkeep = 1;
  assign s_axis_tx_tdata = count + 2;
  assign s_axis_tx_tlast = (current_state == WRITING) & (count == 4);

  // -----------------------------------------
  // Register outputs
  // -----------------------------------------

  // S_AXI_CTRL

  always @(posedge ACLK) begin: S_AXI_CTRL_DUMMY
    s_axi_crtl_awaddr = 0;
    s_axi_crtl_awprot = 0;
    s_axi_crtl_awvalid = 0;
    s_axi_crtl_wdata = 0;
    s_axi_crtl_wstrb = 0;
    s_axi_crtl_wvalid = 0;
    s_axi_crtl_bready = 0;
    s_axi_crtl_araddr = 0;
    s_axi_crtl_arprot = 0;
    s_axi_crtl_arvalid = 0;
    s_axi_crtl_rready = 0;
  end

  always @(posedge ACLK) begin: COUNTER
    if (ARESETN == 1'b0) begin
      count <= 0;
    end else begin
      if (next_state == WRITING) begin
        if (s_axis_tx_tready) begin
          // FIFO is ready to accept data
          count <= count + 8'd1;
        end else begin
          count <= count;
        end
      end else begin
        count <= 0;
      end
    end
  end

  always @(posedge ACLK) begin: TVALID
    if (ARESETN == 1'b0) begin
      s_axis_tx_tvalid <= 0;
    end else begin
      if (next_state == WRITING) begin
        // TDATA has valid data now
        s_axis_tx_tvalid <= 1;
      end else begin
        s_axis_tx_tvalid <= 0;
      end
    end
  end

endmodule
