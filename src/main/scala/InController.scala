// støjen bliver skubbet op i høje frekvenser, men det er også de høje frekvenser der bliver dæmpet
//lav et fælles modul det styrer filter ressourcen
import chisel3._
import chisel3.util._

class InController(bufferWidth: Int) extends Module {
  val io = IO(new Bundle {
    val In = Input(UInt(1.W))
    val In_FIR = Input(UInt(bufferwidth.W))
    val Clk = Input(Bool())
    val Out = Output(UInt(bufferwidth.W))
    val Out_FIR = Output(UInt(bufferwidth.W))
    val FIRQuery = Output(Bool())
    
  })

  //serial to prallel buffer
  val outReg = RegInit(0.U(bufferWidth.W))
  
  when(io.Clk){outReg := Cat(io.In, outReg(bufferWidth - 1, 1))}
  val sample = outReg

  //Counter for generating a 'do a sample' flag
  val cntReg = RegInit(0.U(3.W))
  val tick = cntReg === 0.U

  when(io.Clk) {cntReg := cntReg + 1.U}

  when (cntReg === bufferWidth.U) {
    cntReg := 0.U
  }

  //send word to fir
  io.FIRquery := tick
  when(tick){
    io.Out_FIR := sample
  }

  //master will then put filtered value onto io.Out

}
// generate Verilog
object Inp extends App {
  (new chisel3.stage.ChiselStage).emitVerilog(new InController(18))
}

