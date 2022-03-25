module XADC(
  input         clock,
  input         reset,
  output [15:0] io_LED,
  input  [7:0]  io_JA
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire [15:0] adc_di_in; // @[XADC.scala 31:19]
  wire [6:0] adc_daddr_in; // @[XADC.scala 31:19]
  wire  adc_den_in; // @[XADC.scala 31:19]
  wire  adc_dwe_in; // @[XADC.scala 31:19]
  wire  adc_drdy_out; // @[XADC.scala 31:19]
  wire [15:0] adc_do_out; // @[XADC.scala 31:19]
  wire  adc_dclk_in; // @[XADC.scala 31:19]
  wire  adc_reset_in; // @[XADC.scala 31:19]
  wire  adc_convst_in; // @[XADC.scala 31:19]
  wire  adc_vp_in; // @[XADC.scala 31:19]
  wire  adc_vn_in; // @[XADC.scala 31:19]
  wire  adc_vauxp5; // @[XADC.scala 31:19]
  wire  adc_vauxn5; // @[XADC.scala 31:19]
  wire [4:0] adc_channel_out; // @[XADC.scala 31:19]
  wire  adc_eoc_out; // @[XADC.scala 31:19]
  wire  adc_alarm_out; // @[XADC.scala 31:19]
  wire  adc_eos_out; // @[XADC.scala 31:19]
  wire  adc_busy_out; // @[XADC.scala 31:19]
  reg [15:0] cntReg; // @[XADC.scala 21:23]
  wire [15:0] _cntReg_T_1 = cntReg + 16'h1; // @[XADC.scala 24:20]
  wire [4:0] channel_out = adc_channel_out; // @[XADC.scala 17:25 49:15]
  wire [5:0] daddr_in = {1'h0,channel_out}; // @[Cat.scala 31:58]
  wire [15:0] do_out = adc_do_out; // @[XADC.scala 14:20 50:10]
  wire [15:0] _GEN_1 = 4'hf == do_out[15:12] ? 16'h7fff : 16'hcccc; // @[XADC.scala 107:14 57:10 60:26]
  wire [15:0] _GEN_2 = 4'he == do_out[15:12] ? 16'h3fff : _GEN_1; // @[XADC.scala 104:14 60:26]
  wire [15:0] _GEN_3 = 4'hd == do_out[15:12] ? 16'h1fff : _GEN_2; // @[XADC.scala 101:14 60:26]
  wire [15:0] _GEN_4 = 4'hc == do_out[15:12] ? 16'hfff : _GEN_3; // @[XADC.scala 60:26 98:14]
  wire [15:0] _GEN_5 = 4'hb == do_out[15:12] ? 16'h7ff : _GEN_4; // @[XADC.scala 60:26 95:14]
  wire [15:0] _GEN_6 = 4'ha == do_out[15:12] ? 16'h3ff : _GEN_5; // @[XADC.scala 60:26 92:14]
  wire [15:0] _GEN_7 = 4'h9 == do_out[15:12] ? 16'h1ff : _GEN_6; // @[XADC.scala 60:26 89:14]
  wire [15:0] _GEN_8 = 4'h8 == do_out[15:12] ? 16'hff : _GEN_7; // @[XADC.scala 60:26 86:14]
  wire [15:0] _GEN_9 = 4'h7 == do_out[15:12] ? 16'h7f : _GEN_8; // @[XADC.scala 60:26 83:14]
  wire [15:0] _GEN_10 = 4'h6 == do_out[15:12] ? 16'h3f : _GEN_9; // @[XADC.scala 60:26 80:14]
  wire [15:0] _GEN_11 = 4'h5 == do_out[15:12] ? 16'h1f : _GEN_10; // @[XADC.scala 60:26 77:14]
  wire [15:0] _GEN_12 = 4'h4 == do_out[15:12] ? 16'hf : _GEN_11; // @[XADC.scala 60:26 74:14]
  wire [15:0] _GEN_13 = 4'h3 == do_out[15:12] ? 16'h7 : _GEN_12; // @[XADC.scala 60:26 71:14]
  wire [15:0] _GEN_14 = 4'h2 == do_out[15:12] ? 16'h3 : _GEN_13; // @[XADC.scala 60:26 68:14]
  wire [15:0] _GEN_15 = 4'h1 == do_out[15:12] ? 16'h1 : _GEN_14; // @[XADC.scala 60:26 65:14]
  xadc_wiz_0 adc ( // @[XADC.scala 31:19]
    .di_in(adc_di_in),
    .daddr_in(adc_daddr_in),
    .den_in(adc_den_in),
    .dwe_in(adc_dwe_in),
    .drdy_out(adc_drdy_out),
    .do_out(adc_do_out),
    .dclk_in(adc_dclk_in),
    .reset_in(adc_reset_in),
    .convst_in(adc_convst_in),
    .vp_in(adc_vp_in),
    .vn_in(adc_vn_in),
    .vauxp5(adc_vauxp5),
    .vauxn5(adc_vauxn5),
    .channel_out(adc_channel_out),
    .eoc_out(adc_eoc_out),
    .alarm_out(adc_alarm_out),
    .eos_out(adc_eos_out),
    .busy_out(adc_busy_out)
  );
  assign io_LED = 4'h0 == do_out[15:12] ? 16'h0 : _GEN_15; // @[XADC.scala 60:26 62:14]
  assign adc_di_in = 16'h0; // @[XADC.scala 33:16]
  assign adc_daddr_in = {{1'd0}, daddr_in}; // @[XADC.scala 34:19]
  assign adc_den_in = adc_eoc_out; // @[XADC.scala 13:21 48:11]
  assign adc_dwe_in = 1'h0; // @[XADC.scala 36:17]
  assign adc_dclk_in = clock; // @[XADC.scala 38:18]
  assign adc_reset_in = reset; // @[XADC.scala 39:19]
  assign adc_convst_in = cntReg == 16'hfde7; // @[XADC.scala 22:21]
  assign adc_vp_in = 1'h0; // @[XADC.scala 41:16]
  assign adc_vn_in = 1'h0; // @[XADC.scala 42:16]
  assign adc_vauxp5 = io_JA[4]; // @[XADC.scala 54:18]
  assign adc_vauxn5 = io_JA[0]; // @[XADC.scala 55:18]
  always @(posedge clock) begin
    if (reset) begin // @[XADC.scala 21:23]
      cntReg <= 16'h0; // @[XADC.scala 21:23]
    end else if (cntReg == 16'hfde8) begin // @[XADC.scala 25:29]
      cntReg <= 16'h0; // @[XADC.scala 26:12]
    end else begin
      cntReg <= _cntReg_T_1; // @[XADC.scala 24:10]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  cntReg = _RAND_0[15:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
