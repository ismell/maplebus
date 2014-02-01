module maplebus(
  input wire clk,
  input wire reset,
  
  input wire sdcka, sdckb,
  
  input wire flagd,  //  EP6 full flag
  input wire flaga,  //  EP2 empty flag
  
  inout wire [7:0] fdata,  
  output wire [1:0] faddr,  
  output wire sloe,
  output wire slrd,
  output wire slwr,
  output wire pkt_end,
  output wire clk_out,
  
  output wire menable,
  output wire mready
);

	assign clk_out = clk;
	
	//wire menable, mready;
   wire [7:0] mdata;
	receiver r(clk, reset, sdcka, sdckb, menable, mready, mdata);
    
   fifo f(clk, reset, menable, mready, mdata, flagd, flaga, fdata, faddr, sloe, slrd, slwr, pkt_end);
    
endmodule