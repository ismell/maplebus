`timescale 1 ns / 1 ps
`default_nettype none

// lib IP_Integrator_Lib
module rxMapleBusLoopBackTest;
  reg ACLK;
  reg ARESETN;

  // Ports of Axi Slave Bus Interface S_AXIS_TX
  wire  s_axis_tx_tready;
  wire [7:0] s_axis_tx_tdata;
  wire [0:0] s_axis_tx_tstrb;
  wire  s_axis_tx_tlast;
  reg  s_axis_tx_tvalid;

  wire  m_axis_rx_tready;
  wire [7:0] m_axis_rx_tdata;
  wire [0:0] m_axis_rx_tstrb;
  wire  m_axis_rx_tlast;
  wire  m_axis_rx_tvalid;

  rxMapleBus_v1_0 DUT(
      .aclk(ACLK),
      .aresetn(ARESETN),
      .s_axis_tx_tready(s_axis_tx_tready),
      .s_axis_tx_tdata(s_axis_tx_tdata),
      .s_axis_tx_tstrb(s_axis_tx_tstrb),
      .s_axis_tx_tlast(s_axis_tx_tlast),
      .s_axis_tx_tvalid(s_axis_tx_tvalid),

      .m_axis_rx_tvalid(m_axis_rx_tvalid),   // output wire m_axis_tvalid
      .m_axis_rx_tready(m_axis_rx_tready),   // input wire m_axis_tready
      .m_axis_rx_tdata(m_axis_rx_tdata),     // output wire [7 : 0] m_axis_tdata
      .m_axis_rx_tstrb(m_axis_rx_tstrb),     // output wire [0 : 0] m_axis_tstrb
      .m_axis_rx_tlast(m_axis_rx_tlast)      // output wire m_axis_tlast
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
  assign s_axis_tx_tdata = count;
  assign s_axis_tx_tlast = (current_state == WRITING) & (count == 4);

  // -----------------------------------------
  // Register outputs
  // -----------------------------------------

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
