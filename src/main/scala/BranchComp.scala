import chisel3._
import chisel3.util._

class BranchComp(maxCount: Int) extends Module {
  val io = IO(new Bundle {
    val Read1 = Input(UInt(16.W))
    val Read0 = Input(UInt(16.W))
    val Operation = Input(UInt(3.W))

    val Out = Output(Bool())
  })

  io.Out := false.B

  switch(io.Operation(2,0)){
    is(0.U){
      io.Out := io.Read1 > io.Read0
    }
    is(1.U){
      io.Out := io.Read1 >= io.Read0
    }
    is(2.U){
      io.Out := io.Read1 === io.Read0
    }
    is(3.U){
      io.Out := false.B
    }
  }
}
