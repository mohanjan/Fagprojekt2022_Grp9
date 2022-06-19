// støjen bliver skubbet op i høje frekvenser, men det er også de høje frekvenser der bliver dæmpet
//lav et fælles modul det styrer filter ressourcen
import chisel3._
import chisel3.util._
class IOMaster(bufferWidth: Int) extends Module {
  val io = IO(new Bundle {
    val In_ADC = Input(UInt(1.W))
    val Out_DAC = Output(UInt(1.W))
    val Out_ADC_D = Output(UInt(1.W))
    val Sync1 = Output(UInt(1.W))
    val Sync2 = Output(UInt(1.W))

    val In_DAC = Input(SInt(bufferWidth.W))
    val Out_ADC = Output(SInt(bufferWidth.W))
    // -----unsigned val-----
    // val In_DAC = Input(UInt(bufferWidth.W))
    // val Out_ADC = Output(UInt(bufferWidth.W))

    val SAD1  = Input(UInt(1.W))
    val SAD2  = Input(UInt(1.W))
    val SAD3  = Input(UInt(1.W))
    val SAD4  = Input(UInt(1.W))
    val SAD5  = Input(UInt(1.W))
    val SAD6  = Input(UInt(1.W))
    val SAD7  = Input(UInt(1.W))
    val SAD8  = Input(UInt(1.W))
    val SDA1  = Input(UInt(1.W))
    val SDA2  = Input(UInt(1.W))
    val SDA3  = Input(UInt(1.W))
    val SDA4  = Input(UInt(1.W))
    val SDA5  = Input(UInt(1.W))
    val SDA6  = Input(UInt(1.W))
    val SDA7  = Input(UInt(1.W))
    val SDA8  = Input(UInt(1.W))

  })
  val filterLength = 824

  val ADC = Module(new InController(bufferWidth))
  val DAC = Module(new OutController(bufferWidth))
  val c1  = RegInit(1.U(8.W)) 
  val c2  = RegInit(1.U(8.W))
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
  val ADCLoad = RegInit(false.B)
  val DACLoad = RegInit(false.B)

   // ----- synchronizing clock ----------
  val syncReg1 = RegInit(0.U(8.W))
  syncReg1 := syncReg1 + 1.U
  when(syncReg1 === 0.U){
    io.Sync1 := 1.U
  }.otherwise{
    io.Sync1 := 0.U
  }
  when(syncReg1 === c1){
    syncReg1 := 0.U
  }

  val syncReg2 = RegInit(0.U(8.W))
  syncReg2 := syncReg2 + 1.U
  when(syncReg2 === 0.U){
    io.Sync2 := 1.U
  }.otherwise{
    io.Sync2 := 0.U
  }
  when(syncReg2 === c2){
    syncReg2 := 0.U
  }

// these are for testing purposes
  c1 := io.SAD1 + (io.SAD2<<1) + (io.SAD3<<2) + (io.SAD4<<3) + (io.SAD5<<4) + (io.SAD6<<5) + (io.SAD7<<6) + (io.SAD8<<7)
  c2 := (io.SDA2<<1) + (io.SDA3<<2) + (io.SDA4<<3) + (io.SDA5<<4) + (io.SDA6<<5) + (io.SDA7<<6) + (io.SDA8<<7)

  ADC.io.Sync := io.Sync1
  DAC.io.Sync := io.Sync2

  // connecting modules
  ADC.io.In := io.In_ADC
  io.Out_ADC := ADC.io.Out
  // ADC.io.postFIR := ADCFilter.io.WaveOut
  // ADCReg := ADC.io.preFIR

  when(io.SAD1===1.U){
  ADC.io.postFIR := ADCFilter.io.WaveOut
  ADCReg := ADC.io.preFIR
  DAC.io.postFIR := DACFilter.io.WaveOut
  DACReg := DAC.io.preFIR
  }.otherwise{
  ADC.io.postFIR := ADC.io.preFIR
  ADCReg := 0.S
  DAC.io.postFIR := DAC.io.preFIR
  DACReg := 0.S
  }

  DAC.io.In := io.In_DAC
  io.Out_DAC := DAC.io.OutPWM
  // DAC.io.postFIR := DACFilter.io.WaveOut
  // DACReg := DAC.io.preFIR


  io.Out_ADC_D := ADC.io.ADC_D_out

  ADCFilter.io.WaveIn := ADCReg
  ADCFilter.io.LoadSamples := ADCLoad // hhhh
  ADCFilter.io.ConvEnable := 0.U

  DACFilter.io.WaveIn := DACReg
  DACFilter.io.LoadSamples := DACLoad // hhhh
  DACFilter.io.ConvEnable := 0.U

  // Counter for ensuring filter is filled with samples
  val cntReg1 = RegInit(0.U(10.W))
  val cntReg2 = RegInit(0.U(10.W))

  val doneLoading1 = cntReg1 === (filterLength.asUInt - 1.U)
  val doneLoading2 = cntReg2 === (filterLength.asUInt - 1.U)
  val count1 = RegInit(true.B)
  val count2 = RegInit(true.B)

  when(count1 && ADC.io.TickOut === 1.U) {
    cntReg1 := cntReg1 + 1.U
  }

  when(count2) {
    cntReg2 := cntReg2 + 1.U
  }

  when(doneLoading1) {

    ADCFilter.io.ConvEnable := 1.U
    ADCLoad := false.B
    cntReg1 := 0.U
    count1 := false.B
  }
  when(doneLoading2) {

    DACFilter.io.ConvEnable := 1.U
    DACLoad := false.B
    cntReg2 := 0.U
    count2 := false.B
  }

  when(ADCFilter.io.Completed === 1.U && doneLoading1 === 0.U) {
    // when a sample is ready send it to either adc or dac

    ADCLoad := 1.U
    count1 := true.B

  }
  when(DACFilter.io.Completed === 1.U && doneLoading2 === 0.U) {
    // when a sample is ready send it to either adc or dac

    DACLoad := 1.U
    count2 := true.B

  }

}
