import chisel3._
import chisel3.experimental.Analog
import chisel3.util.HasBlackBoxInline

class LCDBusDriver extends BlackBox with HasBlackBoxInline {
  val io = IO(new Bundle{
    val busData =     Output(UInt(4.W))   // data on the bus
    val driveData =   Input(UInt(4.W))    // data put on the bus if io.drive is asserted
    val bus =         Analog(4.W)         // the tri-state bus
    val drive =       Input(Bool())           // when asserted the module drives the bus
  })

  setInline("LCDBusDriver.v",
    s"""
       |module LCDBusDriver(
       |    output [${3}:0] busData,
       |    input [${3}:0] driveData,
       |    inout [${3}:0] bus,
       |    input drive);
       |
       |    assign bus = drive ? driveData : {(${3}){1'bz}};
       |    assign busData = bus;
       |endmodule
       |""".stripMargin
  )
}
