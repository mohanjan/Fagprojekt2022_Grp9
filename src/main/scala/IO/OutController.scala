// støjen bliver skubbet op i høje frekvenser, men det er også de høje frekvenser der bliver dæmpet
import chisel3._
import chisel3.util._

class OutController(bufferWidth: Int) extends Module {
  val io = IO(new Bundle {
    val OutPWM = Output(UInt(1.W))
    val Sync = Input(UInt(1.W))

    val In    = Input(SInt(bufferWidth.W))
    val InFIR = Input(SInt(bufferWidth.W)) // input from FIR filter
    val OutFIR = Output(SInt(bufferWidth.W)) // output from interpolator to FIR
    
    // -----unsigned test-----
    // val In    = Input(UInt(bufferWidth.W))
    // val InFIR = Input(UInt(bufferWidth.W)) // input from FIR filter
    // val OutFIR = Output(UInt(bufferWidth.W)) // output from interpolator to FIR
  })
  val scale = bufferWidth.U
  val DDC   = RegInit(0.S(bufferWidth.W))

  // val DDC   = RegInit(0.U(bufferWidth.W))

  io.OutFIR := io.In
  val ZReg  = RegInit(0.S(bufferWidth.W))
  val Diff  = RegInit(0.S(bufferWidth.W))
  val FIRpReg = RegInit(0.S(bufferWidth.W))
  // -----unsigned test-----
  // val ZReg  = RegInit(0.U(bufferWidth.W))
  // val Diff  = RegInit(0.U(bufferWidth.W))
  // val FIRpReg = RegInit(0.U(bufferWidth.W))

  //-----scale registers-----
  val syncIn = WireDefault(0.U(1.W))
  syncIn := io.Sync


  // -----init values
  // Diff      := 0.U
  // io.OutFIR := 0.S
  // io.OutPWM := 0.U
  // FIRpReg := io.InFIR
  // -----timed test-----
  when(syncIn === 1.U){
  // DDC  := Mux(io.OutPWM === 1.U, Fill(bufferWidth, 1.U).asUInt, 0.U)
  // Diff := io.InFIR - DDC.asSInt
  // ZReg := ZReg + Diff
  // io.OutPWM := ZReg(bufferWidth - 1)
  // io.OutFIR := io.In

    FIRpReg := io.InFIR
    Diff := FIRpReg - DDC
    ZReg := ZReg + Diff
    DDC := Mux(io.OutPWM === 1.U, Fill(bufferWidth-1, 1.U).zext, ~(Fill(bufferWidth-1, 1.U).zext))

  // -----unsigned values-----
    // FIRpReg := io.InFIR
    // Diff := FIRpReg - DDC
    // ZReg := ZReg + Diff
    // DDC := Mux(io.OutPWM === 1.U, Fill(bufferWidth, 1.U), 0.U)
  }
  io.OutPWM := ~ZReg(bufferWidth - 1)
  // io.OutPWM := ZReg(bufferWidth-1)

  

  // x3-----unsigned values-----
  // Diff := io.InFIR - DDC
  // DDC := Mux(io.OutPWM === 1.U, Fill(bufferWidth, 1.U), 0.U)

  // x3-----signed values-----
  // DDC := Mux(io.OutPWM === 1.U, Fill(bufferWidth, 1.U).asUInt, 0.U)
  // Diff := io.InFIR - DDC.asSInt
  // ZReg := ZReg + Diff
  // io.OutFIR := io.In 
  // io.OutPWM := ~ZReg(bufferWidth - 1)

  //Diff := io.InFIR - DDC.asSInt
  // ZReg := ZReg + Diff
  // Diff := io.InFIR - DDC

  
  // io.OutFIR := Mux(tick, io.In, 0.S)
  // io.OutFIR := io.In
  

}
