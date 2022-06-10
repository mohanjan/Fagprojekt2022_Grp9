import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class IOFilterTest extends AnyFlatSpec with ChiselScalatestTester {
  "IOtest " should "pass" in {
    test(new IOFilter(5)).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>

      //Load coeff
      //todo sørg for at coeff er i fixpoint Q:0.17

      dut.io.Enable.poke(0.U)
      dut.io.Coeffdata.poke(-65536.S)
      dut.io.CoeffAdress.poke(0.U)
      dut.io.CoeffLoadEN.poke(true.B)
      dut.clock.step()
      dut.io.CoeffAdress.poke(1.U)
      dut.io.Coeffdata.poke(32768.S)
      dut.clock.step()
      dut.io.CoeffAdress.poke(2.U)
      dut.io.Coeffdata.poke(16384.S)
      dut.clock.step()
      dut.io.CoeffAdress.poke(3.U)
      dut.io.Coeffdata.poke(8192.S)
      dut.clock.step()
      dut.io.CoeffAdress.poke(4.U)
      dut.io.Coeffdata.poke(4096.S)
      dut.clock.step()
      dut.io.CoeffLoadEN.poke(false.B)

      /*convolution check table:
      * convolution pr sample:
      * Coeff: 0.5,0.25,0.125,0.5,0.25
      * Samples: 65536,65536,0,0,0,-1000,-2000,0,-4000,0
      *
      * input:
      * 1 samples: -32768
      * 2 samples: -16384
      * 3 samples: 24576
      * 4 samples: 24576
      * 5 samples: -16384
      * 6 samples: -32268
      * 7 samples: 750
      * 8 samples: -625
      * 9 samples: 1500
      * 10 samples -1000
      *
      * output:
      * 1 samples: -32768
      * 2 samples: -16384
      * 3 samples: 24576
      * 4 samples: 24576
      * 5 samples: -16384
      * 6 samples: -32268
      * 7 samples: 750
      * 8 samples: -625
      * 9 samples: 1500
      * 10 samples -1000
      * */


      //input samples
      dut.io.WaveIn.poke(0.S)
      dut.io.SampleType.poke(0.U)
      dut.io.Enable.poke(true.B)
      dut.clock.step()
      dut.io.Enable.poke(0.U)       //checking if convolution stops when enable is missing
      dut.clock.step()
      dut.clock.step()
      dut.clock.step()
      dut.clock.step()
      dut.clock.step()
      dut.io.Enable.poke(1.U)
      dut.io.WaveIn.poke(65536.S)
      dut.clock.step()
      dut.clock.step()
      dut.clock.step()
      dut.clock.step()
      dut.clock.step()
      dut.io.WaveIn.poke(65536.S)
      dut.clock.step()
      dut.clock.step()
      dut.clock.step()
      dut.clock.step()
      dut.clock.step()
      dut.io.WaveIn.poke(0.S)
      dut.clock.step()
      dut.clock.step()
      dut.clock.step()
      dut.clock.step()
      dut.clock.step()
      dut.io.WaveIn.poke(0.S)
      dut.clock.step()
      dut.clock.step()
      dut.clock.step()
      dut.clock.step()
      dut.clock.step()
      dut.io.WaveIn.poke(0.S)
      dut.clock.step()
      dut.clock.step()
      dut.clock.step()
      dut.clock.step()
      dut.clock.step()
      dut.io.WaveIn.poke(-1000.S)
      dut.clock.step()
      dut.clock.step()
      dut.clock.step()
      dut.clock.step()
      dut.clock.step()
      dut.io.WaveIn.poke(-2000.S)
      dut.clock.step()
      dut.clock.step()
      dut.clock.step()
      dut.clock.step()
      dut.clock.step()
      dut.io.WaveIn.poke(0.S)
      dut.clock.step()
      dut.clock.step()
      dut.clock.step()
      dut.clock.step()
      dut.clock.step()
      dut.io.WaveIn.poke(-4000.S)
      dut.clock.step()
      dut.clock.step()
      dut.clock.step()
      dut.clock.step()
      dut.clock.step()
      dut.io.WaveIn.poke(0.S)
      dut.clock.step()
      dut.clock.step()
      dut.clock.step()
      dut.clock.step()
      dut.clock.step()

      //Output samples
      dut.io.SampleType.poke(1.U)
      dut.io.WaveIn.poke(65536.S)
      dut.clock.step()
      dut.clock.step()
      dut.clock.step()
      dut.clock.step()
      dut.clock.step()
      dut.io.WaveIn.poke(65536.S)
      dut.clock.step()
      dut.clock.step()
      dut.clock.step()
      dut.clock.step()
      dut.clock.step()
      dut.io.WaveIn.poke(0.S)
      dut.clock.step()
      dut.clock.step()
      dut.clock.step()
      dut.clock.step()
      dut.clock.step()
      dut.io.WaveIn.poke(0.S)
      dut.clock.step()
      dut.clock.step()
      dut.clock.step()
      dut.clock.step()
      dut.clock.step()
      dut.io.WaveIn.poke(0.S)
      dut.clock.step()
      dut.clock.step()
      dut.clock.step()
      dut.clock.step()
      dut.clock.step()
      dut.io.WaveIn.poke(-1000.S)
      dut.clock.step()
      dut.clock.step()
      dut.clock.step()
      dut.clock.step()
      dut.clock.step()
      dut.io.WaveIn.poke(-2000.S)
      dut.clock.step()
      dut.clock.step()
      dut.clock.step()
      dut.clock.step()
      dut.clock.step()
      dut.io.WaveIn.poke(0.S)
      dut.clock.step()
      dut.clock.step()
      dut.clock.step()
      dut.clock.step()
      dut.clock.step()
      dut.io.WaveIn.poke(-4000.S)
      dut.clock.step()
      dut.clock.step()
      dut.clock.step()
      dut.clock.step()
      dut.clock.step()
      dut.io.WaveIn.poke(0.S)
      dut.clock.step()
      dut.clock.step()
      dut.clock.step()
      dut.clock.step()
      dut.clock.step()

      }
    }
}