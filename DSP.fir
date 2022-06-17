circuit DSP :
  module InController :
    input clock : Clock
    input reset : Reset
    output io : { flip In : UInt<1>, ADC_D_out : UInt<1>, flip Sync : UInt<1>, flip InFIR : UInt<18>, Out : UInt<18>, OutFIR : UInt<18>}

    wire syncIn : UInt<1>
    syncIn <= UInt<1>("h0")
    reg ADCDReg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[InController.scala 25:24]
    reg FIRReg : UInt<18>, clock with :
      reset => (reset, UInt<18>("h0")) @[InController.scala 26:23]
    reg OutReg : UInt<18>, clock with :
      reset => (reset, UInt<18>("h0")) @[InController.scala 27:23]
    syncIn <= io.Sync @[InController.scala 29:10]
    io.ADC_D_out <= ADCDReg @[InController.scala 31:16]
    io.OutFIR <= FIRReg @[InController.scala 32:13]
    io.Out <= OutReg @[InController.scala 33:10]
    reg inReg : UInt<18>, clock with :
      reset => (reset, UInt<18>("h0")) @[InController.scala 36:22]
    reg sample : UInt<18>, clock with :
      reset => (reset, UInt<18>("h0")) @[InController.scala 40:23]
    reg cntReg : UInt<5>, clock with :
      reset => (reset, UInt<5>("h0")) @[InController.scala 43:23]
    node tick = eq(cntReg, UInt<1>("h0")) @[InController.scala 45:21]
    node _T = eq(syncIn, UInt<1>("h1")) @[InController.scala 52:15]
    when _T : @[InController.scala 52:23]
      node _cntReg_T = add(cntReg, UInt<1>("h1")) @[InController.scala 53:22]
      node _cntReg_T_1 = tail(_cntReg_T, 1) @[InController.scala 53:22]
      cntReg <= _cntReg_T_1 @[InController.scala 53:12]
      node _inReg_T = bits(inReg, 17, 1) @[InController.scala 54:30]
      node _inReg_T_1 = cat(io.In, _inReg_T) @[Cat.scala 31:58]
      inReg <= _inReg_T_1 @[InController.scala 54:11]
      node _ADCDReg_T = bits(inReg, 17, 17) @[InController.scala 56:21]
      ADCDReg <= _ADCDReg_T @[InController.scala 56:13]
    node _T_1 = eq(cntReg, UInt<5>("h12")) @[InController.scala 60:15]
    when _T_1 : @[InController.scala 60:27]
      cntReg <= UInt<1>("h0") @[InController.scala 61:12]
      sample <= io.InFIR @[InController.scala 62:12]
      FIRReg <= inReg @[InController.scala 65:12]
      OutReg <= sample @[InController.scala 66:12]

  module OutController :
    input clock : Clock
    input reset : Reset
    output io : { OutPWM : UInt<1>, flip Sync : UInt<1>, flip In : UInt<18>, flip InFIR : UInt<18>, OutFIR : UInt<18>}

    wire DDC : UInt<18>
    DDC <= UInt<18>("h0")
    reg ZReg : UInt<18>, clock with :
      reset => (reset, UInt<18>("h0")) @[OutController.scala 25:22]
    wire Diff : UInt<18>
    Diff <= UInt<18>("h0")
    wire syncIn : UInt<1>
    syncIn <= UInt<1>("h0")
    syncIn <= io.Sync @[OutController.scala 30:10]
    Diff <= UInt<1>("h0") @[OutController.scala 34:13]
    node _T = eq(syncIn, UInt<1>("h1")) @[OutController.scala 39:15]
    when _T : @[OutController.scala 39:23]
      node _ZReg_T = add(ZReg, Diff) @[OutController.scala 47:18]
      node _ZReg_T_1 = tail(_ZReg_T, 1) @[OutController.scala 47:18]
      ZReg <= _ZReg_T_1 @[OutController.scala 47:10]
      node _Diff_T = sub(io.InFIR, DDC) @[OutController.scala 48:22]
      node _Diff_T_1 = tail(_Diff_T, 1) @[OutController.scala 48:22]
      Diff <= _Diff_T_1 @[OutController.scala 48:10]
      node _DDC_T = eq(io.OutPWM, UInt<1>("h1")) @[OutController.scala 49:26]
      node _DDC_T_1 = mux(UInt<1>("h1"), UInt<18>("h3ffff"), UInt<18>("h0")) @[Bitwise.scala 74:12]
      node _DDC_T_2 = mux(_DDC_T, _DDC_T_1, UInt<1>("h0")) @[OutController.scala 49:15]
      DDC <= _DDC_T_2 @[OutController.scala 49:9]
    node _io_OutPWM_T = bits(ZReg, 17, 17) @[OutController.scala 52:20]
    io.OutPWM <= _io_OutPWM_T @[OutController.scala 52:13]
    io.OutFIR <= io.In @[OutController.scala 54:13]

  module IOMaster :
    input clock : Clock
    input reset : Reset
    output io : { flip In_ADC : UInt<1>, Out_ADC_D : UInt<1>, Out_DAC : UInt<1>, Sync : UInt<1>, flip In_DAC : UInt<18>, Out_ADC : UInt<18>}

    inst ADC of InController @[IOMaster.scala 19:19]
    ADC.clock <= clock
    ADC.reset <= reset
    inst DAC of OutController @[IOMaster.scala 20:19]
    DAC.clock <= clock
    DAC.reset <= reset
    reg syncReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[IOMaster.scala 22:24]
    node _syncReg_T = add(syncReg, UInt<1>("h1")) @[IOMaster.scala 23:22]
    node _syncReg_T_1 = tail(_syncReg_T, 1) @[IOMaster.scala 23:22]
    syncReg <= _syncReg_T_1 @[IOMaster.scala 23:11]
    node _T = eq(syncReg, UInt<1>("h1")) @[IOMaster.scala 24:16]
    when _T : @[IOMaster.scala 24:24]
      io.Sync <= UInt<1>("h1") @[IOMaster.scala 25:13]
    else :
      io.Sync <= UInt<1>("h0") @[IOMaster.scala 27:13]
    node _T_1 = eq(syncReg, UInt<7>("h7f")) @[IOMaster.scala 29:16]
    when _T_1 : @[IOMaster.scala 29:26]
      syncReg <= UInt<1>("h0") @[IOMaster.scala 30:13]
    ADC.io.In <= io.In_ADC @[IOMaster.scala 33:13]
    io.Out_ADC <= ADC.io.Out @[IOMaster.scala 34:14]
    ADC.io.InFIR <= ADC.io.OutFIR @[IOMaster.scala 35:16]
    io.Out_ADC_D <= ADC.io.ADC_D_out @[IOMaster.scala 36:16]
    DAC.io.In <= io.In_DAC @[IOMaster.scala 38:13]
    io.Out_DAC <= DAC.io.OutPWM @[IOMaster.scala 39:14]
    DAC.io.InFIR <= DAC.io.OutFIR @[IOMaster.scala 40:16]
    ADC.io.Sync <= io.Sync @[IOMaster.scala 42:15]
    DAC.io.Sync <= io.Sync @[IOMaster.scala 43:15]

  module DSP :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip ADIn : UInt<1>, DAOut : UInt<1>, ADOut : UInt<1>, SyncOut : UInt<1>}

    inst IOC of IOMaster @[DSP.scala 14:20]
    IOC.clock <= clock
    IOC.reset <= reset
    IOC.io.In_ADC <= io.ADIn @[DSP.scala 16:17]
    IOC.io.In_DAC <= IOC.io.Out_ADC @[DSP.scala 17:17]
    io.DAOut <= IOC.io.Out_DAC @[DSP.scala 18:17]
    io.ADOut <= IOC.io.Out_ADC_D @[DSP.scala 19:17]
    io.SyncOut <= IOC.io.Sync @[DSP.scala 20:17]

