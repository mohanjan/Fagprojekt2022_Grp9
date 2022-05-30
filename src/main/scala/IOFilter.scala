import chisel3._
import chisel3.util._

class IOFilter(filterLength: Int) extends Module {
  val io = IO(new Bundle {
    val WaveIn = Input(UInt(18.W))
    val WaveOut = Output(UInt(18.W))
    val SampleType = Input(Bool()) // [input=0/output=1]
    val Enable = Input(Bool())
    val Completed = Output(Bool())
  })


  //Wire definitions
  val DSPOut = Wire(UInt())
  val DSPIn = Wire(UInt())
  val RegOutEN = Wire(UInt())
  val IncrementCount = Wire(UInt())
  val End = Wire(UInt())

  val FIROutput = Wire(UInt())
  val FIRInput = Wire(UInt())
  val CoeffCount = Wire(UInt())
  val SampleAdress = Wire(UInt())
  // Memory definitions

  val InputSampleMemory = SyncReadMem(2048, UInt(18.W))
  val OutputSampleMemory = SyncReadMem(2048, UInt(18.W))
  val CoeffMemory = SyncReadMem(1024, UInt(18.W))

  val OutputReg = Reg(UInt(18.W))
  val MAccReg = Reg(UInt(18.W))

  val CountMax = (filterLength-1).U
  val SampleCount = Reg(UInt(11.W))

  val InputSamplePointer = Reg(UInt(11.W))
  val OutputSamplePointer = Reg(UInt(11.W))

  // Defaults

  io.WaveOut := OutputReg
  io.Completed := false.B
  SampleCount:=0.U
  CoeffCount := 0.U

  //MemControl FSM
  //TODO Make control logic controlling the control bits

  //Counter

  //output state:
  when(SampleCount === CountMax){
    OutputReg:=FIROutput
    SampleCount:=0.U
    MAccReg:=0.U

    //CountUp state:
  }.elsewhen(SampleCount > 0.U | io.Enable){
    SampleCount := SampleCount+1.U
    CoeffCount := SampleCount

    //CountDown state:
  }.elsewhen(SampleCount > CountMax(2,11)){
    SampleCount:=SampleCount+1.U
    CoeffCount := CountMax-SampleCount

    //Ready state:
  }.otherwise{
    io.Completed := 1.U
    MAccReg:=0.U
  }


  //Input/output mode
  //Output mode
  when(io.SampleType){
    FIRInput:=OutputSampleMemory(SampleCount)


    //sample pointer
    when(OutputSamplePointer<=CountMax & SampleCount===0.U){
      OutputSamplePointer:=OutputSamplePointer + 1.U
    }.elsewhen(SampleCount===0.U){
      OutputSamplePointer:=0.U
    }



  //Input mode
  }.otherwise{
    FIRInput:=InputSampleMemory(SampleCount)

    //sample pointer
    when(InputSamplePointer<=CountMax & SampleCount===0.U){
      InputSamplePointer:=InputSamplePointer + 1.U
    }.elsewhen(SampleCount===0.U){
      InputSamplePointer:=0.U
    }

  }



  //FIR filtering
  MAccReg:=MAccReg + CoeffMemory(CoeffCount)*FIRInput     //note first filterlength of samples are garbage, but since they are gone in a split second it is fine




}

