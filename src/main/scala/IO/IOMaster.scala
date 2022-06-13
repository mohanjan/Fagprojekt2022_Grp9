// støjen bliver skubbet op i høje frekvenser, men det er også de høje frekvenser der bliver dæmpet
//lav et fælles modul det styrer filter ressourcen
import chisel3._
import chisel3.util._

class IOMaster(bufferWidth: Int) extends Module {
  val io = IO(new Bundle {
    val In_ADC = Input(UInt(1.W))
    val In_DAC = Input(SInt(16.W))
    val Out_ADC = Output(SInt(16.W))
    val Out_DAC = Output(UInt(1.W))
  })
  val filterLength = 100
  val ADC = Module(new InController(bufferWidth))
  val DAC = Module(new OutController(bufferWidth))
  val Filter = Module(
    new IOFilter(filterLength)
  ) // 827 filterlængde 414 koefficienter

  val sampleType = RegInit(0.U(1.W))
  val lastSampleType = RegInit(0.U(1.W))
  val ADCReg = RegInit(0.S(bufferWidth.W))
  val DACReg = RegInit(0.S(bufferWidth.W))
  val DACEn = RegInit(true.B)
  val ADCEn = RegInit(false.B)
  val isLoading = RegInit(false.B)
  val toggle = sampleType === lastSampleType

  isLoading := Filter.io.DACEnable === 1.U || Filter.io.ADCEnable === 1.U

  ADC.io.In := io.In_ADC
  io.Out_ADC := ADC.io.Out
  ADC.io.InFIR := 0.S
  ADCReg := ADC.io.OutFIR

  DAC.io.In := io.In_DAC
  io.Out_DAC := DAC.io.OutPWM
  DAC.io.InFIR := 0.S
  DACReg := DAC.io.OutFIR

  DAC.io.convReady := false.B
  lastSampleType := sampleType
  Filter.io.SampleType := sampleType
  Filter.io.ADCWaveIn := ADCReg
  Filter.io.DACWaveIn := DACReg
  Filter.io.DACEnable := DACEn
  Filter.io.ADCEnable := ADCEn

  // Counter for ensuring filter is filled with samples
  val cntReg = RegInit(0.U(10.W))
  val check1 = cntReg === filterLength.asUInt && sampleType === 0.U
  val check2 = cntReg === filterLength.asUInt && sampleType === 1.U
  when(isLoading) {
    cntReg := cntReg + 1.U
  }

  when(check1) {
    Filter.io.ADCEnable := 0.U
    cntReg := 0.U
  }
    .elsewhen(check2) {
      Filter.io.DACEnable := 0.U
      cntReg := 0.U
    }

  when(Filter.io.Completed === 1.U && !isLoading) {

    // when a sample is ready send it to either adc or dac
    switch(lastSampleType) {
      is(0.U) {
        ADC.io.InFIR := Filter.io.WaveOut
      }
      is(1.U) {
        DAC.io.InFIR := Filter.io.WaveOut
        // DAC.io.convReady := true.B // needs a flag bc of decimation
      }
    }

    // send a new signal to the filter
    when(sampleType === 1.U) {
      DACEn := 0.U
      ADCEn := 1.U
      lastSampleType := 1.U
      sampleType := ~sampleType //0.U
    }
      .elsewhen(sampleType === 0.U) {
        DACEn := 1.U
        ADCEn := 0.U
        lastSampleType := 0.U
        sampleType := ~sampleType //1.U
      }
  }

}
