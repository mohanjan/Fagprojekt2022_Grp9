import chisel3._
import chisel3.util._
import chisel3.util.experimental.loadMemoryFromFile

class DataMemory(maxCount: Int) extends Module {
  val io = IO(new Bundle {
    val Address = Input(UInt(11.W))
    val DataIn = Input(UInt(18.W))
    val DataOut = Output(UInt(18.W))

    val Operation = Input(UInt(1.W))
    val Valid = Input(Bool())
  })

  val Memory = SyncReadMem(2048, UInt(18.W))

  io.DataOut := 0.U

  switch(io.Operation){
    is(0.U){
      io.DataOut := Memory.read(io.Address)
    }
    is(1.U){
      Memory.write(io.Address,io.DataIn)
    }
  }
}
