module InController(
  input         clock,
  input         reset,
  input         io_In,
  input  [17:0] io_InFIR,
  output [17:0] io_Out,
  output        io_ADC_D_out,
  output [17:0] io_OutFIR
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  reg  dReg; // @[InController.scala 16:21]
  reg [17:0] inReg; // @[InController.scala 22:22]
  reg [17:0] sample; // @[InController.scala 23:23]
  reg [4:0] cntReg; // @[InController.scala 27:23]
  wire [17:0] _inReg_T_1 = {io_In,inReg[17:1]}; // @[Cat.scala 31:58]
  reg [7:0] cntReg2; // @[InController.scala 35:24]
  wire [7:0] _cntReg2_T_1 = cntReg2 + 8'h1; // @[InController.scala 36:22]
  wire [4:0] _cntReg_T_1 = cntReg + 5'h1; // @[InController.scala 40:22]
  wire [17:0] _io_OutFIR_T_2 = ~inReg; // @[InController.scala 49:16]
  assign io_Out = sample; // @[InController.scala 50:10]
  assign io_ADC_D_out = dReg; // @[InController.scala 19:16]
  assign io_OutFIR = $signed(_io_OutFIR_T_2) + 18'sh1; // @[InController.scala 49:30]
  always @(posedge clock) begin
    if (reset) begin // @[InController.scala 16:21]
      dReg <= 1'h0; // @[InController.scala 16:21]
    end else begin
      dReg <= io_In; // @[InController.scala 18:8]
    end
    if (reset) begin // @[InController.scala 22:22]
      inReg <= 18'h0; // @[InController.scala 22:22]
    end else begin
      inReg <= _inReg_T_1; // @[InController.scala 31:9]
    end
    if (reset) begin // @[InController.scala 23:23]
      sample <= 18'sh0; // @[InController.scala 23:23]
    end else if (cntReg == 5'h12) begin // @[InController.scala 43:27]
      sample <= io_InFIR; // @[InController.scala 45:12]
    end
    if (reset) begin // @[InController.scala 27:23]
      cntReg <= 5'h0; // @[InController.scala 27:23]
    end else if (cntReg == 5'h12) begin // @[InController.scala 43:27]
      cntReg <= 5'h0; // @[InController.scala 44:12]
    end else if (cntReg2 == 8'h7f) begin // @[InController.scala 38:26]
      cntReg <= _cntReg_T_1; // @[InController.scala 40:12]
    end
    if (reset) begin // @[InController.scala 35:24]
      cntReg2 <= 8'h0; // @[InController.scala 35:24]
    end else if (cntReg2 == 8'h7f) begin // @[InController.scala 38:26]
      cntReg2 <= 8'h0; // @[InController.scala 39:13]
    end else begin
      cntReg2 <= _cntReg2_T_1; // @[InController.scala 36:11]
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
  dReg = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  inReg = _RAND_1[17:0];
  _RAND_2 = {1{`RANDOM}};
  sample = _RAND_2[17:0];
  _RAND_3 = {1{`RANDOM}};
  cntReg = _RAND_3[4:0];
  _RAND_4 = {1{`RANDOM}};
  cntReg2 = _RAND_4[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module OutController(
  input         clock,
  input         reset,
  input  [17:0] io_In,
  input  [17:0] io_InFIR,
  output [17:0] io_OutFIR,
  output        io_OutPWM
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [17:0] ZReg; // @[OutController.scala 17:22]
  wire [17:0] _Diff_T = io_OutPWM ? 18'h3ffff : 18'h0; // @[OutController.scala 50:26]
  wire [17:0] Diff = $signed(io_InFIR) - $signed(_Diff_T); // @[OutController.scala 50:20]
  wire [17:0] _ZReg_T_2 = $signed(ZReg) + $signed(Diff); // @[OutController.scala 45:19]
  assign io_OutFIR = io_In; // @[OutController.scala 58:13]
  assign io_OutPWM = ~ZReg[17]; // @[OutController.scala 59:16]
  always @(posedge clock) begin
    if (reset) begin // @[OutController.scala 17:22]
      ZReg <= 18'sh0; // @[OutController.scala 17:22]
    end else begin
      ZReg <= _ZReg_T_2; // @[OutController.scala 52:8]
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
  ZReg = _RAND_0[17:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module IOMaster(
  input         clock,
  input         reset,
  input         io_In_ADC,
  input  [17:0] io_In_DAC,
  output [17:0] io_Out_ADC,
  output        io_Out_ADC_D,
  output        io_Out_DAC
);
  wire  ADC_clock; // @[IOMaster.scala 13:19]
  wire  ADC_reset; // @[IOMaster.scala 13:19]
  wire  ADC_io_In; // @[IOMaster.scala 13:19]
  wire [17:0] ADC_io_InFIR; // @[IOMaster.scala 13:19]
  wire [17:0] ADC_io_Out; // @[IOMaster.scala 13:19]
  wire  ADC_io_ADC_D_out; // @[IOMaster.scala 13:19]
  wire [17:0] ADC_io_OutFIR; // @[IOMaster.scala 13:19]
  wire  DAC_clock; // @[IOMaster.scala 14:19]
  wire  DAC_reset; // @[IOMaster.scala 14:19]
  wire [17:0] DAC_io_In; // @[IOMaster.scala 14:19]
  wire [17:0] DAC_io_InFIR; // @[IOMaster.scala 14:19]
  wire [17:0] DAC_io_OutFIR; // @[IOMaster.scala 14:19]
  wire  DAC_io_OutPWM; // @[IOMaster.scala 14:19]
  InController ADC ( // @[IOMaster.scala 13:19]
    .clock(ADC_clock),
    .reset(ADC_reset),
    .io_In(ADC_io_In),
    .io_InFIR(ADC_io_InFIR),
    .io_Out(ADC_io_Out),
    .io_ADC_D_out(ADC_io_ADC_D_out),
    .io_OutFIR(ADC_io_OutFIR)
  );
  OutController DAC ( // @[IOMaster.scala 14:19]
    .clock(DAC_clock),
    .reset(DAC_reset),
    .io_In(DAC_io_In),
    .io_InFIR(DAC_io_InFIR),
    .io_OutFIR(DAC_io_OutFIR),
    .io_OutPWM(DAC_io_OutPWM)
  );
  assign io_Out_ADC = ADC_io_Out; // @[IOMaster.scala 17:14]
  assign io_Out_ADC_D = ADC_io_ADC_D_out; // @[IOMaster.scala 19:16]
  assign io_Out_DAC = DAC_io_OutPWM; // @[IOMaster.scala 22:14]
  assign ADC_clock = clock;
  assign ADC_reset = reset;
  assign ADC_io_In = io_In_ADC; // @[IOMaster.scala 16:13]
  assign ADC_io_InFIR = ADC_io_OutFIR; // @[IOMaster.scala 18:16]
  assign DAC_clock = clock;
  assign DAC_reset = reset;
  assign DAC_io_In = io_In_DAC; // @[IOMaster.scala 21:13]
  assign DAC_io_InFIR = DAC_io_OutFIR; // @[IOMaster.scala 23:16]
endmodule
module DSP(
  input   clock,
  input   reset,
  input   io_ADIn,
  output  io_DAOut,
  output  io_ADOut
);
  wire  IOC_clock; // @[DSP.scala 21:20]
  wire  IOC_reset; // @[DSP.scala 21:20]
  wire  IOC_io_In_ADC; // @[DSP.scala 21:20]
  wire [17:0] IOC_io_In_DAC; // @[DSP.scala 21:20]
  wire [17:0] IOC_io_Out_ADC; // @[DSP.scala 21:20]
  wire  IOC_io_Out_ADC_D; // @[DSP.scala 21:20]
  wire  IOC_io_Out_DAC; // @[DSP.scala 21:20]
  IOMaster IOC ( // @[DSP.scala 21:20]
    .clock(IOC_clock),
    .reset(IOC_reset),
    .io_In_ADC(IOC_io_In_ADC),
    .io_In_DAC(IOC_io_In_DAC),
    .io_Out_ADC(IOC_io_Out_ADC),
    .io_Out_ADC_D(IOC_io_Out_ADC_D),
    .io_Out_DAC(IOC_io_Out_DAC)
  );
  assign io_DAOut = IOC_io_Out_DAC; // @[DSP.scala 27:19]
  assign io_ADOut = IOC_io_Out_ADC_D; // @[DSP.scala 28:19]
  assign IOC_clock = clock;
  assign IOC_reset = reset;
  assign IOC_io_In_ADC = io_ADIn; // @[DSP.scala 23:17]
  assign IOC_io_In_DAC = IOC_io_Out_ADC; // @[DSP.scala 25:17]
endmodule
