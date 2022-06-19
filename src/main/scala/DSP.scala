import chisel3._
import chisel3.util._
import chisel3.experimental.Analog


class DSP(maxCount: Int) extends Module {
  val io = IO(new Bundle {
    val ADIn  = Input(UInt(1.W))
    val DAOut = Output(UInt(1.W))
    val ADOut = Output(UInt(1.W))
    val SyncOut = Output(UInt(1.W))


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


  val IOC  = Module(new IOMaster(14))

  IOC.io.In_ADC := io.ADIn
  IOC.io.In_DAC := IOC.io.Out_ADC
  io.DAOut      := IOC.io.Out_DAC
  io.ADOut      := IOC.io.Out_ADC_D
  io.SyncOut    := IOC.io.Sync2


  IOC.io.SAD1   := io.SAD1
  IOC.io.SAD2   := io.SAD2
  IOC.io.SAD3   := io.SAD3
  IOC.io.SAD4   := io.SAD4
  IOC.io.SAD5   := io.SAD5
  IOC.io.SAD6   := io.SAD6
  IOC.io.SAD7   := io.SAD7
  IOC.io.SAD8   := io.SAD8

  IOC.io.SDA1   := io.SDA1
  IOC.io.SDA2   := io.SDA2
  IOC.io.SDA3   := io.SDA3
  IOC.io.SDA4   := io.SDA4
  IOC.io.SDA5   := io.SDA5
  IOC.io.SDA6   := io.SDA6
  IOC.io.SDA7   := io.SDA7
  IOC.io.SDA8   := io.SDA8
  

}

// generate Verilog
object DSP extends App {
  (new chisel3.stage.ChiselStage).emitVerilog(new DSP(100000000))
}
