import chisel3._
import chisel3.util._

class IOMaster(bufferWidth: Int) extends Module {
  val io = IO(new Bundle {
    val In_ADC = Input(UInt(1.W))
    val Out_ADC_D = Output(UInt(1.W))
    val Out_DAC = Output(UInt(1.W))
    val Sync = Output(UInt(1.W))

    // val In_DAC = Input(SInt(bufferWidth.W))
    // val Out_ADC = Output(SInt(bufferWidth.W))
    // -----unsigned test-----
    val In_DAC = Input(UInt(bufferWidth.W))
    val Out_ADC = Output(UInt(bufferWidth.W))

  })

  val ADC = Module(new InController(bufferWidth))
  val DAC = Module(new OutController(bufferWidth))
  
  val syncReg = RegInit(0.U(8.W))
  syncReg := syncReg + 1.U
  when(syncReg === 1.U){
    io.Sync := 1.U
  }.otherwise{
    io.Sync := 0.U
  }
  when(syncReg === 16.U){
    syncReg := 0.U
  }
  
  ADC.io.In := io.In_ADC
  io.Out_ADC := ADC.io.Out
  ADC.io.InFIR := ADC.io.OutFIR
  io.Out_ADC_D := ADC.io.ADC_D_out

  DAC.io.In := io.In_DAC
  io.Out_DAC := DAC.io.OutPWM
  DAC.io.InFIR := DAC.io.OutFIR

  ADC.io.Sync := io.Sync
  DAC.io.Sync := io.Sync
}
