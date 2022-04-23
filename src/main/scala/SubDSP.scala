import chisel3._
import chisel3.experimental.Analog
import chisel3.util._

class MemPort extends Bundle{
  val Address = Output(UInt(18.W))
  val WriteData = Output(UInt(18.W))
  val Enable = Output(Bool())
  val WriteEn = Output(Bool())

  val ReadData = Input(UInt(18.W))
  val Completed = Input(Bool())
}

class SubDSP extends Module {
  val io = IO(new Bundle {
    val In = Input(UInt(16.W))
    //val Stall = Input(Bool())
    //val MasterWrite = Flipped(new MemPort)

    val Out = Output(UInt(16.W))
  })
  val SPI = IO(new Bundle{
    val SCLK = Output(Bool())
    val CE = Output(Bool())
    val SO = Input(Vec(4,Bool()))
    val SI = Output(Vec(4,Bool()))
    val Drive = Output(Bool())
  })

  // Single Core

  val Core = Module(new Core())
  val FirEngine = Module(new FirEngine())
  val DataMemory = Module(new DataMemory(2))

  // IO

  io.Out := Core.io.WaveOut + FirEngine.io.WaveOut
  FirEngine.io.WaveIn := io.In
  Core.io.WaveIn := io.In

  // Interconnections

  Core.io.Stall := false.B
  Core.io.ProgramLength := 0.U

  Core.io.MemPort <> DataMemory.io.MemPort(0)

  FirEngine.io.Registers <> DataMemory.io.Registers

  FirEngine.io.MemPort <> DataMemory.io.MemPort(1)
  FirEngine.io.WaveIn := 0.U

  SPI <> DataMemory.SPI
}