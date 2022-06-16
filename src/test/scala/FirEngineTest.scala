//todo fix this mess

import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class FirEngineTest extends AnyFlatSpec with ChiselScalatestTester {
  val Filterlength = 55;

  "FieEnginetest " should "pass" in {
    test(new FirEngine).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>

    val testvalues = Array(65536, 65536, 0, 0, 0, -1000, -2000, 0, -4000, 0)

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

      dut.io.Registers.Enable.poke(1.U)
      dut.io.Registers.WriteEn.poke(1.U)
      dut.io.Registers.Address.poke(0.U)
      /*11_1111_1111_1111_1101
      * \  |\           | \|||
      *    ?            F  SCE
      * where:
      * - E is enable
      * - C is completed
      * - S is statereg
      * - F is filterlength
      * - ? is extra bits
      * */

      var FilterlengthBinary = Integer.toBinaryString(Filterlength)
      for(i<- FilterlengthBinary.length until 18){
        FilterlengthBinary = "0"+FilterlengthBinary
      }
      dut.io.Registers.WriteData.poke(("b"+"000"+Integer.toBinaryString(Filterlength)+"00"+"0"+"1").U)
      dut.io.Registers.Address.poke(0.U)
      dut.io.Registers.Enable.poke(1.U)
      dut.clock.step()
      for (j <- testvalues) {
        dut.io.WaveIn.poke(j.S)
        //step filterlength
        for (k <- 0 until Filterlength) {
          dut.clock.step()

        }
      }
    }
  }
}