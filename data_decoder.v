//////////////////////
// Data decoder

module data_decoder(
	input wire clk,
   	input wire reset,
    input wire sdcka_data, sdcka_posedge, sdcka_negedge,
    input wire sdckb_data, sdckb_posedge, sdckb_negedge,
    output reg [7:0] data, 
    output reg ready);

//=============Internal Constants======================
parameter SIZE = 4;
parameter IDLE = 4'b0001, PHASE1 = 4'b0010, PHASE2 = 4'b0100, DONE = 4'b1000;
//=============Internal Variables======================
reg   [SIZE-1:0]          state        ;// Seq part of the FSM
 
reg [7:0] count;
reg [7:0] buffer;

initial begin
	count = 0;
    state = IDLE;
    buffer = 0;
    data = 0;
    ready = 0;
end

always @ (posedge clk)
begin
	if (reset) begin
    	count <= 0;
        state <= PHASE1;
        buffer <= 0;
        data <= 0;
        ready <= 0;
    end else begin
		ready <= 0;
    	if (state == PHASE1) begin
        	if (sdcka_negedge) begin
            	buffer <= {buffer[6:0], sdckb_data};
                count <= count + 8'd1;
                state <= PHASE2;
            end
        end else if (state == PHASE2) begin
            if (sdckb_negedge) begin
                state <= PHASE1;
                
                if (count == 7) begin
                	data <= {buffer[6:0], sdcka_data};
                    ready <= 1;
                    count <= 0;
                 end else begin
                 	buffer <= {buffer[6:0], sdcka_data};
                	count <= count + 8'd1;
                end
            end
        end
    end
end

endmodule