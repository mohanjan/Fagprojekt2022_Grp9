import chisel3._
import chisel3.util._

class IOFilter(filterLength: Int) extends Module {
  val io = IO(new Bundle {
    val WaveIn = Input(SInt(18.W))
    val WaveOut = Output(SInt(18.W))
    val SampleType = Input(Bool()) // [input=0/output=1]
    val Enable = Input(Bool())
    val Completed = Output(Bool())

    val CoeffAdress = Input(UInt(10.W))//TEMP
    val Coeffdata = Input(SInt(18.W))//TEMP
    val CoeffLoadEN = Input(Bool())//TEMP
  })


  //Wire definitions
  val FIRInput = Wire(SInt())
  val CoeffCount = Wire(UInt())
  val SampleAdress = Wire(UInt())

  //test wires
  val Fircomputation = Wire(SInt())


  // Memory definitions
  val InputSampleMemory = SyncReadMem(2048, SInt(18.W))
  val OutputSampleMemory = SyncReadMem(2048, SInt(18.W))
  val CoeffMemory = SyncReadMem(1024, SInt(18.W))

  val OutputReg = Reg(SInt(18.W))
  val MAccReg = Reg(SInt(36.W))

  val CountMax = (filterLength-1).U
  val HalfCount = ((filterLength-1)>>2-1).U
  val SampleCount = Reg(UInt(11.W))

  val InputSamplePointer = Reg(UInt(11.W))
  val OutputSamplePointer = Reg(UInt(11.W))


  // Defaults
  io.WaveOut := OutputReg
  io.Completed := false.B
  SampleCount:=0.U
  CoeffCount := 0.U

  //TEMP COEFF MEMORY CONTROL
  when(io.CoeffLoadEN){
    CoeffMemory.write(io.CoeffAdress,io.Coeffdata)
  }


  //FIR filtering
  //todo make sure that the timing of coeffMemory is ok
  //todo below something is UInt instead of Int (:
  //note first filterlength of samples are garbage, but since they are gone in a split second it is fine
  Fircomputation:=MAccReg + CoeffMemory.read(CoeffCount)*FIRInput
  MAccReg:=Fircomputation

  //Counter

  //output state:
  when(SampleCount === CountMax){
    OutputReg:=(MAccReg >> 17).asSInt & 131071.S //bitshift and mask aka bit extract
    SampleCount:=0.U
    MAccReg:=0.S

    //CountUp state:
  }.elsewhen((SampleCount > 0.U) | io.Enable){
    SampleCount := SampleCount+1.U
    CoeffCount := SampleCount

    //CountDown state:
  }.elsewhen(SampleCount > HalfCount){
    SampleCount:=SampleCount+1.U
    CoeffCount := CountMax-SampleCount

    //Ready state:
  }.otherwise{
    io.Completed := 1.U
    MAccReg:=0.S
  }



  //Input/output mode
  //Output mode
  when(io.SampleType){

    when(OutputSamplePointer+SampleCount<CountMax) {
      SampleAdress := OutputSamplePointer + SampleCount
    }.otherwise{
      SampleAdress := OutputSamplePointer+SampleCount-CountMax //måske ineffektiv
    }

    //sample pointer
    when(OutputSamplePointer<=CountMax & SampleCount===0.U & io.Enable){
      OutputSamplePointer:=OutputSamplePointer + 1.U
    }.elsewhen(SampleCount===0.U & io.Enable){
      OutputSamplePointer:=0.U
    }

    //sample handling
    when(SampleCount===1.U){
      //todo fix wraparound bug
      OutputSampleMemory.write(OutputSamplePointer-1.U,io.WaveIn)
    }

    when(SampleCount===0.U){
      FIRInput:=io.WaveIn
    }.otherwise{
      FIRInput:=OutputSampleMemory.read(SampleAdress)
    }


    //Input mode
  }.otherwise{

    when(SampleCount===0.U){
      FIRInput:=io.WaveIn
    }.otherwise{
      FIRInput:=InputSampleMemory.read(SampleAdress)
    }

    when(InputSamplePointer+SampleCount<CountMax) {
      SampleAdress := InputSamplePointer + SampleCount
    }.otherwise{
      SampleAdress := InputSamplePointer+SampleCount-CountMax
    }

    //sample pointer
    when(InputSamplePointer<=CountMax & SampleCount===0.U){
      InputSamplePointer:=InputSamplePointer + 1.U
    }.elsewhen(SampleCount===0.U){
      InputSamplePointer:=0.U
    }

    //sample handling
    when(io.Enable & SampleCount===0.U){
      InputSampleMemory.write(InputSamplePointer-1.U,io.WaveIn)
    }
  }





}

