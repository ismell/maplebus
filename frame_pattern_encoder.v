//////////////////////
// Frame pattern encoder

module frame_pattern_encoder(
  input wire clk, reset,
  input wire enable,
  output reg done,
  output reg sdcka, sdckb
  );

  //=============Internal Constants======================
  parameter TICKS = 0;
  parameter SIZE = 5;
  parameter IDLE     = 5'b00001;
  parameter SETUP_1  = 5'b00010;
  parameter SETUP_2  = 5'b00100;
  parameter COUNTING = 5'b01000;
  parameter DONE     = 5'b10000;

  //=============Internal Variables======================
  reg   [SIZE-1:0]          current_state;
  reg   [SIZE-1:0]          next_state;
   
  reg [7:0] count;
  reg [6:0] delay;

  initial begin
    count <= 0;
    delay <= 6'b111000;
    current_state <= IDLE;
    sdcka <= 1;
    sdckb <= 1;
    done <= 0;
  end

  always @ (posedge clk or negedge reset) begin: FSM_SEQ 
    if (reset == 1'b0) begin
      current_state <= IDLE;
    end else begin
      current_state <= next_state;
    end
  end

  always @(*) begin: FSM_COMBO
    case (current_state)
      IDLE:
        if (enable) begin
           next_state = SETUP_1;
        end else begin
          next_state = IDLE;
        end
      SETUP_1:
        next_state <= SETUP_2;
      SETUP_2:
        next_state <= COUNTING;
      COUNTING:
        if (count == (TICKS * 2) + 1) begin
          next_state = DONE;
        end else begin
          next_state = COUNTING;
        end
      DONE:
        next_state = IDLE;
      default:
        next_state = IDLE;
    endcase 
  end

  // -----------------------------------------
  // Register outputs
  // -----------------------------------------

  // SDCK Address
  always @(posedge clk, negedge reset) begin: SDCK_OUTPUT
    if (reset == 1'b0) begin
      sdcka <= 1'b1;
      sdckb <= 1'b1;
    end
    else begin
      case (next_state)
        COUNTING: begin
          sdcka <= 1'b0;
          sdckb <= delay[5];
        end
        default: begin
          sdcka <= 1'b1;
          sdckb <= 1'b1;
        end
      endcase
    end
  end

  always @(posedge clk or negedge reset) begin: DONE_OUTPUT
    if (reset == 1'b0) begin
      done <= 0;
    end else begin
      if (next_state == DONE) begin
        done <= 1;
      end else begin
        done <= 0;
      end
    end
  end

  always @(posedge clk or negedge reset) begin: DELAY_COUNTER
    if (reset == 1'b0) begin
      delay <= 6'b111000;
    end else begin
      if (next_state == COUNTING) begin
        // Create a rotating shift Register
        delay <= {delay[4:0], delay[5]}; 
      end else begin
        delay <= 6'b111000;
      end
    end
  end

  always @(posedge clk or negedge reset) begin: COUNTER
    if (reset == 1'b0) begin
      count <= 0;
    end else begin
      if (next_state == COUNTING) begin
        if (delay[5] != delay[4]) begin
          count <= count + 8'd1;
        end else begin
          count <= count;
        end
      end else begin
        count <= 0;
      end
    end
  end
endmodule