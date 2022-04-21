// støjen bliver skubbet op i høje frekvenser, men det er også de høje frekvenser der bliver dæmpet
//lav et fælles modul det styrer filter ressourcen
import chisel3._
import chisel3.util._

class InController(bufferWidth: Int) extends Module {
  val io = IO(new Bundle {
    val In_ADC = Input(UInt(1.W))
    val In_DAC = Input(UInt(16.W))
    val Clk = Input(Bool())
    val Out_ADC = Output(UInt(16.W))
    val Out_DAC = Output(UInt(1.W))
    
  })


  //send word to fir
  //FIRquery := tick
  when(conversionReady){
    læs værdi fra out mem
    input ny værdi til hukommelse
    (enable, adresse til sendt værdi)
  }


}
// generate Verilog
object Inp extends App {
  (new chisel3.stage.ChiselStage).emitVerilog(new InController(18))
}

