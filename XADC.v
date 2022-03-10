module XADC(
  input         clock,
  input         reset,
  output [15:0] io_LED,
  output [7:0]  io_JA,
  input         io_clk,
  input         io_sw
);
  assign io_LED = 16'h0; // @[XADC.scala 56:26 58:14]
  assign io_JA = 8'h0; // @[XADC.scala 42:9]
endmodule
