import chisel3._
import chisel3.util._
import chisel3.experimental.Analog


class DSP(maxCount: Int) extends Module {
  val io = IO(new Bundle {
    val ADIn  = Input(UInt(1.W))
    val DAOut = Output(UInt(1.W))
    val ADOut = Output(UInt(1.W))
    val SyncOut = Output(UInt(1.W))
  })

  val IOC  = Module(new IOMaster(18))

  IOC.io.In_ADC := io.ADIn
  IOC.io.In_DAC := IOC.io.Out_ADC
  io.DAOut      := IOC.io.Out_DAC
  io.ADOut      := IOC.io.Out_ADC_D
  io.SyncOut    := IOC.io.Sync
}

// generate Verilog
object DSP extends App {
  (new chisel3.stage.ChiselStage).emitVerilog(new DSP(100000000))
}
