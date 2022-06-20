import chisel3._
import chisel3.util._
import chisel3.util.experimental.loadMemoryFromFileInline

class IOFilter(filterLength: Int, bufferWidth: Int) extends Module {
  val io = IO(new Bundle {
    val WaveIn = Input(SInt(bufferWidth.W))
    val WaveOut = Output(SInt(bufferWidth.W))
    val LoadSamples = Input(Bool())
    val ConvEnable = Input(Bool())
    val Completed = Output(Bool())
  })

  // Wire definitions
  val FIRInput = Wire(SInt())
  val CoeffCount = Wire(UInt())
  val SampleAddress = Wire(UInt())
  val ReadSample = Wire(SInt())

  // test wires
  val CoeffWire = Wire(SInt())
  val Fircomputation36 = Wire(SInt())
  val Fircomputation18 = Wire(SInt())
  val Halfcountwire = Wire(UInt())
  val maxcountwire = Wire(UInt())

  // Memory definitions
  val InputSampleMemory = SyncReadMem(2048, SInt(18.W))
  val CoeffMemory = SyncReadMem(1024, SInt(18.W))

  val OutputReg = Reg(SInt(18.W))
  val MAccReg = Reg(SInt(36.W))

  val CountMax = (filterLength - 1).U
  val SampleCount = Reg(UInt(11.W))

  val InputSamplePointer = Reg(UInt(11.W))
  val OutputSamplePointer = Reg(UInt(11.W))

  loadMemoryFromFileInline(CoeffMemory, "IOFilterCoeffsQ0_17.txt")

  // Defaults
  io.WaveOut := OutputReg
  io.Completed := false.B
  SampleCount := 0.U
  CoeffCount := 0.U
  ReadSample :=0.S
  Halfcountwire := (((filterLength - 1 + 2) / 2) - 1).U // CeilDivide
  maxcountwire := CountMax

  // TestWires
  CoeffWire := CoeffMemory.read(CoeffCount)
  Fircomputation36 := 0.S
  Fircomputation18 := 0.S

  when(!io.LoadSamples){
    ReadSample :=InputSampleMemory.read(SampleAddress)
  }

  when(
    SampleCount > 0.U || (io.ConvEnable && SampleCount === 0.U)) {
    // FIR Computations
    Fircomputation36 := CoeffWire * FIRInput
    MAccReg := MAccReg + Fircomputation36
  }

  // Counter
  // Ready state:
  when(SampleCount === 0.U) {
    io.Completed := 1.U
  }
  // output state:
  when(SampleCount === maxcountwire) {
    OutputReg := (MAccReg + Fircomputation36 >> 17) (17, 0).asSInt // bitshift
    MAccReg := 0.S

    // CountUp start state:
  }.elsewhen(
    ((SampleCount > 0.U) && (SampleCount < Halfcountwire))|| (io.ConvEnable && SampleCount === 0.U)
  ) {
    SampleCount := SampleCount + 1.U
    CoeffCount := SampleCount + 1.U

    // CountDown state:
  }.elsewhen(SampleCount >= Halfcountwire) {
    SampleCount := SampleCount + 1.U
    CoeffCount := (filterLength - 2).U - SampleCount
  }

  // FIRInput handling
  when(SampleCount === 0.U) {
    FIRInput := io.WaveIn
  }.otherwise {
    FIRInput := ReadSample
  }

  // Sample address
  when(InputSamplePointer + SampleCount <= maxcountwire) {
    SampleAddress := InputSamplePointer + SampleCount
  }.otherwise {
    SampleAddress := InputSamplePointer + SampleCount - filterLength.U
  }

  when(io.LoadSamples && SampleCount === 0.U) {
    InputSampleMemory.write(InputSamplePointer - 1.U, io.WaveIn)
    when(InputSamplePointer > 0.U) {
      InputSamplePointer := InputSamplePointer - 1.U
    }.elsewhen(InputSamplePointer === 0.U) {
      InputSamplePointer := maxcountwire
    }
  }
}