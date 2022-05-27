module InstuctionMemory(
  input         clock,
  input         io_enable,
  input  [9:0]  io_Address,
  output [17:0] io_Instruction
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [17:0] mem [0:1023]; // @[InstructionMemory.scala 28:24]
  wire  mem_rdwrPort_r_en; // @[InstructionMemory.scala 28:24]
  wire [9:0] mem_rdwrPort_r_addr; // @[InstructionMemory.scala 28:24]
  wire [17:0] mem_rdwrPort_r_data; // @[InstructionMemory.scala 28:24]
  wire [17:0] mem_rdwrPort_w_data; // @[InstructionMemory.scala 28:24]
  wire [9:0] mem_rdwrPort_w_addr; // @[InstructionMemory.scala 28:24]
  wire  mem_rdwrPort_w_mask; // @[InstructionMemory.scala 28:24]
  wire  mem_rdwrPort_w_en; // @[InstructionMemory.scala 28:24]
  reg  mem_rdwrPort_r_en_pipe_0;
  reg [9:0] mem_rdwrPort_r_addr_pipe_0;
  assign mem_rdwrPort_r_en = mem_rdwrPort_r_en_pipe_0;
  assign mem_rdwrPort_r_addr = mem_rdwrPort_r_addr_pipe_0;
  assign mem_rdwrPort_r_data = mem[mem_rdwrPort_r_addr]; // @[InstructionMemory.scala 28:24]
  assign mem_rdwrPort_w_data = 18'h0;
  assign mem_rdwrPort_w_addr = io_Address;
  assign mem_rdwrPort_w_mask = 1'h0;
  assign mem_rdwrPort_w_en = io_enable & 1'h0;
  assign io_Instruction = mem_rdwrPort_r_data; // @[InstructionMemory.scala 35:21 36:38]
  always @(posedge clock) begin
    if (mem_rdwrPort_w_en & mem_rdwrPort_w_mask) begin
      mem[mem_rdwrPort_w_addr] <= mem_rdwrPort_w_data; // @[InstructionMemory.scala 28:24]
    end
    mem_rdwrPort_r_en_pipe_0 <= io_enable & ~1'h0;
    if (io_enable & ~1'h0) begin
      mem_rdwrPort_r_addr_pipe_0 <= io_Address;
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
  integer initvar;
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
  mem_rdwrPort_r_en_pipe_0 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  mem_rdwrPort_r_addr_pipe_0 = _RAND_1[9:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
initial begin
  $readmemh("MachineCode.mem", mem);
end
endmodule
module FetchStage(
  input         clock,
  input         io_Clear,
  input  [17:0] In_PC,
  output [17:0] Out_Instruction
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire  InstructionMem_clock; // @[FetchStage.scala 21:30]
  wire  InstructionMem_io_enable; // @[FetchStage.scala 21:30]
  wire [9:0] InstructionMem_io_Address; // @[FetchStage.scala 21:30]
  wire [17:0] InstructionMem_io_Instruction; // @[FetchStage.scala 21:30]
  reg  ClearDelay; // @[FetchStage.scala 18:27]
  InstuctionMemory InstructionMem ( // @[FetchStage.scala 21:30]
    .clock(InstructionMem_clock),
    .io_enable(InstructionMem_io_enable),
    .io_Address(InstructionMem_io_Address),
    .io_Instruction(InstructionMem_io_Instruction)
  );
  assign Out_Instruction = InstructionMem_io_Instruction; // @[FetchStage.scala 41:19]
  assign InstructionMem_clock = clock;
  assign InstructionMem_io_enable = io_Clear | ClearDelay ? 1'h0 : 1'h1; // @[FetchStage.scala 32:28 43:31 44:30]
  assign InstructionMem_io_Address = In_PC[9:0]; // @[FetchStage.scala 30:29]
  always @(posedge clock) begin
    ClearDelay <= io_Clear; // @[FetchStage.scala 18:27]
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
  ClearDelay = _RAND_0[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module InstuctionDecoder(
  input  [17:0] io_Instruction,
  output [1:0]  io_Type,
  output [3:0]  io_rs1,
  output [3:0]  io_rs2,
  output [3:0]  io_rd,
  output [10:0] io_AImmidiate,
  output [10:0] io_ASImmidiate,
  output [3:0]  io_AOperation,
  output [1:0]  io_MemOp,
  output [10:0] io_MemAdress,
  output [1:0]  io_COperation,
  output [5:0]  io_COffset
);
  wire [9:0] _io_ASImmidiate_T_1 = io_Instruction[9:0]; // @[InstuctionDecoder.scala 49:45]
  wire [5:0] _io_COffset_T_1 = io_Instruction[5:0]; // @[InstuctionDecoder.scala 60:41]
  wire [1:0] _GEN_0 = 2'h3 == io_Instruction[17:16] ? io_Instruction[15:14] : 2'h0; // @[InstuctionDecoder.scala 35:17 38:32 57:21]
  wire [3:0] _GEN_1 = 2'h3 == io_Instruction[17:16] ? io_Instruction[13:10] : 4'h0; // @[InstuctionDecoder.scala 27:10 38:32 58:14]
  wire [3:0] _GEN_2 = 2'h3 == io_Instruction[17:16] ? io_Instruction[9:6] : 4'h0; // @[InstuctionDecoder.scala 28:10 38:32 59:14]
  wire [5:0] _GEN_3 = 2'h3 == io_Instruction[17:16] ? $signed(_io_COffset_T_1) : $signed(6'sh0); // @[InstuctionDecoder.scala 36:14 38:32 60:18]
  wire  _GEN_4 = 2'h2 == io_Instruction[17:16] & io_Instruction[15]; // @[InstuctionDecoder.scala 33:12 38:32 52:16]
  wire [3:0] _GEN_5 = 2'h2 == io_Instruction[17:16] ? io_Instruction[14:11] : 4'h0; // @[InstuctionDecoder.scala 38:32 53:13 29:9]
  wire [10:0] _GEN_6 = 2'h2 == io_Instruction[17:16] ? io_Instruction[10:0] : 11'h0; // @[InstuctionDecoder.scala 34:16 38:32 54:20]
  wire [1:0] _GEN_7 = 2'h2 == io_Instruction[17:16] ? 2'h0 : _GEN_0; // @[InstuctionDecoder.scala 35:17 38:32]
  wire [3:0] _GEN_8 = 2'h2 == io_Instruction[17:16] ? 4'h0 : _GEN_1; // @[InstuctionDecoder.scala 27:10 38:32]
  wire [3:0] _GEN_9 = 2'h2 == io_Instruction[17:16] ? 4'h0 : _GEN_2; // @[InstuctionDecoder.scala 28:10 38:32]
  wire [5:0] _GEN_10 = 2'h2 == io_Instruction[17:16] ? $signed(6'sh0) : $signed(_GEN_3); // @[InstuctionDecoder.scala 36:14 38:32]
  wire [1:0] _GEN_11 = 2'h1 == io_Instruction[17:16] ? io_Instruction[15:14] : 2'h0; // @[InstuctionDecoder.scala 32:17 38:32 46:21]
  wire [3:0] _GEN_12 = 2'h1 == io_Instruction[17:16] ? io_Instruction[13:10] : _GEN_5; // @[InstuctionDecoder.scala 38:32 47:13]
  wire [9:0] _GEN_13 = 2'h1 == io_Instruction[17:16] ? io_Instruction[9:0] : 10'h0; // @[InstuctionDecoder.scala 30:17 38:32 48:21]
  wire [9:0] _GEN_14 = 2'h1 == io_Instruction[17:16] ? $signed(_io_ASImmidiate_T_1) : $signed(10'sh0); // @[InstuctionDecoder.scala 31:18 38:32 49:22]
  wire  _GEN_15 = 2'h1 == io_Instruction[17:16] ? 1'h0 : _GEN_4; // @[InstuctionDecoder.scala 33:12 38:32]
  wire [10:0] _GEN_16 = 2'h1 == io_Instruction[17:16] ? 11'h0 : _GEN_6; // @[InstuctionDecoder.scala 34:16 38:32]
  wire [1:0] _GEN_17 = 2'h1 == io_Instruction[17:16] ? 2'h0 : _GEN_7; // @[InstuctionDecoder.scala 35:17 38:32]
  wire [3:0] _GEN_18 = 2'h1 == io_Instruction[17:16] ? 4'h0 : _GEN_8; // @[InstuctionDecoder.scala 27:10 38:32]
  wire [3:0] _GEN_19 = 2'h1 == io_Instruction[17:16] ? 4'h0 : _GEN_9; // @[InstuctionDecoder.scala 28:10 38:32]
  wire [5:0] _GEN_20 = 2'h1 == io_Instruction[17:16] ? $signed(6'sh0) : $signed(_GEN_10); // @[InstuctionDecoder.scala 36:14 38:32]
  wire [9:0] _GEN_25 = 2'h0 == io_Instruction[17:16] ? 10'h0 : _GEN_13; // @[InstuctionDecoder.scala 30:17 38:32]
  wire [9:0] _GEN_26 = 2'h0 == io_Instruction[17:16] ? $signed(10'sh0) : $signed(_GEN_14); // @[InstuctionDecoder.scala 31:18 38:32]
  wire  _GEN_27 = 2'h0 == io_Instruction[17:16] ? 1'h0 : _GEN_15; // @[InstuctionDecoder.scala 33:12 38:32]
  assign io_Type = io_Instruction[17:16]; // @[InstuctionDecoder.scala 26:28]
  assign io_rs1 = 2'h0 == io_Instruction[17:16] ? io_Instruction[7:4] : _GEN_18; // @[InstuctionDecoder.scala 38:32 42:14]
  assign io_rs2 = 2'h0 == io_Instruction[17:16] ? io_Instruction[3:0] : _GEN_19; // @[InstuctionDecoder.scala 38:32 43:14]
  assign io_rd = 2'h0 == io_Instruction[17:16] ? io_Instruction[11:8] : _GEN_12; // @[InstuctionDecoder.scala 38:32 41:13]
  assign io_AImmidiate = {{1'd0}, _GEN_25};
  assign io_ASImmidiate = {{1{_GEN_26[9]}},_GEN_26};
  assign io_AOperation = 2'h0 == io_Instruction[17:16] ? io_Instruction[15:12] : {{2'd0}, _GEN_11}; // @[InstuctionDecoder.scala 38:32 40:21]
  assign io_MemOp = {{1'd0}, _GEN_27};
  assign io_MemAdress = 2'h0 == io_Instruction[17:16] ? 11'h0 : _GEN_16; // @[InstuctionDecoder.scala 34:16 38:32]
  assign io_COperation = 2'h0 == io_Instruction[17:16] ? 2'h0 : _GEN_17; // @[InstuctionDecoder.scala 35:17 38:32]
  assign io_COffset = 2'h0 == io_Instruction[17:16] ? $signed(6'sh0) : $signed(_GEN_20); // @[InstuctionDecoder.scala 36:14 38:32]
endmodule
module DecodeStage(
  input         clock,
  input         reset,
  input         io_Clear,
  input         io_Stall,
  input  [17:0] In_Instruction,
  output [1:0]  Out_Type,
  output [3:0]  Out_rs1,
  output [3:0]  Out_rs2,
  output [3:0]  Out_rd,
  output [10:0] Out_AImmediate,
  output [10:0] Out_ASImmediate,
  output [3:0]  Out_AOperation,
  output        Out_MemOp,
  output [10:0] Out_MemAddress,
  output [1:0]  Out_COperation,
  output [5:0]  Out_COffset
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
`endif // RANDOMIZE_REG_INIT
  wire [17:0] InstDec_io_Instruction; // @[DecodeStage.scala 28:23]
  wire [1:0] InstDec_io_Type; // @[DecodeStage.scala 28:23]
  wire [3:0] InstDec_io_rs1; // @[DecodeStage.scala 28:23]
  wire [3:0] InstDec_io_rs2; // @[DecodeStage.scala 28:23]
  wire [3:0] InstDec_io_rd; // @[DecodeStage.scala 28:23]
  wire [10:0] InstDec_io_AImmidiate; // @[DecodeStage.scala 28:23]
  wire [10:0] InstDec_io_ASImmidiate; // @[DecodeStage.scala 28:23]
  wire [3:0] InstDec_io_AOperation; // @[DecodeStage.scala 28:23]
  wire [1:0] InstDec_io_MemOp; // @[DecodeStage.scala 28:23]
  wire [10:0] InstDec_io_MemAdress; // @[DecodeStage.scala 28:23]
  wire [1:0] InstDec_io_COperation; // @[DecodeStage.scala 28:23]
  wire [5:0] InstDec_io_COffset; // @[DecodeStage.scala 28:23]
  reg [1:0] TypeReg; // @[DecodeStage.scala 31:24]
  reg [3:0] rs1Reg; // @[DecodeStage.scala 32:23]
  reg [3:0] rs2Reg; // @[DecodeStage.scala 33:23]
  reg [3:0] rdReg; // @[DecodeStage.scala 34:22]
  reg [10:0] AImmediateReg; // @[DecodeStage.scala 36:30]
  reg [10:0] ASImmediateReg; // @[DecodeStage.scala 37:31]
  reg [3:0] AOperationReg; // @[DecodeStage.scala 39:30]
  reg  MemOpReg; // @[DecodeStage.scala 41:25]
  reg [10:0] MemAddressReg; // @[DecodeStage.scala 42:30]
  reg [1:0] COperationReg; // @[DecodeStage.scala 44:30]
  reg [5:0] COffsetReg; // @[DecodeStage.scala 45:27]
  wire [1:0] _GEN_7 = ~io_Stall ? InstDec_io_MemOp : {{1'd0}, MemOpReg}; // @[DecodeStage.scala 67:18 78:14 41:25]
  wire [1:0] _GEN_19 = io_Clear ? 2'h0 : _GEN_7; // @[DecodeStage.scala 85:17 98:14]
  wire [1:0] _GEN_34 = reset ? 2'h0 : _GEN_19; // @[DecodeStage.scala 41:{25,25}]
  InstuctionDecoder InstDec ( // @[DecodeStage.scala 28:23]
    .io_Instruction(InstDec_io_Instruction),
    .io_Type(InstDec_io_Type),
    .io_rs1(InstDec_io_rs1),
    .io_rs2(InstDec_io_rs2),
    .io_rd(InstDec_io_rd),
    .io_AImmidiate(InstDec_io_AImmidiate),
    .io_ASImmidiate(InstDec_io_ASImmidiate),
    .io_AOperation(InstDec_io_AOperation),
    .io_MemOp(InstDec_io_MemOp),
    .io_MemAdress(InstDec_io_MemAdress),
    .io_COperation(InstDec_io_COperation),
    .io_COffset(InstDec_io_COffset)
  );
  assign Out_Type = io_Clear ? 2'h0 : TypeReg; // @[DecodeStage.scala 104:14 51:12 85:17]
  assign Out_rs1 = io_Clear ? 4'h0 : rs1Reg; // @[DecodeStage.scala 105:13 52:11 85:17]
  assign Out_rs2 = io_Clear ? 4'h0 : rs2Reg; // @[DecodeStage.scala 106:13 53:11 85:17]
  assign Out_rd = io_Clear ? 4'h0 : rdReg; // @[DecodeStage.scala 107:12 54:10 85:17]
  assign Out_AImmediate = io_Clear ? 11'h0 : AImmediateReg; // @[DecodeStage.scala 85:17 109:20 56:18]
  assign Out_ASImmediate = io_Clear ? $signed(11'sh0) : $signed(ASImmediateReg); // @[DecodeStage.scala 85:17 110:20 57:18]
  assign Out_AOperation = io_Clear ? 4'h0 : AOperationReg; // @[DecodeStage.scala 85:17 112:20 59:18]
  assign Out_MemOp = io_Clear ? 1'h0 : MemOpReg; // @[DecodeStage.scala 114:15 61:13 85:17]
  assign Out_MemAddress = io_Clear ? 11'h0 : MemAddressReg; // @[DecodeStage.scala 85:17 115:20 62:18]
  assign Out_COperation = io_Clear ? 2'h0 : COperationReg; // @[DecodeStage.scala 85:17 117:20 64:18]
  assign Out_COffset = io_Clear ? $signed(6'sh0) : $signed(COffsetReg); // @[DecodeStage.scala 118:17 65:15 85:17]
  assign InstDec_io_Instruction = io_Clear ? 18'h0 : In_Instruction; // @[DecodeStage.scala 85:17 49:26 86:28]
  always @(posedge clock) begin
    if (reset) begin // @[DecodeStage.scala 31:24]
      TypeReg <= 2'h0; // @[DecodeStage.scala 31:24]
    end else if (io_Clear) begin // @[DecodeStage.scala 85:17]
      TypeReg <= 2'h0; // @[DecodeStage.scala 88:13]
    end else if (~io_Stall) begin // @[DecodeStage.scala 67:18]
      TypeReg <= InstDec_io_Type; // @[DecodeStage.scala 68:13]
    end
    if (reset) begin // @[DecodeStage.scala 32:23]
      rs1Reg <= 4'h0; // @[DecodeStage.scala 32:23]
    end else if (io_Clear) begin // @[DecodeStage.scala 85:17]
      rs1Reg <= 4'h0; // @[DecodeStage.scala 89:12]
    end else if (~io_Stall) begin // @[DecodeStage.scala 67:18]
      rs1Reg <= InstDec_io_rs1; // @[DecodeStage.scala 69:12]
    end
    if (reset) begin // @[DecodeStage.scala 33:23]
      rs2Reg <= 4'h0; // @[DecodeStage.scala 33:23]
    end else if (io_Clear) begin // @[DecodeStage.scala 85:17]
      rs2Reg <= 4'h0; // @[DecodeStage.scala 90:12]
    end else if (~io_Stall) begin // @[DecodeStage.scala 67:18]
      rs2Reg <= InstDec_io_rs2; // @[DecodeStage.scala 70:12]
    end
    if (reset) begin // @[DecodeStage.scala 34:22]
      rdReg <= 4'h0; // @[DecodeStage.scala 34:22]
    end else if (io_Clear) begin // @[DecodeStage.scala 85:17]
      rdReg <= 4'h0; // @[DecodeStage.scala 91:11]
    end else if (~io_Stall) begin // @[DecodeStage.scala 67:18]
      rdReg <= InstDec_io_rd; // @[DecodeStage.scala 71:11]
    end
    if (reset) begin // @[DecodeStage.scala 36:30]
      AImmediateReg <= 11'h0; // @[DecodeStage.scala 36:30]
    end else if (io_Clear) begin // @[DecodeStage.scala 85:17]
      AImmediateReg <= 11'h0; // @[DecodeStage.scala 93:19]
    end else if (~io_Stall) begin // @[DecodeStage.scala 67:18]
      AImmediateReg <= InstDec_io_AImmidiate; // @[DecodeStage.scala 73:19]
    end
    if (reset) begin // @[DecodeStage.scala 37:31]
      ASImmediateReg <= 11'sh0; // @[DecodeStage.scala 37:31]
    end else if (io_Clear) begin // @[DecodeStage.scala 85:17]
      ASImmediateReg <= 11'sh0; // @[DecodeStage.scala 94:20]
    end else if (~io_Stall) begin // @[DecodeStage.scala 67:18]
      ASImmediateReg <= InstDec_io_ASImmidiate; // @[DecodeStage.scala 74:20]
    end
    if (reset) begin // @[DecodeStage.scala 39:30]
      AOperationReg <= 4'h0; // @[DecodeStage.scala 39:30]
    end else if (io_Clear) begin // @[DecodeStage.scala 85:17]
      AOperationReg <= 4'h0; // @[DecodeStage.scala 96:19]
    end else if (~io_Stall) begin // @[DecodeStage.scala 67:18]
      AOperationReg <= InstDec_io_AOperation; // @[DecodeStage.scala 76:19]
    end
    MemOpReg <= _GEN_34[0]; // @[DecodeStage.scala 41:{25,25}]
    if (reset) begin // @[DecodeStage.scala 42:30]
      MemAddressReg <= 11'h0; // @[DecodeStage.scala 42:30]
    end else if (io_Clear) begin // @[DecodeStage.scala 85:17]
      MemAddressReg <= 11'h0; // @[DecodeStage.scala 99:19]
    end else if (~io_Stall) begin // @[DecodeStage.scala 67:18]
      MemAddressReg <= InstDec_io_MemAdress; // @[DecodeStage.scala 79:19]
    end
    if (reset) begin // @[DecodeStage.scala 44:30]
      COperationReg <= 2'h0; // @[DecodeStage.scala 44:30]
    end else if (io_Clear) begin // @[DecodeStage.scala 85:17]
      COperationReg <= 2'h0; // @[DecodeStage.scala 101:19]
    end else if (~io_Stall) begin // @[DecodeStage.scala 67:18]
      COperationReg <= InstDec_io_COperation; // @[DecodeStage.scala 81:19]
    end
    if (reset) begin // @[DecodeStage.scala 45:27]
      COffsetReg <= 6'sh0; // @[DecodeStage.scala 45:27]
    end else if (io_Clear) begin // @[DecodeStage.scala 85:17]
      COffsetReg <= 6'sh0; // @[DecodeStage.scala 102:16]
    end else if (~io_Stall) begin // @[DecodeStage.scala 67:18]
      COffsetReg <= InstDec_io_COffset; // @[DecodeStage.scala 82:16]
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
  TypeReg = _RAND_0[1:0];
  _RAND_1 = {1{`RANDOM}};
  rs1Reg = _RAND_1[3:0];
  _RAND_2 = {1{`RANDOM}};
  rs2Reg = _RAND_2[3:0];
  _RAND_3 = {1{`RANDOM}};
  rdReg = _RAND_3[3:0];
  _RAND_4 = {1{`RANDOM}};
  AImmediateReg = _RAND_4[10:0];
  _RAND_5 = {1{`RANDOM}};
  ASImmediateReg = _RAND_5[10:0];
  _RAND_6 = {1{`RANDOM}};
  AOperationReg = _RAND_6[3:0];
  _RAND_7 = {1{`RANDOM}};
  MemOpReg = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  MemAddressReg = _RAND_8[10:0];
  _RAND_9 = {1{`RANDOM}};
  COperationReg = _RAND_9[1:0];
  _RAND_10 = {1{`RANDOM}};
  COffsetReg = _RAND_10[5:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ALU(
  input  [17:0] io_rs1,
  input  [17:0] io_rs2,
  input  [7:0]  io_Operation,
  output [17:0] io_Out
);
  wire [17:0] _io_Out_T_1 = io_rs1 + io_rs2; // @[ALU.scala 17:24]
  wire [17:0] _io_Out_T_3 = io_rs1 - io_rs2; // @[ALU.scala 20:24]
  wire [35:0] _io_Out_T_4 = io_rs1 * io_rs2; // @[ALU.scala 23:24]
  wire [262160:0] _GEN_8 = {{262143'd0}, io_rs1}; // @[ALU.scala 26:24]
  wire [262160:0] _io_Out_T_5 = _GEN_8 << io_rs2; // @[ALU.scala 26:24]
  wire [17:0] _io_Out_T_6 = io_rs1 >> io_rs2; // @[ALU.scala 29:24]
  wire [17:0] _io_Out_T_7 = io_rs1 & io_rs2; // @[ALU.scala 32:24]
  wire [17:0] _io_Out_T_8 = io_rs1 | io_rs2; // @[ALU.scala 35:24]
  wire [17:0] _io_Out_T_9 = io_rs1 ^ io_rs2; // @[ALU.scala 38:24]
  wire [17:0] _GEN_0 = 8'h7 == io_Operation ? _io_Out_T_9 : 18'h0; // @[ALU.scala 13:10 15:24 38:14]
  wire [17:0] _GEN_1 = 8'h6 == io_Operation ? _io_Out_T_8 : _GEN_0; // @[ALU.scala 15:24 35:14]
  wire [17:0] _GEN_2 = 8'h5 == io_Operation ? _io_Out_T_7 : _GEN_1; // @[ALU.scala 15:24 32:14]
  wire [17:0] _GEN_3 = 8'h4 == io_Operation ? _io_Out_T_6 : _GEN_2; // @[ALU.scala 15:24 29:14]
  wire [262160:0] _GEN_4 = 8'h3 == io_Operation ? _io_Out_T_5 : {{262143'd0}, _GEN_3}; // @[ALU.scala 15:24 26:14]
  wire [262160:0] _GEN_5 = 8'h2 == io_Operation ? {{262125'd0}, _io_Out_T_4} : _GEN_4; // @[ALU.scala 15:24 23:14]
  wire [262160:0] _GEN_6 = 8'h1 == io_Operation ? {{262143'd0}, _io_Out_T_3} : _GEN_5; // @[ALU.scala 15:24 20:14]
  wire [262160:0] _GEN_7 = 8'h0 == io_Operation ? {{262143'd0}, _io_Out_T_1} : _GEN_6; // @[ALU.scala 15:24 17:14]
  assign io_Out = _GEN_7[17:0];
endmodule
module BranchComp(
  input  [17:0] io_rs2,
  input  [17:0] io_rs1,
  input  [17:0] io_PC,
  input  [10:0] io_Offset,
  input  [1:0]  io_Operation,
  output        io_CondCheck,
  output [17:0] io_Out
);
  wire  _GEN_0 = 2'h3 == io_Operation & io_rs2 > io_rs1; // @[BranchComp.scala 19:13 21:23 32:17]
  wire  _GEN_1 = 2'h2 == io_Operation ? io_rs2 >= io_rs1 : _GEN_0; // @[BranchComp.scala 21:23 29:17]
  wire  _GEN_2 = 2'h1 == io_Operation ? io_rs2 != io_rs1 : _GEN_1; // @[BranchComp.scala 21:23 26:17]
  wire  CondCheck = 2'h0 == io_Operation ? io_rs2 == io_rs1 : _GEN_2; // @[BranchComp.scala 21:23 23:17]
  wire [17:0] _GEN_5 = {{7{io_Offset[10]}},io_Offset}; // @[BranchComp.scala 37:29]
  wire [17:0] _io_Out_T_4 = $signed(io_PC) + $signed(_GEN_5); // @[BranchComp.scala 37:42]
  wire [17:0] _io_Out_T_6 = io_PC + 18'h1; // @[BranchComp.scala 39:21]
  assign io_CondCheck = 2'h0 == io_Operation ? io_rs2 == io_rs1 : _GEN_2; // @[BranchComp.scala 21:23 23:17]
  assign io_Out = CondCheck ? _io_Out_T_4 : _io_Out_T_6; // @[BranchComp.scala 36:18 37:12 39:12]
endmodule
module ExecuteStage(
  input         clock,
  input         reset,
  input  [17:0] io_x_0,
  input  [17:0] io_x_1,
  input  [17:0] io_x_2,
  input  [17:0] io_x_3,
  input  [17:0] io_x_4,
  input  [17:0] io_x_5,
  input  [17:0] io_x_6,
  input  [17:0] io_x_7,
  input  [17:0] io_x_8,
  input  [17:0] io_x_9,
  input  [17:0] io_x_10,
  input  [17:0] io_x_11,
  input  [17:0] io_x_12,
  input  [17:0] io_x_13,
  input  [17:0] io_x_14,
  input  [17:0] io_x_15,
  output [17:0] io_MemPort_Address,
  output [17:0] io_MemPort_WriteData,
  output        io_MemPort_Enable,
  output        io_MemPort_WriteEn,
  input  [17:0] io_MemPort_ReadData,
  input         io_MemPort_Completed,
  output        io_Stall,
  input         io_Clear,
  input  [1:0]  In_Type,
  input  [3:0]  In_rs1,
  input  [3:0]  In_rs2,
  input  [3:0]  In_rd,
  input  [10:0] In_AImmediate,
  input  [10:0] In_ASImmediate,
  input  [3:0]  In_AOperation,
  input         In_MemOp,
  input  [10:0] In_MemAddress,
  input  [1:0]  In_COperation,
  input  [5:0]  In_COffset,
  output [3:0]  Out_WritebackMode,
  output [3:0]  Out_WritebackRegister,
  output [17:0] Out_ALUOut,
  output [17:0] Out_JumpValue
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  wire [17:0] ALU_io_rs1; // @[ExecuteStage.scala 38:19]
  wire [17:0] ALU_io_rs2; // @[ExecuteStage.scala 38:19]
  wire [7:0] ALU_io_Operation; // @[ExecuteStage.scala 38:19]
  wire [17:0] ALU_io_Out; // @[ExecuteStage.scala 38:19]
  wire [17:0] BranchComp_io_rs2; // @[ExecuteStage.scala 39:26]
  wire [17:0] BranchComp_io_rs1; // @[ExecuteStage.scala 39:26]
  wire [17:0] BranchComp_io_PC; // @[ExecuteStage.scala 39:26]
  wire [10:0] BranchComp_io_Offset; // @[ExecuteStage.scala 39:26]
  wire [1:0] BranchComp_io_Operation; // @[ExecuteStage.scala 39:26]
  wire  BranchComp_io_CondCheck; // @[ExecuteStage.scala 39:26]
  wire [17:0] BranchComp_io_Out; // @[ExecuteStage.scala 39:26]
  reg [3:0] WritebackMode; // @[ExecuteStage.scala 60:30]
  reg [3:0] WritebackRegister; // @[ExecuteStage.scala 61:34]
  reg [17:0] ALUOutReg; // @[ExecuteStage.scala 62:26]
  reg [5:0] COffsetReg; // @[ExecuteStage.scala 63:27]
  reg [3:0] DataHazard; // @[ExecuteStage.scala 65:27]
  wire [17:0] _GEN_1 = 4'h1 == In_rs1 ? io_x_1 : io_x_0; // @[ExecuteStage.scala 73:{7,7}]
  wire [17:0] _GEN_2 = 4'h2 == In_rs1 ? io_x_2 : _GEN_1; // @[ExecuteStage.scala 73:{7,7}]
  wire [17:0] _GEN_3 = 4'h3 == In_rs1 ? io_x_3 : _GEN_2; // @[ExecuteStage.scala 73:{7,7}]
  wire [17:0] _GEN_4 = 4'h4 == In_rs1 ? io_x_4 : _GEN_3; // @[ExecuteStage.scala 73:{7,7}]
  wire [17:0] _GEN_5 = 4'h5 == In_rs1 ? io_x_5 : _GEN_4; // @[ExecuteStage.scala 73:{7,7}]
  wire [17:0] _GEN_6 = 4'h6 == In_rs1 ? io_x_6 : _GEN_5; // @[ExecuteStage.scala 73:{7,7}]
  wire [17:0] _GEN_7 = 4'h7 == In_rs1 ? io_x_7 : _GEN_6; // @[ExecuteStage.scala 73:{7,7}]
  wire [17:0] _GEN_8 = 4'h8 == In_rs1 ? io_x_8 : _GEN_7; // @[ExecuteStage.scala 73:{7,7}]
  wire [17:0] _GEN_9 = 4'h9 == In_rs1 ? io_x_9 : _GEN_8; // @[ExecuteStage.scala 73:{7,7}]
  wire [17:0] _GEN_10 = 4'ha == In_rs1 ? io_x_10 : _GEN_9; // @[ExecuteStage.scala 73:{7,7}]
  wire [17:0] _GEN_11 = 4'hb == In_rs1 ? io_x_11 : _GEN_10; // @[ExecuteStage.scala 73:{7,7}]
  wire [17:0] _GEN_12 = 4'hc == In_rs1 ? io_x_12 : _GEN_11; // @[ExecuteStage.scala 73:{7,7}]
  wire [17:0] _GEN_13 = 4'hd == In_rs1 ? io_x_13 : _GEN_12; // @[ExecuteStage.scala 73:{7,7}]
  wire [17:0] _GEN_14 = 4'he == In_rs1 ? io_x_14 : _GEN_13; // @[ExecuteStage.scala 73:{7,7}]
  wire [17:0] _GEN_15 = 4'hf == In_rs1 ? io_x_15 : _GEN_14; // @[ExecuteStage.scala 73:{7,7}]
  wire [17:0] _GEN_17 = 4'h1 == In_rs2 ? io_x_1 : io_x_0; // @[ExecuteStage.scala 74:{7,7}]
  wire [17:0] _GEN_18 = 4'h2 == In_rs2 ? io_x_2 : _GEN_17; // @[ExecuteStage.scala 74:{7,7}]
  wire [17:0] _GEN_19 = 4'h3 == In_rs2 ? io_x_3 : _GEN_18; // @[ExecuteStage.scala 74:{7,7}]
  wire [17:0] _GEN_20 = 4'h4 == In_rs2 ? io_x_4 : _GEN_19; // @[ExecuteStage.scala 74:{7,7}]
  wire [17:0] _GEN_21 = 4'h5 == In_rs2 ? io_x_5 : _GEN_20; // @[ExecuteStage.scala 74:{7,7}]
  wire [17:0] _GEN_22 = 4'h6 == In_rs2 ? io_x_6 : _GEN_21; // @[ExecuteStage.scala 74:{7,7}]
  wire [17:0] _GEN_23 = 4'h7 == In_rs2 ? io_x_7 : _GEN_22; // @[ExecuteStage.scala 74:{7,7}]
  wire [17:0] _GEN_24 = 4'h8 == In_rs2 ? io_x_8 : _GEN_23; // @[ExecuteStage.scala 74:{7,7}]
  wire [17:0] _GEN_25 = 4'h9 == In_rs2 ? io_x_9 : _GEN_24; // @[ExecuteStage.scala 74:{7,7}]
  wire [17:0] _GEN_26 = 4'ha == In_rs2 ? io_x_10 : _GEN_25; // @[ExecuteStage.scala 74:{7,7}]
  wire [17:0] _GEN_27 = 4'hb == In_rs2 ? io_x_11 : _GEN_26; // @[ExecuteStage.scala 74:{7,7}]
  wire [17:0] _GEN_28 = 4'hc == In_rs2 ? io_x_12 : _GEN_27; // @[ExecuteStage.scala 74:{7,7}]
  wire [17:0] _GEN_29 = 4'hd == In_rs2 ? io_x_13 : _GEN_28; // @[ExecuteStage.scala 74:{7,7}]
  wire [17:0] _GEN_30 = 4'he == In_rs2 ? io_x_14 : _GEN_29; // @[ExecuteStage.scala 74:{7,7}]
  wire [17:0] _GEN_31 = 4'hf == In_rs2 ? io_x_15 : _GEN_30; // @[ExecuteStage.scala 74:{7,7}]
  wire [17:0] _GEN_33 = 4'h1 == In_rd ? io_x_1 : io_x_0; // @[ExecuteStage.scala 75:{6,6}]
  wire [17:0] _GEN_34 = 4'h2 == In_rd ? io_x_2 : _GEN_33; // @[ExecuteStage.scala 75:{6,6}]
  wire [17:0] _GEN_35 = 4'h3 == In_rd ? io_x_3 : _GEN_34; // @[ExecuteStage.scala 75:{6,6}]
  wire [17:0] _GEN_36 = 4'h4 == In_rd ? io_x_4 : _GEN_35; // @[ExecuteStage.scala 75:{6,6}]
  wire [17:0] _GEN_37 = 4'h5 == In_rd ? io_x_5 : _GEN_36; // @[ExecuteStage.scala 75:{6,6}]
  wire [17:0] _GEN_38 = 4'h6 == In_rd ? io_x_6 : _GEN_37; // @[ExecuteStage.scala 75:{6,6}]
  wire [17:0] _GEN_39 = 4'h7 == In_rd ? io_x_7 : _GEN_38; // @[ExecuteStage.scala 75:{6,6}]
  wire [17:0] _GEN_40 = 4'h8 == In_rd ? io_x_8 : _GEN_39; // @[ExecuteStage.scala 75:{6,6}]
  wire [17:0] _GEN_41 = 4'h9 == In_rd ? io_x_9 : _GEN_40; // @[ExecuteStage.scala 75:{6,6}]
  wire [17:0] _GEN_42 = 4'ha == In_rd ? io_x_10 : _GEN_41; // @[ExecuteStage.scala 75:{6,6}]
  wire [17:0] _GEN_43 = 4'hb == In_rd ? io_x_11 : _GEN_42; // @[ExecuteStage.scala 75:{6,6}]
  wire [17:0] _GEN_44 = 4'hc == In_rd ? io_x_12 : _GEN_43; // @[ExecuteStage.scala 75:{6,6}]
  wire [17:0] _GEN_45 = 4'hd == In_rd ? io_x_13 : _GEN_44; // @[ExecuteStage.scala 75:{6,6}]
  wire [17:0] _GEN_46 = 4'he == In_rd ? io_x_14 : _GEN_45; // @[ExecuteStage.scala 75:{6,6}]
  wire [17:0] _GEN_47 = 4'hf == In_rd ? io_x_15 : _GEN_46; // @[ExecuteStage.scala 75:{6,6}]
  wire  _T = In_rs1 == DataHazard; // @[ExecuteStage.scala 77:15]
  wire  _T_1 = 4'h1 == WritebackMode; // @[ExecuteStage.scala 78:26]
  wire  _T_2 = 4'h2 == WritebackMode; // @[ExecuteStage.scala 78:26]
  wire  _T_3 = 4'h3 == WritebackMode; // @[ExecuteStage.scala 78:26]
  wire [17:0] _GEN_48 = 4'h3 == WritebackMode ? io_MemPort_ReadData : _GEN_15; // @[ExecuteStage.scala 78:26 86:13 73:7]
  wire [17:0] _GEN_49 = 4'h2 == WritebackMode ? ALUOutReg : _GEN_48; // @[ExecuteStage.scala 78:26 83:13]
  wire [17:0] _GEN_50 = 4'h1 == WritebackMode ? ALUOutReg : _GEN_49; // @[ExecuteStage.scala 78:26 80:13]
  wire [17:0] rs1 = In_rs1 == DataHazard ? _GEN_50 : _GEN_15; // @[ExecuteStage.scala 77:30 73:7]
  wire [17:0] _GEN_52 = _T_3 ? io_MemPort_ReadData : _GEN_31; // @[ExecuteStage.scala 100:13 92:26 74:7]
  wire [17:0] _GEN_53 = _T_2 ? ALUOutReg : _GEN_52; // @[ExecuteStage.scala 92:26 97:13]
  wire [17:0] _GEN_54 = _T_1 ? ALUOutReg : _GEN_53; // @[ExecuteStage.scala 92:26 94:13]
  wire [17:0] rs2 = In_rs2 == DataHazard ? _GEN_54 : _GEN_31; // @[ExecuteStage.scala 91:30 74:7]
  wire [17:0] _GEN_56 = _T_3 ? io_MemPort_ReadData : _GEN_47; // @[ExecuteStage.scala 106:26 114:12 75:6]
  wire [17:0] _GEN_57 = _T_2 ? ALUOutReg : _GEN_56; // @[ExecuteStage.scala 106:26 111:12]
  wire [17:0] _GEN_58 = _T_1 ? ALUOutReg : _GEN_57; // @[ExecuteStage.scala 106:26 108:12]
  wire [17:0] rd = In_rd == DataHazard ? _GEN_58 : _GEN_47; // @[ExecuteStage.scala 105:29 75:6]
  wire [3:0] _GEN_61 = io_Clear ? 4'h0 : WritebackMode; // @[ExecuteStage.scala 128:17 130:19 60:30]
  wire [3:0] _GEN_62 = io_Clear ? 4'h0 : WritebackRegister; // @[ExecuteStage.scala 128:17 131:23 61:34]
  wire [5:0] _GEN_63 = io_Clear ? 6'h0 : COffsetReg; // @[ExecuteStage.scala 128:17 132:16 63:27]
  wire [17:0] _GEN_64 = _T_2 ? ALUOutReg : 18'h0; // @[ExecuteStage.scala 160:32 165:34 44:22]
  wire [17:0] _GEN_65 = _T_1 ? ALUOutReg : _GEN_64; // @[ExecuteStage.scala 160:32 162:34]
  wire [17:0] _GEN_66 = _T & In_rs1 != 4'h0 ? _GEN_65 : 18'h0; // @[ExecuteStage.scala 159:54 44:22]
  wire  _T_20 = ~io_MemPort_Completed; // @[ExecuteStage.scala 175:14]
  wire  _T_21 = In_AOperation == 4'h9; // @[ExecuteStage.scala 178:32]
  wire [17:0] _GEN_70 = _T ? _GEN_65 : 18'h0; // @[ExecuteStage.scala 185:36 44:22]
  wire [17:0] _GEN_73 = In_AOperation == 4'h9 ? _GEN_70 : 18'h0; // @[ExecuteStage.scala 178:40 44:22]
  wire [17:0] _GEN_74 = In_AOperation == 4'h9 ? rd : 18'h0; // @[ExecuteStage.scala 178:40 196:30 45:24]
  wire [3:0] _GEN_75 = In_AOperation == 4'h9 ? 4'h0 : _GEN_61; // @[ExecuteStage.scala 178:40 198:23]
  wire  _GEN_76 = In_AOperation == 4'h9 & _T_20; // @[ExecuteStage.scala 178:40 48:12]
  wire  _GEN_77 = In_AOperation == 4'h8 | _T_21; // @[ExecuteStage.scala 152:40 153:27]
  wire [17:0] _GEN_78 = In_AOperation == 4'h8 ? _GEN_66 : _GEN_73; // @[ExecuteStage.scala 152:40]
  wire  _GEN_82 = In_AOperation == 4'h8 ? _T_20 : _GEN_76; // @[ExecuteStage.scala 152:40]
  wire  _GEN_83 = In_AOperation == 4'h8 ? 1'h0 : _T_21; // @[ExecuteStage.scala 152:40 46:22]
  wire [17:0] _GEN_84 = In_AOperation == 4'h8 ? 18'h0 : _GEN_74; // @[ExecuteStage.scala 152:40 45:24]
  wire [3:0] _GEN_85 = In_AOperation <= 4'h7 ? In_AOperation : 4'h0; // @[ExecuteStage.scala 139:33 140:26 52:20]
  wire [17:0] _GEN_86 = In_AOperation <= 4'h7 ? rs2 : 18'h0; // @[ExecuteStage.scala 139:33 145:20 50:14]
  wire [17:0] _GEN_87 = In_AOperation <= 4'h7 ? rs1 : 18'h0; // @[ExecuteStage.scala 139:33 146:20 51:14]
  wire  _GEN_91 = In_AOperation <= 4'h7 ? 1'h0 : _GEN_77; // @[ExecuteStage.scala 139:33 43:21]
  wire [17:0] _GEN_92 = In_AOperation <= 4'h7 ? 18'h0 : _GEN_78; // @[ExecuteStage.scala 139:33 44:22]
  wire  _GEN_93 = In_AOperation <= 4'h7 ? 1'h0 : _GEN_82; // @[ExecuteStage.scala 139:33 48:12]
  wire  _GEN_94 = In_AOperation <= 4'h7 ? 1'h0 : _GEN_83; // @[ExecuteStage.scala 139:33 46:22]
  wire [17:0] _GEN_95 = In_AOperation <= 4'h7 ? 18'h0 : _GEN_84; // @[ExecuteStage.scala 139:33 45:24]
  wire [8:0] upper = In_AImmediate[8:0]; // @[ExecuteStage.scala 214:31]
  wire [8:0] lower = rd[8:0]; // @[ExecuteStage.scala 217:20]
  wire [17:0] cat = {upper,lower}; // @[Cat.scala 31:58]
  wire  _T_29 = $signed(In_ASImmediate) < 11'sh0; // @[ExecuteStage.scala 224:29]
  wire [10:0] _ALU_io_rs2_T_3 = 11'sh0 - $signed(In_ASImmediate); // @[ExecuteStage.scala 226:48]
  wire [10:0] _GEN_97 = $signed(In_ASImmediate) < 11'sh0 ? _ALU_io_rs2_T_3 : In_ASImmediate; // @[ExecuteStage.scala 224:35 226:22 231:22]
  wire [10:0] _GEN_99 = In_AOperation == 4'h2 ? 11'h0 : _GEN_97; // @[ExecuteStage.scala 210:40 211:20]
  wire [17:0] _GEN_100 = In_AOperation == 4'h2 ? cat : rd; // @[ExecuteStage.scala 210:40 221:20]
  wire  _GEN_101 = In_AOperation == 4'h2 ? 1'h0 : _T_29; // @[ExecuteStage.scala 210:40 222:26]
  wire [10:0] _GEN_102 = In_AOperation == 4'h1 ? 11'h0 : _GEN_99; // @[ExecuteStage.scala 206:34 207:20]
  wire [17:0] _GEN_103 = In_AOperation == 4'h1 ? {{7'd0}, In_AImmediate} : _GEN_100; // @[ExecuteStage.scala 206:34 208:20]
  wire  _GEN_104 = In_AOperation == 4'h1 ? 1'h0 : _GEN_101; // @[ExecuteStage.scala 206:34 209:26]
  wire [3:0] _GEN_105 = In_MemOp ? 4'h0 : _GEN_61; // @[ExecuteStage.scala 249:23 255:25]
  wire [3:0] _GEN_106 = ~In_MemOp ? 4'h3 : _GEN_105; // @[ExecuteStage.scala 249:23 251:25]
  wire [3:0] _GEN_107 = ~In_MemOp ? In_rd : DataHazard; // @[ExecuteStage.scala 249:23 252:22 65:27]
  wire [17:0] _BranchComp_io_PC_T_1 = io_x_1 - 18'h2; // @[ExecuteStage.scala 273:35]
  wire [2:0] _GEN_109 = BranchComp_io_CondCheck ? 3'h4 : 3'h0; // @[ExecuteStage.scala 278:36 279:23 281:23]
  wire [2:0] _GEN_110 = io_Clear ? 3'h0 : _GEN_109; // @[ExecuteStage.scala 284:21 285:23]
  wire [17:0] _GEN_111 = 2'h3 == In_Type ? rs2 : 18'h0; // @[ExecuteStage.scala 137:18 269:25 54:21]
  wire [17:0] _GEN_112 = 2'h3 == In_Type ? rs1 : 18'h0; // @[ExecuteStage.scala 137:18 270:25 55:21]
  wire [1:0] _GEN_113 = 2'h3 == In_Type ? In_COperation : 2'h0; // @[ExecuteStage.scala 137:18 272:31 58:27]
  wire [17:0] _GEN_114 = 2'h3 == In_Type ? _BranchComp_io_PC_T_1 : 18'h0; // @[ExecuteStage.scala 137:18 273:24 56:20]
  wire [5:0] _GEN_115 = 2'h3 == In_Type ? $signed(In_COffset) : $signed(6'sh0); // @[ExecuteStage.scala 137:18 274:28 57:24]
  wire [17:0] _GEN_116 = 2'h3 == In_Type ? BranchComp_io_Out : {{12'd0}, _GEN_63}; // @[ExecuteStage.scala 137:18 276:18]
  wire [3:0] _GEN_117 = 2'h3 == In_Type ? {{1'd0}, _GEN_110} : _GEN_61; // @[ExecuteStage.scala 137:18]
  wire [3:0] _GEN_118 = 2'h3 == In_Type ? 4'h0 : _GEN_62; // @[ExecuteStage.scala 137:18 288:25]
  wire [10:0] _GEN_119 = 2'h2 == In_Type ? In_MemAddress : 11'h0; // @[ExecuteStage.scala 137:18 243:26 44:22]
  wire [17:0] _GEN_120 = 2'h2 == In_Type ? rd : 18'h0; // @[ExecuteStage.scala 137:18 245:28 45:24]
  wire  _GEN_122 = 2'h2 == In_Type & In_MemOp; // @[ExecuteStage.scala 137:18 247:26 46:22]
  wire [17:0] _GEN_127 = 2'h2 == In_Type ? 18'h0 : _GEN_111; // @[ExecuteStage.scala 137:18 54:21]
  wire [17:0] _GEN_128 = 2'h2 == In_Type ? 18'h0 : _GEN_112; // @[ExecuteStage.scala 137:18 55:21]
  wire [1:0] _GEN_129 = 2'h2 == In_Type ? 2'h0 : _GEN_113; // @[ExecuteStage.scala 137:18 58:27]
  wire [17:0] _GEN_130 = 2'h2 == In_Type ? 18'h0 : _GEN_114; // @[ExecuteStage.scala 137:18 56:20]
  wire [5:0] _GEN_131 = 2'h2 == In_Type ? $signed(6'sh0) : $signed(_GEN_115); // @[ExecuteStage.scala 137:18 57:24]
  wire [17:0] _GEN_132 = 2'h2 == In_Type ? {{12'd0}, _GEN_63} : _GEN_116; // @[ExecuteStage.scala 137:18]
  wire [10:0] _GEN_133 = 2'h1 == In_Type ? _GEN_102 : 11'h0; // @[ExecuteStage.scala 137:18 50:14]
  wire [17:0] _GEN_134 = 2'h1 == In_Type ? _GEN_103 : 18'h0; // @[ExecuteStage.scala 137:18 51:14]
  wire  _GEN_135 = 2'h1 == In_Type & _GEN_104; // @[ExecuteStage.scala 137:18 52:20]
  wire [10:0] _GEN_139 = 2'h1 == In_Type ? 11'h0 : _GEN_119; // @[ExecuteStage.scala 137:18 44:22]
  wire [17:0] _GEN_140 = 2'h1 == In_Type ? 18'h0 : _GEN_120; // @[ExecuteStage.scala 137:18 45:24]
  wire  _GEN_141 = 2'h1 == In_Type ? 1'h0 : 2'h2 == In_Type; // @[ExecuteStage.scala 137:18 43:21]
  wire  _GEN_142 = 2'h1 == In_Type ? 1'h0 : _GEN_122; // @[ExecuteStage.scala 137:18 46:22]
  wire  _GEN_143 = 2'h1 == In_Type ? 1'h0 : 2'h2 == In_Type & _T_20; // @[ExecuteStage.scala 137:18 48:12]
  wire [17:0] _GEN_144 = 2'h1 == In_Type ? 18'h0 : _GEN_127; // @[ExecuteStage.scala 137:18 54:21]
  wire [17:0] _GEN_145 = 2'h1 == In_Type ? 18'h0 : _GEN_128; // @[ExecuteStage.scala 137:18 55:21]
  wire [1:0] _GEN_146 = 2'h1 == In_Type ? 2'h0 : _GEN_129; // @[ExecuteStage.scala 137:18 58:27]
  wire [17:0] _GEN_147 = 2'h1 == In_Type ? 18'h0 : _GEN_130; // @[ExecuteStage.scala 137:18 56:20]
  wire [5:0] _GEN_148 = 2'h1 == In_Type ? $signed(6'sh0) : $signed(_GEN_131); // @[ExecuteStage.scala 137:18 57:24]
  wire [17:0] _GEN_149 = 2'h1 == In_Type ? {{12'd0}, _GEN_63} : _GEN_132; // @[ExecuteStage.scala 137:18]
  wire [3:0] _GEN_150 = 2'h0 == In_Type ? _GEN_85 : {{3'd0}, _GEN_135}; // @[ExecuteStage.scala 137:18]
  wire [5:0] _GEN_165 = 2'h0 == In_Type ? $signed(6'sh0) : $signed(_GEN_148); // @[ExecuteStage.scala 137:18 57:24]
  wire [17:0] _GEN_166 = 2'h0 == In_Type ? {{12'd0}, _GEN_63} : _GEN_149; // @[ExecuteStage.scala 137:18]
  wire [17:0] _GEN_167 = reset ? 18'h0 : _GEN_166; // @[ExecuteStage.scala 63:{27,27}]
  ALU ALU ( // @[ExecuteStage.scala 38:19]
    .io_rs1(ALU_io_rs1),
    .io_rs2(ALU_io_rs2),
    .io_Operation(ALU_io_Operation),
    .io_Out(ALU_io_Out)
  );
  BranchComp BranchComp ( // @[ExecuteStage.scala 39:26]
    .io_rs2(BranchComp_io_rs2),
    .io_rs1(BranchComp_io_rs1),
    .io_PC(BranchComp_io_PC),
    .io_Offset(BranchComp_io_Offset),
    .io_Operation(BranchComp_io_Operation),
    .io_CondCheck(BranchComp_io_CondCheck),
    .io_Out(BranchComp_io_Out)
  );
  assign io_MemPort_Address = 2'h0 == In_Type ? _GEN_92 : {{7'd0}, _GEN_139}; // @[ExecuteStage.scala 137:18]
  assign io_MemPort_WriteData = 2'h0 == In_Type ? _GEN_95 : _GEN_140; // @[ExecuteStage.scala 137:18]
  assign io_MemPort_Enable = 2'h0 == In_Type ? _GEN_91 : _GEN_141; // @[ExecuteStage.scala 137:18]
  assign io_MemPort_WriteEn = 2'h0 == In_Type ? _GEN_94 : _GEN_142; // @[ExecuteStage.scala 137:18]
  assign io_Stall = 2'h0 == In_Type ? _GEN_93 : _GEN_143; // @[ExecuteStage.scala 137:18]
  assign Out_WritebackMode = WritebackMode; // @[ExecuteStage.scala 120:21]
  assign Out_WritebackRegister = WritebackRegister; // @[ExecuteStage.scala 121:25]
  assign Out_ALUOut = ALUOutReg; // @[ExecuteStage.scala 119:14]
  assign Out_JumpValue = {{12'd0}, COffsetReg}; // @[ExecuteStage.scala 122:17]
  assign ALU_io_rs1 = 2'h0 == In_Type ? _GEN_87 : _GEN_134; // @[ExecuteStage.scala 137:18]
  assign ALU_io_rs2 = 2'h0 == In_Type ? _GEN_86 : {{7'd0}, _GEN_133}; // @[ExecuteStage.scala 137:18]
  assign ALU_io_Operation = {{4'd0}, _GEN_150};
  assign BranchComp_io_rs2 = 2'h0 == In_Type ? 18'h0 : _GEN_144; // @[ExecuteStage.scala 137:18 54:21]
  assign BranchComp_io_rs1 = 2'h0 == In_Type ? 18'h0 : _GEN_145; // @[ExecuteStage.scala 137:18 55:21]
  assign BranchComp_io_PC = 2'h0 == In_Type ? 18'h0 : _GEN_147; // @[ExecuteStage.scala 137:18 56:20]
  assign BranchComp_io_Offset = {{5{_GEN_165[5]}},_GEN_165};
  assign BranchComp_io_Operation = 2'h0 == In_Type ? 2'h0 : _GEN_146; // @[ExecuteStage.scala 137:18 58:27]
  always @(posedge clock) begin
    if (reset) begin // @[ExecuteStage.scala 60:30]
      WritebackMode <= 4'h0; // @[ExecuteStage.scala 60:30]
    end else if (2'h0 == In_Type) begin // @[ExecuteStage.scala 137:18]
      if (In_AOperation <= 4'h7) begin // @[ExecuteStage.scala 139:33]
        WritebackMode <= 4'h1; // @[ExecuteStage.scala 148:23]
      end else if (In_AOperation == 4'h8) begin // @[ExecuteStage.scala 152:40]
        WritebackMode <= 4'h3; // @[ExecuteStage.scala 170:23]
      end else begin
        WritebackMode <= _GEN_75;
      end
    end else if (2'h1 == In_Type) begin // @[ExecuteStage.scala 137:18]
      WritebackMode <= 4'h1; // @[ExecuteStage.scala 237:21]
    end else if (2'h2 == In_Type) begin // @[ExecuteStage.scala 137:18]
      WritebackMode <= _GEN_106;
    end else begin
      WritebackMode <= _GEN_117;
    end
    if (reset) begin // @[ExecuteStage.scala 61:34]
      WritebackRegister <= 4'h0; // @[ExecuteStage.scala 61:34]
    end else if (2'h0 == In_Type) begin // @[ExecuteStage.scala 137:18]
      if (In_AOperation <= 4'h7) begin // @[ExecuteStage.scala 139:33]
        WritebackRegister <= In_rd; // @[ExecuteStage.scala 149:27]
      end else if (In_AOperation == 4'h8) begin // @[ExecuteStage.scala 152:40]
        WritebackRegister <= In_rd; // @[ExecuteStage.scala 171:27]
      end else begin
        WritebackRegister <= _GEN_62;
      end
    end else if (2'h1 == In_Type) begin // @[ExecuteStage.scala 137:18]
      WritebackRegister <= In_rd; // @[ExecuteStage.scala 238:25]
    end else if (2'h2 == In_Type) begin // @[ExecuteStage.scala 137:18]
      WritebackRegister <= In_rd; // @[ExecuteStage.scala 263:25]
    end else begin
      WritebackRegister <= _GEN_118;
    end
    if (reset) begin // @[ExecuteStage.scala 62:26]
      ALUOutReg <= 18'h0; // @[ExecuteStage.scala 62:26]
    end else if (io_Clear) begin // @[ExecuteStage.scala 128:17]
      ALUOutReg <= 18'h0; // @[ExecuteStage.scala 129:15]
    end else begin
      ALUOutReg <= ALU_io_Out; // @[ExecuteStage.scala 124:13]
    end
    COffsetReg <= _GEN_167[5:0]; // @[ExecuteStage.scala 63:{27,27}]
    if (reset) begin // @[ExecuteStage.scala 65:27]
      DataHazard <= 4'h0; // @[ExecuteStage.scala 65:27]
    end else if (2'h0 == In_Type) begin // @[ExecuteStage.scala 137:18]
      if (In_AOperation <= 4'h7) begin // @[ExecuteStage.scala 139:33]
        DataHazard <= In_rd; // @[ExecuteStage.scala 151:20]
      end else if (In_AOperation == 4'h8) begin // @[ExecuteStage.scala 152:40]
        DataHazard <= In_rd; // @[ExecuteStage.scala 173:20]
      end
    end else if (2'h1 == In_Type) begin // @[ExecuteStage.scala 137:18]
      DataHazard <= In_rd; // @[ExecuteStage.scala 240:18]
    end else if (2'h2 == In_Type) begin // @[ExecuteStage.scala 137:18]
      DataHazard <= _GEN_107;
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
  WritebackMode = _RAND_0[3:0];
  _RAND_1 = {1{`RANDOM}};
  WritebackRegister = _RAND_1[3:0];
  _RAND_2 = {1{`RANDOM}};
  ALUOutReg = _RAND_2[17:0];
  _RAND_3 = {1{`RANDOM}};
  COffsetReg = _RAND_3[5:0];
  _RAND_4 = {1{`RANDOM}};
  DataHazard = _RAND_4[3:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Core(
  input         clock,
  input         reset,
  input  [15:0] io_WaveIn,
  output [15:0] io_WaveOut,
  output [17:0] io_MemPort_Address,
  output [17:0] io_MemPort_WriteData,
  output        io_MemPort_Enable,
  output        io_MemPort_WriteEn,
  input  [17:0] io_MemPort_ReadData,
  input         io_MemPort_Completed
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
`endif // RANDOMIZE_REG_INIT
  wire  FetchStage_clock; // @[Core.scala 28:26]
  wire  FetchStage_io_Clear; // @[Core.scala 28:26]
  wire [17:0] FetchStage_In_PC; // @[Core.scala 28:26]
  wire [17:0] FetchStage_Out_Instruction; // @[Core.scala 28:26]
  wire  DecodeStage_clock; // @[Core.scala 29:27]
  wire  DecodeStage_reset; // @[Core.scala 29:27]
  wire  DecodeStage_io_Clear; // @[Core.scala 29:27]
  wire  DecodeStage_io_Stall; // @[Core.scala 29:27]
  wire [17:0] DecodeStage_In_Instruction; // @[Core.scala 29:27]
  wire [1:0] DecodeStage_Out_Type; // @[Core.scala 29:27]
  wire [3:0] DecodeStage_Out_rs1; // @[Core.scala 29:27]
  wire [3:0] DecodeStage_Out_rs2; // @[Core.scala 29:27]
  wire [3:0] DecodeStage_Out_rd; // @[Core.scala 29:27]
  wire [10:0] DecodeStage_Out_AImmediate; // @[Core.scala 29:27]
  wire [10:0] DecodeStage_Out_ASImmediate; // @[Core.scala 29:27]
  wire [3:0] DecodeStage_Out_AOperation; // @[Core.scala 29:27]
  wire  DecodeStage_Out_MemOp; // @[Core.scala 29:27]
  wire [10:0] DecodeStage_Out_MemAddress; // @[Core.scala 29:27]
  wire [1:0] DecodeStage_Out_COperation; // @[Core.scala 29:27]
  wire [5:0] DecodeStage_Out_COffset; // @[Core.scala 29:27]
  wire  ExecuteStage_clock; // @[Core.scala 30:28]
  wire  ExecuteStage_reset; // @[Core.scala 30:28]
  wire [17:0] ExecuteStage_io_x_0; // @[Core.scala 30:28]
  wire [17:0] ExecuteStage_io_x_1; // @[Core.scala 30:28]
  wire [17:0] ExecuteStage_io_x_2; // @[Core.scala 30:28]
  wire [17:0] ExecuteStage_io_x_3; // @[Core.scala 30:28]
  wire [17:0] ExecuteStage_io_x_4; // @[Core.scala 30:28]
  wire [17:0] ExecuteStage_io_x_5; // @[Core.scala 30:28]
  wire [17:0] ExecuteStage_io_x_6; // @[Core.scala 30:28]
  wire [17:0] ExecuteStage_io_x_7; // @[Core.scala 30:28]
  wire [17:0] ExecuteStage_io_x_8; // @[Core.scala 30:28]
  wire [17:0] ExecuteStage_io_x_9; // @[Core.scala 30:28]
  wire [17:0] ExecuteStage_io_x_10; // @[Core.scala 30:28]
  wire [17:0] ExecuteStage_io_x_11; // @[Core.scala 30:28]
  wire [17:0] ExecuteStage_io_x_12; // @[Core.scala 30:28]
  wire [17:0] ExecuteStage_io_x_13; // @[Core.scala 30:28]
  wire [17:0] ExecuteStage_io_x_14; // @[Core.scala 30:28]
  wire [17:0] ExecuteStage_io_x_15; // @[Core.scala 30:28]
  wire [17:0] ExecuteStage_io_MemPort_Address; // @[Core.scala 30:28]
  wire [17:0] ExecuteStage_io_MemPort_WriteData; // @[Core.scala 30:28]
  wire  ExecuteStage_io_MemPort_Enable; // @[Core.scala 30:28]
  wire  ExecuteStage_io_MemPort_WriteEn; // @[Core.scala 30:28]
  wire [17:0] ExecuteStage_io_MemPort_ReadData; // @[Core.scala 30:28]
  wire  ExecuteStage_io_MemPort_Completed; // @[Core.scala 30:28]
  wire  ExecuteStage_io_Stall; // @[Core.scala 30:28]
  wire  ExecuteStage_io_Clear; // @[Core.scala 30:28]
  wire [1:0] ExecuteStage_In_Type; // @[Core.scala 30:28]
  wire [3:0] ExecuteStage_In_rs1; // @[Core.scala 30:28]
  wire [3:0] ExecuteStage_In_rs2; // @[Core.scala 30:28]
  wire [3:0] ExecuteStage_In_rd; // @[Core.scala 30:28]
  wire [10:0] ExecuteStage_In_AImmediate; // @[Core.scala 30:28]
  wire [10:0] ExecuteStage_In_ASImmediate; // @[Core.scala 30:28]
  wire [3:0] ExecuteStage_In_AOperation; // @[Core.scala 30:28]
  wire  ExecuteStage_In_MemOp; // @[Core.scala 30:28]
  wire [10:0] ExecuteStage_In_MemAddress; // @[Core.scala 30:28]
  wire [1:0] ExecuteStage_In_COperation; // @[Core.scala 30:28]
  wire [5:0] ExecuteStage_In_COffset; // @[Core.scala 30:28]
  wire [3:0] ExecuteStage_Out_WritebackMode; // @[Core.scala 30:28]
  wire [3:0] ExecuteStage_Out_WritebackRegister; // @[Core.scala 30:28]
  wire [17:0] ExecuteStage_Out_ALUOut; // @[Core.scala 30:28]
  wire [17:0] ExecuteStage_Out_JumpValue; // @[Core.scala 30:28]
  reg [17:0] x_0; // @[Core.scala 34:14]
  reg [17:0] x_1; // @[Core.scala 34:14]
  reg [17:0] x_2; // @[Core.scala 34:14]
  reg [17:0] x_3; // @[Core.scala 34:14]
  reg [17:0] x_4; // @[Core.scala 34:14]
  reg [17:0] x_5; // @[Core.scala 34:14]
  reg [17:0] x_6; // @[Core.scala 34:14]
  reg [17:0] x_7; // @[Core.scala 34:14]
  reg [17:0] x_8; // @[Core.scala 34:14]
  reg [17:0] x_9; // @[Core.scala 34:14]
  reg [17:0] x_10; // @[Core.scala 34:14]
  reg [17:0] x_11; // @[Core.scala 34:14]
  reg [17:0] x_12; // @[Core.scala 34:14]
  reg [17:0] x_13; // @[Core.scala 34:14]
  reg [17:0] x_14; // @[Core.scala 34:14]
  reg [17:0] x_15; // @[Core.scala 34:14]
  wire [17:0] _x_1_T_1 = x_1 + 18'h1; // @[Core.scala 60:18]
  wire [17:0] _GEN_0 = ~ExecuteStage_io_Stall ? _x_1_T_1 : x_1; // @[Core.scala 59:31 60:10 34:14]
  wire [17:0] _x_ExecuteStage_Out_WritebackRegister = ExecuteStage_Out_ALUOut; // @[Core.scala 76:{45,45}]
  wire  _T_2 = ExecuteStage_Out_WritebackRegister == 4'h1; // @[Core.scala 78:46]
  wire  _GEN_52 = 4'h3 == ExecuteStage_Out_WritebackMode ? 1'h0 : 4'h4 == ExecuteStage_Out_WritebackMode; // @[Core.scala 43:23 74:41]
  FetchStage FetchStage ( // @[Core.scala 28:26]
    .clock(FetchStage_clock),
    .io_Clear(FetchStage_io_Clear),
    .In_PC(FetchStage_In_PC),
    .Out_Instruction(FetchStage_Out_Instruction)
  );
  DecodeStage DecodeStage ( // @[Core.scala 29:27]
    .clock(DecodeStage_clock),
    .reset(DecodeStage_reset),
    .io_Clear(DecodeStage_io_Clear),
    .io_Stall(DecodeStage_io_Stall),
    .In_Instruction(DecodeStage_In_Instruction),
    .Out_Type(DecodeStage_Out_Type),
    .Out_rs1(DecodeStage_Out_rs1),
    .Out_rs2(DecodeStage_Out_rs2),
    .Out_rd(DecodeStage_Out_rd),
    .Out_AImmediate(DecodeStage_Out_AImmediate),
    .Out_ASImmediate(DecodeStage_Out_ASImmediate),
    .Out_AOperation(DecodeStage_Out_AOperation),
    .Out_MemOp(DecodeStage_Out_MemOp),
    .Out_MemAddress(DecodeStage_Out_MemAddress),
    .Out_COperation(DecodeStage_Out_COperation),
    .Out_COffset(DecodeStage_Out_COffset)
  );
  ExecuteStage ExecuteStage ( // @[Core.scala 30:28]
    .clock(ExecuteStage_clock),
    .reset(ExecuteStage_reset),
    .io_x_0(ExecuteStage_io_x_0),
    .io_x_1(ExecuteStage_io_x_1),
    .io_x_2(ExecuteStage_io_x_2),
    .io_x_3(ExecuteStage_io_x_3),
    .io_x_4(ExecuteStage_io_x_4),
    .io_x_5(ExecuteStage_io_x_5),
    .io_x_6(ExecuteStage_io_x_6),
    .io_x_7(ExecuteStage_io_x_7),
    .io_x_8(ExecuteStage_io_x_8),
    .io_x_9(ExecuteStage_io_x_9),
    .io_x_10(ExecuteStage_io_x_10),
    .io_x_11(ExecuteStage_io_x_11),
    .io_x_12(ExecuteStage_io_x_12),
    .io_x_13(ExecuteStage_io_x_13),
    .io_x_14(ExecuteStage_io_x_14),
    .io_x_15(ExecuteStage_io_x_15),
    .io_MemPort_Address(ExecuteStage_io_MemPort_Address),
    .io_MemPort_WriteData(ExecuteStage_io_MemPort_WriteData),
    .io_MemPort_Enable(ExecuteStage_io_MemPort_Enable),
    .io_MemPort_WriteEn(ExecuteStage_io_MemPort_WriteEn),
    .io_MemPort_ReadData(ExecuteStage_io_MemPort_ReadData),
    .io_MemPort_Completed(ExecuteStage_io_MemPort_Completed),
    .io_Stall(ExecuteStage_io_Stall),
    .io_Clear(ExecuteStage_io_Clear),
    .In_Type(ExecuteStage_In_Type),
    .In_rs1(ExecuteStage_In_rs1),
    .In_rs2(ExecuteStage_In_rs2),
    .In_rd(ExecuteStage_In_rd),
    .In_AImmediate(ExecuteStage_In_AImmediate),
    .In_ASImmediate(ExecuteStage_In_ASImmediate),
    .In_AOperation(ExecuteStage_In_AOperation),
    .In_MemOp(ExecuteStage_In_MemOp),
    .In_MemAddress(ExecuteStage_In_MemAddress),
    .In_COperation(ExecuteStage_In_COperation),
    .In_COffset(ExecuteStage_In_COffset),
    .Out_WritebackMode(ExecuteStage_Out_WritebackMode),
    .Out_WritebackRegister(ExecuteStage_Out_WritebackRegister),
    .Out_ALUOut(ExecuteStage_Out_ALUOut),
    .Out_JumpValue(ExecuteStage_Out_JumpValue)
  );
  assign io_WaveOut = x_3[15:0]; // @[Core.scala 38:14]
  assign io_MemPort_Address = ExecuteStage_io_MemPort_Address; // @[Core.scala 48:27]
  assign io_MemPort_WriteData = ExecuteStage_io_MemPort_WriteData; // @[Core.scala 48:27]
  assign io_MemPort_Enable = ExecuteStage_io_MemPort_Enable; // @[Core.scala 48:27]
  assign io_MemPort_WriteEn = ExecuteStage_io_MemPort_WriteEn; // @[Core.scala 48:27]
  assign FetchStage_clock = clock;
  assign FetchStage_io_Clear = 4'h1 == ExecuteStage_Out_WritebackMode ? _T_2 : _GEN_52; // @[Core.scala 74:41]
  assign FetchStage_In_PC = x_1; // @[Core.scala 56:20]
  assign DecodeStage_clock = clock;
  assign DecodeStage_reset = reset;
  assign DecodeStage_io_Clear = 4'h1 == ExecuteStage_Out_WritebackMode ? _T_2 : _GEN_52; // @[Core.scala 74:41]
  assign DecodeStage_io_Stall = ExecuteStage_io_Stall; // @[Core.scala 66:24]
  assign DecodeStage_In_Instruction = FetchStage_Out_Instruction; // @[Core.scala 65:18]
  assign ExecuteStage_clock = clock;
  assign ExecuteStage_reset = reset;
  assign ExecuteStage_io_x_0 = x_0; // @[Core.scala 50:21]
  assign ExecuteStage_io_x_1 = x_1; // @[Core.scala 50:21]
  assign ExecuteStage_io_x_2 = x_2; // @[Core.scala 50:21]
  assign ExecuteStage_io_x_3 = x_3; // @[Core.scala 50:21]
  assign ExecuteStage_io_x_4 = x_4; // @[Core.scala 50:21]
  assign ExecuteStage_io_x_5 = x_5; // @[Core.scala 50:21]
  assign ExecuteStage_io_x_6 = x_6; // @[Core.scala 50:21]
  assign ExecuteStage_io_x_7 = x_7; // @[Core.scala 50:21]
  assign ExecuteStage_io_x_8 = x_8; // @[Core.scala 50:21]
  assign ExecuteStage_io_x_9 = x_9; // @[Core.scala 50:21]
  assign ExecuteStage_io_x_10 = x_10; // @[Core.scala 50:21]
  assign ExecuteStage_io_x_11 = x_11; // @[Core.scala 50:21]
  assign ExecuteStage_io_x_12 = x_12; // @[Core.scala 50:21]
  assign ExecuteStage_io_x_13 = x_13; // @[Core.scala 50:21]
  assign ExecuteStage_io_x_14 = x_14; // @[Core.scala 50:21]
  assign ExecuteStage_io_x_15 = x_15; // @[Core.scala 50:21]
  assign ExecuteStage_io_MemPort_ReadData = io_MemPort_ReadData; // @[Core.scala 48:27]
  assign ExecuteStage_io_MemPort_Completed = io_MemPort_Completed; // @[Core.scala 48:27]
  assign ExecuteStage_io_Clear = 4'h1 == ExecuteStage_Out_WritebackMode ? _T_2 : _GEN_52; // @[Core.scala 74:41]
  assign ExecuteStage_In_Type = DecodeStage_Out_Type; // @[Core.scala 70:19]
  assign ExecuteStage_In_rs1 = DecodeStage_Out_rs1; // @[Core.scala 70:19]
  assign ExecuteStage_In_rs2 = DecodeStage_Out_rs2; // @[Core.scala 70:19]
  assign ExecuteStage_In_rd = DecodeStage_Out_rd; // @[Core.scala 70:19]
  assign ExecuteStage_In_AImmediate = DecodeStage_Out_AImmediate; // @[Core.scala 70:19]
  assign ExecuteStage_In_ASImmediate = DecodeStage_Out_ASImmediate; // @[Core.scala 70:19]
  assign ExecuteStage_In_AOperation = DecodeStage_Out_AOperation; // @[Core.scala 70:19]
  assign ExecuteStage_In_MemOp = DecodeStage_Out_MemOp; // @[Core.scala 70:19]
  assign ExecuteStage_In_MemAddress = DecodeStage_Out_MemAddress; // @[Core.scala 70:19]
  assign ExecuteStage_In_COperation = DecodeStage_Out_COperation; // @[Core.scala 70:19]
  assign ExecuteStage_In_COffset = DecodeStage_Out_COffset; // @[Core.scala 70:19]
  always @(posedge clock) begin
    if (4'h1 == ExecuteStage_Out_WritebackMode) begin // @[Core.scala 74:41]
      if (4'h0 == ExecuteStage_Out_WritebackRegister) begin // @[Core.scala 76:45]
        x_0 <= _x_ExecuteStage_Out_WritebackRegister; // @[Core.scala 76:45]
      end else begin
        x_0 <= 18'h0; // @[Core.scala 36:8]
      end
    end else if (4'h3 == ExecuteStage_Out_WritebackMode) begin // @[Core.scala 74:41]
      if (4'h0 == ExecuteStage_Out_WritebackRegister) begin // @[Core.scala 85:45]
        x_0 <= io_MemPort_ReadData; // @[Core.scala 85:45]
      end else begin
        x_0 <= 18'h0; // @[Core.scala 36:8]
      end
    end else begin
      x_0 <= 18'h0; // @[Core.scala 36:8]
    end
    if (4'h1 == ExecuteStage_Out_WritebackMode) begin // @[Core.scala 74:41]
      if (4'h1 == ExecuteStage_Out_WritebackRegister) begin // @[Core.scala 76:45]
        x_1 <= _x_ExecuteStage_Out_WritebackRegister; // @[Core.scala 76:45]
      end else begin
        x_1 <= _GEN_0;
      end
    end else if (4'h3 == ExecuteStage_Out_WritebackMode) begin // @[Core.scala 74:41]
      if (4'h1 == ExecuteStage_Out_WritebackRegister) begin // @[Core.scala 85:45]
        x_1 <= io_MemPort_ReadData; // @[Core.scala 85:45]
      end else begin
        x_1 <= _GEN_0;
      end
    end else if (4'h4 == ExecuteStage_Out_WritebackMode) begin // @[Core.scala 74:41]
      x_1 <= ExecuteStage_Out_JumpValue; // @[Core.scala 88:12]
    end else begin
      x_1 <= _GEN_0;
    end
    if (4'h1 == ExecuteStage_Out_WritebackMode) begin // @[Core.scala 74:41]
      if (4'h2 == ExecuteStage_Out_WritebackRegister) begin // @[Core.scala 76:45]
        x_2 <= _x_ExecuteStage_Out_WritebackRegister; // @[Core.scala 76:45]
      end else begin
        x_2 <= {{2'd0}, io_WaveIn}; // @[Core.scala 37:8]
      end
    end else if (4'h3 == ExecuteStage_Out_WritebackMode) begin // @[Core.scala 74:41]
      if (4'h2 == ExecuteStage_Out_WritebackRegister) begin // @[Core.scala 85:45]
        x_2 <= io_MemPort_ReadData; // @[Core.scala 85:45]
      end else begin
        x_2 <= {{2'd0}, io_WaveIn}; // @[Core.scala 37:8]
      end
    end else begin
      x_2 <= {{2'd0}, io_WaveIn}; // @[Core.scala 37:8]
    end
    if (4'h1 == ExecuteStage_Out_WritebackMode) begin // @[Core.scala 74:41]
      if (4'h3 == ExecuteStage_Out_WritebackRegister) begin // @[Core.scala 76:45]
        x_3 <= _x_ExecuteStage_Out_WritebackRegister; // @[Core.scala 76:45]
      end
    end else if (4'h3 == ExecuteStage_Out_WritebackMode) begin // @[Core.scala 74:41]
      if (4'h3 == ExecuteStage_Out_WritebackRegister) begin // @[Core.scala 85:45]
        x_3 <= io_MemPort_ReadData; // @[Core.scala 85:45]
      end
    end
    if (4'h1 == ExecuteStage_Out_WritebackMode) begin // @[Core.scala 74:41]
      if (4'h4 == ExecuteStage_Out_WritebackRegister) begin // @[Core.scala 76:45]
        x_4 <= _x_ExecuteStage_Out_WritebackRegister; // @[Core.scala 76:45]
      end
    end else if (4'h3 == ExecuteStage_Out_WritebackMode) begin // @[Core.scala 74:41]
      if (4'h4 == ExecuteStage_Out_WritebackRegister) begin // @[Core.scala 85:45]
        x_4 <= io_MemPort_ReadData; // @[Core.scala 85:45]
      end
    end
    if (4'h1 == ExecuteStage_Out_WritebackMode) begin // @[Core.scala 74:41]
      if (4'h5 == ExecuteStage_Out_WritebackRegister) begin // @[Core.scala 76:45]
        x_5 <= _x_ExecuteStage_Out_WritebackRegister; // @[Core.scala 76:45]
      end
    end else if (4'h3 == ExecuteStage_Out_WritebackMode) begin // @[Core.scala 74:41]
      if (4'h5 == ExecuteStage_Out_WritebackRegister) begin // @[Core.scala 85:45]
        x_5 <= io_MemPort_ReadData; // @[Core.scala 85:45]
      end
    end
    if (4'h1 == ExecuteStage_Out_WritebackMode) begin // @[Core.scala 74:41]
      if (4'h6 == ExecuteStage_Out_WritebackRegister) begin // @[Core.scala 76:45]
        x_6 <= _x_ExecuteStage_Out_WritebackRegister; // @[Core.scala 76:45]
      end
    end else if (4'h3 == ExecuteStage_Out_WritebackMode) begin // @[Core.scala 74:41]
      if (4'h6 == ExecuteStage_Out_WritebackRegister) begin // @[Core.scala 85:45]
        x_6 <= io_MemPort_ReadData; // @[Core.scala 85:45]
      end
    end
    if (4'h1 == ExecuteStage_Out_WritebackMode) begin // @[Core.scala 74:41]
      if (4'h7 == ExecuteStage_Out_WritebackRegister) begin // @[Core.scala 76:45]
        x_7 <= _x_ExecuteStage_Out_WritebackRegister; // @[Core.scala 76:45]
      end
    end else if (4'h3 == ExecuteStage_Out_WritebackMode) begin // @[Core.scala 74:41]
      if (4'h7 == ExecuteStage_Out_WritebackRegister) begin // @[Core.scala 85:45]
        x_7 <= io_MemPort_ReadData; // @[Core.scala 85:45]
      end
    end
    if (4'h1 == ExecuteStage_Out_WritebackMode) begin // @[Core.scala 74:41]
      if (4'h8 == ExecuteStage_Out_WritebackRegister) begin // @[Core.scala 76:45]
        x_8 <= _x_ExecuteStage_Out_WritebackRegister; // @[Core.scala 76:45]
      end
    end else if (4'h3 == ExecuteStage_Out_WritebackMode) begin // @[Core.scala 74:41]
      if (4'h8 == ExecuteStage_Out_WritebackRegister) begin // @[Core.scala 85:45]
        x_8 <= io_MemPort_ReadData; // @[Core.scala 85:45]
      end
    end
    if (4'h1 == ExecuteStage_Out_WritebackMode) begin // @[Core.scala 74:41]
      if (4'h9 == ExecuteStage_Out_WritebackRegister) begin // @[Core.scala 76:45]
        x_9 <= _x_ExecuteStage_Out_WritebackRegister; // @[Core.scala 76:45]
      end
    end else if (4'h3 == ExecuteStage_Out_WritebackMode) begin // @[Core.scala 74:41]
      if (4'h9 == ExecuteStage_Out_WritebackRegister) begin // @[Core.scala 85:45]
        x_9 <= io_MemPort_ReadData; // @[Core.scala 85:45]
      end
    end
    if (4'h1 == ExecuteStage_Out_WritebackMode) begin // @[Core.scala 74:41]
      if (4'ha == ExecuteStage_Out_WritebackRegister) begin // @[Core.scala 76:45]
        x_10 <= _x_ExecuteStage_Out_WritebackRegister; // @[Core.scala 76:45]
      end
    end else if (4'h3 == ExecuteStage_Out_WritebackMode) begin // @[Core.scala 74:41]
      if (4'ha == ExecuteStage_Out_WritebackRegister) begin // @[Core.scala 85:45]
        x_10 <= io_MemPort_ReadData; // @[Core.scala 85:45]
      end
    end
    if (4'h1 == ExecuteStage_Out_WritebackMode) begin // @[Core.scala 74:41]
      if (4'hb == ExecuteStage_Out_WritebackRegister) begin // @[Core.scala 76:45]
        x_11 <= _x_ExecuteStage_Out_WritebackRegister; // @[Core.scala 76:45]
      end
    end else if (4'h3 == ExecuteStage_Out_WritebackMode) begin // @[Core.scala 74:41]
      if (4'hb == ExecuteStage_Out_WritebackRegister) begin // @[Core.scala 85:45]
        x_11 <= io_MemPort_ReadData; // @[Core.scala 85:45]
      end
    end
    if (4'h1 == ExecuteStage_Out_WritebackMode) begin // @[Core.scala 74:41]
      if (4'hc == ExecuteStage_Out_WritebackRegister) begin // @[Core.scala 76:45]
        x_12 <= _x_ExecuteStage_Out_WritebackRegister; // @[Core.scala 76:45]
      end
    end else if (4'h3 == ExecuteStage_Out_WritebackMode) begin // @[Core.scala 74:41]
      if (4'hc == ExecuteStage_Out_WritebackRegister) begin // @[Core.scala 85:45]
        x_12 <= io_MemPort_ReadData; // @[Core.scala 85:45]
      end
    end
    if (4'h1 == ExecuteStage_Out_WritebackMode) begin // @[Core.scala 74:41]
      if (4'hd == ExecuteStage_Out_WritebackRegister) begin // @[Core.scala 76:45]
        x_13 <= _x_ExecuteStage_Out_WritebackRegister; // @[Core.scala 76:45]
      end
    end else if (4'h3 == ExecuteStage_Out_WritebackMode) begin // @[Core.scala 74:41]
      if (4'hd == ExecuteStage_Out_WritebackRegister) begin // @[Core.scala 85:45]
        x_13 <= io_MemPort_ReadData; // @[Core.scala 85:45]
      end
    end
    if (4'h1 == ExecuteStage_Out_WritebackMode) begin // @[Core.scala 74:41]
      if (4'he == ExecuteStage_Out_WritebackRegister) begin // @[Core.scala 76:45]
        x_14 <= _x_ExecuteStage_Out_WritebackRegister; // @[Core.scala 76:45]
      end
    end else if (4'h3 == ExecuteStage_Out_WritebackMode) begin // @[Core.scala 74:41]
      if (4'he == ExecuteStage_Out_WritebackRegister) begin // @[Core.scala 85:45]
        x_14 <= io_MemPort_ReadData; // @[Core.scala 85:45]
      end
    end
    if (4'h1 == ExecuteStage_Out_WritebackMode) begin // @[Core.scala 74:41]
      if (4'hf == ExecuteStage_Out_WritebackRegister) begin // @[Core.scala 76:45]
        x_15 <= _x_ExecuteStage_Out_WritebackRegister; // @[Core.scala 76:45]
      end
    end else if (4'h3 == ExecuteStage_Out_WritebackMode) begin // @[Core.scala 74:41]
      if (4'hf == ExecuteStage_Out_WritebackRegister) begin // @[Core.scala 85:45]
        x_15 <= io_MemPort_ReadData; // @[Core.scala 85:45]
      end
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
  x_0 = _RAND_0[17:0];
  _RAND_1 = {1{`RANDOM}};
  x_1 = _RAND_1[17:0];
  _RAND_2 = {1{`RANDOM}};
  x_2 = _RAND_2[17:0];
  _RAND_3 = {1{`RANDOM}};
  x_3 = _RAND_3[17:0];
  _RAND_4 = {1{`RANDOM}};
  x_4 = _RAND_4[17:0];
  _RAND_5 = {1{`RANDOM}};
  x_5 = _RAND_5[17:0];
  _RAND_6 = {1{`RANDOM}};
  x_6 = _RAND_6[17:0];
  _RAND_7 = {1{`RANDOM}};
  x_7 = _RAND_7[17:0];
  _RAND_8 = {1{`RANDOM}};
  x_8 = _RAND_8[17:0];
  _RAND_9 = {1{`RANDOM}};
  x_9 = _RAND_9[17:0];
  _RAND_10 = {1{`RANDOM}};
  x_10 = _RAND_10[17:0];
  _RAND_11 = {1{`RANDOM}};
  x_11 = _RAND_11[17:0];
  _RAND_12 = {1{`RANDOM}};
  x_12 = _RAND_12[17:0];
  _RAND_13 = {1{`RANDOM}};
  x_13 = _RAND_13[17:0];
  _RAND_14 = {1{`RANDOM}};
  x_14 = _RAND_14[17:0];
  _RAND_15 = {1{`RANDOM}};
  x_15 = _RAND_15[17:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module MemoryController(
  input         clock,
  input         reset,
  input         io_ReadEnable,
  input         io_WriteEnable,
  input  [23:0] io_Address,
  input  [17:0] io_WriteData,
  output [17:0] io_ReadData,
  output        io_Ready,
  output        io_Completed,
  output        SPI_SCLK,
  output        SPI_CE,
  input         SPI_SO_0,
  input         SPI_SO_1,
  input         SPI_SO_2,
  input         SPI_SO_3,
  output        SPI_SI_0,
  output        SPI_SI_1,
  output        SPI_SI_2,
  output        SPI_SI_3,
  output        SPI_Drive
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
`endif // RANDOMIZE_REG_INIT
  reg [15:0] DataReg; // @[MemoryController.scala 42:24]
  reg [3:0] StateReg; // @[MemoryController.scala 55:25]
  reg [2:0] SubStateReg; // @[MemoryController.scala 58:28]
  reg [13:0] CntReg; // @[MemoryController.scala 60:23]
  reg [15:0] WriteDataReg; // @[MemoryController.scala 62:29]
  reg [23:0] AddressReg; // @[MemoryController.scala 63:27]
  reg  ClkReg; // @[MemoryController.scala 69:23]
  reg [7:0] ClkCounter; // @[MemoryController.scala 70:27]
  reg  ClkRegDelay; // @[MemoryController.scala 72:28]
  wire  _T_27 = 3'h0 == SubStateReg; // @[MemoryController.scala 219:27]
  wire  _T_30 = 3'h1 == SubStateReg; // @[MemoryController.scala 219:27]
  wire  _T_33 = 3'h4 == SubStateReg; // @[MemoryController.scala 219:27]
  wire  _GEN_58 = 3'h1 == SubStateReg | 3'h4 == SubStateReg; // @[MemoryController.scala 219:27 239:19]
  wire  _GEN_67 = 3'h0 == SubStateReg | _GEN_58; // @[MemoryController.scala 219:27 222:19]
  wire  _T_43 = 3'h2 == SubStateReg; // @[MemoryController.scala 272:27]
  wire  _GEN_92 = _T_30 | 3'h2 == SubStateReg; // @[MemoryController.scala 272:27 291:19]
  wire  _GEN_99 = _T_27 | _GEN_92; // @[MemoryController.scala 272:27 275:19]
  wire  _GEN_249 = 4'h7 == StateReg & _GEN_99; // @[MemoryController.scala 125:20 87:11]
  wire  _GEN_259 = 4'h8 == StateReg ? _GEN_67 : _GEN_249; // @[MemoryController.scala 125:20]
  wire  _GEN_271 = 4'h6 == StateReg ? _GEN_99 : _GEN_259; // @[MemoryController.scala 125:20]
  wire  _GEN_283 = 4'h5 == StateReg ? _GEN_67 : _GEN_271; // @[MemoryController.scala 125:20]
  wire  _GEN_301 = 4'h4 == StateReg ? 1'h0 : _GEN_283; // @[MemoryController.scala 125:20 87:11]
  wire  _GEN_311 = 4'h3 == StateReg | _GEN_301; // @[MemoryController.scala 125:20 167:15]
  wire  _GEN_329 = 4'h2 == StateReg ? 1'h0 : _GEN_311; // @[MemoryController.scala 125:20 87:11]
  wire  _GEN_343 = 4'h1 == StateReg | _GEN_329; // @[MemoryController.scala 125:20 140:15]
  wire  ClockEn = 4'h0 == StateReg ? 1'h0 : _GEN_343; // @[MemoryController.scala 125:20 87:11]
  wire [7:0] _ClkCounter_T_1 = ClkCounter + 8'h1; // @[MemoryController.scala 95:28]
  wire  NextStateInv = ClkCounter == 8'h1 & ClkReg; // @[MemoryController.scala 85:16 97:31]
  wire  _T_13 = CntReg == 14'h1; // @[MemoryController.scala 131:19]
  wire  _GEN_38 = io_ReadEnable | io_WriteEnable; // @[MemoryController.scala 189:27 200:20]
  wire  _GEN_318 = 4'h3 == StateReg ? 1'h0 : 4'h4 == StateReg & _GEN_38; // @[MemoryController.scala 125:20 88:14]
  wire  _GEN_327 = 4'h2 == StateReg ? NextStateInv : _GEN_318; // @[MemoryController.scala 125:20]
  wire  _GEN_348 = 4'h1 == StateReg ? 1'h0 : _GEN_327; // @[MemoryController.scala 125:20 88:14]
  wire  ClockReset = 4'h0 == StateReg ? _T_13 : _GEN_348; // @[MemoryController.scala 125:20]
  wire  RisingEdge = ClkReg & ~ClkRegDelay; // @[MemoryController.scala 114:22]
  wire [13:0] _CntReg_T_1 = CntReg + 14'h1; // @[MemoryController.scala 129:24]
  wire  _GEN_10 = CntReg == 14'h1 ? 1'h0 : 1'h1; // @[MemoryController.scala 131:27 132:16 44:10]
  wire [13:0] _SPI_SI_1_T_1 = 14'h7 - CntReg; // @[MemoryController.scala 143:39]
  wire [7:0] _SPI_SI_1_T_2 = 8'h66 >> _SPI_SI_1_T_1; // @[MemoryController.scala 143:34]
  wire [13:0] _GEN_14 = NextStateInv ? _CntReg_T_1 : CntReg; // @[MemoryController.scala 145:25 146:16 60:23]
  wire  _T_16 = CntReg == 14'h7 & NextStateInv; // @[MemoryController.scala 149:27]
  wire [13:0] _GEN_16 = CntReg == 14'h7 & NextStateInv ? 14'h0 : _GEN_14; // @[MemoryController.scala 149:44 151:16]
  wire  _GEN_17 = CntReg == 14'h7 & NextStateInv ? 1'h0 : _SPI_SI_1_T_2[0]; // @[MemoryController.scala 143:17 149:44 152:19]
  wire [3:0] _GEN_20 = NextStateInv ? 4'h3 : StateReg; // @[MemoryController.scala 160:25 162:18 55:25]
  wire [7:0] _SPI_SI_1_T_6 = 8'h99 >> _SPI_SI_1_T_1; // @[MemoryController.scala 170:28]
  wire [3:0] _GEN_24 = _T_16 ? 4'h4 : StateReg; // @[MemoryController.scala 176:44 180:18 55:25]
  wire [3:0] _GEN_29 = io_WriteEnable ? 4'h7 : StateReg; // @[MemoryController.scala 202:34 55:25]
  wire [2:0] _GEN_30 = io_WriteEnable ? 3'h0 : SubStateReg; // @[MemoryController.scala 202:34 211:21 58:28]
  wire  _GEN_31 = io_WriteEnable ? 1'h0 : 1'h1; // @[MemoryController.scala 186:14 202:34 212:16]
  wire [23:0] _GEN_33 = io_WriteEnable ? io_Address : AddressReg; // @[MemoryController.scala 202:34 214:20 63:27]
  wire [17:0] _GEN_34 = io_WriteEnable ? io_WriteData : {{2'd0}, WriteDataReg}; // @[MemoryController.scala 202:34 215:22 62:29]
  wire [3:0] _GEN_35 = io_ReadEnable ? 4'h8 : _GEN_29; // @[MemoryController.scala 189:27]
  wire [2:0] _GEN_36 = io_ReadEnable ? 3'h0 : _GEN_30; // @[MemoryController.scala 189:27 198:21]
  wire  _GEN_37 = io_ReadEnable ? 1'h0 : _GEN_31; // @[MemoryController.scala 189:27 199:16]
  wire [23:0] _GEN_39 = io_ReadEnable ? io_Address : _GEN_33; // @[MemoryController.scala 189:27 201:20]
  wire [17:0] _GEN_40 = io_ReadEnable ? {{2'd0}, WriteDataReg} : _GEN_34; // @[MemoryController.scala 189:27 62:29]
  wire [7:0] _SPI_SI_1_T_10 = 8'h3 >> _SPI_SI_1_T_1; // @[MemoryController.scala 225:34]
  wire [2:0] _GEN_43 = _T_16 ? 3'h1 : SubStateReg; // @[MemoryController.scala 231:48 233:25 58:28]
  wire [13:0] _SPI_SI_1_T_13 = 14'h17 - CntReg; // @[MemoryController.scala 242:40]
  wire [23:0] _SPI_SI_1_T_14 = AddressReg >> _SPI_SI_1_T_13; // @[MemoryController.scala 242:34]
  wire  _T_32 = CntReg == 14'h17 & NextStateInv; // @[MemoryController.scala 248:32]
  wire [13:0] _GEN_45 = CntReg == 14'h17 & NextStateInv ? 14'h0 : _GEN_14; // @[MemoryController.scala 248:49 249:20]
  wire [2:0] _GEN_46 = CntReg == 14'h17 & NextStateInv ? 3'h4 : SubStateReg; // @[MemoryController.scala 248:49 250:25 58:28]
  wire [16:0] _DataReg_T = {DataReg,SPI_SO_0}; // @[Cat.scala 31:58]
  wire [16:0] _GEN_47 = RisingEdge ? _DataReg_T : {{1'd0}, DataReg}; // @[MemoryController.scala 259:27 260:21 42:24]
  wire [13:0] _GEN_48 = RisingEdge ? _CntReg_T_1 : CntReg; // @[MemoryController.scala 259:27 261:20 60:23]
  wire  _T_35 = CntReg == 14'hf & NextStateInv; // @[MemoryController.scala 264:32]
  wire [3:0] _GEN_50 = CntReg == 14'hf & NextStateInv ? 4'h4 : StateReg; // @[MemoryController.scala 264:49 266:22 55:25]
  wire  _GEN_51 = 3'h4 == SubStateReg ? 1'h0 : 1'h1; // @[MemoryController.scala 219:27 254:18 44:10]
  wire [16:0] _GEN_53 = 3'h4 == SubStateReg ? _GEN_47 : {{1'd0}, DataReg}; // @[MemoryController.scala 219:27 42:24]
  wire [13:0] _GEN_54 = 3'h4 == SubStateReg ? _GEN_48 : CntReg; // @[MemoryController.scala 219:27 60:23]
  wire [3:0] _GEN_56 = 3'h4 == SubStateReg ? _GEN_50 : StateReg; // @[MemoryController.scala 219:27 55:25]
  wire  _GEN_57 = 3'h1 == SubStateReg ? 1'h0 : _GEN_51; // @[MemoryController.scala 219:27 238:18]
  wire  _GEN_60 = 3'h1 == SubStateReg & _SPI_SI_1_T_14[0]; // @[MemoryController.scala 219:27 242:21 50:10]
  wire [13:0] _GEN_61 = 3'h1 == SubStateReg ? _GEN_45 : _GEN_54; // @[MemoryController.scala 219:27]
  wire [2:0] _GEN_62 = 3'h1 == SubStateReg ? _GEN_46 : SubStateReg; // @[MemoryController.scala 219:27 58:28]
  wire [16:0] _GEN_63 = 3'h1 == SubStateReg ? {{1'd0}, DataReg} : _GEN_53; // @[MemoryController.scala 219:27 42:24]
  wire  _GEN_64 = 3'h1 == SubStateReg ? 1'h0 : 3'h4 == SubStateReg & _T_35; // @[MemoryController.scala 219:27 45:16]
  wire [3:0] _GEN_65 = 3'h1 == SubStateReg ? StateReg : _GEN_56; // @[MemoryController.scala 219:27 55:25]
  wire  _GEN_66 = 3'h0 == SubStateReg ? 1'h0 : _GEN_57; // @[MemoryController.scala 219:27 221:18]
  wire  _GEN_68 = 3'h0 == SubStateReg | 3'h1 == SubStateReg; // @[MemoryController.scala 219:27 223:21]
  wire  _GEN_69 = 3'h0 == SubStateReg ? _SPI_SI_1_T_10[0] : _GEN_60; // @[MemoryController.scala 219:27 225:21]
  wire [13:0] _GEN_70 = 3'h0 == SubStateReg ? _GEN_16 : _GEN_61; // @[MemoryController.scala 219:27]
  wire [2:0] _GEN_71 = 3'h0 == SubStateReg ? _GEN_43 : _GEN_62; // @[MemoryController.scala 219:27]
  wire [16:0] _GEN_72 = 3'h0 == SubStateReg ? {{1'd0}, DataReg} : _GEN_63; // @[MemoryController.scala 219:27 42:24]
  wire  _GEN_73 = 3'h0 == SubStateReg ? 1'h0 : _GEN_64; // @[MemoryController.scala 219:27 45:16]
  wire [3:0] _GEN_74 = 3'h0 == SubStateReg ? StateReg : _GEN_65; // @[MemoryController.scala 219:27 55:25]
  wire [7:0] _SPI_SI_1_T_18 = 8'h2 >> _SPI_SI_1_T_1; // @[MemoryController.scala 278:35]
  wire [2:0] _GEN_80 = _T_32 ? 3'h2 : SubStateReg; // @[MemoryController.scala 300:48 302:25 58:28]
  wire [15:0] _SPI_SI_1_T_24 = WriteDataReg >> CntReg; // @[MemoryController.scala 310:36]
  wire [13:0] _GEN_82 = _T_35 ? 14'h0 : _GEN_14; // @[MemoryController.scala 316:49 317:20]
  wire  _GEN_85 = 3'h2 == SubStateReg ? _T_35 : 1'h1; // @[MemoryController.scala 272:27 44:10]
  wire  _GEN_87 = 3'h2 == SubStateReg & _SPI_SI_1_T_24[0]; // @[MemoryController.scala 272:27 310:21 50:10]
  wire [13:0] _GEN_88 = 3'h2 == SubStateReg ? _GEN_82 : CntReg; // @[MemoryController.scala 272:27 60:23]
  wire [3:0] _GEN_90 = 3'h2 == SubStateReg ? _GEN_50 : StateReg; // @[MemoryController.scala 272:27 55:25]
  wire  _GEN_91 = _T_30 ? 1'h0 : _GEN_85; // @[MemoryController.scala 272:27 290:18]
  wire  _GEN_93 = _T_30 ? _SPI_SI_1_T_14[0] : _GEN_87; // @[MemoryController.scala 272:27 294:21]
  wire [13:0] _GEN_94 = _T_30 ? _GEN_45 : _GEN_88; // @[MemoryController.scala 272:27]
  wire [2:0] _GEN_95 = _T_30 ? _GEN_80 : SubStateReg; // @[MemoryController.scala 272:27 58:28]
  wire  _GEN_96 = _T_30 ? 1'h0 : 3'h2 == SubStateReg & _T_35; // @[MemoryController.scala 272:27 45:16]
  wire [3:0] _GEN_97 = _T_30 ? StateReg : _GEN_90; // @[MemoryController.scala 272:27 55:25]
  wire  _GEN_98 = _T_27 ? 1'h0 : _GEN_91; // @[MemoryController.scala 272:27 274:18]
  wire  _GEN_100 = _T_27 ? _SPI_SI_1_T_18[0] : _GEN_93; // @[MemoryController.scala 272:27 278:21]
  wire [13:0] _GEN_101 = _T_27 ? _GEN_16 : _GEN_94; // @[MemoryController.scala 272:27]
  wire [2:0] _GEN_102 = _T_27 ? _GEN_43 : _GEN_95; // @[MemoryController.scala 272:27]
  wire  _GEN_103 = _T_27 ? 1'h0 : _GEN_96; // @[MemoryController.scala 272:27 45:16]
  wire [3:0] _GEN_104 = _T_27 ? StateReg : _GEN_97; // @[MemoryController.scala 272:27 55:25]
  wire [7:0] _SPI_SI_1_T_28 = 8'heb >> _SPI_SI_1_T_1; // @[MemoryController.scala 332:34]
  wire  _T_51 = 14'h0 == CntReg; // @[MemoryController.scala 350:27]
  wire  _GEN_108 = 14'h0 == CntReg & AddressReg[20]; // @[MemoryController.scala 350:27 352:24 50:10]
  wire  _GEN_109 = 14'h0 == CntReg & AddressReg[21]; // @[MemoryController.scala 350:27 352:24 50:10]
  wire  _GEN_110 = 14'h0 == CntReg & AddressReg[22]; // @[MemoryController.scala 350:27 352:24 50:10]
  wire  _GEN_111 = 14'h0 == CntReg & AddressReg[23]; // @[MemoryController.scala 350:27 352:24 50:10]
  wire  _T_57 = 14'h4 == CntReg; // @[MemoryController.scala 350:27]
  wire  _GEN_112 = 14'h4 == CntReg ? AddressReg[16] : _GEN_108; // @[MemoryController.scala 350:27 352:24]
  wire  _GEN_113 = 14'h4 == CntReg ? AddressReg[17] : _GEN_109; // @[MemoryController.scala 350:27 352:24]
  wire  _GEN_114 = 14'h4 == CntReg ? AddressReg[18] : _GEN_110; // @[MemoryController.scala 350:27 352:24]
  wire  _GEN_115 = 14'h4 == CntReg ? AddressReg[19] : _GEN_111; // @[MemoryController.scala 350:27 352:24]
  wire  _T_63 = 14'h8 == CntReg; // @[MemoryController.scala 350:27]
  wire  _GEN_116 = 14'h8 == CntReg ? AddressReg[12] : _GEN_112; // @[MemoryController.scala 350:27 352:24]
  wire  _GEN_117 = 14'h8 == CntReg ? AddressReg[13] : _GEN_113; // @[MemoryController.scala 350:27 352:24]
  wire  _GEN_118 = 14'h8 == CntReg ? AddressReg[14] : _GEN_114; // @[MemoryController.scala 350:27 352:24]
  wire  _GEN_119 = 14'h8 == CntReg ? AddressReg[15] : _GEN_115; // @[MemoryController.scala 350:27 352:24]
  wire  _T_69 = 14'hc == CntReg; // @[MemoryController.scala 350:27]
  wire  _GEN_120 = 14'hc == CntReg ? AddressReg[8] : _GEN_116; // @[MemoryController.scala 350:27 352:24]
  wire  _GEN_121 = 14'hc == CntReg ? AddressReg[9] : _GEN_117; // @[MemoryController.scala 350:27 352:24]
  wire  _GEN_122 = 14'hc == CntReg ? AddressReg[10] : _GEN_118; // @[MemoryController.scala 350:27 352:24]
  wire  _GEN_123 = 14'hc == CntReg ? AddressReg[11] : _GEN_119; // @[MemoryController.scala 350:27 352:24]
  wire  _GEN_124 = 14'h10 == CntReg ? AddressReg[4] : _GEN_120; // @[MemoryController.scala 350:27 352:24]
  wire  _GEN_125 = 14'h10 == CntReg ? AddressReg[5] : _GEN_121; // @[MemoryController.scala 350:27 352:24]
  wire  _GEN_126 = 14'h10 == CntReg ? AddressReg[6] : _GEN_122; // @[MemoryController.scala 350:27 352:24]
  wire  _GEN_127 = 14'h10 == CntReg ? AddressReg[7] : _GEN_123; // @[MemoryController.scala 350:27 352:24]
  wire  _GEN_128 = 14'h14 == CntReg ? AddressReg[0] : _GEN_124; // @[MemoryController.scala 350:27 352:24]
  wire  _GEN_129 = 14'h14 == CntReg ? AddressReg[1] : _GEN_125; // @[MemoryController.scala 350:27 352:24]
  wire  _GEN_130 = 14'h14 == CntReg ? AddressReg[2] : _GEN_126; // @[MemoryController.scala 350:27 352:24]
  wire  _GEN_131 = 14'h14 == CntReg ? AddressReg[3] : _GEN_127; // @[MemoryController.scala 350:27 352:24]
  wire [13:0] _CntReg_T_21 = CntReg + 14'h4; // @[MemoryController.scala 358:30]
  wire [13:0] _GEN_132 = NextStateInv ? _CntReg_T_21 : CntReg; // @[MemoryController.scala 357:29 358:20 60:23]
  wire  _T_88 = CntReg == 14'h14 & NextStateInv; // @[MemoryController.scala 361:32]
  wire [13:0] _GEN_133 = CntReg == 14'h14 & NextStateInv ? 14'h0 : _GEN_132; // @[MemoryController.scala 361:49 362:20]
  wire [2:0] _GEN_134 = CntReg == 14'h14 & NextStateInv ? 3'h4 : SubStateReg; // @[MemoryController.scala 361:49 363:25 58:28]
  wire [19:0] _DataReg_T_2 = {DataReg,SPI_SO_3,SPI_SO_2,SPI_SO_1,SPI_SO_0}; // @[Cat.scala 31:58]
  wire [19:0] _GEN_135 = RisingEdge ? _DataReg_T_2 : {{4'd0}, DataReg}; // @[MemoryController.scala 370:27 371:21 42:24]
  wire [13:0] _GEN_136 = RisingEdge ? _CntReg_T_21 : CntReg; // @[MemoryController.scala 370:27 372:20 60:23]
  wire  _T_91 = CntReg == 14'hc & NextStateInv; // @[MemoryController.scala 375:32]
  wire [3:0] _GEN_138 = CntReg == 14'hc & NextStateInv ? 4'h4 : StateReg; // @[MemoryController.scala 375:49 377:22 55:25]
  wire [19:0] _GEN_141 = _T_33 ? _GEN_135 : {{4'd0}, DataReg}; // @[MemoryController.scala 326:27 42:24]
  wire [13:0] _GEN_142 = _T_33 ? _GEN_136 : CntReg; // @[MemoryController.scala 326:27 60:23]
  wire [3:0] _GEN_144 = _T_33 ? _GEN_138 : StateReg; // @[MemoryController.scala 326:27 55:25]
  wire  _GEN_149 = _T_30 & _GEN_129; // @[MemoryController.scala 326:27 50:10]
  wire [13:0] _GEN_152 = _T_30 ? _GEN_133 : _GEN_142; // @[MemoryController.scala 326:27]
  wire [2:0] _GEN_153 = _T_30 ? _GEN_134 : SubStateReg; // @[MemoryController.scala 326:27 58:28]
  wire [19:0] _GEN_154 = _T_30 ? {{4'd0}, DataReg} : _GEN_141; // @[MemoryController.scala 326:27 42:24]
  wire  _GEN_155 = _T_30 ? 1'h0 : _T_33 & _T_91; // @[MemoryController.scala 326:27 45:16]
  wire [3:0] _GEN_156 = _T_30 ? StateReg : _GEN_144; // @[MemoryController.scala 326:27 55:25]
  wire  _GEN_160 = _T_27 ? _SPI_SI_1_T_28[0] : _GEN_149; // @[MemoryController.scala 326:27 332:21]
  wire [13:0] _GEN_161 = _T_27 ? _GEN_16 : _GEN_152; // @[MemoryController.scala 326:27]
  wire [2:0] _GEN_162 = _T_27 ? _GEN_43 : _GEN_153; // @[MemoryController.scala 326:27]
  wire  _GEN_163 = _T_27 ? 1'h0 : _T_30 & _GEN_128; // @[MemoryController.scala 326:27 50:10]
  wire  _GEN_164 = _T_27 ? 1'h0 : _T_30 & _GEN_130; // @[MemoryController.scala 326:27 50:10]
  wire  _GEN_165 = _T_27 ? 1'h0 : _T_30 & _GEN_131; // @[MemoryController.scala 326:27 50:10]
  wire [19:0] _GEN_166 = _T_27 ? {{4'd0}, DataReg} : _GEN_154; // @[MemoryController.scala 326:27 42:24]
  wire  _GEN_167 = _T_27 ? 1'h0 : _GEN_155; // @[MemoryController.scala 326:27 45:16]
  wire [3:0] _GEN_168 = _T_27 ? StateReg : _GEN_156; // @[MemoryController.scala 326:27 55:25]
  wire [7:0] _SPI_SI_1_T_32 = 8'h38 >> _SPI_SI_1_T_1; // @[MemoryController.scala 389:35]
  wire [2:0] _GEN_198 = _T_88 ? 3'h2 : SubStateReg; // @[MemoryController.scala 417:49 419:25 58:28]
  wire  _GEN_199 = _T_51 & WriteDataReg[12]; // @[MemoryController.scala 428:27 430:24 50:10]
  wire  _GEN_200 = _T_51 & WriteDataReg[13]; // @[MemoryController.scala 428:27 430:24 50:10]
  wire  _GEN_201 = _T_51 & WriteDataReg[14]; // @[MemoryController.scala 428:27 430:24 50:10]
  wire  _GEN_202 = _T_51 & WriteDataReg[15]; // @[MemoryController.scala 428:27 430:24 50:10]
  wire  _GEN_203 = _T_57 ? WriteDataReg[8] : _GEN_199; // @[MemoryController.scala 428:27 430:24]
  wire  _GEN_204 = _T_57 ? WriteDataReg[9] : _GEN_200; // @[MemoryController.scala 428:27 430:24]
  wire  _GEN_205 = _T_57 ? WriteDataReg[10] : _GEN_201; // @[MemoryController.scala 428:27 430:24]
  wire  _GEN_206 = _T_57 ? WriteDataReg[11] : _GEN_202; // @[MemoryController.scala 428:27 430:24]
  wire  _GEN_207 = _T_63 ? WriteDataReg[4] : _GEN_203; // @[MemoryController.scala 428:27 430:24]
  wire  _GEN_208 = _T_63 ? WriteDataReg[5] : _GEN_204; // @[MemoryController.scala 428:27 430:24]
  wire  _GEN_209 = _T_63 ? WriteDataReg[6] : _GEN_205; // @[MemoryController.scala 428:27 430:24]
  wire  _GEN_210 = _T_63 ? WriteDataReg[7] : _GEN_206; // @[MemoryController.scala 428:27 430:24]
  wire  _GEN_211 = _T_69 ? WriteDataReg[0] : _GEN_207; // @[MemoryController.scala 428:27 430:24]
  wire  _GEN_212 = _T_69 ? WriteDataReg[1] : _GEN_208; // @[MemoryController.scala 428:27 430:24]
  wire  _GEN_213 = _T_69 ? WriteDataReg[2] : _GEN_209; // @[MemoryController.scala 428:27 430:24]
  wire  _GEN_214 = _T_69 ? WriteDataReg[3] : _GEN_210; // @[MemoryController.scala 428:27 430:24]
  wire [13:0] _GEN_216 = _T_91 ? 14'h0 : _GEN_132; // @[MemoryController.scala 439:49 440:20]
  wire  _GEN_219 = _T_43 ? _T_91 : 1'h1; // @[MemoryController.scala 383:27 44:10]
  wire  _GEN_221 = _T_43 & _GEN_211; // @[MemoryController.scala 383:27 50:10]
  wire  _GEN_222 = _T_43 & _GEN_212; // @[MemoryController.scala 383:27 50:10]
  wire  _GEN_223 = _T_43 & _GEN_213; // @[MemoryController.scala 383:27 50:10]
  wire  _GEN_224 = _T_43 & _GEN_214; // @[MemoryController.scala 383:27 50:10]
  wire [13:0] _GEN_225 = _T_43 ? _GEN_216 : CntReg; // @[MemoryController.scala 383:27 60:23]
  wire [3:0] _GEN_227 = _T_43 ? _GEN_138 : StateReg; // @[MemoryController.scala 383:27 55:25]
  wire  _GEN_228 = _T_30 ? 1'h0 : _GEN_219; // @[MemoryController.scala 383:27 401:18]
  wire  _GEN_230 = _T_30 ? _GEN_128 : _GEN_221; // @[MemoryController.scala 383:27]
  wire  _GEN_231 = _T_30 ? _GEN_129 : _GEN_222; // @[MemoryController.scala 383:27]
  wire  _GEN_232 = _T_30 ? _GEN_130 : _GEN_223; // @[MemoryController.scala 383:27]
  wire  _GEN_233 = _T_30 ? _GEN_131 : _GEN_224; // @[MemoryController.scala 383:27]
  wire [13:0] _GEN_234 = _T_30 ? _GEN_133 : _GEN_225; // @[MemoryController.scala 383:27]
  wire [2:0] _GEN_235 = _T_30 ? _GEN_198 : SubStateReg; // @[MemoryController.scala 383:27 58:28]
  wire  _GEN_236 = _T_30 ? 1'h0 : _T_43 & _T_91; // @[MemoryController.scala 383:27 45:16]
  wire [3:0] _GEN_237 = _T_30 ? StateReg : _GEN_227; // @[MemoryController.scala 383:27 55:25]
  wire  _GEN_238 = _T_27 ? 1'h0 : _GEN_228; // @[MemoryController.scala 383:27 385:18]
  wire  _GEN_240 = _T_27 ? _SPI_SI_1_T_32[0] : _GEN_231; // @[MemoryController.scala 383:27 389:21]
  wire [13:0] _GEN_241 = _T_27 ? _GEN_16 : _GEN_234; // @[MemoryController.scala 383:27]
  wire [2:0] _GEN_242 = _T_27 ? _GEN_43 : _GEN_235; // @[MemoryController.scala 383:27]
  wire  _GEN_243 = _T_27 ? 1'h0 : _GEN_230; // @[MemoryController.scala 383:27 50:10]
  wire  _GEN_244 = _T_27 ? 1'h0 : _GEN_232; // @[MemoryController.scala 383:27 50:10]
  wire  _GEN_245 = _T_27 ? 1'h0 : _GEN_233; // @[MemoryController.scala 383:27 50:10]
  wire  _GEN_246 = _T_27 ? 1'h0 : _GEN_236; // @[MemoryController.scala 383:27 45:16]
  wire [3:0] _GEN_247 = _T_27 ? StateReg : _GEN_237; // @[MemoryController.scala 383:27 55:25]
  wire  _GEN_248 = 4'h7 == StateReg ? _GEN_238 : 1'h1; // @[MemoryController.scala 125:20 44:10]
  wire  _GEN_250 = 4'h7 == StateReg & _GEN_240; // @[MemoryController.scala 125:20 50:10]
  wire [13:0] _GEN_251 = 4'h7 == StateReg ? _GEN_241 : CntReg; // @[MemoryController.scala 125:20 60:23]
  wire [2:0] _GEN_252 = 4'h7 == StateReg ? _GEN_242 : SubStateReg; // @[MemoryController.scala 125:20 58:28]
  wire  _GEN_253 = 4'h7 == StateReg & _GEN_243; // @[MemoryController.scala 125:20 50:10]
  wire  _GEN_254 = 4'h7 == StateReg & _GEN_244; // @[MemoryController.scala 125:20 50:10]
  wire  _GEN_255 = 4'h7 == StateReg & _GEN_245; // @[MemoryController.scala 125:20 50:10]
  wire  _GEN_256 = 4'h7 == StateReg & _GEN_246; // @[MemoryController.scala 125:20 45:16]
  wire [3:0] _GEN_257 = 4'h7 == StateReg ? _GEN_247 : StateReg; // @[MemoryController.scala 125:20 55:25]
  wire  _GEN_258 = 4'h8 == StateReg ? _GEN_66 : _GEN_248; // @[MemoryController.scala 125:20]
  wire  _GEN_260 = 4'h8 == StateReg ? _GEN_68 : _GEN_249; // @[MemoryController.scala 125:20]
  wire  _GEN_261 = 4'h8 == StateReg ? _GEN_160 : _GEN_250; // @[MemoryController.scala 125:20]
  wire [13:0] _GEN_262 = 4'h8 == StateReg ? _GEN_161 : _GEN_251; // @[MemoryController.scala 125:20]
  wire [2:0] _GEN_263 = 4'h8 == StateReg ? _GEN_162 : _GEN_252; // @[MemoryController.scala 125:20]
  wire  _GEN_264 = 4'h8 == StateReg ? _GEN_163 : _GEN_253; // @[MemoryController.scala 125:20]
  wire  _GEN_265 = 4'h8 == StateReg ? _GEN_164 : _GEN_254; // @[MemoryController.scala 125:20]
  wire  _GEN_266 = 4'h8 == StateReg ? _GEN_165 : _GEN_255; // @[MemoryController.scala 125:20]
  wire [19:0] _GEN_267 = 4'h8 == StateReg ? _GEN_166 : {{4'd0}, DataReg}; // @[MemoryController.scala 125:20 42:24]
  wire  _GEN_268 = 4'h8 == StateReg ? _GEN_167 : _GEN_256; // @[MemoryController.scala 125:20]
  wire [3:0] _GEN_269 = 4'h8 == StateReg ? _GEN_168 : _GEN_257; // @[MemoryController.scala 125:20]
  wire  _GEN_270 = 4'h6 == StateReg ? _GEN_98 : _GEN_258; // @[MemoryController.scala 125:20]
  wire  _GEN_272 = 4'h6 == StateReg ? _GEN_99 : _GEN_260; // @[MemoryController.scala 125:20]
  wire  _GEN_273 = 4'h6 == StateReg ? _GEN_100 : _GEN_261; // @[MemoryController.scala 125:20]
  wire [13:0] _GEN_274 = 4'h6 == StateReg ? _GEN_101 : _GEN_262; // @[MemoryController.scala 125:20]
  wire [2:0] _GEN_275 = 4'h6 == StateReg ? _GEN_102 : _GEN_263; // @[MemoryController.scala 125:20]
  wire  _GEN_276 = 4'h6 == StateReg ? _GEN_103 : _GEN_268; // @[MemoryController.scala 125:20]
  wire [3:0] _GEN_277 = 4'h6 == StateReg ? _GEN_104 : _GEN_269; // @[MemoryController.scala 125:20]
  wire  _GEN_278 = 4'h6 == StateReg ? 1'h0 : _GEN_264; // @[MemoryController.scala 125:20 50:10]
  wire  _GEN_279 = 4'h6 == StateReg ? 1'h0 : _GEN_265; // @[MemoryController.scala 125:20 50:10]
  wire  _GEN_280 = 4'h6 == StateReg ? 1'h0 : _GEN_266; // @[MemoryController.scala 125:20 50:10]
  wire [19:0] _GEN_281 = 4'h6 == StateReg ? {{4'd0}, DataReg} : _GEN_267; // @[MemoryController.scala 125:20 42:24]
  wire  _GEN_282 = 4'h5 == StateReg ? _GEN_66 : _GEN_270; // @[MemoryController.scala 125:20]
  wire  _GEN_284 = 4'h5 == StateReg ? _GEN_68 : _GEN_272; // @[MemoryController.scala 125:20]
  wire  _GEN_285 = 4'h5 == StateReg ? _GEN_69 : _GEN_273; // @[MemoryController.scala 125:20]
  wire [13:0] _GEN_286 = 4'h5 == StateReg ? _GEN_70 : _GEN_274; // @[MemoryController.scala 125:20]
  wire [2:0] _GEN_287 = 4'h5 == StateReg ? _GEN_71 : _GEN_275; // @[MemoryController.scala 125:20]
  wire [19:0] _GEN_288 = 4'h5 == StateReg ? {{3'd0}, _GEN_72} : _GEN_281; // @[MemoryController.scala 125:20]
  wire  _GEN_289 = 4'h5 == StateReg ? _GEN_73 : _GEN_276; // @[MemoryController.scala 125:20]
  wire [3:0] _GEN_290 = 4'h5 == StateReg ? _GEN_74 : _GEN_277; // @[MemoryController.scala 125:20]
  wire  _GEN_291 = 4'h5 == StateReg ? 1'h0 : _GEN_278; // @[MemoryController.scala 125:20 50:10]
  wire  _GEN_292 = 4'h5 == StateReg ? 1'h0 : _GEN_279; // @[MemoryController.scala 125:20 50:10]
  wire  _GEN_293 = 4'h5 == StateReg ? 1'h0 : _GEN_280; // @[MemoryController.scala 125:20 50:10]
  wire  _GEN_294 = 4'h4 == StateReg ? _GEN_37 : _GEN_282; // @[MemoryController.scala 125:20]
  wire [3:0] _GEN_296 = 4'h4 == StateReg ? _GEN_35 : _GEN_290; // @[MemoryController.scala 125:20]
  wire [2:0] _GEN_297 = 4'h4 == StateReg ? _GEN_36 : _GEN_287; // @[MemoryController.scala 125:20]
  wire [23:0] _GEN_299 = 4'h4 == StateReg ? _GEN_39 : AddressReg; // @[MemoryController.scala 125:20 63:27]
  wire [17:0] _GEN_300 = 4'h4 == StateReg ? _GEN_40 : {{2'd0}, WriteDataReg}; // @[MemoryController.scala 125:20 62:29]
  wire  _GEN_302 = 4'h4 == StateReg ? 1'h0 : _GEN_284; // @[MemoryController.scala 125:20 52:13]
  wire  _GEN_303 = 4'h4 == StateReg ? 1'h0 : _GEN_285; // @[MemoryController.scala 125:20 50:10]
  wire [13:0] _GEN_304 = 4'h4 == StateReg ? CntReg : _GEN_286; // @[MemoryController.scala 125:20 60:23]
  wire [19:0] _GEN_305 = 4'h4 == StateReg ? {{4'd0}, DataReg} : _GEN_288; // @[MemoryController.scala 125:20 42:24]
  wire  _GEN_306 = 4'h4 == StateReg ? 1'h0 : _GEN_289; // @[MemoryController.scala 125:20 45:16]
  wire  _GEN_307 = 4'h4 == StateReg ? 1'h0 : _GEN_291; // @[MemoryController.scala 125:20 50:10]
  wire  _GEN_308 = 4'h4 == StateReg ? 1'h0 : _GEN_292; // @[MemoryController.scala 125:20 50:10]
  wire  _GEN_309 = 4'h4 == StateReg ? 1'h0 : _GEN_293; // @[MemoryController.scala 125:20 50:10]
  wire  _GEN_310 = 4'h3 == StateReg ? _T_16 : _GEN_294; // @[MemoryController.scala 125:20]
  wire  _GEN_312 = 4'h3 == StateReg | _GEN_302; // @[MemoryController.scala 125:20 168:17]
  wire  _GEN_313 = 4'h3 == StateReg ? _SPI_SI_1_T_6[0] : _GEN_303; // @[MemoryController.scala 125:20 170:17]
  wire [13:0] _GEN_314 = 4'h3 == StateReg ? _GEN_16 : _GEN_304; // @[MemoryController.scala 125:20]
  wire [3:0] _GEN_315 = 4'h3 == StateReg ? _GEN_24 : _GEN_296; // @[MemoryController.scala 125:20]
  wire  _GEN_316 = 4'h3 == StateReg ? 1'h0 : 4'h4 == StateReg; // @[MemoryController.scala 125:20 46:12]
  wire [2:0] _GEN_317 = 4'h3 == StateReg ? SubStateReg : _GEN_297; // @[MemoryController.scala 125:20 58:28]
  wire [23:0] _GEN_319 = 4'h3 == StateReg ? AddressReg : _GEN_299; // @[MemoryController.scala 125:20 63:27]
  wire [17:0] _GEN_320 = 4'h3 == StateReg ? {{2'd0}, WriteDataReg} : _GEN_300; // @[MemoryController.scala 125:20 62:29]
  wire [19:0] _GEN_321 = 4'h3 == StateReg ? {{4'd0}, DataReg} : _GEN_305; // @[MemoryController.scala 125:20 42:24]
  wire  _GEN_322 = 4'h3 == StateReg ? 1'h0 : _GEN_306; // @[MemoryController.scala 125:20 45:16]
  wire  _GEN_323 = 4'h3 == StateReg ? 1'h0 : _GEN_307; // @[MemoryController.scala 125:20 50:10]
  wire  _GEN_324 = 4'h3 == StateReg ? 1'h0 : _GEN_308; // @[MemoryController.scala 125:20 50:10]
  wire  _GEN_325 = 4'h3 == StateReg ? 1'h0 : _GEN_309; // @[MemoryController.scala 125:20 50:10]
  wire  _GEN_326 = 4'h2 == StateReg | _GEN_310; // @[MemoryController.scala 125:20 158:14]
  wire  _GEN_330 = 4'h2 == StateReg ? 1'h0 : _GEN_312; // @[MemoryController.scala 125:20 52:13]
  wire  _GEN_331 = 4'h2 == StateReg ? 1'h0 : _GEN_313; // @[MemoryController.scala 125:20 50:10]
  wire  _GEN_333 = 4'h2 == StateReg ? 1'h0 : _GEN_316; // @[MemoryController.scala 125:20 46:12]
  wire [17:0] _GEN_336 = 4'h2 == StateReg ? {{2'd0}, WriteDataReg} : _GEN_320; // @[MemoryController.scala 125:20 62:29]
  wire [19:0] _GEN_337 = 4'h2 == StateReg ? {{4'd0}, DataReg} : _GEN_321; // @[MemoryController.scala 125:20 42:24]
  wire  _GEN_338 = 4'h2 == StateReg ? 1'h0 : _GEN_322; // @[MemoryController.scala 125:20 45:16]
  wire  _GEN_339 = 4'h2 == StateReg ? 1'h0 : _GEN_323; // @[MemoryController.scala 125:20 50:10]
  wire  _GEN_340 = 4'h2 == StateReg ? 1'h0 : _GEN_324; // @[MemoryController.scala 125:20 50:10]
  wire  _GEN_341 = 4'h2 == StateReg ? 1'h0 : _GEN_325; // @[MemoryController.scala 125:20 50:10]
  wire  _GEN_342 = 4'h1 == StateReg ? _T_16 : _GEN_326; // @[MemoryController.scala 125:20]
  wire  _GEN_344 = 4'h1 == StateReg | _GEN_330; // @[MemoryController.scala 125:20 141:17]
  wire  _GEN_345 = 4'h1 == StateReg ? _GEN_17 : _GEN_331; // @[MemoryController.scala 125:20]
  wire  _GEN_349 = 4'h1 == StateReg ? 1'h0 : _GEN_333; // @[MemoryController.scala 125:20 46:12]
  wire [17:0] _GEN_352 = 4'h1 == StateReg ? {{2'd0}, WriteDataReg} : _GEN_336; // @[MemoryController.scala 125:20 62:29]
  wire [19:0] _GEN_353 = 4'h1 == StateReg ? {{4'd0}, DataReg} : _GEN_337; // @[MemoryController.scala 125:20 42:24]
  wire  _GEN_354 = 4'h1 == StateReg ? 1'h0 : _GEN_338; // @[MemoryController.scala 125:20 45:16]
  wire  _GEN_355 = 4'h1 == StateReg ? 1'h0 : _GEN_339; // @[MemoryController.scala 125:20 50:10]
  wire  _GEN_356 = 4'h1 == StateReg ? 1'h0 : _GEN_340; // @[MemoryController.scala 125:20 50:10]
  wire  _GEN_357 = 4'h1 == StateReg ? 1'h0 : _GEN_341; // @[MemoryController.scala 125:20 50:10]
  wire [17:0] _GEN_368 = 4'h0 == StateReg ? {{2'd0}, WriteDataReg} : _GEN_352; // @[MemoryController.scala 125:20 62:29]
  wire [19:0] _GEN_369 = 4'h0 == StateReg ? {{4'd0}, DataReg} : _GEN_353; // @[MemoryController.scala 125:20 42:24]
  wire [19:0] _GEN_374 = reset ? 20'h0 : _GEN_369; // @[MemoryController.scala 42:{24,24}]
  wire [17:0] _GEN_375 = reset ? 18'h0 : _GEN_368; // @[MemoryController.scala 62:{29,29}]
  assign io_ReadData = {{2'd0}, DataReg}; // @[MemoryController.scala 48:15]
  assign io_Ready = 4'h0 == StateReg ? 1'h0 : _GEN_349; // @[MemoryController.scala 125:20 46:12]
  assign io_Completed = 4'h0 == StateReg ? 1'h0 : _GEN_354; // @[MemoryController.scala 125:20 45:16]
  assign SPI_SCLK = ClkReg & ClockEn; // @[MemoryController.scala 93:23]
  assign SPI_CE = 4'h0 == StateReg ? _GEN_10 : _GEN_342; // @[MemoryController.scala 125:20]
  assign SPI_SI_0 = 4'h0 == StateReg ? 1'h0 : _GEN_355; // @[MemoryController.scala 125:20 50:10]
  assign SPI_SI_1 = 4'h0 == StateReg ? 1'h0 : _GEN_345; // @[MemoryController.scala 125:20 50:10]
  assign SPI_SI_2 = 4'h0 == StateReg ? 1'h0 : _GEN_356; // @[MemoryController.scala 125:20 50:10]
  assign SPI_SI_3 = 4'h0 == StateReg ? 1'h0 : _GEN_357; // @[MemoryController.scala 125:20 50:10]
  assign SPI_Drive = 4'h0 == StateReg ? 1'h0 : _GEN_344; // @[MemoryController.scala 125:20 52:13]
  always @(posedge clock) begin
    DataReg <= _GEN_374[15:0]; // @[MemoryController.scala 42:{24,24}]
    if (reset) begin // @[MemoryController.scala 55:25]
      StateReg <= 4'h0; // @[MemoryController.scala 55:25]
    end else if (4'h0 == StateReg) begin // @[MemoryController.scala 125:20]
      if (CntReg == 14'h1) begin // @[MemoryController.scala 131:27]
        StateReg <= 4'h1; // @[MemoryController.scala 134:18]
      end
    end else if (4'h1 == StateReg) begin // @[MemoryController.scala 125:20]
      if (CntReg == 14'h7 & NextStateInv) begin // @[MemoryController.scala 149:44]
        StateReg <= 4'h2; // @[MemoryController.scala 153:18]
      end
    end else if (4'h2 == StateReg) begin // @[MemoryController.scala 125:20]
      StateReg <= _GEN_20;
    end else begin
      StateReg <= _GEN_315;
    end
    if (reset) begin // @[MemoryController.scala 58:28]
      SubStateReg <= 3'h0; // @[MemoryController.scala 58:28]
    end else if (!(4'h0 == StateReg)) begin // @[MemoryController.scala 125:20]
      if (!(4'h1 == StateReg)) begin // @[MemoryController.scala 125:20]
        if (!(4'h2 == StateReg)) begin // @[MemoryController.scala 125:20]
          SubStateReg <= _GEN_317;
        end
      end
    end
    if (reset) begin // @[MemoryController.scala 60:23]
      CntReg <= 14'h0; // @[MemoryController.scala 60:23]
    end else if (4'h0 == StateReg) begin // @[MemoryController.scala 125:20]
      if (CntReg == 14'h1) begin // @[MemoryController.scala 131:27]
        CntReg <= 14'h0; // @[MemoryController.scala 135:16]
      end else begin
        CntReg <= _CntReg_T_1; // @[MemoryController.scala 129:14]
      end
    end else if (4'h1 == StateReg) begin // @[MemoryController.scala 125:20]
      if (CntReg == 14'h7 & NextStateInv) begin // @[MemoryController.scala 149:44]
        CntReg <= 14'h0; // @[MemoryController.scala 151:16]
      end else begin
        CntReg <= _GEN_14;
      end
    end else if (!(4'h2 == StateReg)) begin // @[MemoryController.scala 125:20]
      CntReg <= _GEN_314;
    end
    WriteDataReg <= _GEN_375[15:0]; // @[MemoryController.scala 62:{29,29}]
    if (reset) begin // @[MemoryController.scala 63:27]
      AddressReg <= 24'h0; // @[MemoryController.scala 63:27]
    end else if (!(4'h0 == StateReg)) begin // @[MemoryController.scala 125:20]
      if (!(4'h1 == StateReg)) begin // @[MemoryController.scala 125:20]
        if (!(4'h2 == StateReg)) begin // @[MemoryController.scala 125:20]
          AddressReg <= _GEN_319;
        end
      end
    end
    if (reset) begin // @[MemoryController.scala 69:23]
      ClkReg <= 1'h0; // @[MemoryController.scala 69:23]
    end else if (ClockReset) begin // @[MemoryController.scala 109:19]
      ClkReg <= 1'h0; // @[MemoryController.scala 110:12]
    end else if (ClkCounter == 8'h1) begin // @[MemoryController.scala 97:31]
      ClkReg <= ~ClkReg; // @[MemoryController.scala 98:12]
    end
    if (reset) begin // @[MemoryController.scala 70:27]
      ClkCounter <= 8'h0; // @[MemoryController.scala 70:27]
    end else if (ClockReset) begin // @[MemoryController.scala 109:19]
      ClkCounter <= 8'h0; // @[MemoryController.scala 111:16]
    end else if (ClkCounter == 8'h1) begin // @[MemoryController.scala 97:31]
      ClkCounter <= 8'h0; // @[MemoryController.scala 99:16]
    end else begin
      ClkCounter <= _ClkCounter_T_1; // @[MemoryController.scala 95:14]
    end
    if (reset) begin // @[MemoryController.scala 72:28]
      ClkRegDelay <= 1'h0; // @[MemoryController.scala 72:28]
    end else begin
      ClkRegDelay <= ClkReg; // @[MemoryController.scala 73:15]
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
  DataReg = _RAND_0[15:0];
  _RAND_1 = {1{`RANDOM}};
  StateReg = _RAND_1[3:0];
  _RAND_2 = {1{`RANDOM}};
  SubStateReg = _RAND_2[2:0];
  _RAND_3 = {1{`RANDOM}};
  CntReg = _RAND_3[13:0];
  _RAND_4 = {1{`RANDOM}};
  WriteDataReg = _RAND_4[15:0];
  _RAND_5 = {1{`RANDOM}};
  AddressReg = _RAND_5[23:0];
  _RAND_6 = {1{`RANDOM}};
  ClkReg = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  ClkCounter = _RAND_7[7:0];
  _RAND_8 = {1{`RANDOM}};
  ClkRegDelay = _RAND_8[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module DataMemory(
  input         clock,
  input         reset,
  input  [17:0] io_MemPort_0_Address,
  input  [17:0] io_MemPort_0_WriteData,
  input         io_MemPort_0_Enable,
  input         io_MemPort_0_WriteEn,
  output [17:0] io_MemPort_0_ReadData,
  output        io_MemPort_0_Completed,
  output        SPI_SCLK,
  output        SPI_CE,
  input         SPI_SO_0,
  input         SPI_SO_1,
  input         SPI_SO_2,
  input         SPI_SO_3,
  output        SPI_SI_0,
  output        SPI_SI_1,
  output        SPI_SI_2,
  output        SPI_SI_3,
  output        SPI_Drive
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [17:0] Memory [0:2047]; // @[DataMemory.scala 21:27]
  wire  Memory_ReadWritePort_r_en; // @[DataMemory.scala 21:27]
  wire [10:0] Memory_ReadWritePort_r_addr; // @[DataMemory.scala 21:27]
  wire [17:0] Memory_ReadWritePort_r_data; // @[DataMemory.scala 21:27]
  wire [17:0] Memory_ReadWritePort_w_data; // @[DataMemory.scala 21:27]
  wire [10:0] Memory_ReadWritePort_w_addr; // @[DataMemory.scala 21:27]
  wire  Memory_ReadWritePort_w_mask; // @[DataMemory.scala 21:27]
  wire  Memory_ReadWritePort_w_en; // @[DataMemory.scala 21:27]
  reg  Memory_ReadWritePort_r_en_pipe_0;
  reg [10:0] Memory_ReadWritePort_r_addr_pipe_0;
  wire  ExternalMemory_clock; // @[DataMemory.scala 22:30]
  wire  ExternalMemory_reset; // @[DataMemory.scala 22:30]
  wire  ExternalMemory_io_ReadEnable; // @[DataMemory.scala 22:30]
  wire  ExternalMemory_io_WriteEnable; // @[DataMemory.scala 22:30]
  wire [23:0] ExternalMemory_io_Address; // @[DataMemory.scala 22:30]
  wire [17:0] ExternalMemory_io_WriteData; // @[DataMemory.scala 22:30]
  wire [17:0] ExternalMemory_io_ReadData; // @[DataMemory.scala 22:30]
  wire  ExternalMemory_io_Ready; // @[DataMemory.scala 22:30]
  wire  ExternalMemory_io_Completed; // @[DataMemory.scala 22:30]
  wire  ExternalMemory_SPI_SCLK; // @[DataMemory.scala 22:30]
  wire  ExternalMemory_SPI_CE; // @[DataMemory.scala 22:30]
  wire  ExternalMemory_SPI_SO_0; // @[DataMemory.scala 22:30]
  wire  ExternalMemory_SPI_SO_1; // @[DataMemory.scala 22:30]
  wire  ExternalMemory_SPI_SO_2; // @[DataMemory.scala 22:30]
  wire  ExternalMemory_SPI_SO_3; // @[DataMemory.scala 22:30]
  wire  ExternalMemory_SPI_SI_0; // @[DataMemory.scala 22:30]
  wire  ExternalMemory_SPI_SI_1; // @[DataMemory.scala 22:30]
  wire  ExternalMemory_SPI_SI_2; // @[DataMemory.scala 22:30]
  wire  ExternalMemory_SPI_SI_3; // @[DataMemory.scala 22:30]
  wire  ExternalMemory_SPI_Drive; // @[DataMemory.scala 22:30]
  wire  _T_10 = io_MemPort_0_Address <= 18'h7ff; // @[DataMemory.scala 63:39]
  wire [17:0] _io_MemPort_T_13_ReadData = Memory_ReadWritePort_r_data; // @[DataMemory.scala 70:{39,39}]
  wire [17:0] _GEN_23 = io_MemPort_0_WriteEn ? 18'h0 : _io_MemPort_T_13_ReadData; // @[DataMemory.scala 32:28 67:41]
  wire  _GEN_46 = ExternalMemory_io_Ready; // @[DataMemory.scala 38:33 86:38 87:41]
  wire [17:0] _GEN_47 = ExternalMemory_io_Ready ? io_MemPort_0_WriteData : 18'h0; // @[DataMemory.scala 36:31 86:38 88:39]
  wire  _io_MemPort_T_20_Completed = ExternalMemory_io_Completed; // @[DataMemory.scala 91:{40,40}]
  wire [17:0] _io_MemPort_T_22_ReadData = ExternalMemory_io_ReadData; // @[DataMemory.scala 98:{39,39}]
  wire  _GEN_54 = io_MemPort_0_WriteEn & _GEN_46; // @[DataMemory.scala 38:33 85:41]
  wire [17:0] _GEN_55 = io_MemPort_0_WriteEn ? _GEN_47 : 18'h0; // @[DataMemory.scala 36:31 85:41]
  wire  _GEN_56 = io_MemPort_0_WriteEn ? _io_MemPort_T_20_Completed : _io_MemPort_T_20_Completed; // @[DataMemory.scala 85:41]
  wire  _GEN_58 = io_MemPort_0_WriteEn ? 1'h0 : _GEN_46; // @[DataMemory.scala 37:32 85:41]
  wire [17:0] _GEN_59 = io_MemPort_0_WriteEn ? 18'h0 : _io_MemPort_T_22_ReadData; // @[DataMemory.scala 32:28 85:41]
  wire  _GEN_63 = io_MemPort_0_Address <= 18'h87f | _GEN_56; // @[DataMemory.scala 72:55]
  wire [17:0] _GEN_66 = io_MemPort_0_Address <= 18'h87f ? 18'h0 : _GEN_59; // @[DataMemory.scala 72:55]
  wire [17:0] _GEN_68 = io_MemPort_0_Address <= 18'h87f ? 18'h0 : io_MemPort_0_Address; // @[DataMemory.scala 39:29 72:55 83:33]
  wire  _GEN_69 = io_MemPort_0_Address <= 18'h87f ? 1'h0 : _GEN_54; // @[DataMemory.scala 38:33 72:55]
  wire [17:0] _GEN_70 = io_MemPort_0_Address <= 18'h87f ? 18'h0 : _GEN_55; // @[DataMemory.scala 36:31 72:55]
  wire  _GEN_71 = io_MemPort_0_Address <= 18'h87f ? 1'h0 : _GEN_58; // @[DataMemory.scala 37:32 72:55]
  wire  _GEN_76 = io_MemPort_0_Address <= 18'h7ff | _GEN_63; // @[DataMemory.scala 63:49]
  wire  _GEN_79 = io_MemPort_0_Address <= 18'h7ff & io_MemPort_0_WriteEn; // @[DataMemory.scala 21:27 63:49]
  wire [17:0] _GEN_80 = io_MemPort_0_Address <= 18'h7ff ? _GEN_23 : _GEN_66; // @[DataMemory.scala 63:49]
  wire [17:0] _GEN_85 = io_MemPort_0_Address <= 18'h7ff ? 18'h0 : _GEN_68; // @[DataMemory.scala 39:29 63:49]
  wire  _GEN_86 = io_MemPort_0_Address <= 18'h7ff ? 1'h0 : _GEN_69; // @[DataMemory.scala 38:33 63:49]
  wire [17:0] _GEN_87 = io_MemPort_0_Address <= 18'h7ff ? 18'h0 : _GEN_70; // @[DataMemory.scala 36:31 63:49]
  wire  _GEN_88 = io_MemPort_0_Address <= 18'h7ff ? 1'h0 : _GEN_71; // @[DataMemory.scala 37:32 63:49]
  wire [17:0] _GEN_102 = io_MemPort_0_Enable ? _GEN_85 : 18'h0; // @[DataMemory.scala 39:29 62:36]
  MemoryController ExternalMemory ( // @[DataMemory.scala 22:30]
    .clock(ExternalMemory_clock),
    .reset(ExternalMemory_reset),
    .io_ReadEnable(ExternalMemory_io_ReadEnable),
    .io_WriteEnable(ExternalMemory_io_WriteEnable),
    .io_Address(ExternalMemory_io_Address),
    .io_WriteData(ExternalMemory_io_WriteData),
    .io_ReadData(ExternalMemory_io_ReadData),
    .io_Ready(ExternalMemory_io_Ready),
    .io_Completed(ExternalMemory_io_Completed),
    .SPI_SCLK(ExternalMemory_SPI_SCLK),
    .SPI_CE(ExternalMemory_SPI_CE),
    .SPI_SO_0(ExternalMemory_SPI_SO_0),
    .SPI_SO_1(ExternalMemory_SPI_SO_1),
    .SPI_SO_2(ExternalMemory_SPI_SO_2),
    .SPI_SO_3(ExternalMemory_SPI_SO_3),
    .SPI_SI_0(ExternalMemory_SPI_SI_0),
    .SPI_SI_1(ExternalMemory_SPI_SI_1),
    .SPI_SI_2(ExternalMemory_SPI_SI_2),
    .SPI_SI_3(ExternalMemory_SPI_SI_3),
    .SPI_Drive(ExternalMemory_SPI_Drive)
  );
  assign Memory_ReadWritePort_r_en = Memory_ReadWritePort_r_en_pipe_0;
  assign Memory_ReadWritePort_r_addr = Memory_ReadWritePort_r_addr_pipe_0;
  assign Memory_ReadWritePort_r_data = Memory[Memory_ReadWritePort_r_addr]; // @[DataMemory.scala 21:27]
  assign Memory_ReadWritePort_w_data = io_MemPort_0_WriteData;
  assign Memory_ReadWritePort_w_addr = io_MemPort_0_Address[10:0];
  assign Memory_ReadWritePort_w_mask = io_MemPort_0_WriteEn;
  assign Memory_ReadWritePort_w_en = io_MemPort_0_Enable & _T_10 & (io_MemPort_0_Enable & _GEN_79);
  assign io_MemPort_0_ReadData = io_MemPort_0_Enable ? _GEN_80 : 18'h0; // @[DataMemory.scala 32:28 62:36]
  assign io_MemPort_0_Completed = io_MemPort_0_Enable & _GEN_76; // @[DataMemory.scala 33:29 62:36]
  assign SPI_SCLK = ExternalMemory_SPI_SCLK; // @[DataMemory.scala 40:22]
  assign SPI_CE = ExternalMemory_SPI_CE; // @[DataMemory.scala 40:22]
  assign SPI_SI_0 = ExternalMemory_SPI_SI_0; // @[DataMemory.scala 40:22]
  assign SPI_SI_1 = ExternalMemory_SPI_SI_1; // @[DataMemory.scala 40:22]
  assign SPI_SI_2 = ExternalMemory_SPI_SI_2; // @[DataMemory.scala 40:22]
  assign SPI_SI_3 = ExternalMemory_SPI_SI_3; // @[DataMemory.scala 40:22]
  assign SPI_Drive = ExternalMemory_SPI_Drive; // @[DataMemory.scala 40:22]
  assign ExternalMemory_clock = clock;
  assign ExternalMemory_reset = reset;
  assign ExternalMemory_io_ReadEnable = io_MemPort_0_Enable & _GEN_88; // @[DataMemory.scala 37:32 62:36]
  assign ExternalMemory_io_WriteEnable = io_MemPort_0_Enable & _GEN_86; // @[DataMemory.scala 38:33 62:36]
  assign ExternalMemory_io_Address = {{6'd0}, _GEN_102};
  assign ExternalMemory_io_WriteData = io_MemPort_0_Enable ? _GEN_87 : 18'h0; // @[DataMemory.scala 36:31 62:36]
  assign ExternalMemory_SPI_SO_0 = SPI_SO_0; // @[DataMemory.scala 40:22]
  assign ExternalMemory_SPI_SO_1 = SPI_SO_1; // @[DataMemory.scala 40:22]
  assign ExternalMemory_SPI_SO_2 = SPI_SO_2; // @[DataMemory.scala 40:22]
  assign ExternalMemory_SPI_SO_3 = SPI_SO_3; // @[DataMemory.scala 40:22]
  always @(posedge clock) begin
    if (Memory_ReadWritePort_w_en & Memory_ReadWritePort_w_mask) begin
      Memory[Memory_ReadWritePort_w_addr] <= Memory_ReadWritePort_w_data; // @[DataMemory.scala 21:27]
    end
    Memory_ReadWritePort_r_en_pipe_0 <= io_MemPort_0_Enable & _T_10 & ~(io_MemPort_0_Enable & _GEN_79);
    if (io_MemPort_0_Enable & _T_10 & ~(io_MemPort_0_Enable & _GEN_79)) begin
      Memory_ReadWritePort_r_addr_pipe_0 <= io_MemPort_0_Address[10:0];
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
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2048; initvar = initvar+1)
    Memory[initvar] = _RAND_0[17:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  Memory_ReadWritePort_r_en_pipe_0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  Memory_ReadWritePort_r_addr_pipe_0 = _RAND_2[10:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module SubDSP(
  input         clock,
  input         reset,
  input  [15:0] io_In,
  output [15:0] io_Out,
  output        SPI_SCLK,
  output        SPI_CE,
  input         SPI_SO_0,
  input         SPI_SO_1,
  input         SPI_SO_2,
  input         SPI_SO_3,
  output        SPI_SI_0,
  output        SPI_SI_1,
  output        SPI_SI_2,
  output        SPI_SI_3,
  output        SPI_Drive
);
  wire  Core_clock; // @[SubDSP.scala 33:20]
  wire  Core_reset; // @[SubDSP.scala 33:20]
  wire [15:0] Core_io_WaveIn; // @[SubDSP.scala 33:20]
  wire [15:0] Core_io_WaveOut; // @[SubDSP.scala 33:20]
  wire [17:0] Core_io_MemPort_Address; // @[SubDSP.scala 33:20]
  wire [17:0] Core_io_MemPort_WriteData; // @[SubDSP.scala 33:20]
  wire  Core_io_MemPort_Enable; // @[SubDSP.scala 33:20]
  wire  Core_io_MemPort_WriteEn; // @[SubDSP.scala 33:20]
  wire [17:0] Core_io_MemPort_ReadData; // @[SubDSP.scala 33:20]
  wire  Core_io_MemPort_Completed; // @[SubDSP.scala 33:20]
  wire  DataMemory_clock; // @[SubDSP.scala 35:26]
  wire  DataMemory_reset; // @[SubDSP.scala 35:26]
  wire [17:0] DataMemory_io_MemPort_0_Address; // @[SubDSP.scala 35:26]
  wire [17:0] DataMemory_io_MemPort_0_WriteData; // @[SubDSP.scala 35:26]
  wire  DataMemory_io_MemPort_0_Enable; // @[SubDSP.scala 35:26]
  wire  DataMemory_io_MemPort_0_WriteEn; // @[SubDSP.scala 35:26]
  wire [17:0] DataMemory_io_MemPort_0_ReadData; // @[SubDSP.scala 35:26]
  wire  DataMemory_io_MemPort_0_Completed; // @[SubDSP.scala 35:26]
  wire  DataMemory_SPI_SCLK; // @[SubDSP.scala 35:26]
  wire  DataMemory_SPI_CE; // @[SubDSP.scala 35:26]
  wire  DataMemory_SPI_SO_0; // @[SubDSP.scala 35:26]
  wire  DataMemory_SPI_SO_1; // @[SubDSP.scala 35:26]
  wire  DataMemory_SPI_SO_2; // @[SubDSP.scala 35:26]
  wire  DataMemory_SPI_SO_3; // @[SubDSP.scala 35:26]
  wire  DataMemory_SPI_SI_0; // @[SubDSP.scala 35:26]
  wire  DataMemory_SPI_SI_1; // @[SubDSP.scala 35:26]
  wire  DataMemory_SPI_SI_2; // @[SubDSP.scala 35:26]
  wire  DataMemory_SPI_SI_3; // @[SubDSP.scala 35:26]
  wire  DataMemory_SPI_Drive; // @[SubDSP.scala 35:26]
  wire [17:0] _GEN_0 = {{2'd0}, Core_io_WaveOut}; // @[SubDSP.scala 39:29]
  wire [18:0] _io_Out_T = {{1'd0}, _GEN_0}; // @[SubDSP.scala 39:29]
  Core Core ( // @[SubDSP.scala 33:20]
    .clock(Core_clock),
    .reset(Core_reset),
    .io_WaveIn(Core_io_WaveIn),
    .io_WaveOut(Core_io_WaveOut),
    .io_MemPort_Address(Core_io_MemPort_Address),
    .io_MemPort_WriteData(Core_io_MemPort_WriteData),
    .io_MemPort_Enable(Core_io_MemPort_Enable),
    .io_MemPort_WriteEn(Core_io_MemPort_WriteEn),
    .io_MemPort_ReadData(Core_io_MemPort_ReadData),
    .io_MemPort_Completed(Core_io_MemPort_Completed)
  );
  DataMemory DataMemory ( // @[SubDSP.scala 35:26]
    .clock(DataMemory_clock),
    .reset(DataMemory_reset),
    .io_MemPort_0_Address(DataMemory_io_MemPort_0_Address),
    .io_MemPort_0_WriteData(DataMemory_io_MemPort_0_WriteData),
    .io_MemPort_0_Enable(DataMemory_io_MemPort_0_Enable),
    .io_MemPort_0_WriteEn(DataMemory_io_MemPort_0_WriteEn),
    .io_MemPort_0_ReadData(DataMemory_io_MemPort_0_ReadData),
    .io_MemPort_0_Completed(DataMemory_io_MemPort_0_Completed),
    .SPI_SCLK(DataMemory_SPI_SCLK),
    .SPI_CE(DataMemory_SPI_CE),
    .SPI_SO_0(DataMemory_SPI_SO_0),
    .SPI_SO_1(DataMemory_SPI_SO_1),
    .SPI_SO_2(DataMemory_SPI_SO_2),
    .SPI_SO_3(DataMemory_SPI_SO_3),
    .SPI_SI_0(DataMemory_SPI_SI_0),
    .SPI_SI_1(DataMemory_SPI_SI_1),
    .SPI_SI_2(DataMemory_SPI_SI_2),
    .SPI_SI_3(DataMemory_SPI_SI_3),
    .SPI_Drive(DataMemory_SPI_Drive)
  );
  assign io_Out = _io_Out_T[15:0]; // @[SubDSP.scala 39:10]
  assign SPI_SCLK = DataMemory_SPI_SCLK; // @[SubDSP.scala 55:7]
  assign SPI_CE = DataMemory_SPI_CE; // @[SubDSP.scala 55:7]
  assign SPI_SI_0 = DataMemory_SPI_SI_0; // @[SubDSP.scala 55:7]
  assign SPI_SI_1 = DataMemory_SPI_SI_1; // @[SubDSP.scala 55:7]
  assign SPI_SI_2 = DataMemory_SPI_SI_2; // @[SubDSP.scala 55:7]
  assign SPI_SI_3 = DataMemory_SPI_SI_3; // @[SubDSP.scala 55:7]
  assign SPI_Drive = DataMemory_SPI_Drive; // @[SubDSP.scala 55:7]
  assign Core_clock = clock;
  assign Core_reset = reset;
  assign Core_io_WaveIn = io_In; // @[SubDSP.scala 41:18]
  assign Core_io_MemPort_ReadData = DataMemory_io_MemPort_0_ReadData; // @[SubDSP.scala 48:19]
  assign Core_io_MemPort_Completed = DataMemory_io_MemPort_0_Completed; // @[SubDSP.scala 48:19]
  assign DataMemory_clock = clock;
  assign DataMemory_reset = reset;
  assign DataMemory_io_MemPort_0_Address = Core_io_MemPort_Address; // @[SubDSP.scala 48:19]
  assign DataMemory_io_MemPort_0_WriteData = Core_io_MemPort_WriteData; // @[SubDSP.scala 48:19]
  assign DataMemory_io_MemPort_0_Enable = Core_io_MemPort_Enable; // @[SubDSP.scala 48:19]
  assign DataMemory_io_MemPort_0_WriteEn = Core_io_MemPort_WriteEn; // @[SubDSP.scala 48:19]
  assign DataMemory_SPI_SO_0 = SPI_SO_0; // @[SubDSP.scala 55:7]
  assign DataMemory_SPI_SO_1 = SPI_SO_1; // @[SubDSP.scala 55:7]
  assign DataMemory_SPI_SO_2 = SPI_SO_2; // @[SubDSP.scala 55:7]
  assign DataMemory_SPI_SO_3 = SPI_SO_3; // @[SubDSP.scala 55:7]
endmodule
module DSP(
  input         clock,
  input         reset,
  input  [15:0] io_In,
  output [15:0] io_Out,
  output        SPI_SCLK,
  output        SPI_CE,
  input         SPI_SO_0,
  input         SPI_SO_1,
  input         SPI_SO_2,
  input         SPI_SO_3,
  output        SPI_SI_0,
  output        SPI_SI_1,
  output        SPI_SI_2,
  output        SPI_SI_3,
  output        SPI_Drive
);
  wire  SubDSP_clock; // @[DSP.scala 18:22]
  wire  SubDSP_reset; // @[DSP.scala 18:22]
  wire [15:0] SubDSP_io_In; // @[DSP.scala 18:22]
  wire [15:0] SubDSP_io_Out; // @[DSP.scala 18:22]
  wire  SubDSP_SPI_SCLK; // @[DSP.scala 18:22]
  wire  SubDSP_SPI_CE; // @[DSP.scala 18:22]
  wire  SubDSP_SPI_SO_0; // @[DSP.scala 18:22]
  wire  SubDSP_SPI_SO_1; // @[DSP.scala 18:22]
  wire  SubDSP_SPI_SO_2; // @[DSP.scala 18:22]
  wire  SubDSP_SPI_SO_3; // @[DSP.scala 18:22]
  wire  SubDSP_SPI_SI_0; // @[DSP.scala 18:22]
  wire  SubDSP_SPI_SI_1; // @[DSP.scala 18:22]
  wire  SubDSP_SPI_SI_2; // @[DSP.scala 18:22]
  wire  SubDSP_SPI_SI_3; // @[DSP.scala 18:22]
  wire  SubDSP_SPI_Drive; // @[DSP.scala 18:22]
  SubDSP SubDSP ( // @[DSP.scala 18:22]
    .clock(SubDSP_clock),
    .reset(SubDSP_reset),
    .io_In(SubDSP_io_In),
    .io_Out(SubDSP_io_Out),
    .SPI_SCLK(SubDSP_SPI_SCLK),
    .SPI_CE(SubDSP_SPI_CE),
    .SPI_SO_0(SubDSP_SPI_SO_0),
    .SPI_SO_1(SubDSP_SPI_SO_1),
    .SPI_SO_2(SubDSP_SPI_SO_2),
    .SPI_SO_3(SubDSP_SPI_SO_3),
    .SPI_SI_0(SubDSP_SPI_SI_0),
    .SPI_SI_1(SubDSP_SPI_SI_1),
    .SPI_SI_2(SubDSP_SPI_SI_2),
    .SPI_SI_3(SubDSP_SPI_SI_3),
    .SPI_Drive(SubDSP_SPI_Drive)
  );
  assign io_Out = SubDSP_io_Out; // @[DSP.scala 21:27]
  assign SPI_SCLK = SubDSP_SPI_SCLK; // @[DSP.scala 23:14]
  assign SPI_CE = SubDSP_SPI_CE; // @[DSP.scala 23:14]
  assign SPI_SI_0 = SubDSP_SPI_SI_0; // @[DSP.scala 23:14]
  assign SPI_SI_1 = SubDSP_SPI_SI_1; // @[DSP.scala 23:14]
  assign SPI_SI_2 = SubDSP_SPI_SI_2; // @[DSP.scala 23:14]
  assign SPI_SI_3 = SubDSP_SPI_SI_3; // @[DSP.scala 23:14]
  assign SPI_Drive = SubDSP_SPI_Drive; // @[DSP.scala 23:14]
  assign SubDSP_clock = clock;
  assign SubDSP_reset = reset;
  assign SubDSP_io_In = io_In; // @[DSP.scala 20:25]
  assign SubDSP_SPI_SO_0 = SPI_SO_0; // @[DSP.scala 23:14]
  assign SubDSP_SPI_SO_1 = SPI_SO_1; // @[DSP.scala 23:14]
  assign SubDSP_SPI_SO_2 = SPI_SO_2; // @[DSP.scala 23:14]
  assign SubDSP_SPI_SO_3 = SPI_SO_3; // @[DSP.scala 23:14]
endmodule
