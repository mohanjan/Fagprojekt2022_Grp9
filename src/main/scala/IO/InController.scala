// støjen bliver skubbet op i høje frekvenser, men det er også de høje frekvenser der bliver dæmpet
//lav et fælles modul det styrer filter ressourcen
import chisel3._
import chisel3.util._

class InController(bufferWidth: Int) extends Module {
  val io = IO(new Bundle {
    val In = Input(UInt(1.W))
    val InFIR = Input(SInt(bufferWidth.W))
    val Out = Output(SInt(bufferWidth.W))
    val OutFIR = Output(SInt(bufferWidth.W))
  })

  val scaler = 4.U

  // serial to parallel buffer
  val outReg = RegInit(0.U(bufferWidth.W))
  val sample= RegInit(0.S(bufferWidth.W))

  // Counter for generating a 'do a sample' flag
  val cntReg = RegInit(0.U(3.W))
  cntReg := cntReg + 1.U
  val tick = cntReg === 0.U

  outReg := Cat(io.In, outReg(bufferWidth - 1, 1))
  when(cntReg === scaler) {
    cntReg := 0.U

    sample := ~outReg.asSInt + 1.S

  }

  // send word to fir
  io.OutFIR := sample
  io.Out := io.InFIR

  // master will then put filtered value onto io.Out

}
