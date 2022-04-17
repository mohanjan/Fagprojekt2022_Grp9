import chisel3._
import chisel3.util._

class InstuctionDecoder(maxCount: Int) extends Module {
  val io = IO(new Bundle {
    val Instruction = Input(UInt(18.W))

    val Type = Output(UInt(2.W))
    val rs1 = Output(UInt(4.W))
    val rs2 = Output(UInt(4.W))

    val rd = Output(UInt(4.W))

    val AImmidiate = Output(UInt(11.W))
    val ASImmidiate = Output(SInt(11.W))

    val AOperation = Output(UInt(4.W))

    val MemOp = Output(UInt(2.W))
    val MemAdress = Output(UInt(11.W))

    val COperation = Output(UInt(2.W))
    val COffset = Output(SInt(6.W))
  })

  io.Type := io.Instruction(17,16)
  io.rs1 := 0.U
  io.rs2 := 0.U
  io.rd := 0.U
  io.AImmidiate := 0.U
  io.ASImmidiate := 0.S
  io.AOperation := 0.U
  io.MemOp := 0.U
  io.MemAdress := 0.U
  io.COperation := 0.U
  io.COffset := 0.S

  switch(io.Instruction(17,16)){
    is(0.U){
      io.AOperation := io.Instruction(15,12)
      io.rd := io.Instruction(11,8)
      io.rs1 := io.Instruction(7,4)
      io.rs2 := io.Instruction(3,0)
    }
    is(1.U){
      io.AOperation := io.Instruction(15,14)
      io.rd := io.Instruction(13,10)
      io.AImmidiate := io.Instruction(9,0)
      io.ASImmidiate := io.Instruction(9,0).asSInt
    }
    is(2.U){
      io.MemOp := io.Instruction(15)
      io.rd := io.Instruction(14,11)
      io.MemAdress := io.Instruction(10,0)
    }
    is(3.U){
      io.COperation := io.Instruction(15,14)
      io.rs1 := io.Instruction(13,10)
      io.rs2 := io.Instruction(9,6)
      io.COffset := io.Instruction(5,0).asSInt
    }
  }
}