import chisel3._
import chisel3.util._

class ALU() extends Module {
  val io = IO(new Bundle {
    val rs1 = Input(UInt(18.W))
    val rs2 = Input(UInt(18.W))

    val Operation = Input(UInt(8.W))
    val Out = Output(UInt(18.W))
  })

  io.Out := 0.U

  switch(io.Operation) {
    is(0.U){
      io.Out := io.rs1 + io.rs2
    }
    is(1.U){
      io.Out := io.rs1 - io.rs2
    }
    is(2.U){
      io.Out := io.rs1 * io.rs2
    }
    is(3.U){
      io.Out := io.rs1 << io.rs2
    }
    is(4.U){
      io.Out := io.rs1 >> io.rs2
    }
    is(5.U){
      io.Out := io.rs1 & io.rs2
    }
    is(6.U){
      io.Out := io.rs1 | io.rs2
    }
    is(7.U){
      io.Out := io.rs1 ^ io.rs2
    }
  }
}
