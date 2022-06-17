// støjen bliver skubbet op i høje frekvenser, men det er også de høje frekvenser der bliver dæmpet
//lav et fælles modul det styrer filter ressourcen
import chisel3._
import chisel3.util._
class IOMaster(bufferWidth: Int) extends Module {
  val io = IO(new Bundle {
    val In_ADC = Input(UInt(1.W))
    val In_DAC = Input(SInt(bufferWidth.W))
    val Out_ADC = Output(SInt(bufferWidth.W))
    val Out_DAC = Output(UInt(1.W))
  })
  val filterLength = 100

  val ADC = Module(new InController(bufferWidth))
  val DAC = Module(new OutController(bufferWidth))
  val ADCFilter = Module(
    new IOFilter(filterLength)
  ) // 827 filterlængde 414 koefficienter
  val DACFilter = Module(
    new IOFilter(filterLength)
  ) // 827 filterlængde 414 koefficienter

  val ADCReg = RegInit(0.S(bufferWidth.W))
  val DACReg = RegInit(0.S(bufferWidth.W))
  val ADCHold = RegInit(0.S(bufferWidth.W))
  val DACHold = RegInit(0.S(bufferWidth.W))
  val ADCEn = RegInit(false.B)
  val DACEn = RegInit(false.B)

  ADC.io.In := io.In_ADC
  io.Out_ADC := ADC.io.Out
  ADC.io.postFIR := ADCHold
  ADCReg := ADC.io.preFIR
  DAC.io.In := io.In_DAC
  io.Out_DAC := DAC.io.OutPWM
  DAC.io.postFIR := DACHold
  DACReg := DAC.io.preFIR

  ADCFilter.io.SampleType := 0.U
  ADCFilter.io.ADCWaveIn := ADCReg
  ADCFilter.io.DACWaveIn := 0.S
  ADCFilter.io.DACEnable := 0.U
  ADCFilter.io.ADCEnable := ADCEn // hhhh
  ADCFilter.io.ConvEnable := 0.U

  DACFilter.io.SampleType := 1.U
  DACFilter.io.ADCWaveIn := 0.S
  DACFilter.io.DACWaveIn := DACReg
  DACFilter.io.DACEnable := DACEn // hhhh
  DACFilter.io.ADCEnable := 0.U
  DACFilter.io.ConvEnable := 0.U

  // Counter for ensuring filter is filled with samples
  val cntReg = RegInit(0.U(10.W))

  val check1 = cntReg === filterLength.asUInt
  val count = RegInit(true.B)

  when(count) {
    cntReg := cntReg + 1.U
  }

  when(check1) {
    ADCFilter.io.ConvEnable := 1.U
    ADCEn := false.B

    DACFilter.io.ConvEnable := 1.U
    DACEn := false.B
    cntReg := 0.U
    count := false.B
  }

  when(ADCFilter.io.Completed === 1.U) {
    // when a sample is ready send it to either adc or dac

    ADCHold := ADCFilter.io.WaveOut
    ADCEn := 1.U
    count := true.B

  }
  when(DACFilter.io.Completed === 1.U) {
    // when a sample is ready send it to either adc or dac

    DACHold := ADCFilter.io.WaveOut
    DACEn := 1.U

  }

}
