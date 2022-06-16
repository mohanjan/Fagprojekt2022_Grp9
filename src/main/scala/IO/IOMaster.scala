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
  var filterLength = 100
  val ADC = Module(new InController(bufferWidth))
  val DAC = Module(new OutController(bufferWidth))
  val Filter = Module(
    new IOFilter(filterLength)
  ) // 827 filterlængde 414 koefficienter

  val sampleType = RegInit(1.U(1.W))
  val lastSampleType = RegInit(0.U(1.W))
  val ADCReg = RegInit(0.S(bufferWidth.W))
  val DACReg = RegInit(0.S(bufferWidth.W))
  val ADCHold = RegInit(0.S(bufferWidth.W))
  val DACHold = RegInit(0.S(bufferWidth.W))
  val DACEn = RegInit(true.B)
  val ADCEn = RegInit(false.B)
  val isLoading = RegInit(false.B)

  isLoading := (ADCEn === 0.U && DACEn === 1.U) || (ADCEn === 1.U && DACEn === 0.U)

  ADC.io.In := io.In_ADC
  io.Out_ADC := ADC.io.Out
  ADC.io.InFIR := ADCHold
  ADCReg := ADC.io.OutFIR

  DAC.io.In := io.In_DAC
  io.Out_DAC := DAC.io.OutPWM
  DAC.io.InFIR := DACHold
  DACReg := DAC.io.OutFIR

  Filter.io.SampleType := sampleType
  Filter.io.ADCWaveIn := ADCReg
  Filter.io.DACWaveIn := DACReg
  Filter.io.DACEnable := DACEn
  Filter.io.ADCEnable := ADCEn

  // Counter for ensuring filter is filled with samples
  val cntReg = RegInit(0.U(10.W))
  val check1 = cntReg === filterLength.asUInt && ADCEn === true.B
  val check2 = cntReg === filterLength.asUInt && DACEn === true.B
  when(isLoading) {
    cntReg := cntReg + 1.U
  }

  when(check1) {
    DACEn := 1.U
    cntReg := 0.U
  }
    .elsewhen(check2) {
      ADCEn := 1.U
      cntReg := 0.U
    }
    when(sampleType === 1.U) {
      DACEn := 1.U
    }
    .elsewhen(sampleType === 0.U) {
      ADCEn := 1.U
    }

  lastSampleType := lastSampleType
  sampleType := sampleType

  val beginSample = Filter.io.Completed === 1.U && DACEn && ADCEn

  when(beginSample) {

    // when a sample is ready send it to either adc or dac
    switch(lastSampleType) {
      is(1.U) {
        ADCHold := Filter.io.WaveOut
      }
      is(0.U) {
        DACHold := Filter.io.WaveOut
        // DAC.io.convReady := true.B // needs a flag bc of decimation
      }
    }

    // start next sample
    DACEn := 0.U
    ADCEn := 0.U

    lastSampleType := sampleType
    sampleType := ~sampleType
  }

}
