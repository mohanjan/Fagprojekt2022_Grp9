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

  val ADC = Module(new InController(bufferWidth))
  val DAC = Module(new OutController(bufferWidth))
  val Filter = Module(new IOFilter(100)) //827 filterlængde 414 koefficienter

  val sampleType = RegInit(0.U(1.W))
  val lastSampleType = RegInit(0.U(1.W))
  val ADCReg = RegInit(0.S(bufferWidth.W))
  val DACReg = RegInit(0.S(bufferWidth.W))
  val cond = Wire(Bool())

  ADC.io.In := io.In_ADC
  io.Out_ADC := ADC.io.Out
  ADC.io.InFIR := 0.S
  ADCReg := ADC.io.OutFIR

  DAC.io.In := io.In_DAC
  io.Out_DAC := DAC.io.OutPWM
  DAC.io.InFIR := 0.S
  DACReg := DAC.io.OutFIR

  DAC.io.convReady := false.B
  Filter.io.Enable := 0.U
  sampleType := 0.U
  lastSampleType := sampleType
  Filter.io.SampleType := sampleType
  Filter.io.WaveIn := ADCReg

  // decide if adc or dac gets filter resource
  cond := DAC.io.OutFIR === 0.S
  when(!cond) {
    sampleType := 1.U
  }

  when(Filter.io.Completed === 1.U) {

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
      Filter.io.WaveIn := DACReg
    }
    Filter.io.Enable := 1.U
  }


}
