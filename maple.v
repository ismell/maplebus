`default_nettype none

module maple(
	input wire clk, sdcka, sdckb,
    output reg frame,
    output wire data_ready,
    output wire [7:0] data);

	wire sdcka_data, sdcka_posedge, sdcka_negedge, sdckb_data, sdckb_posedge, sdckb_negedge;
	synchronizer sync(clk, sdcka, sdckb, sdcka_data, sdcka_posedge, sdcka_negedge, sdckb_data, sdckb_posedge, sdckb_negedge);
    
    
    // Create a start frame decoder
    wire start_frame, start_with_crc, start_occupancy, start_reset, start_frame_error;
    
    start_frame_decoder sfd(clk, sdcka_posedge, sdcka_negedge, sdckb_posedge, sdckb_negedge, start_frame, start_with_crc, start_occupancy, start_reset, start_frame_error);
    
    // Create an end frame decoder
    wire end_frame, end_frame_error;
    
    end_frame_decoder efd(clk, sdcka_posedge, sdcka_negedge, sdckb_posedge, sdckb_negedge, end_frame, end_frame_error);
    
    data_decoder decoder(clk, ~frame, sdcka_data, sdcka_posedge, sdcka_negedge, sdckb_data, sdckb_posedge, sdckb_negedge, data, data_ready);
    
    
    //=============Internal Constants======================
	parameter SIZE = 4;
	parameter IDLE = 4'b0001, ENABLED = 4'b0010, PHASE2 = 4'b0100, DONE = 4'b1000;
	//=============Internal Variables======================
	reg  [SIZE-1:0]          state;// Seq part of the FSM
   	reg [SIZE-1:0]          next_state;// Combo part of the FSM
    wire reset;

	initial begin
		state <= IDLE;
	end
    
    always @(*)
    begin: FSM_COMBO
	    next_state = IDLE;
		case(state)
          IDLE:
            if (start_frame || start_with_crc || start_reset)
              next_state = ENABLED;
          ENABLED:
          	if (start_frame || start_with_crc || start_reset)
            	next_state = IDLE; // ignore a frame if two start patterns are detected
            else if (end_frame || end_frame_error)
            	next_state = IDLE;
            else
            	next_state = ENABLED;
        endcase 
    end
    
	always @ (posedge clk)
    begin: FSM_SEQ 
		if (!reset) state <= IDLE;
		else state <= next_state;
        
        case (next_state)
          IDLE: frame <= 0;
          ENABLED: frame <= 1;
          default: frame <= 0;
      	endcase
	end
endmodule