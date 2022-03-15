import chisel3._
import chisel3.util._

class BranchComp(maxCount: Int) extends Module {
  val io = IO(new Bundle {
    val rs2 = Input(UInt(16.W))
    val rs1 = Input(UInt(16.W))
    val PC = Input(UInt(16.W))
    val Offset = Input(UInt(11.W))

    val Operation = Input(UInt(2.W))

    val Out = Output(UInt(16.W))
  })

  val OutputReg = RegInit(0.U(18.W))
  val CondCheck = Wire(Bool())

  CondCheck := false.B

  io.Out := OutputReg

  switch(io.Operation){
    is(0.U){
      CondCheck := io.rs2 > io.rs1
    }
    is(1.U){
      CondCheck := io.rs2 >= io.rs1
    }
    is(2.U){
      CondCheck := io.rs2 === io.rs1
    }
    is(3.U){
      CondCheck := io.rs2 =/= io.rs1
    }
  }

  when(CondCheck){
    OutputReg := (io.PC.zext + io.Offset.asSInt).asUInt(15,0)
  }.otherwise{
    OutputReg := io.PC + 1.U
  }

}
