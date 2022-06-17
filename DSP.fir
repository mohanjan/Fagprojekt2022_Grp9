circuit DSP :
  module InController :
    input clock : Clock
    input reset : Reset
    output io : { flip In : UInt<1>, ADC_D_out : UInt<1>, flip Sync : UInt<1>, flip InFIR : UInt<18>, Out : UInt<18>, OutFIR : UInt<18>}

    wire syncIn : UInt<1>
    syncIn <= UInt<1>("h0")
    syncIn <= io.Sync @[InController.scala 23:10]
    io.ADC_D_out <= io.In @[InController.scala 26:15]
    reg inReg : UInt<18>, clock with :
      reset => (reset, UInt<18>("h0")) @[InController.scala 29:22]
    reg sample : UInt<18>, clock with :
      reset => (reset, UInt<18>("h0")) @[InController.scala 33:23]
    reg cntReg : UInt<5>, clock with :
      reset => (reset, UInt<5>("h0")) @[InController.scala 36:23]
    node tick = eq(cntReg, UInt<1>("h0")) @[InController.scala 38:21]
    node _inReg_T = bits(inReg, 17, 1) @[InController.scala 40:28]
    node _inReg_T_1 = cat(io.In, _inReg_T) @[Cat.scala 31:58]
    inReg <= _inReg_T_1 @[InController.scala 40:9]
    node _T = eq(syncIn, UInt<1>("h1")) @[InController.scala 46:14]
    when _T : @[InController.scala 46:21]
      node _cntReg_T = add(cntReg, UInt<1>("h1")) @[InController.scala 48:22]
      node _cntReg_T_1 = tail(_cntReg_T, 1) @[InController.scala 48:22]
      cntReg <= _cntReg_T_1 @[InController.scala 48:12]
    node _T_1 = eq(cntReg, UInt<5>("h12")) @[InController.scala 51:15]
    when _T_1 : @[InController.scala 51:27]
      cntReg <= UInt<1>("h0") @[InController.scala 52:12]
      sample <= io.InFIR @[InController.scala 53:12]
    io.OutFIR <= inReg @[InController.scala 62:13]
    io.Out <= sample @[InController.scala 63:10]

  module OutController :
    input clock : Clock
    input reset : Reset
    output io : { OutPWM : UInt<1>, flip Sync : UInt<1>, flip In : UInt<18>, flip InFIR : UInt<18>, OutFIR : UInt<18>}

    wire DDC : UInt<18>
    DDC <= UInt<18>("h0")
    reg ZReg : UInt<18>, clock with :
      reset => (reset, UInt<18>("h0")) @[OutController.scala 24:22]
    wire Diff : UInt<18>
    Diff <= UInt<18>("h0")
    reg cntReg : UInt<5>, clock with :
      reset => (reset, UInt<5>("h0")) @[OutController.scala 28:23]
    reg cntReg2 : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[OutController.scala 29:24]
    node tick = eq(cntReg, UInt<1>("h0")) @[OutController.scala 30:21]
    wire syncIn : UInt<1>
    syncIn <= UInt<1>("h0")
    syncIn <= io.Sync @[OutController.scala 32:10]
    io.OutFIR <= UInt<1>("h0") @[OutController.scala 33:13]
    node _cntReg2_T = add(cntReg2, UInt<1>("h1")) @[OutController.scala 43:23]
    node _cntReg2_T_1 = tail(_cntReg2_T, 1) @[OutController.scala 43:23]
    cntReg2 <= _cntReg2_T_1 @[OutController.scala 43:12]
    node _T = eq(syncIn, UInt<1>("h1")) @[OutController.scala 52:12]
    when _T : @[OutController.scala 52:19]
      node _ZReg_T = add(ZReg, Diff) @[OutController.scala 53:16]
      node _ZReg_T_1 = tail(_ZReg_T, 1) @[OutController.scala 53:16]
      ZReg <= _ZReg_T_1 @[OutController.scala 53:8]
      node _Diff_T = sub(io.InFIR, DDC) @[OutController.scala 55:20]
      node _Diff_T_1 = tail(_Diff_T, 1) @[OutController.scala 55:20]
      Diff <= _Diff_T_1 @[OutController.scala 55:8]
      node _DDC_T = eq(io.OutPWM, UInt<1>("h1")) @[OutController.scala 56:24]
      node _DDC_T_1 = mux(UInt<1>("h1"), UInt<18>("h3ffff"), UInt<18>("h0")) @[Bitwise.scala 74:12]
      node _DDC_T_2 = mux(_DDC_T, _DDC_T_1, UInt<1>("h0")) @[OutController.scala 56:13]
      DDC <= _DDC_T_2 @[OutController.scala 56:7]
      io.OutFIR <= io.In @[OutController.scala 57:13]
    node _io_OutPWM_T = bits(ZReg, 17, 17) @[OutController.scala 61:18]
    io.OutPWM <= _io_OutPWM_T @[OutController.scala 61:11]

  module IOMaster :
    input clock : Clock
    input reset : Reset
    output io : { flip In_ADC : UInt<1>, Out_ADC_D : UInt<1>, Out_DAC : UInt<1>, Sync : UInt<1>, flip In_DAC : UInt<18>, Out_ADC : UInt<18>}

    inst ADC of InController @[IOMaster.scala 18:19]
    ADC.clock <= clock
    ADC.reset <= reset
    inst DAC of OutController @[IOMaster.scala 19:19]
    DAC.clock <= clock
    DAC.reset <= reset
    reg syncReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[IOMaster.scala 21:24]
    node _syncReg_T = add(syncReg, UInt<1>("h1")) @[IOMaster.scala 22:22]
    node _syncReg_T_1 = tail(_syncReg_T, 1) @[IOMaster.scala 22:22]
    syncReg <= _syncReg_T_1 @[IOMaster.scala 22:11]
    node _T = eq(syncReg, UInt<1>("h0")) @[IOMaster.scala 23:16]
    when _T : @[IOMaster.scala 23:24]
      io.Sync <= UInt<1>("h1") @[IOMaster.scala 24:13]
    else :
      io.Sync <= UInt<1>("h0") @[IOMaster.scala 26:13]
    node _T_1 = eq(syncReg, UInt<1>("h1")) @[IOMaster.scala 28:16]
    when _T_1 : @[IOMaster.scala 28:24]
      syncReg <= UInt<1>("h0") @[IOMaster.scala 29:13]
    ADC.io.In <= io.In_ADC @[IOMaster.scala 32:13]
    io.Out_ADC <= ADC.io.Out @[IOMaster.scala 33:14]
    ADC.io.InFIR <= ADC.io.OutFIR @[IOMaster.scala 34:16]
    io.Out_ADC_D <= ADC.io.ADC_D_out @[IOMaster.scala 35:16]
    DAC.io.In <= io.In_DAC @[IOMaster.scala 37:13]
    io.Out_DAC <= DAC.io.OutPWM @[IOMaster.scala 38:14]
    DAC.io.InFIR <= DAC.io.OutFIR @[IOMaster.scala 39:16]
    ADC.io.Sync <= io.Sync @[IOMaster.scala 41:15]
    DAC.io.Sync <= io.Sync @[IOMaster.scala 42:15]

  module DSP :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip ADIn : UInt<1>, DAOut : UInt<1>, ADOut : UInt<1>}

    inst IOC of IOMaster @[DSP.scala 13:20]
    IOC.clock <= clock
    IOC.reset <= reset
    IOC.io.In_ADC <= io.ADIn @[DSP.scala 15:17]
    IOC.io.In_DAC <= IOC.io.Out_ADC @[DSP.scala 16:17]
    io.DAOut <= IOC.io.Out_DAC @[DSP.scala 17:19]
    io.ADOut <= IOC.io.Out_ADC_D @[DSP.scala 18:19]

