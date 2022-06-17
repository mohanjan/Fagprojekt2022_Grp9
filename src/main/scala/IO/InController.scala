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
  })

  val scaler = bufferWidth.U
  val delay = RegInit(0.U(1.W))
  delay := io.In
  io.ADC_D_out := delay

  // serial to parallel buffer
  val inReg = RegInit(0.U(bufferWidth.W))
  val sample = RegInit(0x10.S(bufferWidth.W))

  // Counter for decimation
  val cntReg = RegInit(0.U(8.W))
  val cntReg2 = RegInit(0.U(7.W))
  cntReg2 := cntReg2 + 1.U
  when(cntReg2 === 127.U){
    cntReg2 := 0.U
    cntReg := cntReg + 1.U
  }

  // cntReg := cntReg + 1.U
  val tick = cntReg === scaler

  inReg := Cat(io.In, inReg(bufferWidth - 1, 1))
  io.ADC_D_out := inReg

  when(tick) {
    cntReg := 0.U
    sample := io.postFIR
  }

  // send word to fir
  io.preFIR := ~inReg.asSInt + 1.S
  io.Out := sample

  // master will then put filtered value onto io.Out

}
