// støjen bliver skubbet op i høje frekvenser, men det er også de høje frekvenser der bliver dæmpet
//lav et fælles modul det styrer filter ressourcen
import chisel3._
import chisel3.util._

class IOMaster(bufferWidth: Int) extends Module {
  val io = IO(new Bundle {
    val In_ADC = Input(UInt(1.W))
    val FIn_ADC = Input(UInt(16.W))
    val In_DAC = Input(UInt(16.W))
    val Clk = Input(Bool())
    val Out_ADC = Output(UInt(16.W))
    val FOut_ADC = Output(UInt(16.W))
    val Out_DAC = Output(UInt(1.W))
    
  })

    val Input = Module(new InController(bufferWidth))
    val Output = Module(new OutController(bufferWidth))
    //val Filter = Module(new FirEngine(bufferWidth))

    val w = Wire(UInt(1.W))
    w := io.In_ADC
    Input.io.In := w
    Input.io.Out :=  io.Out_ADC
    Input.io.Out_FIR := io.FOut_ADC
    Input.io.In_FIR := io.FIn_ADC
    Input.io.Clk := io.Clk
    Input.io.FIRQuery := true.B

    io.FIn_adc := io.FOut_ADC
    
  /*when(conversionReady){
    læs værdi fra out mem
    input ny værdi til hukommelse
    (enable, adresse til sendt værdi)
  }
*/

}

