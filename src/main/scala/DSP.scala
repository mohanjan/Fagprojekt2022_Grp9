import chisel3._
import chisel3.util._

class DSP(maxCount: Int) extends Module {
  val io = IO(new Bundle {
    val Out = Output(UInt(16.W))

    val SCL = Input(Bool())
    val SDA = Input(Bool())
  })
  io.Out := 1.U


}
// generate Verilog
object Synth extends App {
  (new chisel3.stage.ChiselStage).emitVerilog(new DSP(200000000))

val adc = Module(new XADC)
adc.INIT_40("h9000".U)
adc.INIT_41("h2ef0".U)
adc.INIT_42("h0400".U)
adc.INIT_48("h4701".U)
adc.INIT_49("h900f".U)
adc.INIT_4A("h0000".U)
adc.INIT_4B("h0000".U)
adc.INIT_4C("h0000".U)
adc.INIT_4D("h0000".U)
adc.INIT_4E("h0000".U)
adc.INIT_4F("h0000".U)
adc.INIT_50("hb5ed".U)
adc.INIT_51("h5999".U)
adc.INIT_52("ha147".U)
adc.INIT_53("h0000".U)
adc.INIT_54("ha93a".U)
adc.INIT_55("h5111".U)
adc.INIT_56("h91eb".U)
adc.INIT_57("hae4e".U)
adc.INIT_58("h5999".U)
adc.STM_MONITOR_FILE ("design.txt")
adc.CONVST (0.U)
adc.CONVSTCLK (0.U)
adc.DADDR (daddr)
adc.DCLK (DCLK)
adc.DEN (den_reg[0])
adc.DI (di_drp)
adc.

}

