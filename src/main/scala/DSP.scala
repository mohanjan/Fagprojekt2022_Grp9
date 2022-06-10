import chisel3._
import chisel3.experimental.Analog
import chisel3.util._

class DSP(maxCount: Int) extends Module {
  val io = IO(new Bundle {
    val In  = Input(UInt(1.W))
    val Out = Output(UInt(1.W))
  })
 /* val SPI = IO(new Bundle {
    val SCLK  = Output(Bool())
    val CE    = Output(Bool())
    val SO    = Input(Vec(4, Bool()))
    val SI    = Output(Vec(4, Bool()))
    val Drive = Output(Bool())
  })*/

  //val SDSP = Module(new SubDSP())
  val IOC  = Module(new IOMaster(18))

  IOC.io.In_ADC := io.In
  //SDSP.io.In     := IOC.io.Out_ADC
  IOC.io.In_DAC := IOC.io.Out_ADC
  //IOC.io.In_DAC := SDSP.io.Out
  io.Out        := IOC.io.Out_DAC

  //SDSP.SPI <> SPI

}
// generate Verilog
object DSP extends App {
  (new chisel3.stage.ChiselStage).emitVerilog(new DSP(100000000))
}
