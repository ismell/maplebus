module maplebus(
  input wire clk,
  input wire reset,
  
  inout wire sdcka, sdckb,
  
  input wire flaga,  //  EP2 empty flag
  input wire flagb,  //  Indexed Full Flag
  input wire flagc,  //  Indexed Empty Flag
  input wire flagd,  //  EP6 full flag
  
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
  wire [7:0] rx_data;
  wire sdcka_in, sdckb_in, receiving, rx_write;
  receiver r(
    .clk(clk),
    .reset(reset),
    .sdcka(sdcka_in),
    .sdckb(sdckb_in),
    .busy(receiving),
    .write(rx_write), // Write current byte into fifo
    .data(rx_data) // Data from MBus
  );

   wire [7:0] tx_data;
   wire sdcka_out, sdckb_out, tx_enable, transmitting, tx_read;

   transmitter t(
    .clk(clk),
    .reset(reset),
    .enable(tx_enable), // FIFO should enable the transmitter
    .busy(transmitting), // Output the signal
    .sdcka(sdcka_out),
    .sdckb(sdckb_out),    
    .next(tx_read), // Read next byte from FIFO
    .data(tx_data) // Data from FIFO
  );

  assign sdcka_in = transmitting ? 1'b1 : sdcka;
  assign sdckb_in = transmitting ? 1'b1 : sdckb;

  // Let the pull up resistor handle the 1
  //TODO: Change the z to a 1
  assign sdcka = transmitting ? (sdcka_out ? 1'b1 : 1'b0) : 1'bz; 
  assign sdckb = transmitting ? (sdckb_out ? 1'b1 : 1'b0) : 1'bz; 
    
  fifo f(
    .clk(clk),
    .reset(reset),
    .rx_enable(receiving),
    .rx_write(rx_write),
    .rx_data(rx_data),

    .tx_enable(tx_enable),
    .tx_read(tx_read),
    .tx_data(tx_data),

    .full(flagb),
    .empty(flagc),
    .fdata(fdata),
    .faddr(faddr),
    .sloe(sloe),
    .slrd(slrd),
    .slwr(slwr),
    .pkt_end(pkt_end)
  );
    
endmodule