import chisel3._
import chisel3.util._

class FirEngine() extends Module {
  val Registers = IO(new Bundle {
    val Enable = Input(Bool())
    val WriteEn = Input(Bool())
    val ReadData = Output(Bool())
    val Address = Input(UInt(7.W))
    val WriteData = Input(UInt(18.W))
  })
  val DataMemory = IO(new Bundle {
    val Enable = Output(Bool())
    val WriteEn = Output(Bool())
    val WriteData = Output(UInt(18.W))
    val Address = Output(UInt(6.W))

    val ReadData = Input(UInt(18.W))
  })
  val io = IO(new Bundle {
    val WaveIn = Input(UInt(18.W))
    val WaveOut = Output(UInt(18.W))
  })

  // Datamemory

  DataMemory.Enable := false.B
  DataMemory.WriteEn := false.B
  DataMemory.WriteData := 0.U
  DataMemory.Address := 0.U

  Registers.ReadData := 0.U

  io.WaveOut := 0.U

  val DataReg = Reg(Vec(128,UInt(18.W)))

  when(Registers.Enable){
    val ReadWritePort = DataReg(Registers.Address)
    when(Registers.WriteEn){
      ReadWritePort := Registers.WriteData
    }.otherwise{
      Registers.ReadData := ReadWritePort
    }
  }
}