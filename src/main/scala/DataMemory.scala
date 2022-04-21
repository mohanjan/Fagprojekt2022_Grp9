import chisel3._
import chisel3.util._
import chisel3.experimental.Analog
import chisel3.util.experimental.loadMemoryFromFile

class DataMemory() extends Module {
  val io = IO(new Bundle {
    val MemPort = Flipped(new MemPort)
    val FIRMemPort = Flipped(new MemPort)
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

  io.MemPort.ReadData := 0.U
  io.MemPort.Completed := false.B

  io.FIRMemPort.ReadData := 0.U
  io.FIRMemPort.Completed := false.B

  ExternalMemory.io.WriteData := 0.U
  ExternalMemory.io.ReadEnable := false.B
  ExternalMemory.io.WriteEnable := false.B
  ExternalMemory.io.Address := 0.U
  ExternalMemory.SPI <> SPI


  // Address space partition

  when(io.MemPort.Enable){
    when(io.MemPort.Address <= 2047.U){ // Internal data memory
      val ReadWritePort = Memory(io.MemPort.Address)
      io.MemPort.Completed := true.B

      when(io.MemPort.WriteEn){
        ReadWritePort := io.MemPort.WriteData
      }.otherwise{
        io.MemPort.ReadData := ReadWritePort
      }
    }.elsewhen(io.MemPort.Address <= 2175.U){ // Fir Registers
      io.Registers.Address := (io.MemPort.Address - 2175.U)(5,0)
      io.Registers.WriteEn := true.B
      io.MemPort.Completed := true.B

      when(io.MemPort.WriteEn){
        io.Registers.WriteData := io.MemPort.WriteData
      }.otherwise{
        io.MemPort.ReadData := io.Registers.ReadData
      }
    }.otherwise{ // External Memory
      ExternalMemory.io.Address := io.MemPort.Address

      when(io.MemPort.WriteEn){
        when(ExternalMemory.io.Ready){
          ExternalMemory.io.WriteEnable := true.B
          ExternalMemory.io.WriteData := io.MemPort.WriteData
        }

        io.MemPort.Completed := ExternalMemory.io.Completed
      }.otherwise{
        when(ExternalMemory.io.Ready){
          ExternalMemory.io.ReadEnable := true.B
        }

        io.MemPort.Completed := ExternalMemory.io.Completed
        io.MemPort.ReadData := ExternalMemory.io.ReadData
      }
    }
  }
}
