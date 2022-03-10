import chisel3._
import chisel3.util._

class XADC(maxCount: Int) extends Module {
  val io = IO(new Bundle {
    val LED = Output(UInt(16.W))
    val JA = Output(UInt(8.W))

    val clk = Input(Bool())
    val sw = Input(Bool())
  })

  val daddr_in = Wire(UInt(6.W))
  val eoc_out = Wire(UInt(1.W))
  val do_out = Wire(UInt(16.W))
  val anal_p = Wire(UInt(1.W))
  val anal_n = Wire(UInt(1.W))
  val channel_out = Wire(UInt(5.W))

 

  val adc = Module(new xadc_wiz_0(maxCount))

  adc.io.di_in := 0.U(16.W)
  adc.io.daddr_in := daddr_in
  adc.io.den_in := eoc_out
  adc.io.dwe_in := 0.U
  adc.io.drdy_out <> DontCare
  adc.io.do_out := do_out
  adc.io.dclk_in := io.clk
  adc.io.reset_in := io.sw
  adc.io.vp_in := (0.U)
  adc.io.vn_in := (0.U)
  adc.io.vauxp5 := anal_p
  adc.io.vauxn5 := anal_n
  adc.io.channel_out := channel_out
  adc.io.eoc_out := eoc_out
  adc.io.alarm_out <> DontCare
  adc.io.eos_out <> DontCare
  adc.io.busy_out <> DontCare

  io.JA := 0.U
  daddr_in := 0.U
  eoc_out := 0.U
  do_out := 0.U
  anal_p := 0.U
  anal_n := 0.U
  channel_out := 0.U
  

  daddr_in := Cat("b00".U, channel_out)
  anal_p := io.JA(4)
  anal_n := io.JA(0)
  io.LED := "b1100110011001100".U

  switch(do_out(15, 11)) {
    is(0.U) {
      io.LED := "b0000000000000000".U
    }
    is(1.U) {
      io.LED := "b0000000000000001".U
    }
    is(2.U) {
      io.LED := "b0000000000000011".U
    }
    is(3.U) {
      io.LED := "b0000000000000111".U
    }
    is(4.U) {
      io.LED := "b0000000000001111".U
    }
    is(5.U) {
      io.LED := "b0000000000011111".U
    }
    is(6.U) {
      io.LED := "b0000000000111111".U
    }
    is(7.U) {
      io.LED := "b0000000001111111".U
    }
    is(8.U) {
      io.LED := "b0000000011111111".U
    }
    is(9.U) {
      io.LED := "b0000000111111111".U
    }
    is(10.U) {
      io.LED := "b0000001111111111".U
    }
    is(11.U) {
      io.LED := "b0000011111111111".U
    }
    is(12.U) {
      io.LED := "b0000111111111111".U
    }
    is(13.U) {
      io.LED := "b0001111111111111".U
    }
    is(14.U) {
      io.LED := "b0011111111111111".U
    }
    is(15.U) {
      io.LED := "b0111111111111111".U
    }

  }
}

object XADC extends App {
  (new chisel3.stage.ChiselStage).emitVerilog(new XADC(1))
}


