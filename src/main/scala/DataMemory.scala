import chisel3._
import chisel3.util._
import chisel3.experimental.Analog
import chisel3.util.experimental.loadMemoryFromFile

class DataMemory(maxCount: Int) extends Module {
  val io = IO(new Bundle {
    val Address = Input(UInt(18.W))
    val DataIn = Input(UInt(18.W))
    val DataOut = Output(UInt(18.W))

    val Enable = Input(Bool())
    val Write = Input(Bool())

    val Completed = Output(Bool())
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
  val FirEngine = Module(new FirEngine(maxCount))

  // Defaults

  FirEngine.io.WriteData := 0.U
  FirEngine.io.Enable := false.B
  FirEngine.io.Address := 0.U
  FirEngine.io.WaveIn := 0.U
  FirEngine.io.WriteEn := false.B

  io.DataOut := DontCare
  io.Completed := false.B
  ExternalMemory.io.WriteData := 0.U
  ExternalMemory.io.ReadEnable := false.B
  ExternalMemory.io.WriteEnable := false.B
  ExternalMemory.io.Address := 0.U
  ExternalMemory.SPI <> SPI

  // Address space partition

  when(io.Enable){
    when(io.Address <= 2047.U){ // Internal data memory
      val ReadWritePort = Memory(io.Address)
      io.Completed := true.B

      when(io.Write){
        ReadWritePort := io.DataIn
      }.otherwise{
        io.DataOut := ReadWritePort
      }
    }.elsewhen(io.Address <= 2175.U){ // Fir Registers
      FirEngine.io.Address := io.Address
      FirEngine.io.WriteEn := true.B
      io.Completed := true.B

      when(io.Write){
        FirEngine.io.WriteData := io.DataIn
      }.otherwise{
        io.DataOut := FirEngine.io.ReadData
      }
    }.otherwise{ // External Memory
      ExternalMemory.io.Address := io.Address

      when(io.Write){
        when(ExternalMemory.io.Ready){
          ExternalMemory.io.WriteEnable := true.B
          ExternalMemory.io.WriteData := io.DataIn
        }

        io.Completed := ExternalMemory.io.Completed
      }.otherwise{
        when(ExternalMemory.io.Ready){
          ExternalMemory.io.ReadEnable := true.B
        }

        io.Completed := ExternalMemory.io.Completed
        io.DataOut := ExternalMemory.io.ReadData
      }
    }
  }
}
