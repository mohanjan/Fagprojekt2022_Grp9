import chisel3._
//import chiseltest.iotesters.Driver
import chiseltest.iotesters.PeekPokeTester
import org.scalatest._
import org.scalatest.flatspec.AnyFlatSpec
import chiseltest._

class test extends AnyFlatSpec with ChiselScalatestTester {
  "test " should "pass" in {
    test(new DSP(20)).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
      dut.clock.setTimeout(1000000)



      for(i <- 0 until 32){
        poke(dut.io.In, 0.U)
        dut.clock.step(1)
      }

      for(i <- 0 until 1000){
        dut.clock.step(1)
      }
    }
  }
}