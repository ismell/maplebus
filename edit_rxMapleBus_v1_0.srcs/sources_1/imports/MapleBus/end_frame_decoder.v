//////////////////////
// End frame decoder

module end_frame_decoder(
  input wire clk, reset,
  input wire sdcka_posedge, sdcka_negedge,
  input wire sdckb_posedge, sdckb_negedge,
  output reg end_frame, end_frame_error
  );

  //=============Internal Constants======================
  parameter SIZE = 3;
  parameter IDLE = 3'b001, COUNTING = 3'b010, DONE = 3'b100;
  //=============Internal Variables======================
  reg   [SIZE-1:0]          current_state;
  reg   [SIZE-1:0]          next_state;
   
  reg [7:0] count;

  initial begin
    count <= 0;
    current_state <= IDLE;
    end_frame <= 0;
    end_frame_error <= 0;
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
        if (sdckb_negedge) begin
           next_state = COUNTING; 
        end else begin
          next_state = IDLE;
        end
      COUNTING:
        if (sdckb_posedge) begin
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

  always @(posedge clk or negedge reset) begin: COUNTER
    if (reset == 1'b0) begin
      count <= 0;
    end else begin
      if (next_state == COUNTING) begin
        if (sdcka_negedge) begin
          count <= count + 8'd1;
        end else begin
          count <= count;
        end
      end else begin
        count <= 0;
      end
    end
  end

  always @(posedge clk or negedge reset) begin: OUTPUT
    if (reset == 1'b0) begin
      end_frame <= 0;
      end_frame_error <= 0;
    end else begin
      end_frame <= 0;
      end_frame_error <= 0;
      
      if (next_state == DONE) begin
        case (count)
          8'd0: begin end
          8'd1: begin end
          8'd2: end_frame <= 1;
          default: end_frame_error <= 1;
        endcase
      end
    end
  end
endmodule