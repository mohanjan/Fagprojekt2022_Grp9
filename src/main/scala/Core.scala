import chisel3._
import chisel3.util._

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
  val InstructionReg = RegInit(0.U(18.W))

  val ALU = Module(new ALU(maxCount))
  val Memory = Module(new Memory(maxCount))
  val InstDec = Module(new InstuctionDecoder(maxCount))
  val BranchComp = Module(new BranchComp(maxCount))

  val x = Reg(Vec(16,UInt(16.W)))

  x(0) := 0.U(16.W)
  x(2) := io.WaveIn
  io.WaveOut := x(3)

  ALU.io.rs2 := 0.U
  ALU.io.rs1 := 0.U
  ALU.io.Operation := 0.U

  Memory.io.DataIn := 0.U
  Memory.io.Address := 0.U
  Memory.io.Valid := false.B
  Memory.io.Operation := 0.U

  BranchComp.io.rs2 := 0.U
  BranchComp.io.rs1 := 0.U
  BranchComp.io.Operation := 0.U

  InstDec.io.Instruction := 0.U

  when(io.MemWrite){
    Memory.io.DataIn := io.MemInData
    Memory.io.Address := io.MemInAddress
  }.otherwise{
    switch(OpCounter){
      is(0.U){
        Memory.io.Address := x(1)
        Memory.io.Operation := 1.U // Read
        InstructionReg := Memory.io.DataOut
        OpCounter := OpCounter + 1.U
      }
      is(1.U){
        InstDec.io.Instruction := InstructionReg

        //switch(InstDec.io.Type){
        switch(InstructionReg(17,16)){
          is(0.U){
            ALU.io.Operation := InstDec.io.AOperation
            ALU.io.rs2 := x(InstDec.io.rs2)
            ALU.io.rs1 := x(InstDec.io.rs1)
            x(InstDec.io.rd) := ALU.io.Out
            x(1) := x(1) + 1.U
          }
          is(1.U){
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
          is(2.U){
            Memory.io.Valid := true.B
            Memory.io.Operation := InstDec.io.MemOp
            Memory.io.Address := InstDec.io.MemAdress

            when(InstDec.io.MemOp === 0.U){
              x(InstDec.io.rd) := Memory.io.DataOut
            }.otherwise{
              Memory.io.DataIn := x(InstDec.io.rd)
            }
            x(1) := x(1) + 1.U
          }
          is(3.U){
            BranchComp.io.rs2 := x(InstDec.io.rs2)
            BranchComp.io.rs1 := x(InstDec.io.rs1)
            BranchComp.io.Operation := InstDec.io.COperation

            when(BranchComp.io.Out){
              x(1) := (x(1).zext + InstDec.io.Offset.asSInt).asUInt(15,0)
            }.otherwise{
              x(1) := x(1) + 1.U
            }
          }
        }
      }
    }
  }



}
