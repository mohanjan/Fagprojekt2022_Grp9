import chisel3._
import chisel3.experimental.Analog
import chisel3.util._

class DSP(maxCount: Int) extends Module {
  val io = IO(new Bundle {
    val In = Input(UInt(1.W))
    val Out = Output(UInt(1.W))
  })
  val SPI = IO(new Bundle{
    val SCLK = Output(Bool())
    val CE = Output(Bool())
    val SO = Input(Vec(4,Bool()))
    val SI = Output(Vec(4,Bool()))
    val Drive = Output(Bool())
  })

  val SDSP = Module(new SubDSP())
  val IOC = Module(new IOMaster(16))

  
  io.In := IOC.io.In_ADC
  io.Out := IOC.io.Out_DAC
  SDSP.io.In := IOC.io.Out_ADC
  SDSP.io.Out := IOC.io.In_DAC
  SDSP.SPI <> SPI

}
// generate Verilog
object DSP extends App {
  (new chisel3.stage.ChiselStage).emitVerilog(new DSP(100000000))
}

