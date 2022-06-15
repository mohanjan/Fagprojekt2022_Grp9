import chisel3._
import chisel3.util._

class XADC() extends Module {
  val io = IO(new Bundle {
    val LED = Output(UInt(16.W))
    val JA = Input(UInt(8.W))
  })


  // internal wires
  val daddr_in = Wire(UInt(6.W))
  val eoc_out = Wire(UInt(1.W))
  val do_out = Wire(UInt(16.W))
  val anal_p = Wire(UInt(1.W))
  val anal_n = Wire(UInt(1.W))
  val channel_out = Wire(UInt(5.W))


  //Counter for generating a 'do a sample' flag
  val cntReg = RegInit(0.U(16.W))
  val tick = cntReg === 0.U

  cntReg := cntReg + 1.U
  when (cntReg === 1.U) {
    cntReg := 0.U
  }


  //instantiation of adc blackbox module and subsequent connection of signals
  val adc = Module(new xadc_wiz_0())

  adc.io.di_in := 0.U(16.W)
  adc.io.daddr_in := daddr_in
  adc.io.den_in := eoc_out
  adc.io.dwe_in := 0.U
  adc.io.drdy_out <> DontCare
  adc.io.dclk_in := clock
  adc.io.reset_in := reset
  adc.io.convst_in := tick
  adc.io.vp_in := (0.U)
  adc.io.vn_in := (0.U)
  adc.io.vauxp5 := anal_p
  adc.io.vauxn5 := anal_n
  adc.io.alarm_out <> DontCare
  adc.io.eos_out <> DontCare
  adc.io.busy_out <> DontCare
  eoc_out := adc.io.eoc_out
  channel_out := adc.io.channel_out
  do_out := adc.io.do_out

  daddr_in := Cat("b00".U, channel_out)
  //connecting the analog nega tive and positive inputs to correct pmod pins
  anal_p := io.JA(4)
  anal_n := io.JA(0)
  //Base led vector val to catch errors
  io.LED := "b1100110011001100".U

  //'lut' for led output depending in analog reading
  switch(do_out(15, 12)) {
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

