// støjen bliver skubbet op i høje frekvenser, men det er også de høje frekvenser der bliver dæmpet
import chisel3._
import chisel3.util._

class DSP(maxCount: Int) extends Module {
  val io = IO(new Bundle {
    val In = Input(UInt(16.W))
    val Out = Output(UInt(16.W))

    val SCL = Input(Bool())
    val SDA = Input(Bool())
  })

 
}
// generate Verilog
object Synth extends App {
  (new chisel3.stage.ChiselStage).emitVerilog(new DSP(200000000))
}

