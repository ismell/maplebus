`default_nettype none
//////////////////////
// Data decoder

module data_decoder(
  input wire aclk,
  input wire aresetn,
  input wire enable,
  input wire sdcka_data, sdcka_posedge, sdcka_negedge,
  input wire sdckb_data, sdckb_posedge, sdckb_negedge,
  output reg [7:0] tdata,
  output reg tvalid
  );

  //=============Internal Constants======================
  parameter SIZE = 5;
  parameter IDLE        = 6'b000001,
            PHASE1      = 6'b000010,
            PHASE1_DONE = 6'b000100,
            PHASE2      = 6'b001000,
            PHASE2_DONE = 6'b010000;
  //=============Internal Variables======================
  reg   [SIZE-1:0]          current_state;
  reg   [SIZE-1:0]          next_state;

  reg [2:0] count;
  reg [7:0] buffer;

  initial begin
    current_state <= IDLE;
    count <= 0;
    buffer <= 0;
    tdata <= 0;
    tvalid <= 0;
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
        if (enable) begin // enable and sdcka_negedge can both trigger at once
          if (sdcka_negedge) begin
            next_state = PHASE1_DONE;
          end else begin
            next_state = PHASE1;
          end
        end else begin
          next_state = IDLE;
        end
      PHASE1:
        if (enable) begin
          if (sdcka_negedge) begin
            next_state = PHASE1_DONE;
          end else begin
            next_state = PHASE1;
          end
        end else begin
          next_state = IDLE;
        end
      PHASE1_DONE:
        if (enable) begin
          next_state = PHASE2;
        end else begin
          next_state = IDLE;
        end
      PHASE2:
        if (enable) begin
           if (sdckb_negedge) begin
            next_state = PHASE2_DONE;
          end else begin
            next_state = PHASE2;
          end
        end else begin
          next_state = IDLE;
        end
      PHASE2_DONE:
        if (enable) begin
          next_state = PHASE1;
        end else begin
          next_state = IDLE;
        end
      default:
        next_state = IDLE;
    endcase
  end

  // -----------------------------------------
  // Register outputs
  // -----------------------------------------

  always @(posedge aclk) begin: COUNTER
    if (aresetn == 1'b0) begin
      count <= 0;
    end else begin
      case (next_state)
        IDLE:
          count <= 3'd0;
        PHASE1:
          count <= count;
        PHASE1_DONE:
          count <= count + 3'd1;
        PHASE2:
          count <= count;
        PHASE2_DONE:
          count <= count + 3'd1;
        default:
          count <= 3'd0;
      endcase
    end
  end

  always @(posedge aclk) begin: BUFFER
    if (aresetn == 1'b0) begin
      buffer <= 0;
    end else begin
      case (next_state)
        IDLE:
          buffer <= 0;
        PHASE1:
          buffer <= buffer;
        PHASE1_DONE:
          buffer <= {buffer[6:0], sdckb_data};
        PHASE2:
          buffer <= buffer;
        PHASE2_DONE:
          buffer <= {buffer[6:0], sdcka_data};
        default:
          buffer <= 0;
      endcase
    end
  end
  
  always @(posedge aclk) begin: TDATA
    if (aresetn == 1'b0) begin
      tdata <= 0;
    end else begin
      case (next_state)
        IDLE:
          tdata <= 0;
        PHASE2_DONE:
          if (count == 3'd7) begin
            tdata <= {buffer[6:0], sdcka_data};
          end else begin
            tdata <= tdata;
          end
        default:
          tdata <= tdata;
      endcase
    end
  end

  always @(posedge aclk) begin: TVALID
    if (aresetn == 1'b0) begin
      tvalid <= 0;
    end else begin
      case (next_state)
        PHASE2_DONE:
          if (count == 3'd7) begin
            tvalid <= 1'd1;
          end else begin
            tvalid <= 0;
          end
        default:
          tvalid <= 0;
      endcase
    end
  end
endmodule
