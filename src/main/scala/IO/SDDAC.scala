import chisel3._
import chisel3.util._

class SDDAC(bufferWidth: Int, Count: Int) extends Module {
  val io = IO(new Bundle {
    // val In    = Input(SInt(bufferWidth.W))
    val In    = Input(UInt(bufferWidth.W))
    val OutPDM = Output(UInt(1.W))
    // val Sync = Input(UInt(1.W))

 
  })
  
  val Clockdiv = RegInit(0.U(8.W))
  
  Clockdiv := Clockdiv + 1.U

  val ZReg  = RegInit(0.U(bufferWidth.W))
  val Diff  = RegInit(0.U(bufferWidth.W))
  val FIRpReg = RegInit(0.U(bufferWidth.W))
  val DDC   = RegInit(0.U(bufferWidth.W))

  when(Clockdiv === Count.U){
    Clockdiv := 0.U
    // Diff := (~io.In.asUInt+1.U) - DDC
    // -----case that input is unsigned-----
    Diff := io.In - DDC
    ZReg := ZReg + Diff
    DDC := Mux(io.OutPDM === 1.U, Fill(bufferWidth, 1.U), 0.U)

  }
  io.OutPDM := ZReg(bufferWidth-1)

  

}
