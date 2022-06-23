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
/*
  FIRENGINE DESIGN thoughts:

    Basic spec:
  first coeffs are loaded, filterlength is loaded

  a state is then chosen from (FIR, IIR , or SIMD MACC)
  //FIR is fir filtering
  //IIR is iir filtering
  //SIMD is either enable,Load coeffs, subtract,accumulate, and from 

  REGISTERBANK:
    (0)=OutputReg
  (1)=flags and constants
  (2)=SampleCount
  (3)=MAccReg
  (4)=filterlength/SIMD Value

  FLAGS:
    * - (0)(0)Enable
    * - (0)(1)Completed
    * - (0)(2-3)states
    * - (0)(4)filter-full 	IF SIMD add or mult [0=add/1=mult]
  * -	(0)(5-10) Bitshift

  If at any poInt the state is changed then filter full is set to 0.

  Filter starts at Filterlength
*/

  /*

  val FilterLength = Wire(UInt())
  val HalfCount =  Wire(UInt())
  val SIMDVal = 	Wire(SInt())
  val SIMDMode = 	Wire(UInt())
  val Bitshift =	Wire(UInt())
  val Sample =	Wire(SInt())
  val Coeff = 	Wire(SInt())
  val MAcc =		Wire(SInt())
  val SampleCount = Wire(UInt())


  val Enable = 	Wire(UInt())
  val Completed = 	Wire(UInt())
  val States = 	Wire(UInt())

  val Ready = 	Wire(UInt())
  val FirstHalf = 	Wire(UInt())
  val LastHalf = 	Wire(UInt())
  val Outputting = 	Wire(UInt())
  val MAcc =		Wire(SInt())
  val Coeff =		Wire(SInt())
  val Sample =	Wire(SInt())

  val CoeffMemory = SyncReadMem(1024, SInt(18.W))
  loadMemoryFromFileInline(CoeffMemory, "FIRfilterCoeffs.txt")
  
  
  //defaults
  FilterLength :=	DataReg(4)
  SIMDVal :=		DataReg(4)
  SIMDMode :=		FilterLength
  Enable := 		DataReg(0)&1.U
  Completed := 	(DataReg(0)>>1).asUInt & 1.U
  States := 		(DataReg(0)>>2).asUInt & 3.U
  Bitshift :=		(DataReg(0)>>5).asUInt & 31.U
  HalfCount := 0.U
  Filterfull := 0.U

  Ready := 		0.U
  FirstHalf :=	0.U
  LastHalf := 	0.U
  Outputting:= 	0.U
  Coeff:=		  CoeffMemory.read(SampleCount)
  Sample:=		io.MemPort.ReadData
  when(Ready.asBool){Sample:=io.WaveIn}
  MAcc:=		Coeff*Sample
  HalfCount:= 	(Filterlength>>2).asUInt
  Filterfull:=	(DataReg(0)>>4)&1.U
  Ready := 		SampleCount===0.U
  FirstHalf :=	SampleCount<HalfCount
  LastHalf := 	SampleCount>HalfCount
  Outputting:= 	SampleCount===Filterlength

  //FunctionStates
  val fir :: iir :: simd :: Nil = Enum(3)

  when (States=/=simd){ 				//when IIR|FIR
    

  }.else{
    Coeff:=SIMDVal
  }


  //MAcc
  when(Enable&Ready|SampleCount>0.U){
    DataReg(3):=DataReg(3)+MAcc
  }


  when(Outputting){
    SampleCount:=	0.U
    DataReg(0):=	DataReg(3)
    DataReg(3):=	0.U

  }.elsewhen (IIR|FIR)&(Ready&Enable|FirstHalf){
    SampleCount= 1+SampleCount
    CoeffCount= SampleCount
  }.elsewhen(LastHalf){

  }.otherwise{}
  

  }



  */

}
