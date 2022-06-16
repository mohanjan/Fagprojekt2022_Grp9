import chisel3._
import chisel3.util._
import chisel3.util.experimental.loadMemoryFromFileInline

class FirEngine() extends Module {
  val io = IO(new Bundle {
    val WaveIn = Input(SInt(18.W))
    val WaveOut = Output(SInt(18.W))
    val Registers = Flipped(new MemPort)
    val MemPort = new MemPort
  })

  // Defaults

  io.WaveOut := 0.S

  io.MemPort.Enable := false.B
  io.MemPort.WriteEn := false.B
  io.MemPort.WriteData := 0.U
  io.MemPort.Address := 0.U

  io.Registers.ReadData := 0.U
  io.Registers.Completed := false.B

  // Communication Registers

  val DataReg = Reg(Vec(128, UInt(18.W)))

  when(io.Registers.Enable) {
    val ReadWritePort = DataReg(io.Registers.Address)
    when(io.Registers.WriteEn) {
      ReadWritePort := io.Registers.WriteData
    }.otherwise {
      io.Registers.ReadData := ReadWritePort
    }
  }

  /*REGISTER FlAGS
  * DataReg(0): flags
  * - Enable(0)(0)
  * - Completed(0)(1)
  * - states(0)(2-3)
  * - Filter length(0)(15,4)
  * OutputReg (1)
   */


  //FIR Engine controll logic

  //Wire definitions
  val FIRInput = Wire(SInt())
  val CoeffCount = Wire(UInt())
  val SampleAdress = Wire(UInt())
  val ReadSample = Wire(SInt())

  //test wires
  val CoeffWire = Wire(SInt())
  val Fircomputation36 = Wire(SInt())
  val Fircomputation18 = Wire(SInt())
  val maxcountwire = Wire(UInt())
  val Halfcountwire = Wire(UInt())

  // Memory definitions

  val CoeffMemory = SyncReadMem(1024, SInt(18.W))
  val MAccReg = Reg(SInt(36.W))

  val SampleCount = Reg(UInt(11.W))
  val InputSamplePointer = Reg(UInt(11.W))
  val OutputSamplePointer = Reg(UInt(11.W))

  loadMemoryFromFileInline(CoeffMemory, "IOFilterCoeffsQ0_17.txt")
  //todo adress protection

  // Defaults
  io.WaveOut := DataReg(1).asSInt
  SampleCount := 0.U
  CoeffCount := 0.U
  //dynamic bit extraction of register: ((Register & (2^(MSB+1)-1).U)>>LSB).asUInt
  Halfcountwire := ((((DataReg(0) & (2 ^ (15 + 1) - 1).U) >> 4).asUInt + 1.U) >> 1).asUInt - 1.U //divide and round up
  maxcountwire := ((DataReg(0) & (2 ^ (15 + 1) - 1).U) >> 4).asUInt
  ReadSample := 0.S

  //TestWires
  CoeffWire := CoeffMemory.read(CoeffCount)
  Fircomputation36 := 0.S
  Fircomputation18 := 0.S


  when(SampleCount > 0.U) {
    //FIR filtering
    //note first filterlength of samples are garbage, but since they are gone in a split second it is fine
    Fircomputation36 := CoeffWire * FIRInput
    MAccReg := MAccReg + Fircomputation36
  }
  //todo change the counter such that it does the 0th convolution when enable is high
  //States



  DataReg(0) :=DataReg(0)|2.U
  //output state:
  when(SampleCount === ((DataReg(0) & (2 ^ (15 + 1) - 1).U) >> 4).asUInt) {
    DataReg(1) := (MAccReg + Fircomputation36 >> 17) (17, 0).asUInt
    MAccReg := 0.S
    DataReg(0) := DataReg(0) | 2.U      //setting Completed

    //SamplePointer update
    when(InputSamplePointer > 0.U) {
      InputSamplePointer := InputSamplePointer - 1.U
    }.elsewhen(InputSamplePointer === 0.U) {
      InputSamplePointer := maxcountwire - 1.U
    }


    //CountUp start state:
  }.elsewhen((SampleCount > 0.U) && (SampleCount < Halfcountwire) || (DataReg(0) & 1.U)(0) && (SampleCount === 0.U)) {
    when(io.MemPort.Completed) {                //todo add arbiter write and read protection
      SampleCount := SampleCount + 1.U
      CoeffCount := SampleCount
      DataReg(0) := DataReg(0) & "b11_1111_1111_1111_1100".U
    }



    //CountDown state:
  }.elsewhen(SampleCount >= Halfcountwire) {
    when(io.MemPort.Completed) {                //todo add arbiter write and read protection
    SampleCount := SampleCount + 1.U
    CoeffCount := ((DataReg(0) & (2 ^ (15 + 1) - 1).U) >> 4).asUInt - 2.U - SampleCount
  }
  }

  //read/write samples
  when(SampleCount === ((DataReg(0) & (2 ^ (15 + 1) - 1).U) >> 4).asUInt) {
    //Sample write
    io.MemPort.Enable := 1.U
    io.MemPort.WriteEn := 1.U
    io.MemPort.WriteData := io.WaveIn.asUInt
    when(InputSamplePointer > 0.U) {
      io.MemPort.Address := InputSamplePointer - 1.U
    }.otherwise {
      io.MemPort.Address(maxcountwire - 1.U)
    }
  }.elsewhen(SampleCount > 0.U ) {
    //Sample Read
    io.MemPort.Enable := 1.U
    io.MemPort.Address(SampleAdress)
    ReadSample := io.MemPort.ReadData.asSInt
  }

  //sampleadress
  when(InputSamplePointer + SampleCount <= maxcountwire) {
    SampleAdress := InputSamplePointer + SampleCount
  }.otherwise {
    SampleAdress := InputSamplePointer + SampleCount - ((DataReg(0) & (2 ^ (15 + 1) - 1).U) >> 4).asUInt - 1.U
  }

  //sample handling
  when(SampleCount === 1.U) {
    FIRInput := io.WaveIn
  }.otherwise {
    FIRInput := ReadSample
  }

}