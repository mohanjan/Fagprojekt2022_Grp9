import chisel3._
import chisel3.util._
import chisel3.experimental.Analog
import Core._

object Core{
  val Nil = 0.U
  val Arithmetic = 1.U
  val ImmidiateArithmetic = 2.U
  val MemoryI = 3.U
  val Conditional = 4.U
  val FirRead = 5.U
}

class Core(Program: String) extends Module {
  val io = IO(new Bundle {
    val WaveIn = Input(UInt(18.W))
    val WaveOut = Output(UInt(18.W))

    val MemPort = new MemPort
  })

  // Init

  val FetchStage = Module(new FetchStage(Program))
  val DecodeStage = Module(new DecodeStage)
  val ExecuteStage = Module(new ExecuteStage)

  //Registers

  val x = Reg(Vec(16,UInt(18.W)))

  x(0) := 0.U(16.W)
  x(2) := io.WaveIn
  io.WaveOut := x(3)

  // Default

  FetchStage.io.Stall := false.B
  FetchStage.io.Clear := false.B

  DecodeStage.io.Stall := false.B
  DecodeStage.io.Clear := false.B

  ExecuteStage.io.MemPort <> io.MemPort
  ExecuteStage.io.Clear := false.B
  ExecuteStage.io.x := x

  // Processor

  // Instruction Fetch

  FetchStage.In.PC := x(1)
  FetchStage.io.Stall := ExecuteStage.io.Stall

  when(!ExecuteStage.io.Stall && !DecodeStage.io.MiniStall){
    x(1) := x(1) + 1.U
  }

  // Instruction Decode

  DecodeStage.In := FetchStage.Out
  DecodeStage.io.Stall := ExecuteStage.io.Stall

  // Execute

  ExecuteStage.In := DecodeStage.Out

  // Writeback

  switch(ExecuteStage.Out.WritebackMode){
    is(Arithmetic){
      x(ExecuteStage.Out.WritebackRegister) := ExecuteStage.Out.ALUOut

      // In case of jump, the pipeline is cleared

      when(ExecuteStage.Out.WritebackRegister === 1.U){
        FetchStage.io.Clear := true.B
        DecodeStage.io.Clear := true.B
        ExecuteStage.io.Clear := true.B
      }
    }
    is(MemoryI){
      x(ExecuteStage.Out.WritebackRegister) := io.MemPort.ReadData
    }
    is(Conditional){
      x(1) := ExecuteStage.Out.JumpValue
      FetchStage.io.Clear := true.B
      DecodeStage.io.Clear := true.B
      ExecuteStage.io.Clear := true.B
    }
  }
}
