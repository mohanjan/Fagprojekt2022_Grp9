import chisel3._
import chisel3.util._

class BranchComp() extends Module {
  val io = IO(new Bundle {
    val rs2 = Input(UInt(18.W))
    val rs1 = Input(UInt(18.W))
    val PC = Input(UInt(18.W))
    val Offset = Input(SInt(11.W))

    val Operation = Input(UInt(2.W))

    val CondCheck = Output(Bool())
    val Out = Output(UInt(18.W))
  })

  val CondCheck = Wire(Bool())

  CondCheck := false.B

  switch(io.Operation){
    is(0.U){
      CondCheck := (io.rs2 === io.rs1)
    }
    is(1.U){
      CondCheck := (io.rs2 =/= io.rs1)
    }
    is(2.U){
      CondCheck := (io.rs2 >= io.rs1)
    }
    is(3.U){
      CondCheck := (io.rs2 > io.rs1)
    }
  }

  when(CondCheck){
    io.Out := (io.PC.asSInt + io.Offset).asUInt
  }.otherwise{
    io.Out := io.PC + 1.U
  }

  io.CondCheck := CondCheck

}
