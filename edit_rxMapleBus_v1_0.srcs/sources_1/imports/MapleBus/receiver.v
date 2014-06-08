module receiver(
  input wire clk, reset,
  input wire sdcka, sdckb,

  output reg busy,
  output wire write,
  output wire [7:0] data);

  // Create the synchronizer
  wire sdcka_data, sdcka_posedge, sdcka_negedge, sdckb_data, sdckb_posedge, sdckb_negedge;
  synchronizer sync(clk, sdcka, sdckb, sdcka_data, sdcka_posedge, sdcka_negedge, sdckb_data, sdckb_posedge, sdckb_negedge);
  
  // Create a start frame decoder
  wire start_frame, start_with_crc, start_occupancy, start_reset, start_frame_error;
  
  start_frame_decoder sfd(clk, reset, sdcka_posedge, sdcka_negedge, sdckb_posedge, sdckb_negedge, start_frame, start_with_crc, start_occupancy, start_reset, start_frame_error);
  
  // Create the data decoder
  data_decoder decoder(clk, reset, busy, sdcka_data, sdcka_posedge, sdcka_negedge, sdckb_data, sdckb_posedge, sdckb_negedge, data, write);

  // Create an end frame decoder
  wire end_frame, end_frame_error;
  
  end_frame_decoder efd(clk, reset, sdcka_posedge, sdcka_negedge, sdckb_posedge, sdckb_negedge, end_frame, end_frame_error);
  
  //=============Internal Constants======================
  parameter SIZE = 2;
  parameter IDLE = 2'b01, ENABLED = 2'b10;
  //=============Internal Variables======================
  reg  [SIZE-1:0]         current_state;
  reg [SIZE-1:0]          next_state;

  initial begin
    current_state <= IDLE;
    busy <= 0;
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
        if (start_frame || start_with_crc || start_reset)
           next_state = ENABLED; 
        else
          next_state = IDLE;
      ENABLED:
        if (start_frame || start_with_crc || start_reset)
          next_state = IDLE; // ignore a frame if two start patterns are detected
        else if (end_frame || end_frame_error)
          next_state = IDLE;
        else
          next_state = ENABLED;
      default:
        next_state = IDLE;
    endcase 
  end

  // -----------------------------------------
  // Register outputs
  // -----------------------------------------

  always @(posedge clk or negedge reset) begin: FRAME_OUTPUT
    if (reset == 1'b0) begin
      busy <= 0;
    end
    else begin
      case (next_state)
        IDLE: busy <= 0;
        ENABLED: busy <= 1;
        default: busy <= 0;
      endcase
    end
  end
endmodule