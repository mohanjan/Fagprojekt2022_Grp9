// støjen bliver skubbet op i høje frekvenser, men det er også de høje frekvenser der bliver dæmpet
//lav et fælles modul det styrer filter ressourcen
import chisel3._
import chisel3.util._

class InController(bufferWidth: Int) extends Module {
  val io = IO(new Bundle {
    val In      = Input(UInt(1.W))
    val In_FIR  = Input(UInt(bufferWidth.W))
    val Out     = Output(UInt(bufferWidth.W))
    val Out_FIR = Output(UInt(bufferWidth.W))
  })

  val scale = 4.U

  // serial to parallel buffer
  val outReg = RegInit(0.U(bufferWidth.W))
  val sample = RegInit(0.U(bufferWidth.W))

  // Counter for generating a 'do a sample' flag
  val cntReg = RegInit(0.U(3.W))
  cntReg := cntReg + 1.U
  val tick = cntReg === 0.U

  outReg := Cat(io.In, outReg(bufferWidth - 1, 1))
  when(cntReg === scale) {
    cntReg := 0.U

    sample := outReg

  }

  // send word to fir
  io.Out_FIR := Mux(tick, outReg, sample)
  io.Out     := io.In_FIR

  // master will then put filtered value onto io.Out

}
