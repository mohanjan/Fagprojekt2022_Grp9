import chisel3._
import chisel3.experimental.Analog
import chisel3.util._

class DSP(maxCount: Int) extends Module {
  val io = IO(new Bundle {
    val In = Input(UInt(16.W))
    val Out = Output(UInt(16.W))
  })
  val SPI = IO(new Bundle{
    val SCLK = Output(Bool())
    val CE = Output(Bool())
    val SO = Input(Vec(4,Bool()))
    val SI = Output(Vec(4,Bool()))
    val Drive = Output(Bool())
  })

  // Single Core

  val Core = Module(new Core(200000000))

  // Interconnections

  Core.io.WaveIn := 0.U
  Core.io.MemInAddress := 0.U
  Core.io.MemInData := 0.U
  Core.io.MemWrite := false.B
  Core.io.ProgramLength := 0.U
  Core.SPI <> SPI

  io.Out := Core.io.WaveOut

}
// generate Verilog
object Synth extends App {
  (new chisel3.stage.ChiselStage).emitVerilog(new DSP(200000000))
}

