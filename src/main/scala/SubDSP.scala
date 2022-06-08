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

class SubDSP(Program: String) extends Module {
  val io = IO(new Bundle {
    val In = Input(UInt(16.W))

    val Out = Output(UInt(16.W))
    val SPIMemPort = new MemPort
  })

  /*
  val SPI = IO(new Bundle{
    val SCLK = Output(Bool())
    val CE = Output(Bool())
    val SO = Input(Vec(4,Bool()))
    val SI = Output(Vec(4,Bool()))
    val Drive = Output(Bool())
  })
  */

  // Single Core

  val dedupBlock = WireInit(Program.hashCode.S)

  val Core = Module(new Core(Program))
  val FirEngine = Module(new FirEngine())
  val DataMemory = Module(new DataMemory(2))

  /*
  doNotDedup(Core)
  doNotDedup(FirEngine)
  doNotDedup(DataMemory)
  */

  // IO

  io.Out := Core.io.WaveOut + FirEngine.io.WaveOut
  FirEngine.io.WaveIn := io.In
  Core.io.WaveIn := io.In

  // Interconnections

  Core.io.MemPort <> DataMemory.io.MemPort(0)

  FirEngine.io.Registers <> DataMemory.io.Registers

  FirEngine.io.MemPort <> DataMemory.io.MemPort(1)
  FirEngine.io.WaveIn := 0.U

  io.SPIMemPort <> DataMemory.io.SPIMemPort

  //SPI <> DataMemory.SPI
}