import chisel3._
import chisel3.util._
import Core._

object Core{
  val Arithmetic = 0.U
  val ImmidiateArithmetic = 1.U
  val MemoryI = 2.U
  val Conditional = 3.U
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

  // x0 = 0.U hardcoded
  // x1 = Program Counter
  // x2 = Input
  // x3 = Output

  val OpCounter = RegInit(0.U(3.W))
  val AddressReg = RegInit(0.U(10.W))

  val TypeReg = RegInit(0.U(2.W))
  val rs1Reg = RegInit(0.U(4.W))
  val rs2Reg = RegInit(0.U(4.W))
  val rdReg = RegInit(0.U(4.W))

  val AImmidiateReg = RegInit(0.U(10.W))
  val AOperationReg = RegInit(0.U(4.W))

  val MemOpReg = RegInit(0.U(1.W))
  val MemAdressReg = RegInit(0.U(11.W))

  val COperationReg = RegInit(0.U(2.W))
  val COffsetReg = RegInit(0.U(6.W))

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

  ALU.io.rs2 := 0.U
  ALU.io.rs1 := 0.U
  ALU.io.Operation := 0.U

  DataMem.io.DataIn := 0.U
  DataMem.io.Address := 0.U
  DataMem.io.Valid := false.B
  DataMem.io.Operation := 0.U

  BranchComp.io.rs2 := 0.U
  BranchComp.io.rs1 := 0.U
  BranchComp.io.Operation := 0.U

  InstDec.io.Instruction := 0.U

  when(io.MemWrite){
    DataMem.io.DataIn := io.MemInData
    DataMem.io.Address := io.MemInAddress
  }.otherwise{

    switch(OpCounter){
      is(InstructionFetch){
        InstructionMem.io.Address := x(1)
        AddressReg := x(1)
        OpCounter := OpCounter + 1.U
      }
      is(InstructionDecode){
        InstDec.io.Instruction := InstructionMem.io.Instruction

        TypeReg := InstDec.io.Type
        rs1Reg := InstDec.io.rs1
        rs2Reg := InstDec.io.rs2
        rdReg := InstDec.io.rd

        AImmidiateReg := InstDec.io.AImmidiate
        AOperationReg := InstDec.io.AOperation

        MemOpReg := InstDec.io.MemOp
        MemAdressReg := InstDec.io.MemAdress

        COperationReg := InstDec.io.COperation
        COffsetReg := InstDec.io.COffset

        OpCounter := OpCounter + 1.U
      }
      is(Execute){
        switch(TypeReg){
          is(Arithmetic){
            ALU.io.Operation := AOperationReg
            ALU.io.rs2 := x(rs2Reg)
            ALU.io.rs1 := x(rs1Reg)

            /*
            x(rdReg) := ALU.io.Out
            x(1) := x(1) + 1.U
            */

            WritebackMode := Arithmetic
            WritebackRegister := rdReg
          }
          is(ImmidiateArithmetic){
            when(InstDec.io.AOperation === 3.U){
              //x(rdReg) := AImmidiateReg
              ALU.io.rs2 := AImmidiateReg
              ALU.io.rs1 := 0.U
            }.otherwise{
              ALU.io.Operation := AOperationReg
              ALU.io.rs2 := AImmidiateReg
              ALU.io.rs1 := x(rs1Reg)
              //x(rdReg) := ALU.io.Out
            }
            //x(1) := x(1) + 1.U

            WritebackMode := Arithmetic
            WritebackRegister := rdReg
          }
          is(MemoryI){
            DataMem.io.Valid := true.B
            DataMem.io.Operation := MemOpReg
            DataMem.io.Address := InstDec.io.MemAdress

            /*
            when(InstDec.io.MemOp === 0.U){
              x(InstDec.io.rd) := DataMem.io.DataOut
            }.otherwise{
              DataMem.io.DataIn := x(InstDec.io.rd)
            }

            x(1) := x(1) + 1.U
            */

            WritebackMode := MemoryI
            WritebackRegister := rdReg
          }
          is(Conditional){
            BranchComp.io.rs2 := x(rs2Reg)
            BranchComp.io.rs1 := x(rs1Reg)
            BranchComp.io.Operation := COperationReg
            BranchComp.io.PC := x(1)
            BranchComp.io.Offset := COffsetReg

            /*
            when(BranchComp.io.Out){
              x(1) := (x(1).zext + InstDec.io.COffset.asSInt).asUInt(15,0)
            }.otherwise{
              x(1) := x(1) + 1.U
            }
            */

            RegisterWriteback := Conditional
            WritebackRegister := rdReg
          }
        }
      }
      is(RegisterWriteback){
        switch(WritebackMode){
          is(Arithmetic){
            x(WritebackRegister) := ALU.io.Out
            x(1) := x(1) + 1.U
          }
          is(MemoryI){
            x(WritebackRegister) := DataMem.io.DataOut
            x(1) := x(1) + 1.U
          }
          is(Conditional){
            x(WritebackRegister) := BranchComp.io.Out
          }
        }

        OpCounter := InstructionFetch

      }

      /*

      is(1.U){
        InstDec.io.Instruction := InstructionMem.io.Instruction

        switch(InstDec.io.Type){
          is(Arithmetic){
            ALU.io.Operation := InstDec.io.AOperation
            ALU.io.rs2 := x(InstDec.io.rs2)
            ALU.io.rs1 := x(InstDec.io.rs1)
            x(InstDec.io.rd) := ALU.io.Out
            x(1) := x(1) + 1.U
          }
          is(ImmidiateArithmetic){
            when(InstDec.io.AOperation === 3.U){
              x(InstDec.io.rd) := InstDec.io.AImmidiate
            }.otherwise{
              ALU.io.Operation := InstDec.io.AOperation
              ALU.io.rs2 := InstDec.io.AImmidiate
              ALU.io.rs1 := x(InstDec.io.rd)
              x(InstDec.io.rd) := ALU.io.Out
            }
            x(1) := x(1) + 1.U
          }
          is(MemoryI){
            DataMem.io.Valid := true.B
            DataMem.io.Operation := InstDec.io.MemOp
            DataMem.io.Address := InstDec.io.MemAdress

            when(InstDec.io.MemOp === 0.U){
              x(InstDec.io.rd) := DataMem.io.DataOut
            }.otherwise{
              DataMem.io.DataIn := x(InstDec.io.rd)
            }
            x(1) := x(1) + 1.U
          }
          is(Conditional){
            BranchComp.io.rs2 := x(InstDec.io.rs2)
            BranchComp.io.rs1 := x(InstDec.io.rs1)
            BranchComp.io.Operation := InstDec.io.COperation

            when(BranchComp.io.Out){
              x(1) := (x(1).zext + InstDec.io.COffset.asSInt).asUInt(15,0)
            }.otherwise{
              x(1) := x(1) + 1.U
            }
          }
        }
        OpCounter := OpCounter + 1.U
      }

      */
    }
  }



}
