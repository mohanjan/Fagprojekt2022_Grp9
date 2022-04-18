import chisel3._
import chisel3.util._
import chisel3.experimental.Analog
import Core._

object Core{
  val Arithmetic = 0.U
  val ImmidiateArithmetic = 1.U
  val MemoryI = 2.U
  val Conditional = 3.U
  val Nil = 4.U
  val FirRead = 5.U
  val InstructionFetch = 0.U
  val InstructionDecode = 1.U
  val Execute = 2.U
  val MemoryAccess = 3.U
  val RegisterWriteback = 4.U
}


class Core(maxCount: Int) extends Module {
  val io = IO(new Bundle {
    val WaveIn = Input(UInt(16.W))
    val WaveOut = Output(UInt(16.W))

    val MemInData = Input(UInt(18.W))
    val MemInAddress = Input(UInt(10.W))

    val MemWrite = Input(Bool())
    val ProgramLength = Input(UInt(10.W))
  })
  val SPI = IO(new Bundle{
    val SCLK = Output(Bool())
    val CE = Output(Bool())
    val SO = Input(Vec(4,Bool()))
    val SI = Output(Vec(4,Bool()))
    val Drive = Output(Bool())
  })
  /*
  val SPI = IO(new Bundle{
    val SCLK = Output(Bool())
    val CE = Output(Bool())
    val MOSI = Output(Bool())
    val MISO = Input(Bool())
  })
  */
  /*
  val SPI = IO(new Bundle{
    val SCLK = Output(Bool())
    val CE = Output(Bool())
    val SPIBus = Analog(4.W)
  })
  */

  val OpCounter = RegInit(0.U(3.W))

  // Pipeline registers

  val AddressReg = RegInit(0.U(10.W))
  val TypeReg = RegInit(0.U(2.W))
  val rs1Reg = RegInit(0.U(4.W))
  val rs2Reg = RegInit(0.U(4.W))
  val rdReg = RegInit(0.U(4.W))

  val AImmediateReg = RegInit(0.U(11.W))
  val ASImmediateReg = RegInit(0.S(11.W))

  val AOperationReg = RegInit(0.U(4.W))

  val MemOpReg = RegInit(0.U(1.W))
  val MemAddressReg = RegInit(0.U(11.W))

  val COperationReg = RegInit(0.U(2.W))
  val COffsetReg = RegInit(0.S(6.W))

  // Memory Access and Writeback registers

  val WritebackMode = RegInit(0.U(4.W))
  val WritebackRegister = RegInit(0.U(4.W))

  val ALU = Module(new ALU(maxCount))
  val DataMem = Module(new DataMemory(maxCount))
  val InstDec = Module(new InstuctionDecoder(maxCount))
  val BranchComp = Module(new BranchComp(maxCount))
  val InstructionMem = Module(new InstuctionMemory(maxCount))

  //Registers

  val x = Reg(Vec(16,UInt(18.W)))

  x(0) := 0.U(16.W)
  x(2) := io.WaveIn
  io.WaveOut := x(3)

  // Defaults

  ALU.io.rs2 := 0.U
  ALU.io.rs1 := 0.U
  ALU.io.Operation := 0.U

  InstructionMem.io.Address := 0.U
  InstructionMem.io.DataIn := 0.U
  InstructionMem.io.MemWrite := 0.U

  DataMem.io.DataIn := 0.U
  DataMem.io.Address := 0.U
  DataMem.io.Enable := false.B
  DataMem.io.Write := false.B
  DataMem.SPI <> SPI

  BranchComp.io.rs2 := 0.U
  BranchComp.io.rs1 := 0.U
  BranchComp.io.PC := 0.U
  BranchComp.io.Offset := 0.S
  BranchComp.io.Operation := 0.U

  InstDec.io.Instruction := 0.U

  // Processor

  when(io.MemWrite){
    DataMem.io.DataIn := io.MemInData
    DataMem.io.Address := io.MemInAddress
  }.otherwise{
    switch(OpCounter){
      is(InstructionFetch){
        InstructionMem.io.Address := x(1)
        AddressReg := x(1)
        OpCounter := InstructionDecode
      }
      is(InstructionDecode){
        InstDec.io.Instruction := InstructionMem.io.Instruction

        TypeReg := InstDec.io.Type
        rs1Reg := InstDec.io.rs1
        rs2Reg := InstDec.io.rs2
        rdReg := InstDec.io.rd

        AImmediateReg := InstDec.io.AImmidiate
        ASImmediateReg := InstDec.io.ASImmidiate

        AOperationReg := InstDec.io.AOperation

        MemOpReg := InstDec.io.MemOp
        MemAddressReg := InstDec.io.MemAdress

        COperationReg := InstDec.io.COperation
        COffsetReg := InstDec.io.COffset

        OpCounter := Execute
      }
      is(Execute){
        switch(TypeReg){
          is(0.U){
            when(AOperationReg <= 7.U){
              ALU.io.Operation := AOperationReg
              ALU.io.rs2 := x(rs2Reg)
              ALU.io.rs1 := x(rs1Reg)

              WritebackMode := Arithmetic
              WritebackRegister := rdReg

              OpCounter := RegisterWriteback
            }.elsewhen(AOperationReg === 8.U){
              DataMem.io.Enable := true.B
              DataMem.io.Address := x(rs1Reg)
              WritebackMode := MemoryI
              WritebackRegister := rdReg

              when(DataMem.io.Completed){
                OpCounter := RegisterWriteback
              }
            }.elsewhen(AOperationReg === 9.U){
              DataMem.io.Enable := true.B
              DataMem.io.Write := true.B
              DataMem.io.Address := x(rs1Reg)
              DataMem.io.DataIn := x(rdReg)
              WritebackMode := Nil

              when(DataMem.io.Completed){
                OpCounter := RegisterWriteback
              }
            }
          }
          is(1.U){
            when(AOperationReg === 1.U){
              ALU.io.rs2 := 0.U
              ALU.io.rs1 := AImmediateReg
              ALU.io.Operation := 0.U
            }.elsewhen(AOperationReg === 2.U){
              ALU.io.rs2 := 0.U
              //ALU.io.rs1 := (AImmediateReg << 9).asUInt

              val upper = Wire(UInt(9.W))
              upper := AImmediateReg(8,0)
              val lower = Wire(UInt(9.W))
              lower := x(rdReg)(8,0)
              val cat = Wire(UInt(18.W))
              cat := Cat(upper,lower)

              ALU.io.rs1 := cat
              ALU.io.Operation := 0.U
            }.otherwise{
              when(ASImmediateReg < 0.S){
                ALU.io.Operation := 1.U
                ALU.io.rs2 := (0.S - ASImmediateReg).asUInt
                ALU.io.rs1 := x(rdReg)
              }.otherwise{
                ALU.io.rs2 := ASImmediateReg.asUInt
                ALU.io.rs1 := x(rdReg)
                ALU.io.Operation := 0.U
              }
            }
            WritebackMode := Arithmetic
            WritebackRegister := rdReg
            OpCounter := RegisterWriteback
          }
          is(2.U){
            DataMem.io.Address := MemAddressReg
            DataMem.io.DataIn := x(rdReg)
            DataMem.io.Enable := true.B
            DataMem.io.Write := MemOpReg

            switch(MemOpReg){
              is(0.U){
                WritebackMode := MemoryI
              }
              is(1.U){
                WritebackMode := Nil
              }
            }
            WritebackRegister := rdReg
            OpCounter := RegisterWriteback
          }
          is(3.U){
            BranchComp.io.rs2 := x(rs2Reg)
            BranchComp.io.rs1 := x(rs1Reg)
            BranchComp.io.Operation := COperationReg
            BranchComp.io.PC := x(1)
            BranchComp.io.Offset := COffsetReg

            WritebackMode := Conditional
            WritebackRegister := rdReg

            OpCounter := RegisterWriteback
          }
        }
      }
      is(RegisterWriteback){
        switch(WritebackMode){
          is(Nil){
            x(1) := x(1) + 1.U
          }
          is(Arithmetic){
            x(WritebackRegister) := ALU.io.Out.asUInt
            x(1) := x(1) + 1.U
          }
          is(MemoryI){
            x(WritebackRegister) := DataMem.io.DataOut
            x(1) := x(1) + 1.U
          }
          is(Conditional){
            x(1) := BranchComp.io.Out
          }
        }

        OpCounter := InstructionFetch

      }
    }
  }
}
