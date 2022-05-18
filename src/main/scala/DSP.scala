import chisel3._
import chisel3.experimental.Analog
import chisel3.util._

class DSP(maxCount: Int) extends Module {
  val io = IO(new Bundle {
    val In = Input(SInt(16.W))
    val Out = Output(SInt(16.W))
  })
  val SPI = IO(new Bundle{
    val SCLK = Output(Bool())
    val CE = Output(Bool())
    val SO = Input(Vec(4,Bool()))
    val SI = Output(Vec(4,Bool()))
    val Drive = Output(Bool())
  })

  val SubDSP = Module(new SubDSP())

  SubDSP.io.In := io.In.asUInt
  io.Out := SubDSP.io.Out.asSInt

  SubDSP.SPI <> SPI

}
// generate Verilog
object DSP extends App {
  (new chisel3.stage.ChiselStage).emitVerilog(new DSP(100000000))
}

