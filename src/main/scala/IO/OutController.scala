// støjen bliver skubbet op i høje frekvenser, men det er også de høje frekvenser der bliver dæmpet
import chisel3._
import chisel3.util._

class OutController(bufferWidth: Int) extends Module {
  val io = IO(new Bundle {
    val In    = Input(SInt(16.W))
    val InFIR = Input(SInt(16.W)) // input from FIR filter

    val OutFIR = Output(SInt(16.W)) // output from interpolator to FIR
    val OutPWM = Output(UInt(1.W))  //

  })

  val scale = bufferWidth.U //shoud be fixed 16 or bufferwidth?
  val ZReg  = RegInit(0.S(bufferWidth.W))
  val Diff  = Wire(SInt(16.W))
  val ZIn   = Wire(SInt(16.W))
  val DDC   = WireDefault(0.U(bufferWidth.W))

  val cntReg = RegInit(0.U(4.W))
  cntReg := cntReg + 1.U
  val tick = cntReg === 0.U

  when(cntReg === scale) {
    cntReg := 0.U
  }

  Diff := io.InFIR - DDC.asSInt //Mux(io.convReady, io.InFIR - DDC.asSInt, 0.S)
  ZIn  := ZReg + Diff
  ZReg := ZIn

  DDC := Mux(io.OutPWM === 1.U, Fill(bufferWidth, 1.U).asUInt, 0.U)
  
  io.OutFIR := Mux(tick, io.In, 0.S)
  io.OutPWM := ~ZReg(bufferWidth - 1)

}
