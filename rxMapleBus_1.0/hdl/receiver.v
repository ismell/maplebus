`default_nettype none

module receiver #
  (
    // Width of S_AXIS address bus. The slave accepts the read and write addresses of width C_M_AXIS_TDATA_WIDTH.
    parameter integer C_M_AXIS_TDATA_WIDTH  = 8
  )
  (
    input wire  M_AXIS_ACLK,
    //
    input wire  M_AXIS_ARESETN,
    // Master Stream Ports. TVALID indicates that the master is driving a valid transfer, A transfer takes place when both TVALID and TREADY are asserted.
    output wire  M_AXIS_TVALID,
    // TDATA is the primary payload that is used to provide the data that is passing across the interface from the master.
    output wire [C_M_AXIS_TDATA_WIDTH-1 : 0] M_AXIS_TDATA,
    // TSTRB is the byte qualifier that indicates whether the content of the associated byte of TDATA is processed as a data byte or a position byte.
    output wire [(C_M_AXIS_TDATA_WIDTH/8)-1 : 0] M_AXIS_TSTRB,
    // TSTRB is the byte qualifier that indicates whether the content of the associated byte of TDATA is processed as a null byte or a position byte.
    output wire [(C_M_AXIS_TDATA_WIDTH/8)-1 : 0] M_AXIS_TKEEP,
    // TLAST indicates the boundary of a packet.
    output wire  M_AXIS_TLAST,
    // TREADY indicates that the slave can accept a transfer in the current cycle.
    input wire  M_AXIS_TREADY,

    // SDCKX
    input wire SDCKA, SDCKB,
    // Enable transmission
    input wire ENABLE,
    // Indicates the transmitter is busy
    output wire RECEIVING
  );

  wire aclk = M_AXIS_ACLK;
  wire aresetn = M_AXIS_ARESETN;
  wire enable_decoder;
  wire [C_M_AXIS_TDATA_WIDTH-1 : 0] tdata;
  wire tvalid;

  // Create the synchronizer
  wire sdcka_data, sdcka_posedge, sdcka_negedge;
  wire sdckb_data, sdckb_posedge, sdckb_negedge;
  synchronizer sync(
    .aclk(aclk),
    .sdcka(SDCKA),
    .sdckb(SDCKB),
    .sdcka_data(sdcka_data),
    .sdcka_posedge(sdcka_posedge),
    .sdcka_negedge(sdcka_negedge),
    .sdckb_data(sdckb_data),
    .sdckb_posedge(sdckb_posedge),
    .sdckb_negedge(sdckb_negedge)
  );

  // Create a start frame decoder
  wire start_frame,
       start_with_crc,
       start_occupancy,
       start_reset,
       start_frame_error;

  start_frame_decoder sfd(
    .aclk(aclk),
    .aresetn(aresetn),
    .sdcka_posedge(sdcka_posedge),
    .sdcka_negedge(sdcka_negedge),
    .sdckb_posedge(sdckb_posedge),
    .sdckb_negedge(sdckb_negedge),
    .start_frame(start_frame),
    .start_with_crc(start_with_crc),
    .start_occupancy(start_occupancy),
    .start_reset(start_reset),
    .start_frame_error(start_frame_error)
  );

  // Create the data decoder
  data_decoder decoder(
    .aclk(aclk),
    .aresetn(aresetn),
    .enable(enable_decoder),
    .sdcka_data(sdcka_data),
    .sdcka_posedge(sdcka_posedge),
    .sdcka_negedge(sdcka_negedge),
    .sdckb_data(sdckb_data),
    .sdckb_posedge(sdckb_posedge),
    .sdckb_negedge(sdckb_negedge),
    .tdata(tdata),
    .tvalid(tvalid)
  );
  
  // We need a pending buffer because we want to delay sending the last byte
  // until the we are DONE so we can send it with the TLAST param.
  // Create the data decoder
  data_buffer buffer(
    .aclk(aclk),
    .aresetn(aresetn),
    .enable(enable_decoder),
    .s_tdata(tdata),
    .s_tvalid(tvalid),
    .m_tdata(M_AXIS_TDATA),
    .m_tvalid(M_AXIS_TVALID),
    .m_tstrb(M_AXIS_TSTRB),
    .m_tkeep(M_AXIS_TKEEP),
    .m_tlast(M_AXIS_TLAST)
  );

  // Create an end frame decoder
  wire end_frame,
       end_frame_error;

  end_frame_decoder efd(
    .aclk(aclk),
    .aresetn(aresetn),
    .sdcka_posedge(sdcka_posedge),
    .sdcka_negedge(sdcka_negedge),
    .sdckb_posedge(sdckb_posedge),
    .sdckb_negedge(sdckb_negedge),
    .end_frame(end_frame),
    .end_frame_error(end_frame_error)
  );

  //=============Internal Constants======================
  parameter SIZE = 3;
  parameter IDLE    = 3'b001,
            ENABLED = 3'b010,
            DONE    = 3'b100;
  //=============Internal Variables======================
  reg [SIZE-1:0]          current_state;
  reg [SIZE-1:0]          next_state;

  initial begin
    current_state <= IDLE;
  end

  always @ (posedge aclk) begin: FSM_SEQ
    if (aresetn == 1'b0)
      current_state <= IDLE;
    else
      current_state <= next_state;
  end

  always @(*) begin: FSM_COMBO
    case (current_state)
      IDLE:
        if ((start_frame || start_with_crc || start_reset) && M_AXIS_TREADY && ENABLE)
           next_state = ENABLED;
        else
          next_state = IDLE;
      ENABLED:
        if (start_frame || start_with_crc || start_reset)
          next_state = DONE; // ignore a frame if two start patterns are detected
        else if (end_frame || end_frame_error)
          next_state = DONE;
        else
          next_state = ENABLED;
      DONE:
        next_state = IDLE;
      default:
        next_state = IDLE;
    endcase
  end

  assign enable_decoder = (current_state == ENABLED);
  assign RECEIVING = (current_state == ENABLED || current_state == DONE);

  // -----------------------------------------
  // Register outputs
  // -----------------------------------------

endmodule
