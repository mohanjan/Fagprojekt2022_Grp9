import chisel3._
import chisel3.util._

class ALU(maxCount: Int) extends Module {
  val io = IO(new Bundle {
    val rs1 = Input(UInt(18.W))
    val rs2 = Input(UInt(18.W))

    val Operation = Input(UInt(8.W))
    val Out = Output(UInt(18.W))
  })

  val OutputReg = RegInit(0.U(18.W))

  io.Out := OutputReg

  switch(io.Operation){
    is(0.U){
      OutputReg := io.rs1 + io.rs2
    }
    is(1.U){
      OutputReg := io.rs1 - io.rs2
    }
    is(2.U){
      OutputReg := io.rs1 * io.rs2
    }
    is(3.U){
      OutputReg := io.rs1 << io.rs2
    }
    is(4.U){
      OutputReg := io.rs1 >> io.rs2
    }
  }



}
