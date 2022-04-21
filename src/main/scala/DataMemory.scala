import chisel3._
import chisel3.util._
import chisel3.experimental.Analog
import chisel3.util.experimental.loadMemoryFromFile

class DataMemory() extends Module {
  val io = IO(new Bundle {
    val DataMem = Flipped(new DataMem)
    val FIR = Flipped(new DataMem)
    val Registers = Flipped(new Registers)
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

  io.DataMem.ReadData := 0.U
  io.DataMem.Completed := false.B

  io.FIR.ReadData := 0.U
  io.FIR.Completed := false.B

  ExternalMemory.io.WriteData := 0.U
  ExternalMemory.io.ReadEnable := false.B
  ExternalMemory.io.WriteEnable := false.B
  ExternalMemory.io.Address := 0.U
  ExternalMemory.SPI <> SPI


  // Address space partition

  when(io.DataMem.Enable){
    when(io.DataMem.Address <= 2047.U){ // Internal data memory
      val ReadWritePort = Memory(io.DataMem.Address)
      io.DataMem.Completed := true.B

      when(io.DataMem.WriteEn){
        ReadWritePort := io.DataMem.WriteData
      }.otherwise{
        io.DataMem.ReadData := ReadWritePort
      }
    }.elsewhen(io.DataMem.Address <= 2175.U){ // Fir Registers
      io.Registers.Address := (io.DataMem.Address - 2175.U)(5,0)
      io.Registers.WriteEn := true.B
      io.DataMem.Completed := true.B

      when(io.DataMem.WriteEn){
        io.Registers.WriteData := io.DataMem.WriteData
      }.otherwise{
        io.DataMem.ReadData := io.Registers.ReadData
      }
    }.otherwise{ // External Memory
      ExternalMemory.io.Address := io.DataMem.Address

      when(io.DataMem.WriteEn){
        when(ExternalMemory.io.Ready){
          ExternalMemory.io.WriteEnable := true.B
          ExternalMemory.io.WriteData := io.DataMem.WriteData
        }

        io.DataMem.Completed := ExternalMemory.io.Completed
      }.otherwise{
        when(ExternalMemory.io.Ready){
          ExternalMemory.io.ReadEnable := true.B
        }

        io.DataMem.Completed := ExternalMemory.io.Completed
        io.DataMem.ReadData := ExternalMemory.io.ReadData
      }
    }
  }
}
