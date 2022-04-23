import chisel3._
import chisel3.util._

class FirEngine extends Module {
  val io = IO(new Bundle {
    val WaveIn = Input(UInt(18.W))
    val WaveOut = Output(UInt(18.W))
    val Registers = Flipped(new MemPort)
    val MemPort = new MemPort
  })

  // Defaults

  io.WaveOut := 0.U

  io.MemPort.Enable := false.B
  io.MemPort.WriteEn := false.B
  io.MemPort.WriteData := 0.U
  io.MemPort.Address := 0.U

  io.Registers.ReadData := 0.U
  io.Registers.Completed := false.B

  // Communication Registers

  val DataReg = Reg(Vec(128,UInt(18.W)))

  when(io.Registers.Enable){
    val ReadWritePort = DataReg(io.Registers.Address)
    when(io.Registers.WriteEn){
      ReadWritePort := io.Registers.WriteData
    }.otherwise{
      io.Registers.ReadData := ReadWritePort
    }
  }

  // Free space for actual FIR engine















}