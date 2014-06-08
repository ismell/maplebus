module frame_decoder(sdcka, sdckb, start_frame, start_with_crc, start_occupancy, start_reset, start_frame_error, end_frame, end_frame_error);

input sdcka, sdckb;

output start_frame, start_with_crc, start_occupancy, start_reset, start_frame_error, end_frame, end_frame_error;

start_frame_decoder sfd(~sdcka, ~sdckb, start_frame, start_with_crc, start_occupancy, start_reset, start_frame_error);

end_frame_decoder efd(~sdckb, ~sdcka, end_frame, end_frame_error);

endmodule