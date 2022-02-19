import chisel3._
import chisel3.util._

class InstuctionDecoder(maxCount: Int) extends Module {
  val io = IO(new Bundle {
    val Instruction = Input(UInt(18.W))

    //val Type = Input(UInt(2.W))
    val ReadReg0 = Output(UInt(4.W))
    val ReadReg1 = Output(UInt(4.W))

    val WriteReg = Output(UInt(4.W))

    val AImmidiate = Output(UInt(8.W))
    val AOperation = Output(UInt(4.W))

    val MemOp = Output(UInt(2.W))
    val MemAdress = Output(UInt(10.W))
    val MemReg = Output(UInt(4.W))

    val COperation = Output(UInt(3.W))
    val CImmidiate = Output(UInt(5.W))
  })

  //io.Type := io.Instruction(17,16)
  io.ReadReg0 := 0.U
  io.ReadReg1 := 0.U
  io.WriteReg := 0.U
  io.AImmidiate := 0.U
  io.AOperation := 0.U
  io.MemOp := 0.U
  io.MemAdress := 0.U
  io.MemReg := 0.U
  io.COperation := 0.U
  io.CImmidiate := 0.U

  switch(io.Instruction(17,16)){
    is(0.U){
      io.AOperation := io.Instruction(15,12)
      io.WriteReg := io.Instruction(11,8)
      io.ReadReg1 := io.Instruction(7,4)
      io.ReadReg0 := io.Instruction(3,0)
    }
    is(1.U){
      io.AOperation := io.Instruction(15,12)
      io.AImmidiate := io.Instruction(11,4)
      io.WriteReg := io.Instruction(3,0)
    }
    is(2.U){
      io.MemOp := io.Instruction(15,14)
      io.MemAdress := io.Instruction(13,4)
      io.MemAdress := io.Instruction(3,0)
    }
    is(3.U){
      io.COperation := io.Instruction(15,13)
      io.AImmidiate := io.Instruction(12,8)
      io.ReadReg1 := io.Instruction(7,4)
      io.ReadReg0 := io.Instruction(3,0)
    }
  }
}