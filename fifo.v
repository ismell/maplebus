module fifo(
  input wire clk,
  input wire reset,
  
  input wire menable, // master enabled
  input wire mready, // master data ready
  input wire [7:0] mdata, // master data
  
  input wire flagd,  //  EP6 full flag
  input wire flaga,  //  EP2 empty flag
  
  inout wire [7:0] fdata,  
  output wire [1:0] faddr,  
  output wire sloe,
  output wire slrd,
  output reg slwr,
  output reg pkt_end
);

wire full = flagd;
wire empty = flaga;
reg [7:0] data_out;

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

parameter IDLE        = 8'b00000001;
parameter SELECT_FIFO = 8'b00000010;
parameter IS_FULL     = 8'b00000100;
parameter DROP        = 8'b00001000;
parameter HAS_DATA    = 8'b00010000;
parameter SETUP_DATA  = 8'b00100000;
parameter WRITE       = 8'b01000000;
parameter PKTEND      = 8'b10000000;

reg [7:0] current_state;
reg [7:0] next_state;

initial begin
    next_state = IDLE;
    slwr <= 1'b1;
    pkt_end <= 1'b1;
    data_out <= 8'd0;
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
    IDLE: begin
        if (menable)
            next_state = SELECT_FIFO;
        else
            next_state = IDLE;
    end
    SELECT_FIFO: begin
        next_state = IS_FULL;
    end
    IS_FULL: begin
        if (full == 1'b0) // We are full
            next_state = DROP;
        else
            next_state = HAS_DATA;
    end
    DROP: begin
   		// We don't even try and transmit the packet
    	if (menable)
        	next_state = DROP;
        else
        	next_state = IDLE;
    end
    HAS_DATA: begin
    	if (menable) begin
        	if (mready)
            	next_state = SETUP_DATA;
            else
            	next_state = HAS_DATA;
        end else begin
        	next_state = PKTEND;
        end
    end
    SETUP_DATA: begin
       next_state = WRITE;
    end
    WRITE: begin
        next_state = HAS_DATA;
    end
    PKTEND: begin
        next_state = IDLE;
    end
    default: 
      next_state = IDLE;
  endcase
end

// -----------------------------------------
// Register outputs
// -----------------------------------------

//data generator counter
always @(posedge clk, negedge reset)
begin
  if (reset == 1'b0)
    data_out <= 8'd0;
  else if (next_state == SETUP_DATA)
    data_out <= mdata;
  else if (next_state == PKTEND)
     data_out <= 8'd0;
end

always @(posedge clk, negedge reset)
begin
	if (reset == 1'b0)
    	slwr <= 1'b1;
    else
      case (next_state)
          WRITE:
              slwr <= 1'b0; // Write Strobe
          default:
              slwr <= 1'b1; 
      endcase
end

always @(posedge clk, negedge reset)
begin
	if (reset == 1'b0)
    	pkt_end <= 1'b1;
    else
      case (next_state)
          PKTEND:
              pkt_end <= 1'b0;
          default:
              pkt_end <= 1'b1; 
      endcase
end

endmodule
