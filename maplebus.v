module maplebus(
  input wire clk,
  input wire reset,
  
  inout wire sdcka, sdckb,
  
  input wire flagd,  //  EP6 full flag
  input wire flaga,  //  EP2 empty flag
  input wire flagb,  //  Indexed Full Flag
  input wire flagc,  //  Indexed Empty Flag
  
  inout wire [7:0] fdata,  
  output wire [1:0] faddr,  
  output wire sloe,
  output wire slrd,
  output wire slwr,
  output wire pkt_end,
  output wire clk_out
);

	assign clk_out = clk;
	
	//wire menable, mready;
	wire [7:0] mdata_in, mdata_out;
	receiver r(clk, reset, 1'b1, 1'b1, menable, mready, mdata_in);

   wire enable, busy, data_ready, full, sdcka_out, sdckb_out;
   transmitter t(clk, reset, enable, sdcka_out, sdckb_out, busy, data_ready, mdata_out, full);
	
	assign sdcka =  1'bZ; //sdcka_out == 1'b0 ? 1'b0 : 1'bz; // Let the pull up resistor handle the 1
	assign sdckb = 1'bZ; //sdckb_out == 1'b0 ? 1'b0 : 1'bz;
    
   fifo f(clk, reset, menable, mready, mdata_in, mdata_out, flagb, flagc, fdata, faddr, sloe, slrd, slwr, pkt_end);

	assign enable = 1'b1;
    
endmodule