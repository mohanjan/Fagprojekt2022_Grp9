/*

class I2S(Bitwidth: Int) extends Module {
  val io = IO(new Bundle {
    val Enable = Input(Bool())
    val ReadData = Output(UInt(18.W))
    val Completed = Output(Bool())
  })

  val Out = IO(new Bundle{
    val SCLK = Output(Bool())
    val LCLK = Output(Bool())
    //val MCLK = Output(Bool())
    val SDOUT = Input(Bool())
  })

  // Register and state machine definitions.

  val DataRigthReg = RegInit(0.U(Bitwidth.W))
  val DataLeftReg = RegInit(0.U(Bitwidth.W))

  io.ReadData := DataReg

  val CntReg = RegInit(0.U(14.W))

  val StateReg = RegInit(0.U(4.W))

  // Clock stuff

  val ClkReg = RegInit(0.U(1.W))
  val ClkCounter = RegInit(0.U(8.W))

  val ClkRegDelay = RegInit(0.U(1.W)) // Used to determine rising and falling edge
  ClkRegDelay := ClkReg

  val NextState = Wire(Bool()) // Goes high one clock cycle before rising edge of SCLK
  val NextStateInv = Wire(Bool()) // Goes high one clock cycle before falling edge of SCLK

  val ClockEn = Wire(Bool()) // Enables SCLK output
  val ClockReset = Wire(Bool()) // Resets clock to 0

  val RisingEdge = Wire(Bool())
  val FallingEdge = Wire(Bool())

  NextState := false.B
  NextStateInv := false.B

  ClockEn := false.B
  ClockReset := false.B

  RisingEdge := false.B
  FallingEdge := false.B

  SPI.SCLK := (ClkReg & ClockEn)

  ClkCounter := ClkCounter + 1.U

  when(ClkCounter === Count.U){
    ClkReg := !ClkReg
    ClkCounter := 0.U

    when(!ClkReg.asBool){
      NextState := true.B
    }
    when(ClkReg.asBool){
      NextStateInv := true.B
    }
  }

  when(ClockReset){
    ClkReg := false.B
    ClkCounter := 0.U
  }

  when(ClkReg.asBool && !ClkRegDelay.asBool){
    RisingEdge := true.B
  }

  when(!ClkReg.asBool && ClkRegDelay.asBool){
    FallingEdge := true.B
  }

  // Actual state machine

  switch(StateReg){
    is(0.U){
      when(RisingEdge){
        DataRightReg := Cat(DataRightReg, SDOUT.asUInt)
        CntReg := CntReg + 1.U
      }

      when(CntReg === Bitwidth.U){
        CntReg := 0.U
        StateReg := StateReg + 1.U
      }
    }
    is(1.U){
      when(RisingEdge){
        DataLeftReg := Cat(DataRightReg, SDOUT.asUInt)
        CntReg := CntReg + 1.U
      }

      when(CntReg === Bitwidth.U){
        CntReg := 0.U
        StateReg := StateReg + 1.U
      }
    }
  }
}
*/



