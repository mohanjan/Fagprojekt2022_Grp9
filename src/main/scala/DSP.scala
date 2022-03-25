import chisel3._
import chisel3.util._

class DSP(maxCount: Int) extends Module {
  val io = IO(new Bundle {
    val In = Input(UInt(16.W))
    val Out = Output(UInt(16.W))

    val SCL = Input(Bool())
    val SDA = Input(Bool())
  })

  val Core = Module(new Core(200000000))

  Core.io.WaveIn := 0.U
  Core.io.MemInAddress := 0.U
  Core.io.MemInData := 0.U
  Core.io.MemWrite := false.B
  Core.io.ProgramLength := 0.U

  io.Out := Core.io.WaveOut

}
// generate Verilog
object Synth extends App {
  (new chisel3.stage.ChiselStage).emitVerilog(new DSP(200000000))
}

