// støjen bliver skubbet op i høje frekvenser, men det er også de høje frekvenser der bliver dæmpet
//lav et fælles modul det styrer filter ressourcen
import chisel3._
import chisel3.util._

class InController(bufferWidth: Int) extends Module {
  val io = IO(new Bundle {
    val In = Input(UInt(1.W))
    val postFIR = Input(SInt(bufferWidth.W))
    val Out = Output(SInt(bufferWidth.W))
    val ADC_D_out = Output(UInt(1.W))
    val preFIR = Output(SInt(bufferWidth.W))
    val Sync = Input(UInt(1.W))
  })
  val syncIn = WireDefault(0.U(1.W))
  syncIn := io.Sync
  val scaler = bufferWidth.U
  val delay = RegInit(0.U(1.W))
  io.ADC_D_out := delay

  // serial to parallel buffer
  val inReg = RegInit(0.U(bufferWidth.W))
  val sample = RegInit(0.S(bufferWidth.W))

  // Counter for decimation
  val cntReg = RegInit(0.U(5.W))
  val tick = cntReg === scaler
  //-----hold registers-----
 
  val FIRReg = RegInit(0.U(bufferWidth.W))
  val OutReg = RegInit(0.U(bufferWidth.W))
  

  // ----- synchronized calculations -----
   when(syncIn === 1.U){
    cntReg := cntReg + 1.U
    inReg := Cat(io.In, inReg(bufferWidth - 1, 1))
    // io.ADC_D_out:= inReg(bufferWidth - 1)
    delay := inReg(bufferWidth - 1)
    
  }

  when(tick) {
    cntReg := 0.U
    sample := io.postFIR
  }

  // inReg := Cat(inReg(bufferWidth - 2, 0), io.In)
  // io.ADC_D_out := inReg

  // send word to fir
  io.preFIR := inReg.asSInt
  io.Out := sample

  // master will then put filtered value onto io.Out

}
