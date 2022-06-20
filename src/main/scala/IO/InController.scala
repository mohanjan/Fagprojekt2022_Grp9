// støjen bliver skubbet op i høje frekvenser, men det er også de høje frekvenser der bliver dæmpet
//lav et fælles modul det styrer filter ressourcen
import chisel3._
import chisel3.util._

class InController(bufferWidth: Int) extends Module {
  val io = IO(new Bundle {
    val In = Input(UInt(1.W))
    val Out = Output(SInt(bufferWidth.W))
    val ADC_D_out = Output(UInt(1.W))
  })

  val filterLength = 824

  val ADCReg = RegInit(0.S(bufferWidth.W))
  val FIRReg = RegInit(0.S(bufferWidth.W))

  val ADCFilter = Module(
    new IOFilter(filterLength, bufferWidth)
  ) // 827 filterlængde 414 koefficienter
  
  val ADCLoad = RegInit(0.U(1.W))

  ADCFilter.io.WaveIn := ADCReg
  ADCFilter.io.LoadSamples := ADCLoad // hhhh
  ADCFilter.io.ConvEnable := 0.U

  val cntReg1 = RegInit(0.U(10.W))
  val doneLoading1 = cntReg1 === (filterLength.asUInt - 1.U)
  val count1 = RegInit(true.B)
  val cntReg = RegInit(0.U(10.W))

  when(count1 && cntReg === bufferWidth.U) {
    cntReg1 := cntReg1 + 1.U
  }

  when(doneLoading1) {
    ADCFilter.io.ConvEnable := 1.U
    ADCLoad := false.B
    cntReg1 := 0.U
    count1 := false.B
  }

  when(ADCFilter.io.Completed === 1.U && doneLoading1 === 0.U) {
    // when a sample is ready send it to either adc or dac

    ADCLoad := 1.U
    count1 := true.B
  }

  io.Out := ADCFilter.io.WaveOut
  ADCReg := FIRReg

  val delay = RegInit(0.U(1.W))
  delay := io.In
  io.ADC_D_out := delay

  // serial to parallel buffer
  val inReg = RegInit(0.U(bufferWidth.W))
  val sample = RegInit(0x10.S(bufferWidth.W))

  //cntReg := cntReg + 1.U
  //val tick = cntReg === scaler

  /*
  val tick = Wire(Bool())
  tick := (cntReg === scaler).asBool
  */
  
  inReg := Cat(io.In, inReg(bufferWidth - 1, 1))

  when(cntReg === bufferWidth.U) {
    cntReg := 0.U
    FIRReg := ~inReg.asSInt +1.S
  }

  // send word to fir
  io.Out := sample

  // master will then put filtered value onto io.Out

}
