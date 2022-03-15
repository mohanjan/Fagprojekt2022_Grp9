import chisel3._
import chisel3.util._

class FirEngine(maxCount: Int) extends Module {
  val io = IO(new Bundle {
    val WaveIn = Input(UInt(16.W))
    val WaveOut = Output(UInt(16.W))

    val WriteEn = Input(Bool())
    val WriteData = Input(UInt(18.W))
    val Address = Input(UInt(6.W))

    val ReadData = Output(UInt(18.W))
  })

  val DataReg = Reg(Vec(64,UInt(18.W)))

  when(io.WriteEn){
    DataReg(io.Address) := io.WriteData
  }.otherwise{
    io.ReadData := DataReg(io.Address)
  }







}