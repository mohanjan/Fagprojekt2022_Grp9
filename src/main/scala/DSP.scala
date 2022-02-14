import chisel3._
import chisel3.util._

class DSP(maxCount: Int) extends Module {
  val io = IO(new Bundle {
    val Out = Output(UInt(20.W))

    val SCL = Input(Bool())
    val SDA = Input(Bool())
  })


}
// generate Verilog
object Synth extends App {
  (new chisel3.stage.ChiselStage).emitVerilog(new DSP(200000000))
}

