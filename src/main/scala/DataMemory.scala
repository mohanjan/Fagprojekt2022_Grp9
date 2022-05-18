import chisel3._
import chisel3.util._
import chisel3.experimental.Analog
import chisel3.util.experimental.loadMemoryFromFile

class DataMemory(Memports: Int) extends Module {
  val io = IO(new Bundle {
    val MemPort = Vec(Memports,Flipped(new MemPort))
    val Registers = new MemPort
  })
  val SPI = IO(new Bundle{
    val SCLK = Output(Bool())
    val CE = Output(Bool())
    val SO = Input(Vec(4,Bool()))
    val SI = Output(Vec(4,Bool()))
    val Drive = Output(Bool())
  })

  // Module Definitions

  val Memory = SyncReadMem(2048, UInt(18.W))
  val ExternalMemory = Module(new MemoryController(1))

  // Defaults

  io.Registers.Address := 0.U
  io.Registers.WriteData := 0.U
  io.Registers.Enable := false.B
  io.Registers.WriteEn := false.B

  for(i <- 0 until Memports){
    io.MemPort(i).ReadData := 0.U
    io.MemPort(i).Completed := false.B
  }

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

  // Address space partition

  when(io.MemPort(Producer).Enable){
    when(io.MemPort(Producer).Address <= 2047.U){ // Internal data memory
      val ReadWritePort = Memory(io.MemPort(Producer).Address)
      io.MemPort(Producer).Completed := true.B

      when(io.MemPort(Producer).WriteEn){
        ReadWritePort := io.MemPort(Producer).WriteData
      }.otherwise{
        io.MemPort(Producer).ReadData := ReadWritePort
      }
    }.elsewhen(io.MemPort(Producer).Address <= 2175.U){ // Fir Registers
      io.Registers.Address := (io.MemPort(Producer).Address - 2175.U)(5,0)
      io.Registers.WriteEn := true.B
      io.MemPort(Producer).Completed := true.B

      when(io.MemPort(Producer).WriteEn){
        io.Registers.WriteData := io.MemPort(Producer).WriteData
      }.otherwise{
        io.MemPort(Producer).ReadData := io.Registers.ReadData
      }
    }.otherwise{ // External Memory
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
}
