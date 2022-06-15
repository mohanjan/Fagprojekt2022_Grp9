import chisel3._
import chisel3.util._

// ALU module is used by the execute stage for ALU operations

class ALU() extends Module {
  val io = IO(new Bundle {
    val rs1 = Input(UInt(18.W))
    val rs2 = Input(UInt(18.W))
    val rd = Input(UInt(18.W))

    val Operation = Input(UInt(8.W))
    val Out = Output(UInt(18.W))
  })
  
  // Default output is 0
  // Execute stage sends an operation, decoded by the switch statement
  // Output is sent to execute stage
  
  val Temp = Wire(SInt(18.W))

  Temp := io.rs1.asSInt

  io.Out := 0.U

  switch(io.Operation) {
    is(0.U){
      //addition
      io.Out := io.rs1 + io.rs2
    }
    is(1.U){
      //subtraction
      io.Out := io.rs1 - io.rs2
    }
    is(2.U){
      //multiplication
      io.Out := (io.rs1 * io.rs2)(17,0)
    }
    is(3.U){
      //bitshift right logical
      io.Out := (io.rs1 << io.rs2(5,0))(17,0)
    }
    is(4.U){
      //bitshift left logical 
      io.Out := (io.rs1 >> io.rs2)(17,0)
    }
    is(5.U){
      //bitshift right arithmetic
      io.Out := (Temp << io.rs2(5,0))(17,0)
    }
    is(6.U){
      //bitshift left arithmetic
      io.Out := (Temp >> io.rs2)(17,0)
    }
    is(7.U){
      // bitwise AND
      io.Out := io.rs1 & io.rs2
    }
    is(8.U){
      // bitwise OR
      io.Out := io.rs1 | io.rs2
    }
    is(9.U){
      // bitwise XOR
      io.Out := io.rs1 ^ io.rs2
    }
    is(10.U){
      io.Out := (io.rs1 * io.rs2) >> 9
    }
    is(11.U){
      // multiply accumulate
      io.Out := io.rd + (io.rs1 * io.rs2)(17,0)
    }
  }
}
