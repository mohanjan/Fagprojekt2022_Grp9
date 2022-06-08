import chisel3._
import chisel3.experimental._
import chisel3.util._
import scala.xml._
import java.io._


class DSP(maxCount: Int, xml: scala.xml.Elem) extends Module {
  val io = IO(new Bundle {
    val In = Input(SInt(16.W))
    val Out = Output(SInt(16.W))
  })
  val SPI = IO(new Bundle{
    val SCLK = Output(Bool())
    val CE = Output(Bool())
    val SO = Input(Vec(4,Bool()))
    val SI = Output(Vec(4,Bool()))
    val Drive = Output(Bool())
  })

  

  var CoreCount = 0 

  for (CAP <- (xml \\ "CAP")) {
    CoreCount += 1
  }

  val SPIArbiter = Module(new SPIArbiter(CoreCount))

  SPIArbiter.SPI <> SPI

  var CORE = 0

  for (CAP <- (xml \\ "CAP")) {
    val Program = (CAP \ "Program").text

    val SubDSP = Module(new SubDSP(Program))

    doNotDedup(SubDSP)

    SubDSP.io.In := io.In.asUInt
    io.Out := SubDSP.io.Out.asSInt    

    SubDSP.io.SPIMemPort <> SPIArbiter.io.MemPort(CORE)

    CORE += 1 
  }

  

  /*

  val SPIArbiter = Module(new SPIArbiter(2))

  SPIArbiter.SPI <> SPI

  val SubDSP = Module(new SubDSP("MachineCode.mem"))

  doNotDedup(SubDSP)

  SubDSP.io.In := io.In.asUInt
  //io.Out := SubDSP.io.Out.asSInt    

  SubDSP.io.SPIMemPort <> SPIArbiter.io.MemPort(0)

  val SubDSP2 = Module(new SubDSP("Penis.mem"))

  doNotDedup(SubDSP2)

  SubDSP2.io.In := io.In.asUInt
  //io.Out := SubDSP2.io.Out.asSInt    

  SubDSP2.io.SPIMemPort <> SPIArbiter.io.MemPort(1)

  io.Out := (SubDSP.io.Out.asSInt + SubDSP2.io.Out.asSInt )

  */

}
// generate Verilog
object DSP extends App {
  val xml = XML.loadFile("config.xml")
  (new chisel3.stage.ChiselStage).emitVerilog(new DSP(100000000, xml))
}

