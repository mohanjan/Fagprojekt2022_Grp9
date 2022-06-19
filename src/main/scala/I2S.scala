import chisel3._
import chisel3.util._

class I2S(Bitwidth: Int, Count: Int) extends Module {
  val io = IO(new Bundle {
    val Enable = Input(Bool())
    val Left = Output(SInt(Bitwidth.W))
    val Right = Output(SInt(Bitwidth.W))
    val LeftCompleted = Output(Bool())
    val RightCompleted = Output(Bool())
  })

  val I2S = IO(new Bundle{
    val SCLK = Output(Bool())
    val LCLK = Output(Bool())
    //val MCLK = Output(Bool())
    val SDOUT = Input(Bool())
  })

  // Register and state machine definitions.

  val DataReg = RegInit(0.U(Bitwidth.W))
  val OutRegLeft = RegInit(0.S(Bitwidth.W))
  val OutRegRight = RegInit(0.S(Bitwidth.W))

  io.Left := OutRegLeft
  io.Right := OutRegRight

  I2S.LCLK := false.B

  val CntReg = RegInit(0.U(14.W))
  val StateReg = RegInit(0.U(4.W))

  // Clock stuff

  val ClkReg = RegInit(0.U(1.W))
  val ClkCounter = RegInit(0.U(8.W))
  val ClockCounter = RegInit(0.U(8.W)) 

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

  I2S.SCLK := (ClkReg & ClockEn)

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
      I2S.LCLK := false.B

      when(RisingEdge){
        DataReg := Cat(DataReg, I2S.SDOUT.asUInt)
        CntReg := CntReg + 1.U
      }

      when(NextStateInv && CntReg === (Bitwidth - 1).U){
        StateReg := StateReg + 0.U
        I2S.LCLK := true.B
        io.LeftCompleted := true.B
        OutRegLeft := DataReg.asSInt
        CntReg := 0.U
      }
    }
    is(1.U){
      I2S.LCLK := true.B

      when(RisingEdge){
        DataReg := Cat(DataReg, I2S.SDOUT.asUInt)
        CntReg := CntReg + 1.U
      }

      when(NextStateInv && CntReg === (Bitwidth - 1).U){
        StateReg := StateReg + 0.U
        I2S.LCLK := false.B
        io.RightCompleted := true.B
        OutRegRight := DataReg.asSInt
        CntReg := 0.U
      }
    }
  }
}




