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
  val HalfCount = ((filterLength-1+1)>>1).U
  val SampleCount = Reg(UInt(11.W))

  val InputSamplePointer = Reg(UInt(11.W))
  val OutputSamplePointer = Reg(UInt(11.W))


  // Defaults
  io.WaveOut := OutputReg
  io.Completed := false.B
  SampleCount:=0.U
  CoeffCount := 0.U
  Halfcountwire:=HalfCount
  maxcountwire:=CountMax
  //TEMP COEFF MEMORY CONTROL
  when(io.CoeffLoadEN){
    CoeffMemory.write(io.CoeffAdress,io.Coeffdata)
  }


  //FIR filtering
  //todo make sure that io.completed is high when data is ready
  //note first filterlength of samples are garbage, but since they are gone in a split second it is fine
  Fircomputation36:= CoeffMemory.read(CoeffCount)*FIRInput
  Fircomputation18:= ((Fircomputation36)>>17)(17,0).asSInt //bitshift
  MAccReg:=MAccReg + Fircomputation18

  //Counter

  //output state:
  when(SampleCount === maxcountwire){
    OutputReg:=MAccReg
    SampleCount:=0.U
    MAccReg:=0.S

    //CountUp start state:
  }.elsewhen( (io.Enable & SampleCount === 0.U)){
    SampleCount := SampleCount+1.U
    CoeffCount := SampleCount
    io.Completed:=1.U
    //Countup state:
  }.elsewhen((SampleCount > 0.U) & (SampleCount <= Halfcountwire)){
    SampleCount := SampleCount+1.U
    CoeffCount := SampleCount

    //CountDown state:
  }.elsewhen(SampleCount > Halfcountwire){
    SampleCount:=SampleCount+1.U
    CoeffCount := maxcountwire-SampleCount

    //Ready state:
  }.otherwise{
    io.Completed := 1.U
  }



  //Input/output mode
  //Output mode
  when(io.SampleType){

    when(OutputSamplePointer+SampleCount<maxcountwire) {
      SampleAdress := OutputSamplePointer + SampleCount
    }.otherwise{
      SampleAdress := OutputSamplePointer+SampleCount-maxcountwire //måske ineffektiv
    }

    //sample pointer
    when(OutputSamplePointer<=maxcountwire & SampleCount===0.U & io.Enable){
      OutputSamplePointer:=OutputSamplePointer + 1.U
    }.elsewhen(SampleCount===0.U & io.Enable){
      OutputSamplePointer:=0.U
    }

    //sample handling
    when(SampleCount===0.U){
      FIRInput:=io.WaveIn
      when(OutputSamplePointer===0.U){
        OutputSampleMemory.write(maxcountwire,io.WaveIn)
      }.otherwise{
        OutputSampleMemory.write(OutputSamplePointer-1.U,io.WaveIn)
      }
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

    when(InputSamplePointer+SampleCount<maxcountwire) {
      SampleAdress := InputSamplePointer + SampleCount
    }.otherwise{
      SampleAdress := InputSamplePointer+SampleCount-maxcountwire
    }

    //sample pointer
    when(InputSamplePointer<maxcountwire & SampleCount===0.U & io.Enable){
      InputSamplePointer:=InputSamplePointer + 1.U
    }.elsewhen(SampleCount===0.U & io.Enable){
      InputSamplePointer:=0.U
    }

    //sample handling
    when(SampleCount===0.U){
      FIRInput:=io.WaveIn
      when(InputSamplePointer===0.U){
        InputSampleMemory.write(maxcountwire,io.WaveIn)
      }.otherwise{
        InputSampleMemory.write(InputSamplePointer-1.U,io.WaveIn)
      }
    }.otherwise{
      FIRInput:=InputSampleMemory.read(SampleAdress)
    }
    //sample handling
    when(io.Enable & SampleCount===0.U){
      InputSampleMemory.write(InputSamplePointer-1.U,io.WaveIn)
    }
  }





}

