import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class IOFilterTest extends AnyFlatSpec with ChiselScalatestTester {
  "IOtest " should "pass" in {
    test(new IOFilter(5)).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>

      val testvalues = Array(65536, 65536, 0, 0, 0, -1000, -2000, 0, -4000, 0)

      /*convolution check table:
      * convolution pr sample:
      * Coeff: 134,-29,-2d,-35,-41,-50,-61,-76
      * Samples: 65536,65536,0,0,0,-1000,-2000,0,-4000,0
      *
      * input:
      * 1 samples: 20185088
      * 2 samples: 17498112
      * 3 samples: -5636096
      * 4 samples: -6422528
      * 5 samples: -7733248
      * 6 samples: -9810720
      * 7 samples: -12174872
      * 8 samples: -13963240
      * 9 samples: -7733248
      *
      * output:
      * 1 samples: 20185088
      * 2 samples: 17498112
      * 3 samples: -5636096
      * 4 samples: -6422528
      * 5 samples: -7733248
      * 6 samples: -9810720
      * 7 samples: -12174872
      * 8 samples: -13963240
      * 9 samples: -7733248
      * */


      //input samples


      dut.io.DACEnable.poke(true.B) //checking behavior when in input state and no input enable
      dut.io.SampleType.poke(0.U)
      dut.io.ADCWaveIn.poke(0.S)
      dut.clock.step()

      dut.io.DACEnable.poke(false.B) //checking if convolution stops when enable criterea is not met
      dut.clock.step()
      dut.io.DACEnable.poke(1.U)
      dut.clock.step()
      dut.clock.step()
      dut.clock.step()
      dut.clock.step()

      dut.io.DACEnable.poke(0.U)
      for (i <- testvalues) { //test af convolution
        dut.io.ADCWaveIn.poke(i.S)
        dut.clock.step()
        dut.clock.step()
        dut.clock.step()
        dut.clock.step()
        dut.clock.step()
      }

      dut.io.ADCEnable.poke(1.U)

      for (i <- 5 to 9) { //test af buffer opfyldning
        if (i == 9) {
          dut.io.ADCEnable.poke(0.U)
          dut.io.ADCWaveIn.poke(testvalues(i).S)
          dut.clock.step()
          dut.clock.step()
          dut.clock.step()
          dut.clock.step()
          dut.clock.step()
        } else {
          dut.io.ADCWaveIn.poke(testvalues(i).S)
          dut.clock.step()
        }
      }


      //Output samples
      dut.io.ADCEnable.poke(true.B) //checking behavior when in input state and no input enable
      dut.io.SampleType.poke(1.U)
      dut.io.DACWaveIn.poke(0.S)
      dut.clock.step()

      dut.io.ADCEnable.poke(false.B) //checking if convolution stops when enable criterea is not met
      dut.clock.step()
      dut.io.ADCEnable.poke(1.U)
      dut.clock.step()
      dut.clock.step()
      dut.clock.step()
      dut.clock.step()

      dut.io.ADCEnable.poke(0.U)
      dut.io.ConvEnable.poke(1.U)
      for (i <- testvalues) { //test af convolution
        dut.io.DACWaveIn.poke(i.S)
        dut.clock.step()
        dut.clock.step()
        dut.clock.step()
        dut.clock.step()
        dut.clock.step()
      }

      dut.io.DACEnable.poke(1.U)
      dut.io.ConvEnable.poke(1.U)

      for (i <- 5 to 9) { //test af buffer opfyldning
        if (i == 4) {
          dut.io.ADCEnable.poke(0.U)
          dut.io.DACWaveIn.poke(testvalues(i).S)

          dut.clock.step()
          dut.clock.step()
          dut.clock.step()
          dut.clock.step()
          dut.clock.step()
        } else {
          dut.io.DACWaveIn.poke(testvalues(i).S)
          dut.clock.step()
        }
      }

    }
  }
}