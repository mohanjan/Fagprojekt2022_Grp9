import chisel3._
import chisel3.experimental._
import chisel3.util._
import scala.xml._
import java.io._
import Assembler._
//import Text._
//package Text


object Text{
    val name = """
               #   .g8PPPbgd     db      `7MMPPPMq.`7MN.   `7MF'     db      
               # .dP'     `M    ;MM:       MM   `MM. MMN.    M      ;MM:     
               # dM'       `   ,V^MM.      MM   ,M9  M YMb   M     ,V^MM.    
               # MM           ,M  `MM      MMmmdM9   M  `MN. M    ,M  `MM    
               # MM.          AbmmmqMA     MM        M   `MM.M    AbmmmqMA   
               # `Mb.     ,' A'     VML    MM        M     YMM   A'     VML  
               #   `"bmmmd'.AMA.   .AMMA..JMML.    .JML.    YM .AMA.   .AMMA.
               #""".stripMargin('#')
}


class DSP(maxCount: Int, xml: scala.xml.Elem) extends Module {

  val In = Wire(UInt(18.W))
  val Out = Wire(UInt(18.W))


  if((xml \\ "IN_OUT" \\ "@init").text == "true"){

    printf("true")

    val io = IO(new Bundle {
      val In_ADC = Input(UInt(1.W))
      val Out_DAC = Output(UInt(1.W))
    })

    val IOMaster = Module(new IOMaster(18))

    IOMaster.io.In_ADC := io.In_ADC
    io.Out_DAC := IOMaster.io.Out_DAC

    In := IOMaster.io.Out_ADC.asUInt
    IOMaster.io.In_DAC := Out(15,0).asSInt

  }else{
    val io = IO(new Bundle {
      val In = Input(SInt(16.W))
      val Out = Output(SInt(16.W))
    })

    In := io.In.asUInt
    io.Out := Out(15,0).asSInt
  }

  val SPI = IO(new Bundle{
    val SCLK = Output(Bool())
    val CE = Output(Bool())
    val MOSI_MISO = Analog(4.W)   
  })    

  var CoreCount = 0 
  var OutputCount = 0

  for (CAP <- (xml \\ "CAP")) {
    CoreCount += 1
  }

  val SPIArbiter = Module(new SPIArbiter(CoreCount))
  val LCDBusDriver = Module(new LCDBusDriver)

  SPI.MOSI_MISO <> LCDBusDriver.io.bus
  LCDBusDriver.io.drive := SPIArbiter.SPI.Drive
  LCDBusDriver.io.driveData := SPIArbiter.SPI.SI.asUInt
  SPIArbiter.SPI.SO := LCDBusDriver.io.busData.asBools
  SPI.SCLK := SPIArbiter.SPI.SCLK
  SPI.CE := SPIArbiter.SPI.CE

  // The following code reads from the config xml file, and instatiates a variable amount 
  // of SubDSP's. 

  var CORE = 0

  val CAP_IOs = Wire(Vec(CoreCount, new CAP_IO))

  for (CAP <- (xml \\ "CAP")){
    val Program = (CAP \ "Program").text
    var Memsize = (CAP \\ "BRAM" \\ "@size").text.toInt
    var SPIRAM_Offset = (CAP \\ "DRAM" \\ "@offset").text.toInt

    if((CAP \ "@top").text == "true"){
      OutputCount += 1
    }

    replace_pseudo(Program);
    demangle_identifiers(Program);
    read_assembly(Program);

    val SubDSP = Module(new SubDSP("Programs/MachineCode/" + Program + ".mem", Memsize, SPIRAM_Offset))

    doNotDedup(SubDSP)

    SubDSP.SPI.SPIMemPort <> SPIArbiter.io.MemPort(CORE)

    CAP_IOs(CORE) <> SubDSP.io.Sub_IO

    CORE += 1 
  }

  CORE = 0

  // Input Connector

  // The following code configures the inputs and outputs of the SubDSP's in accordance with the
  // config XML file

  var OutputCNT = 0

  val OutputConnector = Module(new NodeConnector(OutputCount))

  for (CAP <- (xml \\ "CAP")){
    var NODECOUNT = (CAP \\ "Input" \\ "@node").size

    if(NODECOUNT > 1){

      val NodeConnector = Module(new NodeConnector(NODECOUNT))

      for(i <- 0 until NODECOUNT){
        val NODE = (CAP \\ "Input" \\ "@node")(i).text

        if(NODE == "In"){
          NodeConnector.io.In(i) := In
        }else{
          var INPUT = NODE.toInt
          NodeConnector.io.In(i) := CAP_IOs(INPUT).Out
        }
      }  

      CAP_IOs(CORE).In := NodeConnector.io.Out

    }else{
      val NODE = (CAP \\ "Input" \\ "@node").text

      if(NODE == "In"){
        CAP_IOs(CORE).In  := In.asUInt
      }else{
        var INPUT = NODE.toInt
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

  Out := OutputConnector.io.Out

}

// generate Verilog
object DSP extends App {
  println(Text.name)
  val xml = XML.loadFile("config.xml")

  (new chisel3.stage.ChiselStage).emitVerilog(new DSP(100000000, xml))
}




