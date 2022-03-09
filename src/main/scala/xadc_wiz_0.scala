import chisel3._

class xadc_wiz_0(maxCount: Int) extends Module {
  val io = IO(new Bundle {
    val di_in = Input(UInt(16.W))
    val daddr_in = Input(UInt(7.W))
    val den_in = Input(UInt(1.W))
    val dwe_in = Input(UInt(1.W))
    val drdy_out  = Input(UInt(1.W))
    val do_out  = Input(UInt(16.W))
    val dclk_in  = Input(Bool())
    val reset_in  = Input(UInt(1.W))
    val vp_in  = Input(UInt(1.W))
    val vn_in  = Input(UInt(1.W))
    val vauxp5 = Input(UInt(1.W))
    val vauxn5  = Input(UInt(1.W))
    val channel_out  = Input(UInt(5.W))
    val eoc_out  = Input(UInt(1.W))
    val alarm_out  = Input(UInt(1.W))
    val eos_out  = Input(UInt(1.W))
    val busy_out  = Input(UInt(1.W))
  })

}
