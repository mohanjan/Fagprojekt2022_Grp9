import chisel3._
import chisel3.util._
import chisel3.util.experimental.loadMemoryFromFileInline

class InstuctionMemory(maxCount: Int) extends Module {
  val io = IO(new Bundle {
    val Address = Input(UInt(10.W))
    val DataIn = Input(UInt(18.W))
    val MemWrite = Input(Bool())

    val Instruction = Output(UInt(18.W))
  })

  val InstructionMemory = SyncReadMem(1024,UInt(10.W))

  loadMemoryFromFileInline(InstructionMemory,"Program.txt")

  io.Instruction := 0.U

  when(io.MemWrite){
    InstructionMemory.write(io.Address,io.DataIn)
  }.otherwise{
    io.Instruction := InstructionMemory.read(io.Address)
  }

}