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
  test(new DSP(100000000,xml)).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
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

      var waw = Array(
      65536, 68776, 72010, 75227, 78420, 81582, 84705, 87781, 90802, 93761, 96652, 99466, 102197, 104839, 107384, 
      109827, 112162, 114382, 116483, 118459, 120306, 122019, 123593, 125026, 126312, 127451, 128437, 129270, 129946, 130465, 
      130826, 131026, 131066, 130946, 130665, 130226, 129628, 128873, 127963, 126900, 125687, 124327, 122824, 121179, 119399, 
      117487, 115448, 113287, 111008, 108619, 106124, 103530, 100843, 98069, 95216, 92290, 89299, 86249, 83149, 80006, 
      76827, 73621, 70394, 67156, 63915, 60677, 57450, 54244, 51065, 47922, 44822, 41772, 38781, 35855, 33002, 
      30228, 27541, 24947, 22452, 20063, 17784, 15623, 13584, 11672, 9892, 8247, 6744, 5384, 4171, 3108, 
      2198, 1443, 845, 406, 125, 5, 45, 245, 606, 1125, 1801, 2634, 3620, 4759, 6045, 
      7478, 9052, 10765, 12612, 14588, 16689, 18909, 21244, 23687, 26232, 28874, 31605, 34419, 37310, 40269, 
      43290, 46366, 49489, 52651, 55844, 59061, 62295, 65535
      )
  
    var error0 = 0
    var error1 = 0

      for (i <- 0 until 12) {
        for (j <- 0 until 128) {

        if (waw(j) >= error0){
          dut.io.In.poke(true.B)
          error1 = 1 - waw(j) - error0
          // println(s"got error to ${ 1 - waw(j) + error0} ")
        }  else{
          dut.io.In.poke(false.B)
          error1 = 0 - waw(j) - error0
          // println(s"got error to ${ 1 - waw(j) + error0} ")
      }
      
        dut.clock.step(1)
        error0 = error1
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
