import chisel3._
import chisel3.util._
import Core._

class ExecuteStage extends Module {
  val io = IO(new Bundle {
    val x = Input(Vec(16,UInt(18.W)))
    val MemPort = new MemPort
    val Stall = Output(Bool())
    val Clear = Input(Bool())
  })
  val In = IO(new Bundle {
    val Type = Input(UInt(2.W))
    val rs1 = Input(UInt(4.W))
    val rs2 = Input(UInt(4.W))
    val rd = Input(UInt(4.W))
    val AImmediate = Input(UInt(11.W))
    val ASImmediate = Input(SInt(11.W))
    val AOperation = Input(UInt(4.W))
    val MemOp = Input(UInt(1.W))
    val MemAddress = Input(UInt(11.W))
    val COperation = Input(UInt(2.W))
    val COffset = Input(SInt(6.W))
  })
  val Out = IO(new Bundle {
    val WritebackMode = Output(UInt(4.W))
    val WritebackRegister = Output(UInt(4.W))
    val ALUOut = Output(UInt(18.W))
    val JumpValue = Output(UInt(18.W))
  })

  // Init
  
  val ALU = Module(new ALU())
  val BranchComp = Module(new BranchComp())

  // Default

  io.MemPort.Enable := false.B
  io.MemPort.Address := 0.U
  io.MemPort.WriteData := 0.U
  io.MemPort.WriteEn := false.B

  io.Stall := false.B

  ALU.io.rs2 := 0.U
  ALU.io.rs1 := 0.U
  ALU.io.rd := 0.U
  ALU.io.Operation := 0.U

  BranchComp.io.rs2 := 0.U
  BranchComp.io.rs1 := 0.U
  BranchComp.io.PC := 0.U
  BranchComp.io.Offset := 0.S
  BranchComp.io.Operation := 0.U

  val WritebackMode = RegInit(0.U(4.W))
  val WritebackRegister = RegInit(0.U(4.W))
  val ALUOutReg = RegInit(0.U(18.W))
  val COffsetReg = RegInit(0.U(6.W))

  val DataHazard = RegInit(0.U(4.W))

  val rs1 = Wire(UInt(18.W))
  val rs2 = Wire(UInt(18.W))
  val rd = Wire(UInt(18.W))

  val swStall = RegInit(0.U(1.W))
  val lwStall = RegInit(0.U(1.W))

  // Data hazard protection

  rs1 := io.x(In.rs1)
  rs2 := io.x(In.rs2)
  rd := io.x(In.rd)

  when(In.rs1 === DataHazard){
    switch(WritebackMode){
      is(Arithmetic){
        rs1 := ALUOutReg
      }
      is(ImmidiateArithmetic){
        rs1 := ALUOutReg
      }
      is(MemoryI){
        rs1 := io.MemPort.ReadData
      }
    }
  }

  when(In.rs2 === DataHazard){
    switch(WritebackMode){
      is(Arithmetic){
        rs2 := ALUOutReg
      }
      is(ImmidiateArithmetic){
        rs2 := ALUOutReg
      }
      is(MemoryI){
        rs2 := io.MemPort.ReadData
      }
    }
  }

  when(In.rd === DataHazard){
    switch(WritebackMode){
      is(Arithmetic){
        rd := ALUOutReg
      }
      is(ImmidiateArithmetic){
        rd := ALUOutReg
      }
      is(MemoryI){
        rd := io.MemPort.ReadData
      }
    }
  }

  Out.ALUOut := ALUOutReg
  Out.WritebackMode := WritebackMode
  Out.WritebackRegister := WritebackRegister
  Out.JumpValue := COffsetReg

  ALUOutReg := ALU.io.Out

  // Clear overwrites registers

  when(io.Clear){
    ALUOutReg := 0.U
    WritebackMode := 0.U
    WritebackRegister := 0.U
    COffsetReg := 0.U
  }

  // Logic

  
  switch(In.Type){
    is(0.U){
      when(In.AOperation <= 7.U){
        ALU.io.Operation := In.AOperation

        ALU.io.rs2 := rs2
        ALU.io.rs1 := rs1

        WritebackMode := Arithmetic
        WritebackRegister := In.rd

        DataHazard := In.rd
      }.elsewhen(In.AOperation === 8.U){
        ALU.io.Operation := In.AOperation

        ALU.io.rs2 := rs2
        ALU.io.rs1 := rs1
        ALU.io.rd := rd

        WritebackMode := Arithmetic
        WritebackRegister := In.rd

        DataHazard := In.rd
      }.elsewhen(In.AOperation === 9.U){

        // lw rd, rs1

        io.MemPort.Enable := true.B

        //io.MemPort.Address := io.x(In.rs1)

        // Was causing combinational loop.

        when(In.rs1 === DataHazard && In.rs1 =/= 0.U){
          switch(WritebackMode){
            is(Arithmetic){
              io.MemPort.Address := ALUOutReg
            }
            is(ImmidiateArithmetic){
              io.MemPort.Address := ALUOutReg
            }
          }
        }.otherwise{
          io.MemPort.Address := io.x(In.rs1)
        }

        WritebackMode := MemoryI
        WritebackRegister := In.rd

        DataHazard := In.rd

        when(!io.MemPort.Completed){
          io.Stall := true.B
        }
      }.elsewhen(In.AOperation === 10.U){

        // sw rd, rs1
 
        io.MemPort.Enable := true.B
        io.MemPort.WriteEn := true.B

        //io.MemPort.Address := io.x(In.rs1)
        //io.MemPort.WriteData := io.x(In.rd)

        when(In.rs1 === DataHazard){
          switch(WritebackMode){
            is(Arithmetic){
              io.MemPort.Address := ALUOutReg
            }
            is(ImmidiateArithmetic){
              io.MemPort.Address := ALUOutReg
            }
          }
        }.otherwise{
          io.MemPort.Address := io.x(In.rs1)
        }

        io.MemPort.WriteData := rd
        //io.MemPort.Address := rs1

        WritebackMode := Nil

        when(!io.MemPort.Completed){
          io.Stall := true.B
        }
      }
    }
    is(1.U){
      when(In.AOperation === 1.U){
        ALU.io.rs2 := 0.U
        ALU.io.rs1 := In.AImmediate
        ALU.io.Operation := 0.U
      }.elsewhen(In.AOperation === 2.U){
        ALU.io.rs2 := 0.U

        val upper = Wire(UInt(9.W))
        upper := In.AImmediate(8,0)
        val lower = Wire(UInt(9.W))
        //lower := io.x(In.rd)(8,0)
        lower := rd(8,0)
        val cat = Wire(UInt(18.W))
        cat := Cat(upper,lower)

        ALU.io.rs1 := cat
        ALU.io.Operation := 0.U
      }.otherwise{
        when(In.ASImmediate < 0.S){
          ALU.io.Operation := 1.U
          ALU.io.rs2 := (0.S - In.ASImmediate).asUInt
          //ALU.io.rs1 := io.x(In.rd)
          ALU.io.rs1 := rd

        }.otherwise{
          ALU.io.rs2 := In.ASImmediate.asUInt
          //ALU.io.rs1 := io.x(In.rd)
          ALU.io.rs1 := rd
          ALU.io.Operation := 0.U
        }
      }
      WritebackMode := Arithmetic
      WritebackRegister := In.rd

      DataHazard := In.rd
    }
    is(2.U){
      io.MemPort.Address := In.MemAddress
      io.MemPort.WriteData := rd
      io.MemPort.Enable := true.B
      io.MemPort.WriteEn := In.MemOp

      switch(In.MemOp){
        is(0.U){
          WritebackMode := MemoryI
          DataHazard := In.rd
        }
        is(1.U){
          WritebackMode := Nil
        }
      }

      when(!io.MemPort.Completed){
        io.Stall := true.B
      }

      WritebackRegister := In.rd
    }
    is(3.U){
      BranchComp.io.rs2 := rs2
      BranchComp.io.rs1 := rs1

      BranchComp.io.Operation := In.COperation
      BranchComp.io.PC := io.x(1) - 2.U
      BranchComp.io.Offset := In.COffset

      COffsetReg := BranchComp.io.Out

      when(BranchComp.io.CondCheck){
        WritebackMode := Conditional
      }.otherwise{
        WritebackMode := Nil
      }

      when(io.Clear){
        WritebackMode := Nil
      }

      WritebackRegister := 0.U
    }
  }
}