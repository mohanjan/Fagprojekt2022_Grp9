import chisel3._
import chisel3.util._
import chisel3.util.experimental.loadMemoryFromFile

class DataMemory(maxCount: Int) extends Module {
  val io = IO(new Bundle {
    val Address = Input(UInt(11.W))
    val DataIn = Input(UInt(18.W))
    val DataOut = Output(UInt(18.W))

    val Enable = Input(Bool())
    val Write = Input(Bool())
  })

  val Memory = SyncReadMem(2048, UInt(18.W))

  io.DataOut := DontCare

  when(io.Enable){
    val ReadWritePort = Memory(io.Address)
    when(io.Write){
      ReadWritePort := io.DataIn
    }.otherwise{
      io.DataOut := ReadWritePort
    }
  }
}
