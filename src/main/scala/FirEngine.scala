import chisel3._
import chisel3.util._

class FirEngine(maxCount: Int) extends Module {
  val io = IO(new Bundle {
    val WaveIn = Input(UInt(16.W))
    val WaveOut = Output(UInt(16.W))

    val Enable = Input(Bool())
    val WriteEn = Input(Bool())
    val WriteData = Input(UInt(18.W))
    val Address = Input(UInt(6.W))

    val ReadData = Output(UInt(18.W))
  })

  io.ReadData := DontCare
  io.WaveOut := 0.U

  val DataReg = Reg(Vec(128,UInt(18.W)))

  when(io.Enable){
    val ReadWritePort = DataReg(io.Address)
    when(io.WriteEn){
      ReadWritePort := io.WriteData
    }.otherwise{
      io.ReadData := ReadWritePort
    }
  }








}