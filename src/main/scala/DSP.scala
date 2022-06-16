import chisel3._
import chisel3.util._
import chisel3.experimental.Analog


class DSP(maxCount: Int) extends Module {
  val io = IO(new Bundle {
    val ADIn  = Input(UInt(1.W))
    val DAOut = Output(UInt(1.W))
    val ADOut = Output(UInt(1.W))
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

  IOC.io.In_ADC := io.ADIn
  //SDSP.io.In     := IOC.io.Out_ADC
  IOC.io.In_DAC := IOC.io.Out_ADC
  //IOC.io.In_DAC := SDSP.io.Out
  io.DAOut        := IOC.io.Out_DAC
  io.ADOut        := IOC.io.Out_ADC_D
  //SDSP.SPI <> SPI

}
// generate Verilog
object DSP extends App {
  (new chisel3.stage.ChiselStage).emitVerilog(new DSP(100000000))
}
