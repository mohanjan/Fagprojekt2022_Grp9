import chisel3._
import chisel3.util._
import chisel3.experimental.Analog
import chisel3.util.HasBlackBoxInline
import SPI_CMDS._


object SPI_CMDS {
  val CMDResetEnable = 102.U(8.W)
  val CMDReset = 153.U(8.W)
  val CMDQuadMode = "h35".U(8.W)
  val CMDSPIRead = 3.U(8.W)
  val CMDSPIWrite = 2.U(8.W)
  val CMDQPIRead = "hEB".U(8.W)
  val CMDQPIWrite = "h38".U(8.W)
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
    val SO = Input(Vec(4,Bool()))
    val SI = Output(Vec(4,Bool()))
    val Drive = Output(Bool())
  })

  // Default

  val DataReg = RegInit(0.U(16.W))

  SPI.CE := true.B
  io.Completed := false.B
  io.Ready := false.B

  io.ReadData := DataReg

  for(i <- 0 until 4){
    SPI.SI(i) := false.B
  }

  SPI.Drive := false.B

  val boot :: resetEnable :: resetWait :: setReset :: idle :: read :: write :: quadWrite :: quadRead :: quadMode :: Nil = Enum(10)
  val StateReg = RegInit(boot)

  val transmitCMD :: transmitAddress :: transmitData :: writeDelay :: receiveData :: computeAddress :: Nil = Enum(6)
  val SubStateReg = RegInit(transmitCMD)

  val CntReg = RegInit(0.U(14.W))

  val WriteDataReg = RegInit(0.U(16.W))
  val AddressReg = RegInit(0.U(24.W))

  val SPI_mode = RegInit(1.U(1.W))

  val OutQPI = Wire(UInt(4.W))
  OutQPI := 0.U

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
      SPI.Drive := true.B

      SPI.SI(1) := CMDResetEnable(7.U - CntReg)

      when(NextStateInv){
        CntReg := CntReg + 1.U
      }

      when(CntReg === 7.U && NextStateInv) {
        SPI.CE := true.B
        CntReg := 0.U
        SPI.SI(1) := 0.U
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
      SPI.Drive := true.B

      SPI.SI(1) := CMDReset(7.U - CntReg)

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
        switch(SPI_mode){
          is(0.U){
            StateReg := read
          }
          is(1.U){
            StateReg := quadRead
          }
        }
        SubStateReg := transmitCMD
        SPI.CE := false.B
        ClockReset := true.B
        AddressReg := io.Address
      }.elsewhen(io.WriteEnable) {
        switch(SPI_mode){
          is(0.U){
            StateReg := write
          }
          is(1.U){
            StateReg := quadWrite
          }
        }
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
          SPI.Drive := true.B

          SPI.SI(1) := CMDSPIRead(7.U - CntReg)
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
          SPI.Drive := true.B

          SPI.SI(1) := AddressReg(23.U - CntReg)
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
            DataReg := Cat(DataReg, SPI.SO(0).asUInt)
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
      switch(SubStateReg) {
        is(transmitCMD) {
          SPI.CE := false.B
          ClockEn := true.B
          //TriState.io.drive := true.B
          SPI.Drive := true.B

          SPI.SI(1) := CMDSPIWrite(7.U - CntReg)
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
          SPI.Drive := true.B

          SPI.SI(1) := AddressReg(23.U - CntReg)
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
          SPI.Drive := true.B

          SPI.SI(1) := WriteDataReg(CntReg)
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
    is(quadRead){
      switch(SubStateReg) {
        is(transmitCMD) {
          SPI.CE := false.B
          ClockEn := true.B
          SPI.Drive := true.B

          SPI.SI(1) := CMDQPIRead(7.U - CntReg)
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
          SPI.Drive := true.B

          //SPI.SI(1) := io.Address(23.U - CntReg)

          for(i <- 0 until 24 by 4){
            switch(CntReg){
              is(i.U){
                //SPI.SI := io.Address(23-i,20-i)
                OutQPI := AddressReg(23-i,20-i)
              }
            }
          }

          for(i <- 0 until 4){
            SPI.SI(i) := OutQPI(i)
          }

          SubStateReg := transmitAddress

          when(NextStateInv){
            CntReg := CntReg + 4.U
          }

          when(CntReg === 20.U && NextStateInv) {
            CntReg := 0.U
            SubStateReg := receiveData
          }
        }
        is(receiveData) {
          SPI.CE := false.B
          ClockEn := true.B

          when(RisingEdge){
            DataReg := Cat(DataReg, SPI.SO.asUInt)
            CntReg := CntReg + 4.U
          }

          when(CntReg === 12.U && NextStateInv) {
            io.Completed := true.B
            StateReg := idle
          }
        }
      }
    }
    is(quadWrite){
      switch(SubStateReg) {
        is(transmitCMD) {
          SPI.CE := false.B
          ClockEn := true.B
          SPI.Drive := true.B

          SPI.SI(1) := CMDQPIWrite(7.U - CntReg)
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
          SPI.Drive := true.B

          //SPI.SI(1) := io.Address(23.U - CntReg)

          for(i <- 0 until 24 by 4){
            switch(CntReg){
              is(i.U){
                //SPI.SI := io.Address(23-i,20-i)
                OutQPI := AddressReg(23-i,20-i)
              }
            }
          }

          for(i <- 0 until 4){
            SPI.SI(i) := OutQPI(i)
          }

          SubStateReg := transmitAddress

          when(NextStateInv){
            CntReg := CntReg + 4.U
          }

          when(CntReg === 20.U && NextStateInv) {
            CntReg := 0.U
            SubStateReg := transmitData
          }
        }
        is(transmitData) {
          SPI.CE := false.B
          ClockEn := true.B
          SPI.Drive := true.B

          //SPI.SI(1) := io.WriteData(CntReg)


          for(i <- 0 until 16 by 4){
            switch(CntReg){
              is(i.U){
                //SPI.SI := io.Address(23-i,20-i)
                OutQPI := WriteDataReg(15-i,12-i)
              }
            }
          }

          for(i <- 0 until 4){
            SPI.SI(i) := OutQPI(i)
          }

          SubStateReg := transmitData

          when(NextStateInv){
            CntReg := CntReg + 4.U
          }

          when(CntReg === 12.U && NextStateInv) {
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
