import chisel3._
import chisel3.util._

class FirEngine() extends Module {
  val io = IO(new Bundle {
    val WaveIn = Input(UInt(18.W))
    val WaveOut = Output(UInt(18.W))
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