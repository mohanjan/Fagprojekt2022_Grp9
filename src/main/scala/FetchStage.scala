import chisel3._
import chisel3.util._
import chisel3.experimental._

class FetchStage(Program: String) extends Module {
  val io = IO(new Bundle{
    val Stall = Input(Bool())
    val Clear = Input(Bool())
  })
  val In = IO(new Bundle{
    val PC = Input(UInt(18.W))
  })
  val Out = IO(new Bundle{
    val Instruction = Output(UInt(18.W))
  })

  // Init

  val ClearDelay = RegNext(io.Clear)

  //val OutputReg = RegInit(0.U(18.W))
  val InstructionMem = Module(new InstuctionMemory(Program))

  doNotDedup(InstructionMem)


  InstructionMem.io.Address := 0.U
  InstructionMem.io.DataIn := 0.U
  InstructionMem.io.enable := 0.U
  InstructionMem.io.write := false.B

  // Logic

  InstructionMem.io.Address := In.PC
  InstructionMem.io.DataIn := 0.U
  InstructionMem.io.enable := true.B


  /*
  when(!io.Stall){
    OutputReg := InstructionMem.io.Instruction
  }
  */

  Out.Instruction := InstructionMem.io.Instruction

  /*
  when(io.Clear | ClearDelay) {
    InstructionMem.io.enable := false.B
  }
  */

  when(io.Clear) {
    InstructionMem.io.enable := false.B
  }
}