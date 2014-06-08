module transmitter #
  (
    // AXI4Stream sink: Data Width
    parameter integer C_S_AXIS_TDATA_WIDTH  = 8
  )
  (
    // AXI4Stream sink: Clock
    input wire  S_AXIS_ACLK,
    // AXI4Stream sink: Reset
    input wire  S_AXIS_ARESETN,
    // Ready to accept data in
    output wire  S_AXIS_TREADY,
    // Data in
    input wire [C_S_AXIS_TDATA_WIDTH-1 : 0] S_AXIS_TDATA,
    // Byte qualifier
    input wire [(C_S_AXIS_TDATA_WIDTH/8)-1 : 0] S_AXIS_TSTRB, // We don't actually use this
    // Indicates boundary of last packet
    input wire  S_AXIS_TLAST,
    // Data is in valid
    input wire  S_AXIS_TVALID,

    // SDCKX
    output reg SDCKA, SDCKB,
    // Enable transmission
    input wire ENABLE,
    // Indicates the transmitter is busy
    output wire TRANSMITTING
  );

  // ================ Create modules ==================

  wire sfe_sdcka, sfe_sdckb, enable_sfe, sfe_done;
  frame_pattern_encoder #(.TICKS(4)) sfe(S_AXIS_ACLK, S_AXIS_ARESETN, enable_sfe, sfe_done, sfe_sdcka, sfe_sdckb);
  
  wire de_sdcka, de_sdckb, de_done, de_next;
  data_encoder de(S_AXIS_ACLK, S_AXIS_ARESETN, sfe_done, de_done, de_sdcka, de_sdckb, S_AXIS_TVALID, S_AXIS_TREADY, S_AXIS_TLAST, S_AXIS_TDATA);

  wire efe_sdcka, efe_sdckb, efe_done;
  frame_pattern_encoder #(.TICKS(2)) efe(S_AXIS_ACLK, S_AXIS_ARESETN, de_done, efe_done, efe_sdckb, efe_sdcka);

  //=============Internal Constants======================
  parameter SIZE = 5;

  parameter IDLE              = 5'b00001;
  parameter START             = 5'b00010;
  parameter SEND_START_FRAME  = 5'b00100;
  parameter SEND_DATA         = 5'b01000;
  parameter SEND_END_FRAME    = 5'b10000;

  //=============Internal Variables======================
  reg [SIZE-1:0]         current_state;
  reg [SIZE-1:0]         next_state;

  initial begin
    current_state <= IDLE;
  end

  always @ (posedge S_AXIS_ACLK) begin: FSM_SEQ 
    if (S_AXIS_ARESETN == 1'b0)
      current_state <= IDLE;
    else
      current_state <= next_state;
  end
  
  always @(*) begin: FSM_COMBO
    case (current_state)
      IDLE:
        if (ENABLE && S_AXIS_TVALID)
          next_state = START; 
        else
          next_state = IDLE;
      START:
        next_state = SEND_START_FRAME;
      SEND_START_FRAME:
        if (sfe_done)
          next_state = SEND_DATA;
        else
          next_state = SEND_START_FRAME;
      SEND_DATA:
        if (de_done)
          next_state = SEND_END_FRAME;
        else
          next_state = SEND_DATA;
      SEND_END_FRAME:
        if (efe_done)
          next_state = IDLE;
        else
          next_state = SEND_END_FRAME;
      default:
        next_state = IDLE;
    endcase 
  end

  // -----------------------------------------
  // Assign outputs
  // -----------------------------------------

  assign enable_sfe = (current_state == START);
  assign TRANSMITTING = (current_state != IDLE);

  always @(*) begin: SDCK_OUTPUT
    case (current_state)
      SEND_START_FRAME: begin
        SDCKA = sfe_sdcka;
        SDCKB = sfe_sdckb;
      end

      SEND_DATA: begin
        SDCKA = de_sdcka;
        SDCKB = de_sdckb;
      end

      SEND_END_FRAME: begin
        SDCKA = efe_sdcka;
        SDCKB = efe_sdckb;
      end

      default: begin
        SDCKA = 1'b1;
        SDCKB = 1'b1;
      end
    endcase
  end


  // -----------------------------------------
  // Register outputs
  // -----------------------------------------

endmodule