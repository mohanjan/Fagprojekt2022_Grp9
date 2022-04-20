import chisel3._
import chisel3.util._
import chisel3.experimental.Analog
import chisel3.util.experimental.loadMemoryFromFile
import chisel3.stage.ChiselStage

class DataMemory() extends Module {
  val DataMem = IO(new Bundle {
    val Address = Input(UInt(18.W))
    val DataIn = Input(UInt(18.W))
    val DataOut = Output(UInt(18.W))

    val Enable = Input(Bool())
    val Write = Input(Bool())

    val Completed = Output(Bool())
  })
  val FIR = IO(new Bundle {
    val Enable = Input(Bool())
    val WriteEn = Input(Bool())
    val WriteData = Input(UInt(18.W))
    val Address = Input(UInt(6.W))

    val ReadData = Output(UInt(18.W))
  })
  val FirRegisters = IO(new Bundle {
    val Enable = Output(Bool())
    val WriteEn = Output(Bool())
    val Address = Output(UInt(7.W))
    val WriteData = Output(UInt(18.W))

    val ReadData = Input(Bool())
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
  val FirEngine = Module(new FirEngine())

  // Defaults

  FirRegisters.Address := 0.U
  FirRegisters.WriteData := 0.U
  FirRegisters.Enable := false.B
  FirRegisters.WriteEn := false.B
  FIR.ReadData := 0.U

  DataMem.DataOut := DontCare
  DataMem.Completed := false.B
  ExternalMemory.io.WriteData := 0.U
  ExternalMemory.io.ReadEnable := false.B
  ExternalMemory.io.WriteEnable := false.B
  ExternalMemory.io.Address := 0.U
  ExternalMemory.SPI <> SPI

  // Address space partition

  when(DataMem.Enable){
    when(DataMem.Address <= 2047.U){ // Internal data memory
      val ReadWritePort = Memory(DataMem.Address)
      DataMem.Completed := true.B

      when(DataMem.Write){
        ReadWritePort := DataMem.DataIn
      }.otherwise{
        DataMem.DataOut := ReadWritePort
      }
    }.elsewhen(DataMem.Address <= 2175.U){ // Fir Registers
      FirRegisters.Address := (DataMem.Address - 2175.U)(5,0)
      FirRegisters.WriteEn := true.B
      DataMem.Completed := true.B

      when(DataMem.Write){
        FirRegisters.WriteData := DataMem.DataIn
      }.otherwise{
        DataMem.DataOut := FirRegisters.ReadData
      }
    }.otherwise{ // External Memory
      ExternalMemory.io.Address := DataMem.Address

      when(DataMem.Write){
        when(ExternalMemory.io.Ready){
          ExternalMemory.io.WriteEnable := true.B
          ExternalMemory.io.WriteData := DataMem.DataIn
        }

        DataMem.Completed := ExternalMemory.io.Completed
      }.otherwise{
        when(ExternalMemory.io.Ready){
          ExternalMemory.io.ReadEnable := true.B
        }

        DataMem.Completed := ExternalMemory.io.Completed
        DataMem.DataOut := ExternalMemory.io.ReadData
      }
    }
  }
}
