// støjen bliver skubbet op i høje frekvenser, men det er også de høje frekvenser der bliver dæmpet
import chisel3._
import chisel3.util._

class OutController(bufferWidth: Int) extends Module {
  val io = IO(new Bundle {
    val OutPWM = Output(UInt(1.W))  //
    val Sync = Input(UInt(1.W))

    val In    = Input(SInt(bufferWidth.W))
    val postFIR = Input(SInt(bufferWidth.W)) // input from FIR filter
    val preFIR = Output(SInt(bufferWidth.W)) // output from interpolator to FIR
    // ----- unsigned val-----
    // val In    = Input(UInt(bufferWidth.W))
    // val postFIR = Input(UInt(bufferWidth.W)) // input from FIR filter
    // val preFIR = Output(UInt(bufferWidth.W))

  })
  val syncIn = WireDefault(0.U(1.W))
  val cntReg = RegInit(0.U(5.W))
  val tick = cntReg === 0.U
  val scale = bufferWidth.U

  val pFIRReg = RegInit(0.S(bufferWidth.W))
  // ----- unsigned val-----
  val ZReg  = RegInit(0.U(bufferWidth.W))
  val Diff  = RegInit(0.U(bufferWidth.W))
  val DDC   = RegInit(0.U(bufferWidth.W))



  syncIn := io.Sync
  cntReg := cntReg + 1.U

  io.preFIR := Mux(tick, io.In, 0.S)
  
  // -----synced calculation-----
  when(syncIn === 1.U){
    // cntReg := cntReg + 1.U
        
    Diff := (~io.postFIR.asUInt+1.U) - DDC
    ZReg  := ZReg + Diff
    DDC := Mux(io.OutPWM === 1.U, Fill(bufferWidth, 1.U), 0.U)
    
  }
  io.OutPWM := ZReg(bufferWidth-1)

  when(cntReg === scale) {
    cntReg := 0.U
  }
 

//shared FIR filter with IN controller
 
}
