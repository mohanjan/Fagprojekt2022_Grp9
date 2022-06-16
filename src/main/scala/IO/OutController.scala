// støjen bliver skubbet op i høje frekvenser, men det er også de høje frekvenser der bliver dæmpet
import chisel3._
import chisel3.util._

class OutController(bufferWidth: Int) extends Module {
  val io = IO(new Bundle {
    val In    = Input(SInt(bufferWidth.W))
    val InFIR = Input(SInt(bufferWidth.W)) // input from FIR filter

    val OutFIR = Output(SInt(bufferWidth.W)) // output from interpolator to FIR
    val OutPWM = Output(UInt(1.W))  //

  })

  val scale = bufferWidth.U //shoud be fixed 16 or bufferwidth?
  val ZReg  = RegInit(0.S(bufferWidth.W))
  val Diff  = Wire(SInt(bufferWidth.W))
  val ZIn   = Wire(SInt(bufferWidth.W))
  val DDC   = WireDefault(0.U(bufferWidth.W))

  val cntReg = RegInit(0.U(5.W))
  val cntReg2 = RegInit(0.U(7.W))
  
/*  cntReg2 := cntReg2 + 1.U
  
  when(cntReg2 === 127.U){
    cntReg2 := 0.U
    cntReg := cntReg + 1.U
  }
  */
    cntReg := cntReg + 1.U
  val tick = cntReg === 0.U

  when(cntReg === scale) {
    cntReg := 0.U
  }

  Diff := io.InFIR - DDC.asSInt
  ZIn  := ZReg + Diff
  ZReg := ZIn

  DDC := Mux(io.OutPWM === 1.U, Fill(bufferWidth, 1.U).asUInt, 0.U)
  
  io.OutFIR := Mux(tick, io.In, 0.S)
  io.OutPWM := ~ZReg(bufferWidth - 1)

//shared FIR filter with IN controller

}
