import chisel3._
import chisel3.util._

class InstuctionDecoder(maxCount: Int) extends Module {
  val io = IO(new Bundle {
    val Instruction = Input(UInt(18.W))

    //val Type = Input(UInt(2.W))
    val rs1 = Output(UInt(4.W))
    val rs2 = Output(UInt(4.W))

    val rd = Output(UInt(4.W))

    val AImmidiate = Output(UInt(10.W))
    val AOperation = Output(UInt(4.W))

    val MemOp = Output(UInt(2.W))
    val MemAdress = Output(UInt(10.W))

    val COperation = Output(UInt(2.W))
    val Offset = Output(UInt(6.W))
  })

  //io.Type := io.Instruction(17,16)
  io.rs1 := 0.U
  io.rs2 := 0.U
  io.rd := 0.U
  io.AImmidiate := 0.U
  io.AOperation := 0.U
  io.MemOp := 0.U
  io.MemAdress := 0.U
  io.COperation := 0.U
  io.Offset := 0.U

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
    }
    is(2.U){
      io.MemOp := io.Instruction(15,14)
      io.rd := io.Instruction(13,10)
      io.MemAdress := io.Instruction(9,0)
    }
    is(3.U){
      io.COperation := io.Instruction(15,14)
      io.rs1 := io.Instruction(13,10)
      io.rs2 := io.Instruction(9,6)
      io.AImmidiate := io.Instruction(5,0)
    }
  }
}