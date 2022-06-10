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
  val ReadInputSample = Wire(SInt())
  val ReadOutputSample = Wire(SInt())

  //test wires
  val CoeffWire = Wire(SInt())
  val Fircomputation36 = Wire(SInt())
  val Fircomputation18 = Wire(SInt())
  val Halfcountwire = Wire(UInt())
  val maxcountwire = Wire(UInt())


  // Memory definitions
  val InputSampleMemory = SyncReadMem(2048, SInt(18.W))
  val OutputSampleMemory = SyncReadMem(2048, SInt(18.W))
  val CoeffMemory = SyncReadMem(1024, SInt(18.W))

  val OutputReg = Reg(SInt(18.W))
  val MAccReg = Reg(SInt(18.W))

  val CountMax = (filterLength-1).U
  val SampleCount = Reg(UInt(11.W))

  val InputSamplePointer = Reg(UInt(11.W))
  val OutputSamplePointer = Reg(UInt(11.W))


  // Defaults
  io.WaveOut := OutputReg
  io.Completed := false.B
  SampleCount:=0.U
  CoeffCount := 0.U
  ReadInputSample:=InputSampleMemory.read(SampleAdress)
  ReadOutputSample:=OutputSampleMemory.read(SampleAdress)
  Halfcountwire:=(((filterLength-1+2)/2)-1).U
  maxcountwire:=CountMax

  //TestWires
  CoeffWire:= CoeffMemory.read(CoeffCount)
  Fircomputation36:=0.S
  Fircomputation18:=0.S

  //TEMP COEFF MEMORY CONTROL
  when(io.CoeffLoadEN){
    CoeffMemory.write(io.CoeffAdress,io.Coeffdata)
  }

  when(SampleCount>0.U | io.Enable & SampleCount === 0.U){
  //FIR filtering
  //note first filterlength of samples are garbage, but since they are gone in a split second it is fine
  Fircomputation36:= CoeffWire*FIRInput
  Fircomputation18:= ((Fircomputation36)>>17)(17,0).asSInt //bitshift
  MAccReg:=MAccReg + Fircomputation18
  }




  //Counter
  //Ready state:
  when(SampleCount === 0.U) {
    io.Completed := 1.U
  }
  //output state:
  when(SampleCount === maxcountwire){
    OutputReg:=MAccReg + Fircomputation18
    MAccReg:=0.S

    //CountUp start state:
  }.elsewhen((SampleCount > 0.U) & (SampleCount < Halfcountwire) | io.Enable & SampleCount===0.U){
    SampleCount := SampleCount+1.U
    CoeffCount := SampleCount+1.U

    //CountDown state:
  }.elsewhen(SampleCount >= Halfcountwire) {
    SampleCount := SampleCount + 1.U
    CoeffCount := (filterLength-2).U - SampleCount
  }

  //Input/output mode logic
  //Logic controling Output mode
  when(io.SampleType){

    when(OutputSamplePointer+SampleCount<=maxcountwire) {
      SampleAdress := OutputSamplePointer + SampleCount
    }.otherwise{
      SampleAdress := OutputSamplePointer+SampleCount-filterLength.U
    }

    //sample pointer
    when(OutputSamplePointer>0.U & SampleCount===maxcountwire){
      OutputSamplePointer:=OutputSamplePointer - 1.U
    }.elsewhen(OutputSamplePointer===0.U & SampleCount===maxcountwire){
      OutputSamplePointer:=maxcountwire
    }

    //sample handling
    when(SampleCount===0.U){
      FIRInput:=io.WaveIn
    }.otherwise{
      FIRInput:=ReadOutputSample
    }

    //Sample write
    when(SampleCount===0.U) {
      when(OutputSamplePointer > 0.U) {
        OutputSampleMemory.write(OutputSamplePointer - 1.U, io.WaveIn)
        OutputSampleMemory.write(OutputSamplePointer - 1.U, io.WaveIn)
      }.otherwise {
        OutputSampleMemory.write(maxcountwire, io.WaveIn)
      }
    }

    //Logic controling Input mode
  }.otherwise{


    when(InputSamplePointer+SampleCount<=maxcountwire) {
      SampleAdress := InputSamplePointer + SampleCount
    }.otherwise{
      SampleAdress := InputSamplePointer+SampleCount-filterLength.U
    }

    //sample pointer
    when(InputSamplePointer>0.U & SampleCount===maxcountwire){
      InputSamplePointer:=InputSamplePointer - 1.U
    }.elsewhen(InputSamplePointer===0.U & SampleCount===maxcountwire){
      InputSamplePointer:=maxcountwire
    }

    //sample handling
    when(SampleCount===0.U){
      FIRInput:=io.WaveIn
    }.otherwise{
      FIRInput:=ReadInputSample
    }

    //Sample write
    when(SampleCount===0.U){
      when(InputSamplePointer>0.U){
        InputSampleMemory.write(InputSamplePointer-1.U, io.WaveIn)
      }.otherwise{
        InputSampleMemory.write(maxcountwire, io.WaveIn)
      }

    }
  }





}

