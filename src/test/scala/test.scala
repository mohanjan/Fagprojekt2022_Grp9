import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class test extends AnyFlatSpec with ChiselScalatestTester {
  "test " should "pass" in {
    test(new DSP(20)).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
      dut.clock.setTimeout(0)
      println("Hej")
      var serial = Array(true.B,  false.B,  true.B,   false.B,  false.B,  false.B,  true.B,   true.B,
                         false.B, false.B,  false.B,  false.B,  false.B,  true.B,   true.B,   true.B,
                         false.B, false.B,  false.B,  false.B,  false.B,  false.B,  true.B,   true.B,
                         true.B,  true.B,   true.B,   false.B,  true.B,   false.B,  true.B,   false.B)

      for(j <- 0 until 4){

        println(s"${j} x 64 bits")

        for(i <- 0 until 32){
          dut.clock.step(1)
          dut.io.In.poke(serial(i))
        }
        
        for(i <- 0 until 32){
          dut.clock.step(1)
          dut.io.In.poke(false.B)
        }
      }
      
       // + dut.IOC.io.Out_ADC.peek().toString
      

      for(i <- 0 until 200){
        dut.clock.step(1)
      }
    }
  }
}