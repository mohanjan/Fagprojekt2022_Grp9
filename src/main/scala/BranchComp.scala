import chisel3._
import chisel3.util._

class BranchComp(maxCount: Int) extends Module {
  val io = IO(new Bundle {
    val rs2 = Input(UInt(16.W))
    val rs1 = Input(UInt(16.W))
    val Operation = Input(UInt(2.W))

    val Out = Output(Bool())
  })

  io.Out := false.B

  switch(io.Operation){
    is(0.U){
      io.Out := io.rs2 > io.rs1
    }
    is(1.U){
      io.Out := io.rs2 >= io.rs1
    }
    is(2.U){
      io.Out := io.rs2 === io.rs1
    }
    is(3.U){
      io.Out := io.rs2 =/= io.rs1
    }
  }
}
