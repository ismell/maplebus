module data_encoder(
  input wire clk,
  input wire reset,
  input wire enable,
  input wire done,
  output reg sdcka,
  output reg sdckb,
  output reg next,
  input wire empty, // Master FIFO is Empty
  input wire [7:0] data
);

  parameter SIZE = 12;

  // All the hold states are so we can output a 2mhz signal
  parameter IDLE               = 12'b000000000001;
  parameter PHASE1_SETUP       = 12'b000000000010;
  parameter PHASE1_DATA        = 12'b000000000100;
  parameter PHASE1_TICK        = 12'b000000001000;
  parameter PHASE1_TICK_HOLD_1 = 12'b000000010000;
  parameter PHASE1_TICK_HOLD_2 = 12'b000000100000;
  parameter PHASE2_SETUP       = 12'b000001000000;
  parameter PHASE2_DATA        = 12'b000010000000;
  parameter PHASE2_TOCK        = 12'b000100000000;
  parameter PHASE2_TOCK_HOLD_1 = 12'b001000000000;
  parameter PHASE2_TOCK_HOLD_2 = 12'b010000000000;
  parameter DONE               = 12'b100000000000;

  reg [SIZE-1:0] current_state;
  reg [SIZE-1:0] next_state;

  reg [2:0] pointer;
  reg [0:7] buffer; // Our pointer counts up

  reg current_bit;

  initial begin
    current_state <= IDLE;
    pointer <= 0;
    next <= 0;
    sdcka <= 1;
    sdckb <= 1;
    buffer <= 0;
  end

  //Stream IN mode state machine 
  always @(posedge clk, negedge reset)
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
          next_state = PHASE1_SETUP;
        else
          next_state = IDLE;
      PHASE1_SETUP:
        next_state = PHASE1_DATA;
      PHASE1_DATA:
        next_state = PHASE1_TICK;
      PHASE1_TICK:
        next_state = PHASE1_TICK_HOLD_1;
      PHASE1_TICK_HOLD_1:
        next_state = PHASE1_TICK_HOLD_2;
      PHASE1_TICK_HOLD_2:
        next_state = PHASE2_SETUP;

      PHASE2_SETUP:
        next_state = PHASE2_DATA;
      PHASE2_DATA:
        next_state = PHASE2_TOCK;
      PHASE2_TOCK:
        next_state = PHASE2_TOCK_HOLD_1;
      PHASE2_TOCK_HOLD_1:
        next_state = PHASE2_TOCK_HOLD_2;
      PHASE2_TOCK_HOLD_2:
        if (pointer == 0 && empty)
          next_state = DONE;
        else
          next_state = PHASE1_SETUP;
      default: 
        next_state = IDLE;
    endcase
  end

  // ------------------------------------------
  // Assign outputs
  // -----------------------------------------

  assign current_bit = buffer[pointer +: 1];
  assign done = (current_state == DONE ? 1'b1 : 1'b0);

  // ------------------------------------------
  // Register outputs
  // -----------------------------------------
    
  always @(posedge clk, negedge reset)
  begin
    if (reset == 1'b0) begin
      buffer <= 0;
    end
    else begin
      case (next_state)
        IDLE:
          buffer <= 0;
        PHASE1_SETUP:
          if (pointer == 0)
            buffer <= data;
          else
            buffer <= buffer;
        default:
          buffer <= buffer;
      endcase
    end
  end

  always @(posedge clk, negedge reset)
  begin
    if (reset == 1'b0) begin
      pointer <= 0;
    end
    else begin
      case (next_state)
        IDLE:
          pointer <= 0;
        PHASE1_TICK:
          pointer <= pointer + 1;
        PHASE2_TOCK:
          pointer <= pointer + 1;
        default:
          pointer <= pointer;
      endcase
    end
  end
  
  always @(posedge clk, negedge reset)
  begin
    if (reset == 1'b0) begin
      next <= 0;
    end
    else begin
      case (next_state)
        PHASE1_DATA:
          if (pointer == 0)
            next <= 1;
          else
          	next <= 0;
        default:
          next <= 0;
      endcase
    end
  end

  // SDCK Address
  always @(posedge clk, negedge reset)
  begin
    if (reset == 1'b0) begin
      sdcka <= 1'b1;
      sdckb <= 1'b1;
    end
    else begin
      case (next_state)
        PHASE1_SETUP: begin
          sdcka <= 1'b1;
          sdckb <= sdckb;
        end
        PHASE1_DATA: begin
          sdcka <= 1'b1;
          sdckb <= current_bit;
        end
        PHASE1_TICK: begin
          sdcka <= 1'b0;
          sdckb <= sdckb;
        end
        PHASE1_TICK_HOLD_1: begin
          sdcka <= 1'b0;
          sdckb <= sdckb;
        end
        PHASE1_TICK_HOLD_2: begin
          sdcka <= 1'b0;
          sdckb <= sdckb;
        end

        PHASE2_SETUP: begin
          sdcka <= sdcka;
          sdckb <= 1'b1;
        end
        PHASE2_DATA: begin
          sdcka <= current_bit;
          sdckb <= 1'b1;
        end
        PHASE2_TOCK: begin
          sdcka <= sdcka;
          sdckb <= 1'b0;
        end
        PHASE2_TOCK_HOLD_1: begin
          sdcka <= sdcka;
          sdckb <= 1'b0;
        end
        PHASE2_TOCK_HOLD_2: begin
          sdcka <= sdcka;
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
