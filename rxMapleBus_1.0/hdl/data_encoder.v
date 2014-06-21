module data_encoder(
  input wire clk,
  input wire reset,
  input wire enable,
  output wire done,
  output reg sdcka,
  output reg sdckb,

  input wire  S_AXIS_TVALID,
  output wire S_AXIS_TREADY,
  input wire S_AXIS_TLAST,
  input wire [7:0] S_AXIS_TDATA
);

  parameter SIZE = 15;

  //TODO: All this will have to be changed anyway
  // All the hold states are so we can output a 2mhz signal
  parameter IDLE                = 15'b1 << 0;
  parameter PHASE1_SETUP_1      = 15'b1 << 1;
  parameter PHASE1_SETUP_2      = 15'b1 << 2;
  parameter PHASE1_DATA_1       = 15'b1 << 3;
  parameter PHASE1_DATA_2       = 15'b1 << 4;
  parameter PHASE1_HOLD_1       = 15'b1 << 5;
  parameter PHASE1_HOLD_2       = 15'b1 << 6;
  parameter PHASE2_SETUP_1      = 15'b1 << 7;
  parameter PHASE2_SETUP_2      = 15'b1 << 8;
  parameter PHASE2_DATA_1       = 15'b1 << 9;
  parameter PHASE2_DATA_2       = 15'b1 << 10;
  parameter PHASE2_HOLD_1       = 15'b1 << 11;
  parameter PHASE2_HOLD_2       = 15'b1 << 12;
  parameter DONE_1              = 15'b1 << 13;
  parameter DONE_2              = 15'b1 << 14;

  reg [SIZE-1:0] current_state;
  reg [SIZE-1:0] next_state;

  reg [2:0] pointer;
  reg [0:7] buffer; // Our pointer counts up

  wire current_bit;
  reg last;

  initial begin
    current_state <= IDLE;
    pointer <= 0;
    sdcka <= 1;
    sdckb <= 1;
    buffer <= 0;
    last <= 0;
  end

  //Stream IN mode state machine 
  always @(posedge clk)
  begin
    if (reset == 1'b0)
      current_state <= IDLE;
    else
      current_state <= next_state;
  end

  // state machine combo
  always @ (*)
  begin
    case(current_state)
      IDLE:
        if (enable)
          next_state = PHASE1_SETUP_1;
        else
          next_state = IDLE;
      PHASE1_SETUP_1:
        if (pointer == 0 && !S_AXIS_TVALID) begin
          next_state = PHASE1_SETUP_1; // Wait until we get valid data
        end else begin
          next_state = PHASE1_SETUP_2;
        end
      PHASE1_SETUP_2:
        next_state = PHASE1_DATA_1;
      PHASE1_DATA_1:
        next_state = PHASE1_DATA_2;
      PHASE1_DATA_2:
        next_state = PHASE1_HOLD_1;
      PHASE1_HOLD_1:
        next_state = PHASE1_HOLD_2;
      PHASE1_HOLD_2:
        next_state = PHASE2_SETUP_1;

      PHASE2_SETUP_1:
        next_state = PHASE2_SETUP_2;
      PHASE2_SETUP_2:
        next_state = PHASE2_DATA_1;
      PHASE2_DATA_1:
        next_state = PHASE2_DATA_2;
      PHASE2_DATA_2:
        next_state = PHASE2_HOLD_1;
      PHASE2_HOLD_1:
        next_state = PHASE2_HOLD_2;
      PHASE2_HOLD_2:
        if (pointer == 0 && last) // TOOD: I think this might fail
          next_state = DONE_1;
        else
          next_state = PHASE1_SETUP_1;
      DONE_1:
        next_state = DONE_2;
      DONE_2:
        next_state = IDLE;
      default: 
        next_state = IDLE;
    endcase
  end

  // ------------------------------------------
  // Assign outputs
  // -----------------------------------------

  assign current_bit = buffer[pointer +: 1];
  assign done = (current_state == DONE_2 ? 1'b1 : 1'b0);
  assign S_AXIS_TREADY = (current_state == PHASE1_SETUP_1 && pointer == 0);

  // ------------------------------------------
  // Register outputs
  // -----------------------------------------
    
  always @(posedge clk)
  begin
    if (reset == 1'b0) begin
      buffer <= 0;
      last <= 0;
    end
    else begin
      case (next_state)
        IDLE: begin
          buffer <= 0;
          last <= 0;
        end
        PHASE1_SETUP_1:
          if (pointer == 0 && S_AXIS_TVALID) begin
            buffer <= S_AXIS_TDATA;
            last <= S_AXIS_TLAST;
          end else begin
            buffer <= buffer;
            last <= last;
          end
        default: begin
          buffer <= buffer;
          last <= last;
        end
      endcase
    end
  end

  always @(posedge clk)
  begin
    if (reset == 1'b0) begin
      pointer <= 0;
    end
    else begin
      case (next_state)
        IDLE:
          pointer <= 0;
        PHASE1_HOLD_1:
          pointer <= pointer + 3'b1;
        PHASE2_HOLD_1:
          pointer <= pointer + 3'b1;
        default:
          pointer <= pointer;
      endcase
    end
  end

  // SDCK Address
  always @(posedge clk)
  begin
    if (reset == 1'b0) begin
      sdcka <= 1'b1;
      sdckb <= 1'b1;
    end
    else begin
      case (next_state)
        PHASE1_SETUP_1: begin
          sdcka <= 1'b1;
          sdckb <= sdckb;
        end
        PHASE1_SETUP_2: begin
          sdcka <= 1'b1;
          sdckb <= sdckb;
        end
        PHASE1_DATA_1: begin
          sdcka <= 1'b1;
          sdckb <= current_bit;
        end
        PHASE1_DATA_2: begin
          sdcka <= 1'b1;
          sdckb <= sdckb;
        end
        PHASE1_HOLD_1: begin
          sdcka <= 1'b0;
          sdckb <= sdckb;
        end
        PHASE1_HOLD_2: begin
          sdcka <= 1'b0;
          sdckb <= sdckb;
        end

        PHASE2_SETUP_1: begin
          sdcka <= sdcka;
          sdckb <= 1'b1;
        end
        PHASE2_SETUP_2: begin
          sdcka <= sdcka;
          sdckb <= 1'b1;
        end
        PHASE2_DATA_1: begin
          sdcka <= current_bit;
          sdckb <= 1'b1;
        end
        PHASE2_DATA_2: begin
          sdcka <= sdcka;
          sdckb <= 1'b1;
        end
        PHASE2_HOLD_1: begin
          sdcka <= sdcka;
          sdckb <= 1'b0;
        end
        PHASE2_HOLD_2: begin
          sdcka <= sdcka;
          sdckb <= 1'b0;
        end

        DONE_1: begin
          sdcka <= 1'b1;
          sdckb <= 1'b0;
        end
        DONE_2: begin
          sdcka <= 1'b1;
          sdckb <= 1'b0;
        end

        default: begin
          sdcka <= 1'b1;
          sdckb <= 1'b1;
        end
      endcase
    end
  end
endmodule
