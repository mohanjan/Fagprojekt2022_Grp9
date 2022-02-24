import chisel3._
import chisel3.util._

class ug480 (maxCount: Int) extends Module {
  val io = IO(new Bundle {

    val Temperature= Reg(UInt(16.W))
    val VccInt = Reg(UInt(16.W))
    val VccAux = Reg(UInt(16.W))
    val Vccbram = Reg(UInt(16.W))
    val Aux0 = Reg(UInt(16.W))
    val Aux1 = Reg(UInt(16.W))
    val Aux2 = Reg(UInt(16.W))
    val Aux3 = Reg(UInt(16.W))

    val Alm = Wire(UInt(8.W))
    val Channel = Wire(UInt(5.W))
    val OT = Wire(UInt())
    val EOC = Wire(UInt())
    val EOS = Wire(UInt())

    val DCLK = Input(Bool())
    val RESET = Input(Bool())
    val VP = Input(Bool())
    val VN = Input(Bool())
    val VauXP = Input(UInt(3.W))
    val VauXN = Input(UInt(3.W))
  })

    val Busy = Wire(UInt())
    val Channel = Wire(UInt(5.W))
    val drdy = Wire(UInt())

    
    val daddr = Reg(UInt(7.W))
    val di_drp = Reg(UInt(16.W))
    val do_drp = Wire(UInt(16.W))
    val VauXPActive = Wire(UInt(16.W))
    val VauXNActive = Wire(UInt(16.W))
    
    val Den = Reg(UInt(2.W))
    val Dwe = Reg(UInt(2.W))



}
// generate Verilog
object Synth extends App {
  (new chisel3.stage.ChiselStage).emitVerilog(new DSP(200000000))

}

