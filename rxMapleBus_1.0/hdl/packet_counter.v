`timescale 1 ps / 1 ps

// This module exists because the FIFO does not provide a way of counting the number
// of packets it contains. So we have to manually count them.
module packet_counter #
  (
    // Parameters of Axi Slave Bus Interface S_AXI_CRTL
    parameter integer C_DATA_COUNT_WIDTH		= 11
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
    
    output wire [C_DATA_COUNT_WIDTH-1 : 0] AXIS_PACKET_COUNT

  );
  
  wire aclk = AXIS_ACLK;
  wire aresetn = AXIS_ARESETN;
  
  //=============Internal Constants======================
  parameter SIZE = 1;

  parameter IDLE     = 1'b1 << 0;

  //=============Internal Variables======================
  reg   [SIZE-1:0]          current_state;
  reg   [SIZE-1:0]          next_state;
  
  reg [C_DATA_COUNT_WIDTH:0] packets;
  assign AXIS_PACKET_COUNT = packets;

  initial begin
    packets <= 0;
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
        next_state = IDLE;
      default:
        next_state = IDLE;
    endcase 
  end

  // -----------------------------------------
  // Register outputs
  // -----------------------------------------
  
  assign increment = (S_AXIS_TREADY && S_AXIS_TLAST && S_AXIS_TVALID);
  assign decrement = (M_AXIS_TREADY && M_AXIS_TLAST && M_AXIS_TVALID);

  always @(posedge aclk) begin: COUNTER
    if (aresetn == 1'b0) begin
      packets <= 0;
    end else begin
      if (increment && decrement)
        packets <= packets; // Null op
      else if (increment)
        packets <= packets + 1;
      else if (decrement)
        packets <= packets - 1;
      else begin
        packets <= packets;
      end
    end
  end




endmodule
