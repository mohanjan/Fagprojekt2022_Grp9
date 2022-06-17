module InController(
  input         clock,
  input         reset,
  input         io_In,
  output        io_ADC_D_out,
  input  [17:0] io_InFIR,
  output [17:0] io_Out,
  output [17:0] io_OutFIR
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [17:0] inReg; // @[InController.scala 30:22]
  reg [17:0] sample; // @[InController.scala 34:23]
  wire [17:0] _inReg_T_1 = {io_In,inReg[17:1]}; // @[Cat.scala 31:58]
  assign io_ADC_D_out = io_In; // @[InController.scala 27:15]
  assign io_Out = sample; // @[InController.scala 62:10]
  assign io_OutFIR = inReg; // @[InController.scala 61:13]
  always @(posedge clock) begin
    if (reset) begin // @[InController.scala 30:22]
      inReg <= 18'h0; // @[InController.scala 30:22]
    end else begin
      inReg <= _inReg_T_1; // @[InController.scala 41:9]
    end
    if (reset) begin // @[InController.scala 34:23]
      sample <= 18'h0; // @[InController.scala 34:23]
    end else begin
      sample <= io_InFIR; // @[InController.scala 53:10]
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
  inReg = _RAND_0[17:0];
  _RAND_1 = {1{`RANDOM}};
  sample = _RAND_1[17:0];
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
  output        io_OutPWM,
  input         io_Sync,
  input  [17:0] io_In,
  input  [17:0] io_InFIR,
  output [17:0] io_OutFIR
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [17:0] ZReg; // @[OutController.scala 25:22]
  wire [17:0] _DDC_T_2 = io_OutPWM ? 18'h3ffff : 18'h0; // @[OutController.scala 49:15]
  wire [17:0] DDC = io_Sync ? _DDC_T_2 : 18'h0; // @[OutController.scala 39:23 49:9]
  wire [17:0] _Diff_T_1 = io_InFIR - DDC; // @[OutController.scala 48:22]
  wire [17:0] Diff = io_Sync ? _Diff_T_1 : 18'h0; // @[OutController.scala 39:23 48:10 34:13]
  wire [17:0] _ZReg_T_1 = ZReg + Diff; // @[OutController.scala 47:18]
  assign io_OutPWM = ZReg[17]; // @[OutController.scala 52:20]
  assign io_OutFIR = io_In; // @[OutController.scala 54:13]
  always @(posedge clock) begin
    if (reset) begin // @[OutController.scala 25:22]
      ZReg <= 18'h0; // @[OutController.scala 25:22]
    end else if (io_Sync) begin // @[OutController.scala 39:23]
      ZReg <= _ZReg_T_1; // @[OutController.scala 47:10]
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
  output        io_Out_ADC_D,
  output        io_Out_DAC,
  output        io_Sync,
  input  [17:0] io_In_DAC,
  output [17:0] io_Out_ADC
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire  ADC_clock; // @[IOMaster.scala 19:19]
  wire  ADC_reset; // @[IOMaster.scala 19:19]
  wire  ADC_io_In; // @[IOMaster.scala 19:19]
  wire  ADC_io_ADC_D_out; // @[IOMaster.scala 19:19]
  wire [17:0] ADC_io_InFIR; // @[IOMaster.scala 19:19]
  wire [17:0] ADC_io_Out; // @[IOMaster.scala 19:19]
  wire [17:0] ADC_io_OutFIR; // @[IOMaster.scala 19:19]
  wire  DAC_clock; // @[IOMaster.scala 20:19]
  wire  DAC_reset; // @[IOMaster.scala 20:19]
  wire  DAC_io_OutPWM; // @[IOMaster.scala 20:19]
  wire  DAC_io_Sync; // @[IOMaster.scala 20:19]
  wire [17:0] DAC_io_In; // @[IOMaster.scala 20:19]
  wire [17:0] DAC_io_InFIR; // @[IOMaster.scala 20:19]
  wire [17:0] DAC_io_OutFIR; // @[IOMaster.scala 20:19]
  reg [7:0] syncReg; // @[IOMaster.scala 22:24]
  wire [7:0] _syncReg_T_1 = syncReg + 8'h1; // @[IOMaster.scala 23:22]
  wire  _T = syncReg == 8'h1; // @[IOMaster.scala 24:16]
  InController ADC ( // @[IOMaster.scala 19:19]
    .clock(ADC_clock),
    .reset(ADC_reset),
    .io_In(ADC_io_In),
    .io_ADC_D_out(ADC_io_ADC_D_out),
    .io_InFIR(ADC_io_InFIR),
    .io_Out(ADC_io_Out),
    .io_OutFIR(ADC_io_OutFIR)
  );
  OutController DAC ( // @[IOMaster.scala 20:19]
    .clock(DAC_clock),
    .reset(DAC_reset),
    .io_OutPWM(DAC_io_OutPWM),
    .io_Sync(DAC_io_Sync),
    .io_In(DAC_io_In),
    .io_InFIR(DAC_io_InFIR),
    .io_OutFIR(DAC_io_OutFIR)
  );
  assign io_Out_ADC_D = ADC_io_ADC_D_out; // @[IOMaster.scala 36:16]
  assign io_Out_DAC = DAC_io_OutPWM; // @[IOMaster.scala 39:14]
  assign io_Sync = syncReg == 8'h1; // @[IOMaster.scala 24:16]
  assign io_Out_ADC = ADC_io_Out; // @[IOMaster.scala 34:14]
  assign ADC_clock = clock;
  assign ADC_reset = reset;
  assign ADC_io_In = io_In_ADC; // @[IOMaster.scala 33:13]
  assign ADC_io_InFIR = ADC_io_OutFIR; // @[IOMaster.scala 35:16]
  assign DAC_clock = clock;
  assign DAC_reset = reset;
  assign DAC_io_Sync = io_Sync; // @[IOMaster.scala 43:15]
  assign DAC_io_In = io_In_DAC; // @[IOMaster.scala 38:13]
  assign DAC_io_InFIR = DAC_io_OutFIR; // @[IOMaster.scala 40:16]
  always @(posedge clock) begin
    if (reset) begin // @[IOMaster.scala 22:24]
      syncReg <= 8'h0; // @[IOMaster.scala 22:24]
    end else if (_T) begin // @[IOMaster.scala 29:24]
      syncReg <= 8'h0; // @[IOMaster.scala 30:13]
    end else begin
      syncReg <= _syncReg_T_1; // @[IOMaster.scala 23:11]
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
  syncReg = _RAND_0[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module DSP(
  input   clock,
  input   reset,
  input   io_ADIn,
  output  io_DAOut,
  output  io_ADOut,
  output  io_SyncOut
);
  wire  IOC_clock; // @[DSP.scala 14:20]
  wire  IOC_reset; // @[DSP.scala 14:20]
  wire  IOC_io_In_ADC; // @[DSP.scala 14:20]
  wire  IOC_io_Out_ADC_D; // @[DSP.scala 14:20]
  wire  IOC_io_Out_DAC; // @[DSP.scala 14:20]
  wire  IOC_io_Sync; // @[DSP.scala 14:20]
  wire [17:0] IOC_io_In_DAC; // @[DSP.scala 14:20]
  wire [17:0] IOC_io_Out_ADC; // @[DSP.scala 14:20]
  IOMaster IOC ( // @[DSP.scala 14:20]
    .clock(IOC_clock),
    .reset(IOC_reset),
    .io_In_ADC(IOC_io_In_ADC),
    .io_Out_ADC_D(IOC_io_Out_ADC_D),
    .io_Out_DAC(IOC_io_Out_DAC),
    .io_Sync(IOC_io_Sync),
    .io_In_DAC(IOC_io_In_DAC),
    .io_Out_ADC(IOC_io_Out_ADC)
  );
  assign io_DAOut = IOC_io_Out_DAC; // @[DSP.scala 18:17]
  assign io_ADOut = IOC_io_Out_ADC_D; // @[DSP.scala 19:17]
  assign io_SyncOut = IOC_io_Sync; // @[DSP.scala 20:17]
  assign IOC_clock = clock;
  assign IOC_reset = reset;
  assign IOC_io_In_ADC = io_ADIn; // @[DSP.scala 16:17]
  assign IOC_io_In_DAC = IOC_io_Out_ADC; // @[DSP.scala 17:17]
endmodule
