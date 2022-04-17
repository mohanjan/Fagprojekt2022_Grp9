import chisel3._
import chisel3.util._
import chisel3.experimental.Analog
import chisel3.util.HasBlackBoxInline
import SPI_CMDS._


object SPI_CMDS {
  val CMDResetEnable = 102.U(8.W)
  val CMDReset = 153.U(8.W)
  val CMDSPIRead = 3.U(8.W)
  val CMDSPIWrite = 2.U(8.W)
}

class MemoryController(Count: Int) extends Module {
  val io = IO(new Bundle {
    val ReadEnable = Input(Bool())
    val WriteEnable = Input(Bool())
    val Address = Input(UInt(24.W))
    val WriteData = Input(UInt(18.W))

    val ReadData = Output(UInt(18.W))

    val Ready = Output(Bool())
    val Completed = Output(Bool())
  })
  val SPI = IO(new Bundle{
    val SCLK = Output(Bool())
    val CE = Output(Bool())
    val MOSI = Output(Bool())
    val MISO = Input(Bool())
  })
  /*
  val SPI = IO(new Bundle{
    val SCLK = Output(Bool())
    val CE = Output(Bool())
    val SPIBus = Analog(4.W)
  })
  */

  // Default

  val DataReg = RegInit(0.U(16.W))
  val MOSI = Wire(Bool())
  val MISO = Wire(Bool())
  MOSI := false.B

  /*
  val TriState = Module(new LCDBusDriver)

  SPI.SPIBus <> TriState.io.bus

  val SPIData = Wire(UInt(4.W))
  SPIData := 0.U

  when(MOSI){
    SPIData := "b0010".U
  }

  TriState.io.driveData := SPIData

  TriState.io.drive := false.B

  MISO := TriState.io.busData(0)
  */

  SPI.MOSI := MOSI
  MISO := SPI.MISO

  SPI.CE := true.B
  io.Completed := false.B
  io.Ready := false.B

  io.ReadData := DataReg

  val boot :: resetEnable :: resetWait :: setReset :: idle :: read :: write :: quadWrite :: quadRead :: Nil = Enum(9)
  val StateReg = RegInit(boot)

  val transmitCMD :: transmitAddress :: transmitData :: writeDelay :: receiveData :: computeAddress :: Nil = Enum(6)
  val SubStateReg = RegInit(transmitCMD)

  val CntReg = RegInit(0.U(14.W))

  val WriteDataReg = RegInit(0.U(16.W))
  val AddressReg = RegInit(0.U(24.W))

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


  switch(StateReg) {
    is(boot){
      // Resets clock for reset command

      CntReg := CntReg + 1.U

      when(CntReg === 1.U){ //Set to 1 for testing, normally "h3fff"
        SPI.CE := false.B
        ClockReset := true.B
        StateReg := resetEnable
        CntReg := 0.U
      }
    }
    is(resetEnable) {
      SPI.CE := false.B
      ClockEn := true.B
      //TriState.io.drive := true.B

      MOSI := CMDResetEnable(7.U - CntReg)

      when(NextStateInv){
        CntReg := CntReg + 1.U
      }

      when(CntReg === 7.U && NextStateInv) {
        SPI.CE := true.B
        CntReg := 0.U
        MOSI := 0.U
        StateReg := resetWait
      }
    }
    is(resetWait){
      // A Delay between the two commands
      SPI.CE := true.B

      when(NextStateInv){
        ClockReset := true.B
        StateReg := setReset
      }
    }
    is(setReset) {
      SPI.CE := false.B
      ClockEn := true.B
      //TriState.io.drive := true.B

      MOSI := CMDReset(7.U - CntReg)

      when(NextStateInv){
        CntReg := CntReg + 1.U
      }

      when(CntReg === 7.U && NextStateInv) {
        SPI.CE := true.B
        CntReg := 0.U
        //io.Completed := true.B

        StateReg := idle
      }
    }
    is(idle) {
      // Waits for command from main

      SPI.CE := true.B
      io.Ready := true.B

      when(io.ReadEnable) {
        StateReg := read
        SubStateReg := transmitCMD
        SPI.CE := false.B
        ClockReset := true.B
        AddressReg := io.Address
      }.elsewhen(io.WriteEnable) {
        StateReg := write
        SubStateReg := transmitCMD
        SPI.CE := false.B
        ClockReset := true.B
        AddressReg := io.Address
        WriteDataReg := io.WriteData
      }
    }
    is(read) {
      switch(SubStateReg) {
        is(transmitCMD) {
          SPI.CE := false.B
          ClockEn := true.B
          //TriState.io.drive := true.B

          MOSI := CMDSPIRead(7.U - CntReg)
          SubStateReg := transmitCMD

          when(NextStateInv){
            CntReg := CntReg + 1.U
          }

          when(CntReg === 7.U && NextStateInv) {
            CntReg := 0.U
            SubStateReg := transmitAddress
          }
        }

        is(transmitAddress) {
          SPI.CE := false.B
          ClockEn := true.B
          //TriState.io.drive := true.B

          MOSI := io.Address(23.U - CntReg)
          SubStateReg := transmitAddress

          when(NextStateInv){
            CntReg := CntReg + 1.U
          }

          when(CntReg === 23.U && NextStateInv) {
            CntReg := 0.U
            SubStateReg := receiveData
          }
        }
        is(receiveData) {
          SPI.CE := false.B
          ClockEn := true.B

          // Reads on the rising edge of SCLK

          when(RisingEdge){
            DataReg := Cat(DataReg, MISO.asUInt)
            CntReg := CntReg + 1.U
          }

          when(CntReg === 15.U && NextStateInv) {
            io.Completed := true.B
            StateReg := idle
          }
        }
      }
    }
    is(write) {
      //SubStateReg := computeAddress

      switch(SubStateReg) {
        is(transmitCMD) {
          SPI.CE := false.B
          ClockEn := true.B
          //TriState.io.drive := true.B

          MOSI := CMDSPIWrite(7.U - CntReg)
          SubStateReg := transmitCMD

          when(NextStateInv){
            CntReg := CntReg + 1.U
          }

          when(CntReg === 7.U && NextStateInv) {
            CntReg := 0.U
            SubStateReg := transmitAddress
          }
        }
        is(transmitAddress) {
          SPI.CE := false.B
          ClockEn := true.B
          //TriState.io.drive := true.B

          MOSI := AddressReg(23.U - CntReg)
          SubStateReg := transmitAddress

          when(NextStateInv){
            CntReg := CntReg + 1.U
          }

          when(CntReg === 23.U && NextStateInv){
            CntReg := 0.U
            SubStateReg := transmitData
          }
        }
        is(transmitData) {
          SPI.CE := false.B
          ClockEn := true.B
          //TriState.io.drive := true.B

          MOSI := io.WriteData(CntReg)
          SubStateReg := transmitData

          when(NextStateInv){
            CntReg := CntReg + 1.U
          }

          when(CntReg === 15.U && NextStateInv) {
            CntReg := 0.U
            io.Completed := true.B
            StateReg := idle
            SPI.CE := true.B
          }
        }
      }
    }
  }
}
