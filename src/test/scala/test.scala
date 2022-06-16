import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class test extends AnyFlatSpec with ChiselScalatestTester {
  "test " should "pass" in {
    test(new DSP(20)).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
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

      for (j <- 0 until 5) {

        for (i <- 0 until 1000) {
          dut.clock.step(1)
          dut.io.In.poke(true.B)
        }

        for (i <- 0 until 1000) {
          dut.clock.step(1)
          dut.io.In.poke(false.B)
        }

        println(s"${j + 1} x 64 bits")
      }

      // + dut.IOC.io.Out_ADC.peek().toString

      for (i <- 0 until 400) {
        dut.clock.step(1)
      }
    }
  }
}
