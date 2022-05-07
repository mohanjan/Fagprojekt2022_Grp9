import chisel3._

class IOFilter(numberOfDSPSLices:Int) extends Module {
  val io = IO(new Bundle {
    val WaveIn = Input(UInt(18.W))
    val WaveOut = Output(UInt(18.W))
    val SampleType = Input(Bool())
    val Enable = Output(Bool())
    val Completed = Output(Bool())
  })

  // Defaults

  io.WaveOut := 0.U
  io.Enable := false.B
  io.Completed := false.B

  // Memory elements

  //MemControl FSM
  //TODO Make control logic controlling the control bits


  //DSP slice
  // TODO describe the DSP-slice in logic and instantiate the number of engines using parameter






}




/*DESIGN:
1 selctorreg is set to 0. The coeff is found at the (CoeffReg) and loaded into the register connected to the multiply register on all the dspslices.Coeffreg is incremented by 1. If coeffReg>=(coeffsize-1) then reset and set end=1. coeff is loaded into all mult registers. Increment selectorbit.
LOOP START
2 If startreg+runningReg1+ID<(sampleSize+coeffsize-1) then sample 1 is found at startReg+runningReg1+ID. Else then sample 1 is found at startReg+runningReg1+ID-sampleSize. If startreg+runningReg1+ID<(sampleSize+coeffsize-1) then runningReg1=startReg+runningReg1-sampleSize.Increment selectorbit.
3 If startreg-runningReg2-ID>(coeffsize-1) then sample 2 is found at startReg-runningReg2-ID. Else then sample 1 is found at startReg-runningReg2-ID+sampleSize. If startreg-runningReg2+ID>(sampleSize+coeffsize-1) then runningReg2=startReg-runningReg2+sampleSize.if (ID<noDSPSlices) then go to loop start else reset selector bit.

 */