import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
//import chiseltest.experimental.TestOptionBuilder._
//import chiseltest.internal.WriteVcdAnnotation
import org.scalatest.FlatSpec
import Sounds._

class SampleTest extends AnyFlatSpec with ChiselScalatestTester {

  behavior of "DSP"

  it should "play" in {
    //test(new DSP(100000000)).withAnnotations(Seq(VerilatorBackendAnnotation, WriteVcdAnnotation)) { dut =>
    test(new DSP(100000000)) { dut =>
      val samples = getFileSamples("sample.wav")
      val outSamples = new Array[Short](samples.length)

      var finished = false

      // no timeout, as a bunch of 0 samples would lead to a timeout.
      dut.clock.setTimeout(0)

      // Write the samples
      val th = fork {
        //dut.io.in.valid.poke(true.B)
        for (s  <- samples) {
          dut.io.In.poke(s.asSInt)
          dut.clock.step()

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

        dut.clock.step()
      }
      th.join()

      // Uncomment for direct playback
      //startPlayer
      //playArray(outSamples)      
      //stopPlayer

      saveArray(outSamples, "sample_distortion_out.wav")
    }
  }
}