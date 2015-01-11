`timescale 1 ps / 1 ps

// This module exists because the FIFO does not provide a way of counting the number
// of packets it contains. So we have to manually count them.
module packet_counter #
  (
    // Parameters of Axi Slave Bus Interface S_AXI_CRTL
    parameter integer C_DATA_COUNT_WIDTH		= 11,
    parameter integer C_TOTAL_COUNT_WIDTH		= 16
  )
  (
    input wire AXIS_ACLK,
    input wire AXIS_ARESETN,
    
    input wire S_AXIS_TREADY,
    input wire S_AXIS_TLAST,
    input wire S_AXIS_TVALID,
    
    input wire M_AXIS_TREADY,
    input wire M_AXIS_TLAST,
    input wire M_AXIS_TVALID,
    
    output reg [C_DATA_COUNT_WIDTH-1 : 0] AXIS_PACKET_COUNT,
    output reg [C_TOTAL_COUNT_WIDTH-1 : 0] AXIS_TOTAL_PACKET_COUNT,
    
    input wire ENABLE_IRQ,
    input wire CLEAR_IRQ,
    output wire IRQ
  );
  
  wire aclk = AXIS_ACLK;
  wire aresetn = AXIS_ARESETN;
  
  //=============Internal Constants======================
  localparam SIZE = 2;

  localparam IDLE     = 2'b1 << 0;
  localparam ASSERTED = 2'b1 << 1;

  //=============Internal Variables======================
  reg   [SIZE-1:0]          current_state;
  reg   [SIZE-1:0]          next_state;
  
  wire increment = (S_AXIS_TREADY && S_AXIS_TLAST && S_AXIS_TVALID);
  wire decrement = (M_AXIS_TREADY && M_AXIS_TLAST && M_AXIS_TVALID);

  initial begin
    AXIS_PACKET_COUNT <= 0;
    AXIS_TOTAL_PACKET_COUNT <= 0;
    current_state <= IDLE;
  end

  always @ (posedge aclk) begin: FSM_SEQ 
    if (aresetn == 1'b0) begin
      current_state <= IDLE;
    end else begin
      current_state <= next_state;
    end
  end

  always @(*) begin: FSM_COMBO
    case (current_state)
      IDLE:
        if (ENABLE_IRQ && increment)
          next_state = ASSERTED;
        else
          next_state = IDLE;
      ASSERTED:
        if (CLEAR_IRQ)
          next_state = IDLE;
        else
          next_state = ASSERTED;
      default:
        next_state = IDLE;
    endcase 
  end
  
  assign IRQ = (current_state == ASSERTED);

  // -----------------------------------------
  // Register outputs
  // -----------------------------------------

  always @(posedge aclk) begin: COUNTER
    if (aresetn == 1'b0) begin
      AXIS_PACKET_COUNT <= 0;
    end else begin
      if (increment && decrement)
        AXIS_PACKET_COUNT <= AXIS_PACKET_COUNT; // Null op
      else if (increment)
        AXIS_PACKET_COUNT <= AXIS_PACKET_COUNT + 1;
      else if (decrement)
        AXIS_PACKET_COUNT <= AXIS_PACKET_COUNT - 1;
      else begin
        AXIS_PACKET_COUNT <= AXIS_PACKET_COUNT;
      end
    end
  end
  
  always @(posedge aclk) begin: TOTAL_COUNTER
    if (aresetn == 1'b0) begin
      AXIS_TOTAL_PACKET_COUNT <= 0;
    end else begin
      if (increment)
        AXIS_TOTAL_PACKET_COUNT <= AXIS_TOTAL_PACKET_COUNT + 1;
      else begin
        AXIS_TOTAL_PACKET_COUNT <= AXIS_TOTAL_PACKET_COUNT;
      end
    end
  end
endmodule
