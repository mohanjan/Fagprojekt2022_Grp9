circuit DSP :
  module InController :
    input clock : Clock
    input reset : Reset
    output io : { flip In : UInt<1>, ADC_D_out : UInt<1>, flip Sync : UInt<1>, flip InFIR : SInt<14>, Out : SInt<14>, OutFIR : SInt<14>}

    wire syncIn : UInt<1>
    syncIn <= UInt<1>("h0")
    reg ADCDReg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[InController.scala 25:24]
    reg FIRReg : SInt<14>, clock with :
      reset => (reset, asSInt(UInt<14>("h0"))) @[InController.scala 26:23]
    reg OutReg : SInt<14>, clock with :
      reset => (reset, asSInt(UInt<14>("h0"))) @[InController.scala 27:23]
    syncIn <= io.Sync @[InController.scala 32:10]
    io.ADC_D_out <= ADCDReg @[InController.scala 34:16]
    io.OutFIR <= FIRReg @[InController.scala 35:13]
    io.Out <= OutReg @[InController.scala 36:10]
    reg inReg : UInt<14>, clock with :
      reset => (reset, UInt<14>("h0")) @[InController.scala 40:22]
    reg sample : SInt<14>, clock with :
      reset => (reset, asSInt(UInt<14>("h0"))) @[InController.scala 42:23]
    reg cntReg : UInt<5>, clock with :
      reset => (reset, UInt<5>("h0")) @[InController.scala 47:23]
    node tick = eq(cntReg, UInt<1>("h0")) @[InController.scala 48:21]
    node _T = eq(syncIn, UInt<1>("h1")) @[InController.scala 51:15]
    when _T : @[InController.scala 51:23]
      node _cntReg_T = add(cntReg, UInt<1>("h1")) @[InController.scala 52:22]
      node _cntReg_T_1 = tail(_cntReg_T, 1) @[InController.scala 52:22]
      cntReg <= _cntReg_T_1 @[InController.scala 52:12]
      node _inReg_T = bits(inReg, 13, 1) @[InController.scala 53:32]
      node _inReg_T_1 = cat(ADCDReg, _inReg_T) @[Cat.scala 31:58]
      inReg <= _inReg_T_1 @[InController.scala 53:11]
      ADCDReg <= io.In @[InController.scala 55:13]
    node _T_1 = eq(cntReg, UInt<4>("he")) @[InController.scala 58:15]
    when _T_1 : @[InController.scala 58:27]
      cntReg <= UInt<1>("h0") @[InController.scala 59:12]
      OutReg <= sample @[InController.scala 60:12]
      sample <= io.InFIR @[InController.scala 61:12]
      node _FIRReg_T = bits(inReg, 13, 1) @[InController.scala 64:20]
      node _FIRReg_T_1 = cvt(_FIRReg_T) @[InController.scala 64:38]
      FIRReg <= _FIRReg_T_1 @[InController.scala 64:12]

  module OutController :
    input clock : Clock
    input reset : Reset
    output io : { OutPWM : UInt<1>, flip Sync : UInt<1>, flip In : SInt<14>, flip InFIR : SInt<14>, OutFIR : SInt<14>}

    reg DDC : SInt<14>, clock with :
      reset => (reset, asSInt(UInt<14>("h0"))) @[OutController.scala 20:22]
    io.OutFIR <= io.In @[OutController.scala 24:13]
    reg ZReg : SInt<14>, clock with :
      reset => (reset, asSInt(UInt<14>("h0"))) @[OutController.scala 25:22]
    reg Diff : SInt<14>, clock with :
      reset => (reset, asSInt(UInt<14>("h0"))) @[OutController.scala 26:22]
    reg FIRpReg : SInt<14>, clock with :
      reset => (reset, asSInt(UInt<14>("h0"))) @[OutController.scala 27:24]
    wire syncIn : UInt<1>
    syncIn <= UInt<1>("h0")
    syncIn <= io.Sync @[OutController.scala 35:10]
    node _T = eq(syncIn, UInt<1>("h1")) @[OutController.scala 44:15]
    when _T : @[OutController.scala 44:23]
      FIRpReg <= io.InFIR @[OutController.scala 51:13]
      node _Diff_T = sub(FIRpReg, DDC) @[OutController.scala 52:21]
      node _Diff_T_1 = tail(_Diff_T, 1) @[OutController.scala 52:21]
      node _Diff_T_2 = asSInt(_Diff_T_1) @[OutController.scala 52:21]
      Diff <= _Diff_T_2 @[OutController.scala 52:10]
      node _ZReg_T = add(ZReg, Diff) @[OutController.scala 53:18]
      node _ZReg_T_1 = tail(_ZReg_T, 1) @[OutController.scala 53:18]
      node _ZReg_T_2 = asSInt(_ZReg_T_1) @[OutController.scala 53:18]
      ZReg <= _ZReg_T_2 @[OutController.scala 53:10]
      node _DDC_T = eq(io.OutPWM, UInt<1>("h1")) @[OutController.scala 54:26]
      node _DDC_T_1 = mux(UInt<1>("h1"), UInt<13>("h1fff"), UInt<13>("h0")) @[Bitwise.scala 74:12]
      node _DDC_T_2 = cvt(_DDC_T_1) @[OutController.scala 54:60]
      node _DDC_T_3 = mux(UInt<1>("h1"), UInt<13>("h1fff"), UInt<13>("h0")) @[Bitwise.scala 74:12]
      node _DDC_T_4 = cvt(_DDC_T_3) @[OutController.scala 54:93]
      node _DDC_T_5 = not(_DDC_T_4) @[OutController.scala 54:66]
      node _DDC_T_6 = asSInt(_DDC_T_5) @[OutController.scala 54:66]
      node _DDC_T_7 = mux(_DDC_T, _DDC_T_2, _DDC_T_6) @[OutController.scala 54:15]
      DDC <= _DDC_T_7 @[OutController.scala 54:9]
    node _io_OutPWM_T = bits(ZReg, 13, 13) @[OutController.scala 62:21]
    node _io_OutPWM_T_1 = not(_io_OutPWM_T) @[OutController.scala 62:16]
    io.OutPWM <= _io_OutPWM_T_1 @[OutController.scala 62:13]

  module IOMaster :
    input clock : Clock
    input reset : Reset
    output io : { flip In_ADC : UInt<1>, Out_ADC_D : UInt<1>, Out_DAC : UInt<1>, Sync : UInt<1>, flip In_DAC : SInt<14>, Out_ADC : SInt<14>}

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
    node _T_1 = eq(syncReg, UInt<1>("h1")) @[IOMaster.scala 29:16]
    when _T_1 : @[IOMaster.scala 29:24]
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

    inst IOC of IOMaster @[DSP.scala 15:20]
    IOC.clock <= clock
    IOC.reset <= reset
    IOC.io.In_ADC <= io.ADIn @[DSP.scala 17:17]
    IOC.io.In_DAC <= IOC.io.Out_ADC @[DSP.scala 18:17]
    io.DAOut <= IOC.io.Out_DAC @[DSP.scala 19:17]
    io.ADOut <= IOC.io.Out_ADC_D @[DSP.scala 20:17]
    io.SyncOut <= IOC.io.Sync @[DSP.scala 21:17]

