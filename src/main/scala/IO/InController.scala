// støjen bliver skubbet op i høje frekvenser, men det er også de høje frekvenser der bliver dæmpet
//lav et fælles modul det styrer filter ressourcen
import chisel3._
import chisel3.util._

class InController(bufferWidth: Int) extends Module {
  val io = IO(new Bundle {
    val In = Input(UInt(1.W))
    val ADC_D_out = Output(UInt(1.W))
    val Sync = Input(UInt(1.W))

    val InFIR = Input(SInt(bufferWidth.W))
    val Out = Output(SInt(bufferWidth.W))
    val OutFIR = Output(SInt(bufferWidth.W))
    // -----unsigned test-----
    // val InFIR = Input(UInt(bufferWidth.W))
    // val Out = Output(UInt(bufferWidth.W))
    // val OutFIR = Output(UInt(bufferWidth.W))
  })

  val scaler = bufferWidth.U
  val syncIn = WireDefault(0.U(1.W))

  //-----hold registers-----
  val ADCDReg = RegInit(0.U(1.W))
  val FIRReg = RegInit(0.S(bufferWidth.W))
  val OutReg = RegInit(0.S(bufferWidth.W))

  // val FIRReg = RegInit(0.U(bufferWidth.W))
  // val OutReg = RegInit(0.U(bufferWidth.W))

  syncIn := io.Sync

  io.ADC_D_out := ADCDReg
  io.OutFIR := FIRReg
  io.Out := OutReg

  // serial to parallel buffer
  
  val inReg = RegInit(0.U(bufferWidth.W))

  val sample = RegInit(0.S(bufferWidth.W))
  // -----unsigned test-----
  // val sample = RegInit(0.U(bufferWidth.W))

  // Counter for decimation
  val cntReg = RegInit(0.U(5.W))
  val tick = cntReg === 0.U


  when(syncIn === 1.U){
    cntReg := cntReg + 1.U
    inReg := Cat(ADCDReg, inReg(bufferWidth - 1, 1))
    // io.ADC_D_out:= inReg(bufferWidth - 1)
    ADCDReg := io.In
  }

  when(cntReg === scaler) {
    cntReg := 0.U
    OutReg := sample
    sample := io.InFIR
    // io.OutFIR := inReg
    // io.Out := sample
    FIRReg := inReg(bufferWidth-1,1).zext
    
  }
  


  // send word to fir
  // io.OutFIR := ~inReg.asSInt + 1.S
  // io.Out := sample

  // -----unsigned test-----
  // io.OutFIR := inReg
  // io.Out := sample

}
