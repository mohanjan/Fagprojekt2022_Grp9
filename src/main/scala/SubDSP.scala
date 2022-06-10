import chisel3._
//import chisel3.experimental.Analog
import chisel3.experimental._
import chisel3.util._

class MemPort extends Bundle{
  val Address = Output(UInt(18.W))
  val WriteData = Output(UInt(18.W))
  val Enable = Output(Bool())
  val WriteEn = Output(Bool())

  val ReadData = Input(UInt(18.W))
  val Completed = Input(Bool())
}

class CAP_IO extends Bundle{
  val In = Input(UInt(18.W))
  val Out = Output(UInt(18.W))
}

class SubDSP(Program: String, Memsize: Int, SPIRAM_Offset: Int) extends Module {
  val io = IO(new Bundle {
    val Sub_IO = new CAP_IO
  })
  val SPI = IO(new Bundle {
    val SPIMemPort = new MemPort
  })

  // Single Core

  val dedupBlock = WireInit(Program.hashCode.S)

  val Core = Module(new Core(Program))
  val FirEngine = Module(new FirEngine())
  val DataMemory = Module(new DataMemory(2, Memsize, SPIRAM_Offset))

  /*
  doNotDedup(Core)
  doNotDedup(FirEngine)
  doNotDedup(DataMemory)
  */

  // IO

  io.Sub_IO.Out := Core.io.WaveOut + FirEngine.io.WaveOut
  FirEngine.io.WaveIn := io.Sub_IO.In
  Core.io.WaveIn := io.Sub_IO.In

  // Interconnections

  Core.io.MemPort <> DataMemory.io.MemPort(0)

  FirEngine.io.Registers <> DataMemory.io.Registers

  FirEngine.io.MemPort <> DataMemory.io.MemPort(1)
  FirEngine.io.WaveIn := 0.U

  SPI.SPIMemPort <> DataMemory.io.SPIMemPort

  //SPI <> DataMemory.SPI
}