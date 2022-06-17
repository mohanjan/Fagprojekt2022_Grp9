// støjen bliver skubbet op i høje frekvenser, men det er også de høje frekvenser der bliver dæmpet
//lav et fælles modul det styrer filter ressourcen
import chisel3._
import chisel3.util._

class InController(bufferWidth: Int) extends Module {
  val io = IO(new Bundle {
    val In = Input(UInt(1.W))
    val ADC_D_out = Output(UInt(1.W))
    // val InFIR = Input(SInt(bufferWidth.W))
    // val Out = Output(SInt(bufferWidth.W))
    // val OutFIR = Output(SInt(bufferWidth.W))
    val Sync = Input(UInt(1.W))
    // -----unsigned test-----
    val InFIR = Input(UInt(bufferWidth.W))
    val Out = Output(UInt(bufferWidth.W))
    val OutFIR = Output(UInt(bufferWidth.W))
  })

  val scaler = bufferWidth.U
  val syncIn = WireDefault(0.U(1.W))

  syncIn := io.Sync


  io.ADC_D_out:= io.In

  // serial to parallel buffer
  val inReg = RegInit(0.U(bufferWidth.W))

  // val sample = RegInit(0.S(bufferWidth.W))
  // -----unsigned test-----
  val sample = RegInit(0.U(bufferWidth.W))

  // Counter for decimation
  val cntReg = RegInit(0.U(5.W))
  
  val tick = cntReg === 0.U

  inReg := Cat(io.In, inReg(bufferWidth - 1, 1))

  //-----prescaler register-----
  

  when(syncIn===1.U){
    cntReg := cntReg + 1.U
  }

  when(cntReg === scaler) {
    cntReg := 0.U
  }
  sample := io.InFIR


  // send word to fir
  // io.OutFIR := ~inReg.asSInt + 1.S
  // io.Out := sample

  // -----unsigned test-----
  io.OutFIR := inReg
  io.Out := sample

}
