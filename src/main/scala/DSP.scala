import chisel3._
import chisel3.experimental._
import chisel3.util._
import scala.xml._
import java.io._
import Assembler._

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


class DSP(maxCount: Int) extends Module {
    val io = IO(new Bundle {
    val In = Input(UInt(1.W))
    val Out_AD = Output(UInt(1.W))
    val Out = Output(UInt(1.W))
  })
  /*val SPI = IO(new Bundle{
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
          NodeConnector.io.In(i) := io.In.asUInt
        }else{
          var INPUT = NODE.toInt
          NodeConnector.io.In(i) := CAP_IOs(INPUT).Out
        }
      }  

      CAP_IOs(CORE).In := NodeConnector.io.Out

    }else{
      val NODE = (CAP \\ "Input" \\ "@node").text

      if(NODE == "In"){
        CAP_IOs(CORE).In  := io.In.asUInt
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
  */
  val IOC  = Module(new IOMaster(18))

  IOC.io.In_ADC := io.In
  //SDSP.io.In     := IOC.io.Out_ADC
  IOC.io.In_DAC := IOC.io.Out_ADC
  //IOC.io.In_DAC := SDSP.io.Out
  io.Out_AD     := IOC.io.Out_ADC_D
  io.Out        := IOC.io.Out_DAC

  // io.Out := OutputConnector.io.Out(15,0).asSInt

}

// generate Verilog
object DSP extends App {
    println(Text.name + "\n")

  print("Enter config file: ")

  // val input = scala.io.StdIn.readLine()

  // val xml = XML.loadFile("Config/" + input + ".xml")

  (new chisel3.stage.ChiselStage).emitVerilog(new DSP(100000000))
}




