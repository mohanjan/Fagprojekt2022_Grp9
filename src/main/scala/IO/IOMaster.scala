import chisel3._
import chisel3.util._

class IOMaster(bufferWidth: Int) extends Module {
  val io = IO(new Bundle {
    val In_ADC = Input(UInt(1.W))
    val Out_ADC_D = Output(UInt(1.W))
    val Out_DAC = Output(UInt(1.W))
    val Sync1 = Output(UInt(1.W))
    val Sync2 = Output(UInt(1.W))
    // val In_DAC = Input(SInt(bufferWidth.W))
    // val Out_ADC = Output(SInt(bufferWidth.W))
    // -----unsigned test-----
    val In_DAC = Input(UInt(bufferWidth.W))
    val Out_ADC = Output(UInt(bufferWidth.W))

    val SAD1  = Input(UInt(1.W))
    val SAD2  = Input(UInt(1.W))
    val SAD3  = Input(UInt(1.W))
    val SAD4  = Input(UInt(1.W))
    val SAD5  = Input(UInt(1.W))
    val SAD6  = Input(UInt(1.W))
    val SAD7  = Input(UInt(1.W))
    val SAD8  = Input(UInt(1.W))
    val SDA1  = Input(UInt(1.W))
    val SDA2  = Input(UInt(1.W))
    val SDA3  = Input(UInt(1.W))
    val SDA4  = Input(UInt(1.W))
    val SDA5  = Input(UInt(1.W))
    val SDA6  = Input(UInt(1.W))
    val SDA7  = Input(UInt(1.W))
    val SDA8  = Input(UInt(1.W))

  })

  val ADC = Module(new InController(bufferWidth))
  val DAC = Module(new OutController(bufferWidth))
  val c1  = RegInit(1.U(8.W)) 
  val c2  = RegInit(1.U(8.W))

  c1 := io.SAD1 + (io.SAD2<<1) + (io.SAD3<<2) + (io.SAD4<<3) + (io.SAD5<<4) + (io.SAD6<<5) + (io.SAD7<<6) + (io.SAD8<<7)
  c2 := io.SDA1 + (io.SDA2<<1) + (io.SDA3<<2) + (io.SDA4<<3) + (io.SDA5<<4) + (io.SDA6<<5) + (io.SDA7<<6) + (io.SDA8<<7)

  val syncReg1 = RegInit(0.U(8.W))
  syncReg1 := syncReg1 + 1.U
  when(syncReg1 === 0.U){
    io.Sync1 := 1.U
  }.otherwise{
    io.Sync1 := 0.U
  }
  when(syncReg1 === c1){
    syncReg1 := 0.U
  }

  val syncReg2 = RegInit(0.U(8.W))
  syncReg2 := syncReg2 + 1.U
  when(syncReg2 === 0.U){
    io.Sync2 := 1.U
  }.otherwise{
    io.Sync2 := 0.U
  }
  when(syncReg2 === c2){
    syncReg2 := 0.U
  }
  
  ADC.io.In := io.In_ADC
  io.Out_ADC := ADC.io.Out
  ADC.io.InFIR := ADC.io.OutFIR
  io.Out_ADC_D := ADC.io.ADC_D_out

  DAC.io.In := io.In_DAC
  io.Out_DAC := DAC.io.OutPWM
  DAC.io.InFIR := DAC.io.OutFIR

  ADC.io.Sync := io.Sync1
  DAC.io.Sync := io.Sync2
}
