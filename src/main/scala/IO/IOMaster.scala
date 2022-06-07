// støjen bliver skubbet op i høje frekvenser, men det er også de høje frekvenser der bliver dæmpet
//lav et fælles modul det styrer filter ressourcen
import chisel3._
import chisel3.util._

class IOMaster(bufferWidth: Int) extends Module {
  val io = IO(new Bundle {
    val In_ADC  = Input(UInt(1.W))
    val In_DAC  = Input(UInt(16.W))
    val Out_ADC = Output(UInt(16.W))
    val Out_DAC = Output(UInt(1.W))
  })

  val ADC = Module(new InController(bufferWidth))
  val DAC = Module(new OutController(bufferWidth))

  // val Filter = Module(new FirEngine(bufferWidth))


  ADC.io.In := io.In_ADC
  ADC.io.In_FIR := ADC.io.Out_FIR
  io.Out_ADC := ADC.io.Out


  DAC.io.In := io.In_DAC
  DAC.io.InFIR := DAC.io.OutFIR
  io.Out_DAC := DAC.io.OutPWM
  // ADC.io.FIRQuery := true.B

  /*when(conversionReady){
    læs værdi fra out mem
    input ny værdi til hukommelse
    (enable, adresse til sendt værdi)
  }
   */

}
