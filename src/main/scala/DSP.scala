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

  val Core = Module(new Core())
  val FirEngine = Module(new FirEngine())
  val DataMemory = Module(new DataMemory())

  // IO

  io.Out := Core.io.WaveOut
  FirEngine.io.WaveIn := io.In


  // Interconnections

  Core.io.WaveIn := 0.U
  Core.io.Stall := false.B
  Core.io.ProgramLength := 0.U
  Core.io.DataMem <> DataMemory.io.DataMem

  FirEngine.io.Registers <> DataMemory.io.Registers
  FirEngine.io.WaveIn := 0.U

  SPI <> DataMemory.SPI

  DataMemory.io.FIR_ <> FirEngine.io.FIR_

}
// generate Verilog
object DSP extends App {
  (new chisel3.stage.ChiselStage).emitVerilog(new DSP(200000000))
}

