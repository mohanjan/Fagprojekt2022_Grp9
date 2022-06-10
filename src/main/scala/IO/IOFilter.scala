import chisel3._
import chisel3.experimental.Analog
import chisel3.util._

class IOFilter(bufferWidth: Int) extends Module {
  val io = IO(new Bundle {
    val enable = Input(UInt(1.W))
    val waveIn = Input(SInt(bufferWidth.W))
    val sampleType = Input(UInt(1.W))
    val complete = Output(UInt(1.W))
    val waveOut = Output(SInt(bufferWidth.W))
  })

  io.waveOut := 0.S

  val mel = RegInit(1.U(1.W))

  mel := 0.U

  io.complete := mel

  when(io.enable === 1.U && io.sampleType === 1.U) {
    io.waveOut := io.waveIn  + 1.S
    mel := 1.U
  }
  .elsewhen (io.enable === 1.U) {
    io.waveOut := io.waveIn
    mel := 1.U
  }
  .otherwise {
    io.waveOut := 0.S
    mel := 0.U
  }

}
