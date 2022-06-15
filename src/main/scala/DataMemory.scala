import chisel3._
import chisel3.util._
import chisel3.experimental.Analog
import chisel3.util.experimental.loadMemoryFromFile

class DataMemory(Memports: Int, Memsize: Int, SPIRAM_Offset: Int) extends Module {
  val io = IO(new Bundle {
    val MemPort = Vec(Memports,Flipped(new MemPort))
    val Registers = new MemPort
    val SPIMemPort = new MemPort
  })


  // Module Definitions

  val Memory = SyncReadMem(Memsize, UInt(18.W))

  // Defaults

  

  io.Registers.Address := 0.U
  io.Registers.WriteData := 0.U
  io.Registers.Enable := false.B
  io.Registers.WriteEn := false.B

  

  val CompleteDelayInternal = RegInit(0.U(1.W))
  val CompleteDelayRegister = RegInit(0.U(1.W))
  //val CompleteDelayExternal = RegInit(0.U(1.W))

  
  for(i <- 0 until Memports){
    io.MemPort(i).ReadData := 0.U
    io.MemPort(i).Completed := false.B
  }

  io.SPIMemPort.Enable := false.B
  io.SPIMemPort.Address := 0.U
  io.SPIMemPort.WriteData := 0.U
  io.SPIMemPort.WriteEn := false.B

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

  when(CompleteDelayInternal.asBool || CompleteDelayRegister.asBool){
    CompleteDelayInternal := false.B
    CompleteDelayInternal := false.B
    Taken := 0.U
  }

  // Address space partition

  when(io.MemPort(Producer).Enable){
    when(io.MemPort(Producer).Address <= 2047.U || CompleteDelayInternal.asBool){ // Internal data memory

      /*

      val ReadWritePort = Memory(io.MemPort(Producer).Address)
      io.MemPort(Producer).Completed := true.B

      when(io.MemPort(Producer).WriteEn){
        ReadWritePort := io.MemPort(Producer).WriteData
      }.otherwise{
        io.MemPort(Producer).ReadData := ReadWritePort
        io.MemPort(Producer).Completed
        CompleteDelayInternal := true.B
      }

      */

      

      io.MemPort(Producer).Completed := true.B

      when(io.MemPort(Producer).WriteEn){
        Memory.write(io.MemPort(Producer).Address, io.MemPort(Producer).WriteData)
      }.otherwise{
        io.MemPort(Producer).ReadData := Memory.read(io.MemPort(Producer).Address, true.B)
        io.MemPort(Producer).Completed
        CompleteDelayInternal := true.B
      }

      

      /*

      io.MemPort(Producer).Completed := true.B

      when(io.MemPort(Producer).WriteEn){
        Memory(io.MemPort(Producer).Address):= io.MemPort(Producer).WriteData
      }.otherwise{
        io.MemPort(Producer).ReadData := Memory(io.MemPort(Producer).Address)
      }

      */

    

    }.elsewhen(io.MemPort(Producer).Address <= 2175.U){ // FIR Registers

      io.Registers.Address := (io.MemPort(Producer).Address - 2175.U)(5,0)
      io.Registers.WriteEn := true.B
      io.MemPort(Producer).Completed := true.B

      when(io.MemPort(Producer).WriteEn){
        io.Registers.WriteData := io.MemPort(Producer).WriteData
      }.otherwise{
        io.MemPort(Producer).ReadData := io.Registers.ReadData
      } 

    }.otherwise{ // External Memory

      io.MemPort(Producer).ReadData := io.SPIMemPort.ReadData
      io.MemPort(Producer).Completed := io.SPIMemPort.Completed

      io.SPIMemPort.Address := io.MemPort(Producer).Address + SPIRAM_Offset.U
      io.SPIMemPort.WriteData := io.MemPort(Producer).WriteData
      io.SPIMemPort.Enable := io.MemPort(Producer).Enable
      io.SPIMemPort.WriteEn := io.MemPort(Producer).WriteEn

    }
  }
}
