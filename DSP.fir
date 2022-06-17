circuit DSP :
  module InController :
    input clock : Clock
    input reset : Reset
    output io : { flip In : UInt<1>, flip InFIR : SInt<18>, Out : SInt<18>, ADC_D_out : UInt<1>, OutFIR : SInt<18>}

    reg dReg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[InController.scala 16:21]
    dReg <= io.In @[InController.scala 18:8]
    io.ADC_D_out <= dReg @[InController.scala 19:16]
    reg inReg : UInt<18>, clock with :
      reset => (reset, UInt<18>("h0")) @[InController.scala 22:22]
    reg sample : SInt<18>, clock with :
      reset => (reset, asSInt(UInt<18>("h0"))) @[InController.scala 23:23]
    reg cntReg : UInt<5>, clock with :
      reset => (reset, UInt<5>("h0")) @[InController.scala 27:23]
    node tick = eq(cntReg, UInt<1>("h0")) @[InController.scala 29:21]
    node _inReg_T = bits(inReg, 17, 1) @[InController.scala 31:28]
    node _inReg_T_1 = cat(io.In, _inReg_T) @[Cat.scala 31:58]
    inReg <= _inReg_T_1 @[InController.scala 31:9]
    reg cntReg2 : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[InController.scala 35:24]
    node _cntReg2_T = add(cntReg2, UInt<1>("h1")) @[InController.scala 36:22]
    node _cntReg2_T_1 = tail(_cntReg2_T, 1) @[InController.scala 36:22]
    cntReg2 <= _cntReg2_T_1 @[InController.scala 36:11]
    node _T = eq(cntReg2, UInt<7>("h7f")) @[InController.scala 38:16]
    when _T : @[InController.scala 38:26]
      cntReg2 <= UInt<1>("h0") @[InController.scala 39:13]
      node _cntReg_T = add(cntReg, UInt<1>("h1")) @[InController.scala 40:22]
      node _cntReg_T_1 = tail(_cntReg_T, 1) @[InController.scala 40:22]
      cntReg <= _cntReg_T_1 @[InController.scala 40:12]
    node _T_1 = eq(cntReg, UInt<5>("h12")) @[InController.scala 43:15]
    when _T_1 : @[InController.scala 43:27]
      cntReg <= UInt<1>("h0") @[InController.scala 44:12]
      sample <= io.InFIR @[InController.scala 45:12]
    node _io_OutFIR_T = asSInt(inReg) @[InController.scala 49:23]
    node _io_OutFIR_T_1 = not(_io_OutFIR_T) @[InController.scala 49:16]
    node _io_OutFIR_T_2 = asSInt(_io_OutFIR_T_1) @[InController.scala 49:16]
    node _io_OutFIR_T_3 = add(_io_OutFIR_T_2, asSInt(UInt<2>("h1"))) @[InController.scala 49:30]
    node _io_OutFIR_T_4 = tail(_io_OutFIR_T_3, 1) @[InController.scala 49:30]
    node _io_OutFIR_T_5 = asSInt(_io_OutFIR_T_4) @[InController.scala 49:30]
    io.OutFIR <= _io_OutFIR_T_5 @[InController.scala 49:13]
    io.Out <= sample @[InController.scala 50:10]

  module OutController :
    input clock : Clock
    input reset : Reset
    output io : { flip In : SInt<18>, flip InFIR : SInt<18>, OutFIR : SInt<18>, OutPWM : UInt<1>}

    reg ZReg : SInt<18>, clock with :
      reset => (reset, asSInt(UInt<18>("h0"))) @[OutController.scala 17:22]
    wire Diff : SInt<18> @[OutController.scala 18:19]
    wire DDC : UInt<18>
    DDC <= UInt<18>("h0")
    reg cntReg : UInt<5>, clock with :
      reset => (reset, UInt<5>("h0")) @[OutController.scala 28:23]
    reg cntReg2 : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[OutController.scala 29:24]
    node tick = eq(cntReg, UInt<1>("h0")) @[OutController.scala 30:21]
    node _cntReg2_T = add(cntReg2, UInt<1>("h1")) @[OutController.scala 41:23]
    node _cntReg2_T_1 = tail(_cntReg2_T, 1) @[OutController.scala 41:23]
    cntReg2 <= _cntReg2_T_1 @[OutController.scala 41:12]
    node _ZReg_T = add(ZReg, Diff) @[OutController.scala 45:19]
    node _ZReg_T_1 = tail(_ZReg_T, 1) @[OutController.scala 45:19]
    node _ZReg_T_2 = asSInt(_ZReg_T_1) @[OutController.scala 45:19]
    ZReg <= _ZReg_T_2 @[OutController.scala 45:11]
    node _Diff_T = asSInt(DDC) @[OutController.scala 50:26]
    node _Diff_T_1 = sub(io.InFIR, _Diff_T) @[OutController.scala 50:20]
    node _Diff_T_2 = tail(_Diff_T_1, 1) @[OutController.scala 50:20]
    node _Diff_T_3 = asSInt(_Diff_T_2) @[OutController.scala 50:20]
    Diff <= _Diff_T_3 @[OutController.scala 50:8]
    node _ZReg_T_3 = add(ZReg, Diff) @[OutController.scala 52:16]
    node _ZReg_T_4 = tail(_ZReg_T_3, 1) @[OutController.scala 52:16]
    node _ZReg_T_5 = asSInt(_ZReg_T_4) @[OutController.scala 52:16]
    ZReg <= _ZReg_T_5 @[OutController.scala 52:8]
    node _DDC_T = eq(io.OutPWM, UInt<1>("h1")) @[OutController.scala 55:24]
    node _DDC_T_1 = mux(UInt<1>("h1"), UInt<18>("h3ffff"), UInt<18>("h0")) @[Bitwise.scala 74:12]
    node _DDC_T_2 = mux(_DDC_T, _DDC_T_1, UInt<1>("h0")) @[OutController.scala 55:13]
    DDC <= _DDC_T_2 @[OutController.scala 55:7]
    io.OutFIR <= io.In @[OutController.scala 58:13]
    node _io_OutPWM_T = bits(ZReg, 17, 17) @[OutController.scala 59:21]
    node _io_OutPWM_T_1 = not(_io_OutPWM_T) @[OutController.scala 59:16]
    io.OutPWM <= _io_OutPWM_T_1 @[OutController.scala 59:13]

  module IOMaster :
    input clock : Clock
    input reset : Reset
    output io : { flip In_ADC : UInt<1>, flip In_DAC : SInt<18>, Out_ADC : SInt<18>, Out_ADC_D : UInt<1>, Out_DAC : UInt<1>}

    inst ADC of InController @[IOMaster.scala 13:19]
    ADC.clock <= clock
    ADC.reset <= reset
    inst DAC of OutController @[IOMaster.scala 14:19]
    DAC.clock <= clock
    DAC.reset <= reset
    ADC.io.In <= io.In_ADC @[IOMaster.scala 16:13]
    io.Out_ADC <= ADC.io.Out @[IOMaster.scala 17:14]
    ADC.io.InFIR <= ADC.io.OutFIR @[IOMaster.scala 18:16]
    io.Out_ADC_D <= ADC.io.ADC_D_out @[IOMaster.scala 19:16]
    DAC.io.In <= io.In_DAC @[IOMaster.scala 21:13]
    io.Out_DAC <= DAC.io.OutPWM @[IOMaster.scala 22:14]
    DAC.io.InFIR <= DAC.io.OutFIR @[IOMaster.scala 23:16]

  module DSP :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip ADIn : UInt<1>, DAOut : UInt<1>, ADOut : UInt<1>}

    inst IOC of IOMaster @[DSP.scala 21:20]
    IOC.clock <= clock
    IOC.reset <= reset
    IOC.io.In_ADC <= io.ADIn @[DSP.scala 23:17]
    IOC.io.In_DAC <= IOC.io.Out_ADC @[DSP.scala 25:17]
    io.DAOut <= IOC.io.Out_DAC @[DSP.scala 27:19]
    io.ADOut <= IOC.io.Out_ADC_D @[DSP.scala 28:19]

