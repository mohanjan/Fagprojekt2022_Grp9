// støjen bliver skubbet op i høje frekvenser, men det er også de høje frekvenser der bliver dæmpet
import chisel3._
import chisel3.util._

class OutController(bufferWidth: Int) extends Module {
  val io = IO(new Bundle {
    val In    = Input(SInt(bufferWidth.W))
    val postFIR = Input(SInt(bufferWidth.W)) // input from FIR filter

    val preFIR = Output(SInt(bufferWidth.W)) // output from interpolator to FIR
    val OutPWM = Output(UInt(1.W))  //
    val Sync = Input(UInt(1.W))
  })
  val syncIn = WireDefault(0.U(1.W))
  syncIn := io.Sync

  val scale = bufferWidth.U //shoud be fixed 16 or bufferwidth?
  val ZReg  = RegInit(0.S(bufferWidth.W))
  val Diff  = RegInit(0.S(bufferWidth.W))
  val DDC   = RegInit(0.S(bufferWidth.W))
  val cntReg = RegInit(0.U(5.W))
  val tick = cntReg === 0.U

  // val DiffReg = RegInit((bufferWidth.W))
  val PDMReg = RegInit(0.U(1.W))
  val pFIRReg = RegInit(0.S(bufferWidth.W))
  val FIRpReg = RegInit(0.S(bufferWidth.W))
  cntReg := cntReg + 1.U
  io.preFIR := pFIRReg
  
  io.preFIR := Mux(tick, io.In, 0.S)
  
  // -----synced calculation-----
  when(syncIn === 1.U){
    // cntReg := cntReg + 1.U
    FIRpReg := io.postFIR
    //bitshift DDC
    Diff := FIRpReg - DDC
    ZReg  := ZReg + Diff
    DDC := Mux(io.OutPWM === 1.U, Fill(bufferWidth-1, 1.U).zext, ~(Fill(bufferWidth-1, 1.U).zext))
    PDMReg := ~ZReg(bufferWidth - 1)
  }
  io.OutPWM := PDMReg

  when(cntReg === scale) {
    cntReg := 0.U
  }
 

//shared FIR filter with IN controller
 
}
