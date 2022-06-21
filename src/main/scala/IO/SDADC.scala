// støjen bliver skubbet op i høje frekvenser, men det er også de høje frekvenser der bliver dæmpet
//lav et fælles modul det styrer filter ressourcen
import chisel3._
import chisel3.util._

class SDADC(bufferWidth: Int, Count: Int) extends Module {
  val io = IO(new Bundle {
    val In = Input(UInt(1.W))
    val ADC_D_out = Output(UInt(1.W))
    val Out = Output(SInt(bufferWidth.W))
  })

  val scaler = bufferWidth.U
  val cntReg = RegInit(0.U(5.W))
  val tick = cntReg === 0.U
  val Clockdiv = RegInit(0.U(8.W))
  Clockdiv := Clockdiv + 1.U

  //-----hold registers-----
  val ADCDReg = RegInit(0.U(1.W))
  val OutReg = RegInit(0.S(bufferWidth.W))

  io.ADC_D_out := ADCDReg
  io.Out := OutReg

  // serial to parallel buffer
  
  val inReg = RegInit(0.U(bufferWidth.W))
  val sample = RegInit(0.S(bufferWidth.W))

  when(Clockdiv === Count.U){
    cntReg := cntReg + 1.U
    inReg := Cat(ADCDReg, inReg(bufferWidth - 1, 1))
    ADCDReg := io.In

    // sample := io.InFIR
    // OutReg := sample
    // FIRReg := inReg
  }

  // -----decimation-----
  when(cntReg === scaler) {
    cntReg := 0.U
    OutReg := sample
    sample := ~inReg.asSInt +1.S

    // FIRReg := inReg

    // io.OutFIR := inReg
    // io.Out := sample
  }
  


  // send word to fir
  // io.OutFIR := ~inReg.asSInt + 1.S
  // io.Out := sample


}
