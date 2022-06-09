import chisel3._
import chisel3.experimental._
import chisel3.util._
import scala.xml._
import java.io._
import Assembler._

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
  var OutputCount = 0

  for (CAP <- (xml \\ "CAP")) {
    CoreCount += 1
  }

  val SPIArbiter = Module(new SPIArbiter(CoreCount))

  SPIArbiter.SPI <> SPI

  var CORE = 0

  val CAP_IOs = Wire(Vec(CoreCount, new CAP_IO))

  for (CAP <- (xml \\ "CAP")){
    val Program = (CAP \ "Program").text

    if((CAP \ "@top").text == "true"){
      OutputCount += 1
    }

    replace_pseudo(Program);
    demangle_identifiers(Program);
    read_assembly(Program);

    val SubDSP = Module(new SubDSP("Programs/MachineCode/" + Program + ".mem"))

    doNotDedup(SubDSP)

    SubDSP.SPI.SPIMemPort <> SPIArbiter.io.MemPort(CORE)

    CAP_IOs(CORE) <> SubDSP.io.Sub_IO

    CORE += 1 
  }

  CORE = 0

  // Input Connector

  var OutputCNT = 0

  val OutputConnector = Module(new NodeConnector(OutputCount))

  for (CAP <- (xml \\ "CAP")){
    var NODECOUNT = (CAP \\ "Input" \\ "@node").size

    if(NODECOUNT > 1){

      val NodeConnector = Module(new NodeConnector(NODECOUNT))

      for(i <- 0 until NODECOUNT){
        val NODE = (CAP \\ "Input" \\ "@node")(i).text

        if(NODE == "In"){
          //CAP_IOs(CORE).In := io.In.asUInt
          NodeConnector.io.In(i) := io.In.asUInt
        }else{
          var INPUT = NODE.toInt
          //CAP_IOs(CORE).In := CAP_IOs(INPUT).Out
          NodeConnector.io.In(i) := CAP_IOs(INPUT).Out
        }
      }  

      CAP_IOs(CORE).In := NodeConnector.io.Out

    }else{
      val NODE = (CAP \\ "Input" \\ "@node").text

      if(NODE == "In"){
        //CAP_IOs(CORE).In := io.In.asUInt
        CAP_IOs(CORE).In  := io.In.asUInt
      }else{
        var INPUT = NODE.toInt
        //CAP_IOs(CORE).In := CAP_IOs(INPUT).Out
        CAP_IOs(CORE).In := CAP_IOs(INPUT).Out
      }
    }

    // Output connection 

    if((CAP \ "@top").text == "true"){
      OutputConnector.io.In(OutputCNT) := CAP_IOs(CORE).Out
      OutputCNT += 1
    }
    
    CORE += 1

  }

  io.Out := OutputConnector.io.Out(15,0).asSInt

  //io.Out := CAP_IOs(1).Out.asSInt


}

// generate Verilog
object DSP extends App {
  val xml = XML.loadFile("config.xml")
  (new chisel3.stage.ChiselStage).emitVerilog(new DSP(100000000, xml))
}




