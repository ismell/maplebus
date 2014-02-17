module fifo(
  input wire clk,
  input wire reset,
  
  input wire rx_enable, // mbus is transmitting to master
  input wire rx_write, // mbus data ready
  input wire [7:0] rx_data, // mbus data out


  output reg tx_enable, // The master has data to transmit to the mbus  
  input wire tx_read, // Write next value to mdata_out
  output wire [7:0] tx_data, // mbus data in
  
  input wire full,
  input wire empty,
  
  inout wire [7:0] fdata,  
  output reg [1:0] faddr,  
  output reg sloe,
  output reg slrd,
  output reg slwr,
  output reg pkt_end
);

reg [7:0] data_out; // out from the master into the slave FIFO
reg [7:0] data_in; // into the master from the slave FIFO

assign tx_data[7:0] = data_in[7:0];

parameter EP2 = 2'b00; // OUT FIFO
parameter EP4 = 2'b01; // DISABLED
parameter EP6 = 2'b10; // IN FIFO
parameter EP8 = 2'b11; // DISABLED

assign fdata[7:0] = sloe ? data_out[7:0] : 8'bz;

parameter SIZE = 14;

parameter SELECT_OUT_FIFO = 14'b00000000000001;
parameter IDLE            = 14'b00000000000010;
parameter SELECT_IN_FIFO  = 14'b00000000000100;
parameter IS_FULL         = 14'b00000000001000;
parameter DROP            = 14'b00000000010000;
parameter HAS_DATA        = 14'b00000000100000;
parameter SETUP_DATA      = 14'b00000001000000;
parameter WRITE           = 14'b00000010000000;
parameter PKTEND          = 14'b00000100000000;
parameter CAN_READ        = 14'b00001000000000;
parameter READ_DATA       = 14'b00010000000000;
parameter READ            = 14'b00100000000000;
parameter IS_EMPTY        = 14'b01000000000000;
parameter READ_DONE       = 14'b10000000000000;

reg [SIZE-1:0] current_state;
reg [SIZE-1:0] next_state;

initial begin
    current_state <= SELECT_OUT_FIFO;
    slwr <= 1'b1;
    slrd <= 1'b1;
    pkt_end <= 1'b1;
    data_out <= 8'd0;
    faddr <= EP2;
    sloe <= 1'b1;

    tx_enable <= 1'b0;
end

//Stream IN mode state machine 
always @(posedge clk, negedge reset)
begin
  if (reset == 1'b0)
    current_state <= SELECT_OUT_FIFO;
  else
    current_state <= next_state;
end

// state machine combo
always @ (*)
begin
  case(current_state)
    SELECT_OUT_FIFO: begin
      next_state = IDLE;
    end
    IDLE: begin
      if (rx_enable) // Maple Bus has something to transmit
        next_state = SELECT_IN_FIFO;
      else if (empty == 1'b1) // Host has something to transmit on the MapleBus
        next_state = READ_DATA;
      else
        next_state = IDLE;
    end

    // Begin transmission to host
    SELECT_IN_FIFO: begin
        next_state = IS_FULL;
    end
    IS_FULL: begin
      if (full == 1'b0) // The IN FIFO is full
        next_state = DROP;
      else
        next_state = HAS_DATA;
    end
    DROP: begin // We don't even try and send the packet to the host
      if (rx_enable)
        next_state = DROP;
      else
        next_state = SELECT_OUT_FIFO;
    end
    HAS_DATA: begin
      if (rx_enable) begin
        if (rx_write)
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
      next_state = SELECT_OUT_FIFO;
    end

    // Begin reception from host
    READ_DATA: begin
      next_state = CAN_READ;
    end
    CAN_READ: begin
      if (empty == 1'b0) // We are empty
        next_state = READ_DONE;
      else
        if (tx_read)
          next_state = READ;
        else
          next_state = CAN_READ;
    end
    READ: begin
      next_state = READ_DATA;
    end
    READ_DONE: begin
      next_state = SELECT_OUT_FIFO;
    end

    default: 
      next_state = SELECT_OUT_FIFO;
  endcase
end

// ------------------------------------------
// Register outputs
// -----------------------------------------

always @(posedge clk, negedge reset) begin : WRITE_DATA_OUT
  if (reset == 1'b0)
    data_out <= 8'd0;
  else if (next_state == SETUP_DATA)
    data_out <= rx_data;
  else if (next_state == PKTEND)
    data_out <= 8'd0;
  else
    data_out <= data_out;
end

always @(posedge clk, negedge reset) begin : READ_DATA_IN
  if (reset == 1'b0)
    data_in <= 8'd0;
  else if (next_state == READ_DATA)
    data_in <= fdata[7:0];
  else if (next_state == READ_DONE)
    data_in <= 8'd0;
  else
    data_in <= data_in;
end

always @(posedge clk, negedge reset) begin : FIFO_ADDRESS
  if (reset == 1'b0)
    faddr <= EP2;
  else
    case (next_state)
      SELECT_IN_FIFO:
        faddr <= EP6;
      IS_FULL:
        faddr <= EP6;
      DROP:
        faddr <= EP6;
      HAS_DATA:
        faddr <= EP6;
      SETUP_DATA:
        faddr <= EP6;
      WRITE:
        faddr <= EP6;
      PKTEND:
        faddr <= EP6;
      default:
        faddr <= EP2; 
    endcase
end

always @(posedge clk, negedge reset) begin : ENABLE_TRANSMITTER
  if (reset == 1'b0)
    tx_enable <= 1'b0;
  else
    case (next_state)
      READ_DATA:
        tx_enable <= 1'b1;
      CAN_READ:
        tx_enable <= 1'b1;
      READ:
        tx_enable <= 1'b1;
      default:
        tx_enable <= 1'b0; 
    endcase
end

always @(posedge clk, negedge reset) begin : SLAVE_OUTPUT_ENABLE
  if (reset == 1'b0)
    sloe <= 1'b1;
  else
    case (next_state)
      IDLE:
        sloe <= 1'b0;
      READ_DATA:
        sloe <= 1'b0;
      CAN_READ:
        sloe <= 1'b0;
      READ:
        sloe <= 1'b0;
      READ_DONE:
        sloe <= 1'b0;
      default:
        sloe <= 1'b1; 
    endcase
end

always @(posedge clk, negedge reset)
begin
  if (reset == 1'b0)
    slrd <= 1'b1;
  else
    case (next_state)
      READ:
        slrd <= 1'b0;
      default:
        slrd <= 1'b1; 
    endcase
end

always @(posedge clk, negedge reset)
begin
  if (reset == 1'b0)
    slwr <= 1'b1;
  else
    case (next_state)
      WRITE:
        slwr <= 1'b0;
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
