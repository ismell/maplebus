module fifo_in(
  input clk,
  output clk_out,
  input reset,
  
  input flagd,  //  EP6 full flag
  input flaga,  //  EP2 empty flag
  
  inout [7:0] fdata,  
  output wire [1:0] faddr,  
  output wire sloe,
  output wire slrd,
  output reg slwr,
  output reg pkt_end
);

wire full = flagd;
wire empty = flaga;
reg [7:0] data_out;
assign clk_out = clk;

/*
FIFOADR[1:0] Selected FIFO
	00 EP2
	01 EP4
	10 EP6
	11 EP8
*/
assign faddr = 2'b10;
assign sloe = 1'b1;
assign slrd = 1'b1;
assign fdata[7:0] = data_out[7:0];

parameter IDLE        = 6'b000001;
parameter SELECT_FIFO = 6'b000010;
parameter IS_FULL     = 6'b000100;
parameter SETUP_DATA  = 6'b001000;
parameter WRITE       = 6'b010000;
parameter PKTEND      = 6'b100000;

reg [5:0] current_state;
reg [5:0] next_state;

initial begin
	next_state = IDLE;
	slwr <= 1'b1;
	pkt_end <= 1'b1;
end

//Stream IN mode state machine 
always @(posedge clk, negedge reset)
begin
  if (reset == 1'b0)
    current_state <= IDLE;
  else
    current_state <= next_state;
end


//data generator counter
always @(posedge clk, negedge reset)
begin
  if (reset == 1'b0)
    data_out <= 8'd0;
  else if (next_state == SETUP_DATA)
    data_out <= data_out + 8'd1;
  else if (next_state == PKTEND)
	 data_out <= 8'd0;
end

// state machine combo
always @ (*)
begin
  case(current_state)
    IDLE: begin
		next_state = SELECT_FIFO;
    end
	 SELECT_FIFO: begin
		next_state = IS_FULL;
	 end
	 IS_FULL: begin
		if (full == 1'b0) // We are full
        next_state = IS_FULL;
      else
        next_state = SETUP_DATA;
	 end
	 SETUP_DATA: begin
		next_state = WRITE;
	 end
    WRITE: begin
		if (data_out == 8'haa)
			next_state = PKTEND;
		else
			next_state = IS_FULL;
    end
	 PKTEND: begin
		next_state = IDLE;
	 end
    default: 
      next_state = IDLE;
  endcase
end

//write control signal generation
// register SLWR so it doesn't glitch
always @(posedge clk)
begin
	case (next_state)
		WRITE:
			slwr <= 1'b0; // Write Strobe
		default:
			slwr <= 1'b1; 
	endcase
end

// register pkt_end so it doesn't glitch
always @(posedge clk)
begin
	case (next_state)
		PKTEND:
			pkt_end <= 1'b0;
		default:
			pkt_end <= 1'b1; 
	endcase
end

endmodule
