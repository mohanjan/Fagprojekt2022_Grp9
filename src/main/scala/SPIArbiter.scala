import chisel3._
import chisel3.util._
import chisel3.experimental.Analog
import chisel3.util.experimental.loadMemoryFromFile

class SPIArbiter(Memports: Int) extends Module {
  val io = IO(new Bundle {
    val MemPort = Vec(Memports,Flipped(new MemPort))
  })
  val SPI = IO(new Bundle{
    val SCLK = Output(Bool())
    val CE = Output(Bool())
    val SO = Input(Vec(4,Bool()))
    val SI = Output(Vec(4,Bool()))
    val Drive = Output(Bool())
  })

  // Defaults

  for(i <- 0 until Memports){
    io.MemPort(i).ReadData := 0.U
    io.MemPort(i).Completed := false.B
  }

  val ExternalMemory = Module(new MemoryController(0))

  ExternalMemory.io.WriteData := 0.U
  ExternalMemory.io.ReadEnable := false.B
  ExternalMemory.io.WriteEnable := false.B
  ExternalMemory.io.Address := 0.U
  ExternalMemory.SPI <> SPI





  val Producer = Wire(UInt(2.W))
  val ProducerReg = RegInit(0.U(2.W))
  val Taken = RegInit(0.U(1.W))

  Producer := ProducerReg

  for(i <- 0 until Memports){
    when(!Taken.asBool && io.MemPort(i).Enable){
      Taken := true.B
      Producer := i.U
      ProducerReg := i.U
    }
  }

  when(io.MemPort(Producer).Completed === true.B){
    Taken := 0.U
  }

  when(io.MemPort(Producer).Enable){
    ExternalMemory.io.Address := io.MemPort(Producer).Address

    when(io.MemPort(Producer).WriteEn){
      when(ExternalMemory.io.Ready){
        ExternalMemory.io.WriteEnable := true.B
        ExternalMemory.io.WriteData := io.MemPort(Producer).WriteData
    }

      io.MemPort(Producer).Completed := ExternalMemory.io.Completed
    }.otherwise{
      when(ExternalMemory.io.Ready){
        ExternalMemory.io.ReadEnable := true.B
    }

      io.MemPort(Producer).Completed := ExternalMemory.io.Completed
      io.MemPort(Producer).ReadData := ExternalMemory.io.ReadData
      
    }
  }
}