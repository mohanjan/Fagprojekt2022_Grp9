// støjen bliver skubbet op i høje frekvenser, men det er også de høje frekvenser der bliver dæmpet
//lav et fælles modul det styrer filter ressourcen
import chisel3._
import chisel3.util._

class InController(bufferWidth: Int) extends Module {
  val io = IO(new Bundle {
    val In = Input(UInt(1.W))
    val InFIR = Input(SInt(bufferWidth.W))
    val Out = Output(SInt(bufferWidth.W))
    val ADC_D_out = Output(UInt(1.W))
    val OutFIR = Output(SInt(bufferWidth.W))
  })

  val scaler = bufferWidth.U
  val dReg = RegInit(0.U(1.W))
  
  dReg := io.In
  io.ADC_D_out := dReg

  // serial to parallel buffer
  val inReg = RegInit(0.U(bufferWidth.W))
  val sample = RegInit(0.S(bufferWidth.W))

  // Counter for decimation
 
  val cntReg = RegInit(0.U(5.W))
  
  val tick = cntReg === 0.U

  inReg := Cat(io.In, inReg(bufferWidth - 1, 1))
  // inReg := Cat(dReg, inReg(bufferWidth - 1, 1))

  //-----prescaler register-----
  val cntReg2 = RegInit(0.U(8.W))
  cntReg2 := cntReg2 +1.U

  when(cntReg2 === 127.U){
    cntReg2 := 0.U
    cntReg := cntReg + 1.U
  }

  when(cntReg === scaler) {
    cntReg := 0.U
    sample := io.InFIR
  }
  // sample := io.InFIR
  // send word to fir
  io.OutFIR := ~inReg.asSInt + 1.S
  io.Out := sample

  // master will then put filtered value onto io.Out

}
