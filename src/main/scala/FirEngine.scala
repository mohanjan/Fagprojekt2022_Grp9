import chisel3._
import chisel3.util._

class Registers extends Bundle{
  val Enable = Input(Bool())
  val WriteEn = Input(Bool())
  val ReadData = Output(Bool())
  val Address = Input(UInt(7.W))
  val WriteData = Input(UInt(18.W))
}

class FIR extends Bundle{
  val Enable = Output(Bool())
  val WriteEn = Output(Bool())
  val WriteData = Output(UInt(18.W))
  val Address = Output(UInt(6.W))

  val ReadData = Input(UInt(18.W))
}

class FirEngine() extends Module {
  val io = IO(new Bundle {
    val WaveIn = Input(UInt(18.W))
    val WaveOut = Output(UInt(18.W))
    val FIR_ = new FIR
    val Registers = new Registers
    val DataMem = new DataMem
  })

  // Defaults

  io.WaveOut := 0.U

  io.DataMem.Enable := false.B
  io.DataMem.WriteEn := false.B
  io.DataMem.WriteData := 0.U
  io.DataMem.Address := 0.U

  io.Registers.ReadData := 0.U

  io.FIR_.Address := 0.U
  io.FIR_.Enable := false.B
  io.FIR_.WriteData := 0.U
  io.FIR_.WriteEn := false.B

  val DataReg = Reg(Vec(128,UInt(18.W)))

  when(io.Registers.Enable){
    val ReadWritePort = DataReg(io.Registers.Address)
    when(io.Registers.WriteEn){
      ReadWritePort := io.Registers.WriteData
    }.otherwise{
      io.Registers.ReadData := ReadWritePort
    }
  }
}