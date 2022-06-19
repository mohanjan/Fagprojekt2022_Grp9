import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
//import chiseltest.experimental.TestOptionBuilder._
//import chiseltest.internal.WriteVcdAnnotation._
import scala.xml._
import org.scalatest.FlatSpec
import Sounds._
import Assembler._
import chisel3.experimental._
import chisel3.util._
import PrintFiles._
import java.io.File
import java.util.Arrays;

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



class SampleTest_Verilator extends AnyFlatSpec with ChiselScalatestTester {

  println(Text.name + "\n")

  /*
  
  sortAll("Config")

  print("\n" + "Enter config file: ")

  val input = scala.io.StdIn.readLine()

  val xml = XML.loadFile("Config/" + input + ".xml")

  */
  
  val xml = XML.loadFile("Config/SingleCore.xml")

  
  behavior of "DSP"

  it should "play" in {
    test(new DSP(100000000,xml)).withAnnotations(Seq(VerilatorBackendAnnotation, WriteVcdAnnotation)) { dut =>
    //test(new DSP(100000000,xml)) { dut =>
      var ClkCount = (xml \\ "TEST" \\ "CLK" \\ "@count").text.toInt
      var Soundfile = (xml \\ "TEST" \\ "SOUND" \\ "@sample").text
      val samples = getFileSamples("Samples/" + Soundfile + ".wav")
      val outSamples = new Array[Short](samples.length)

      var finished = false

      // no timeout, as a bunch of 0 samples would lead to a timeout.
      dut.clock.setTimeout(0)
      // Write the samples
      val th = fork {
        //dut.io.in.valid.poke(true.B)
        for (s  <- (samples)) {
          dut.io.In.poke(s.asSInt)

          for(i <- 0 until ClkCount){
            dut.clock.step()
          }

          /*
          while (!dut.io.in.ready.peek.litToBoolean) {
            dut.clock.step()
          }
          */
        }
        finished = true
      }

      // Playing in real-time does not work, so record the result
      var idx = 0
      while (!finished) {
        // for (j <- 0 to 40) {

        /*
        val valid = dut.io.out.valid.peek.litToBoolean
        if (valid) {
          val s = dut.io.out.bits.peek.litValue.toShort
          outSamples(idx) = s
          idx += 1
        }
        */

        val s = dut.io.Out.peek().litValue.toShort
        outSamples(idx) = s
        idx += 1

        //dut.clock.step()

        for(i <- 0 until ClkCount){
            dut.clock.step()
        }

      }
      th.join()

      // Uncomment for direct playback
      //startPlayer
      //playArray(outSamples)      
      //stopPlayer

      saveArray(outSamples, ("Samples/" + Soundfile + "_out.wav"))
    }
  }
}