import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
//import chiseltest.experimental.TestOptionBuilder._
//import chiseltest.internal.WriteVcdAnnotation._
import scala.xml._
import org.scalatest.FlatSpec
import Sounds._
import Assembler._

class test extends AnyFlatSpec with ChiselScalatestTester {


  val xml = XML.loadFile("config.xml")

  behavior of "DSP"


  it should "play" in {
    test(new DSP(100000000, xml)).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
      dut.clock.setTimeout(0)
      println("Starting test")
      var serial = Array(
        true.B,
        false.B,
        true.B,
        false.B,
        false.B,
        false.B,
        true.B,
        true.B,
        false.B,
        false.B,
        false.B,
        false.B,
        false.B,
        true.B,
        true.B,
        true.B,
        false.B,
        false.B,
        false.B,
        false.B,
        false.B,
        false.B,
        true.B,
        true.B,
        true.B,
        true.B,
        true.B,
        false.B,
        true.B,
        false.B,
        true.B,
        false.B
      )

      var Sine = Array( //5kHz sine
        0,1372,2741,4106,5464,6812,8148,9470,10776,12062,
        13327,14569,15785,16974,18133,19260,20353,21410,22430,23411,
        24350,25247,26100,26907,27666,28377,29038,29648,30207,30712,
        31163,31560,31901,32187,32415,32587,32702,32760,32760,32702,
        32587,32415,32187,31901,31560,31163,30712,30207,29648,29038,
        28377,27666,26907,26100,25247,24350,23411,22430,21410,20353,
        19260,18133,16974,15785,14569,13327,12062,10776,9470,8148,
        6812,5464,4106,2741,1372,0,-1373,-2742,-4107,-5465,
        -6813,-8149,-9471,-10777,-12063,-13328,-14570,-15786,-16975,-18134,
        -19261,-20354,-21411,-22431,-23412,-24351,-25248,-26101,-26908,-27667,
        -28378,-29039,-29649,-30208,-30713,-31164,-31561,-31902,-32188,-32416,
        -32588,-32703,-32761,-32761,-32703,-32588,-32416,-32188,-31902,-31561,
        -31164,-30713,-30208,-29649,-29039,-28378,-27667,-26908,-26101,-25248,
        -24351,-23412,-22431,-21411,-20354,-19261,-18134,-16975,-15786,-14570,
        -13328,-12063,-10777,-9471,-8149,-6813,-5465,-4107,-2742,-1373
      )

      //PDM Modulation
      var error = 0
      var output = 0
      for (i <- 0 until 12) {
        for (j <- 0 until 150) {
          error = error + Sine(j)
          if (error > 0) {
            output = 1
          } else {
            output = -1
          }
          error =  error - output*65535
          output = if (output<0) 0 else output
          dut.io.In.poke(output.B)
          dut.clock.step()
          if(i==0){println(s"output is $output | error is $error | ")}
        }

        println(s"${i + 1} x periods")
      }
      // + dut.IOC.io.Out_ADC.peek().toString

      for (i <- 0 until 500) {
        dut.clock.step(1)
      }
    }
  }
}
