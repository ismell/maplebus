module transmitter(
  input wire clk, reset,
  input wire enable,
  output wire busy,
  
  output reg sdcka, sdckb,

  input wire empty, // Master FIFO is empty
  input wire [7:0] data,// Master FIFO data
  output wire next
  );

  // ================ Create modules ==================

  wire sfe_sdcka, sfe_sdckb, enable_sfe, sfe_done;
  frame_pattern_encoder #(.TICKS(4)) sfe(clk, reset, enable_sfe, sfe_done, sfe_sdcka, sfe_sdckb);
  
  wire de_sdcka, de_sdckb, de_done, de_next;
  data_encoder de(clk, reset, sfe_done, de_done, de_sdcka, de_sdckb, de_next, empty, data);

  wire efe_sdcka, efe_sdckb, efe_done;
  frame_pattern_encoder #(.TICKS(2)) efe(clk, reset, de_done, efe_done, efe_sdckb, efe_sdcka);

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

  always @ (posedge clk or negedge reset) begin: FSM_SEQ 
    if (reset == 1'b0)
      current_state <= IDLE;
    else
      current_state <= next_state;
  end
  
  always @(*) begin: FSM_COMBO
    case (current_state)
      IDLE:
        if (enable)
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
  assign next = de_next;
  assign busy = (current_state != IDLE);

  always @(*) begin: SDCK_OUTPUT
    case (current_state)
      SEND_START_FRAME: begin
        sdcka = sfe_sdcka;
        sdckb = sfe_sdckb;
      end

      SEND_DATA: begin
        sdcka = de_sdcka;
        sdckb = de_sdckb;
      end

      SEND_END_FRAME: begin
        sdcka = efe_sdcka;
        sdckb = efe_sdckb;
      end

      default: begin
        sdcka = 1'b1;
        sdckb = 1'b1;
      end
    endcase
  end


  // -----------------------------------------
  // Register outputs
  // -----------------------------------------

endmodule