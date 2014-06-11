/////////////// Synchronizer

module synchronizer(
	input wire aclk, sdcka, sdckb,
    output wire sdcka_data, sdcka_posedge, sdcka_negedge, sdckb_data, sdckb_posedge, sdckb_negedge);

// sync SDCKA to the FPGA clock using a 3-bits shift register
reg [2:0] SDCKAr;  always @(posedge aclk) SDCKAr <= {SDCKAr[1:0], sdcka};
assign sdcka_data = SDCKAr[1]; // The current value
assign sdcka_posedge = (SDCKAr[2:1]==2'b01);  // now we can detect SDCKA rising edges
assign sdcka_negedge = (SDCKAr[2:1]==2'b10);  // and falling edges

// sync SDCKB to the FPGA clock using a 3-bits shift register
reg [2:0] SDCKBr;  always @(posedge aclk) SDCKBr <= {SDCKBr[1:0], sdckb};
assign sdckb_data = SDCKBr[1]; // The current value
assign sdckb_posedge = (SDCKBr[2:1]==2'b01);  // now we can detect SDCKA rising edges
assign sdckb_negedge = (SDCKBr[2:1]==2'b10);  // and falling edges

initial begin
  SDCKAr = 3'b111;
  SDCKBr = 3'b111;
end

endmodule