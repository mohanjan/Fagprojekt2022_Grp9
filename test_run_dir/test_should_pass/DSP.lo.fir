circuit DSP :
  module InController :
    input clock : Clock
    input reset : UInt<1>
    input io_In : UInt<1>
    input io_InFIR : SInt<18>
    output io_Out : SInt<18>
    output io_ADC_D_out : UInt<1>
    output io_OutFIR : SInt<18>

    reg delay : UInt<1>, clock with :
      reset => (UInt<1>("h0"), delay) @[InController.scala 16:22]
    reg inReg : UInt<18>, clock with :
      reset => (UInt<1>("h0"), inReg) @[InController.scala 21:22]
    reg sample : SInt<18>, clock with :
      reset => (UInt<1>("h0"), sample) @[InController.scala 22:23]
    reg cntReg : UInt<8>, clock with :
      reset => (UInt<1>("h0"), cntReg) @[InController.scala 25:23]
    node _cntReg_T = add(cntReg, UInt<1>("h1")) @[InController.scala 26:20]
    node _cntReg_T_1 = tail(_cntReg_T, 1) @[InController.scala 26:20]
    node tick = eq(cntReg, UInt<5>("h12")) @[InController.scala 27:21]
    node _inReg_T = bits(inReg, 17, 1) @[InController.scala 29:28]
    node _inReg_T_1 = cat(io_In, _inReg_T) @[Cat.scala 31:58]
    node _GEN_0 = mux(tick, UInt<1>("h0"), _cntReg_T_1) @[InController.scala 26:10 32:14 33:12]
    node _GEN_1 = mux(tick, io_InFIR, sample) @[InController.scala 32:14 34:12 22:23]
    node _io_OutFIR_T = asSInt(inReg) @[InController.scala 38:23]
    node _io_OutFIR_T_1 = not(_io_OutFIR_T) @[InController.scala 38:16]
    node _io_OutFIR_T_2 = asSInt(_io_OutFIR_T_1) @[InController.scala 38:16]
    node _io_OutFIR_T_3 = add(_io_OutFIR_T_2, asSInt(UInt<2>("h1"))) @[InController.scala 38:30]
    node _io_OutFIR_T_4 = tail(_io_OutFIR_T_3, 1) @[InController.scala 38:30]
    node _io_OutFIR_T_5 = asSInt(_io_OutFIR_T_4) @[InController.scala 38:30]
    io_Out <= sample @[InController.scala 39:10]
    io_ADC_D_out <= delay @[InController.scala 18:16]
    io_OutFIR <= _io_OutFIR_T_5 @[InController.scala 38:13]
    delay <= mux(reset, UInt<1>("h0"), io_In) @[InController.scala 16:{22,22} 17:9]
    inReg <= mux(reset, UInt<18>("h0"), _inReg_T_1) @[InController.scala 21:{22,22} 29:9]
    sample <= mux(reset, asSInt(UInt<18>("h10")), _GEN_1) @[InController.scala 22:{23,23}]
    cntReg <= mux(reset, UInt<8>("h0"), _GEN_0) @[InController.scala 25:{23,23}]

  module OutController :
    input clock : Clock
    input reset : UInt<1>
    input io_In : SInt<18>
    input io_InFIR : SInt<18>
    output io_OutFIR : SInt<18>
    output io_OutPWM : UInt<1>

    reg ZReg : SInt<18>, clock with :
      reset => (UInt<1>("h0"), ZReg) @[OutController.scala 16:22]
    reg cntReg : UInt<4>, clock with :
      reset => (UInt<1>("h0"), cntReg) @[OutController.scala 21:23]
    node _cntReg_T = add(cntReg, UInt<1>("h1")) @[OutController.scala 22:20]
    node _cntReg_T_1 = tail(_cntReg_T, 1) @[OutController.scala 22:20]
    node tick = eq(cntReg, UInt<1>("h0")) @[OutController.scala 23:21]
    node _T = eq(cntReg, UInt<5>("h12")) @[OutController.scala 25:15]
    node _GEN_0 = mux(_T, UInt<1>("h0"), _cntReg_T_1) @[OutController.scala 22:10 25:26 26:12]
    node _DDC_T = eq(io_OutPWM, UInt<1>("h1")) @[OutController.scala 33:24]
    node _DDC_T_1 = mux(UInt<1>("h1"), UInt<18>("h3ffff"), UInt<18>("h0")) @[Bitwise.scala 74:12]
    node _DDC_T_2 = mux(_DDC_T, _DDC_T_1, UInt<1>("h0")) @[OutController.scala 33:13]
    node DDC = _DDC_T_2
    node _Diff_T = asSInt(DDC) @[OutController.scala 29:26]
    node _Diff_T_1 = sub(io_InFIR, _Diff_T) @[OutController.scala 29:20]
    node _Diff_T_2 = tail(_Diff_T_1, 1) @[OutController.scala 29:20]
    node _Diff_T_3 = asSInt(_Diff_T_2) @[OutController.scala 29:20]
    node Diff = asSInt(bits(_Diff_T_3, 15, 0)) @[OutController.scala 17:19 29:8]
    node _ZIn_T = add(ZReg, Diff) @[OutController.scala 30:16]
    node _ZIn_T_1 = tail(_ZIn_T, 1) @[OutController.scala 30:16]
    node _ZIn_T_2 = asSInt(_ZIn_T_1) @[OutController.scala 30:16]
    node _io_OutFIR_T = mux(tick, io_In, asSInt(UInt<1>("h0"))) @[OutController.scala 35:19]
    node _io_OutPWM_T = bits(ZReg, 17, 17) @[OutController.scala 36:21]
    node _io_OutPWM_T_1 = not(_io_OutPWM_T) @[OutController.scala 36:16]
    node ZIn = asSInt(bits(_ZIn_T_2, 15, 0)) @[OutController.scala 18:19 30:8]
    io_OutFIR <= _io_OutFIR_T @[OutController.scala 35:13]
    io_OutPWM <= _io_OutPWM_T_1 @[OutController.scala 36:13]
    ZReg <= mux(reset, asSInt(UInt<18>("h0")), ZIn) @[OutController.scala 16:{22,22} 31:8]
    cntReg <= mux(reset, UInt<4>("h0"), _GEN_0) @[OutController.scala 21:{23,23}]

  module IOFilter :
    input clock : Clock
    input reset : UInt<1>
    input io_ADCWaveIn : SInt<18>
    input io_DACWaveIn : SInt<18>
    output io_WaveOut : SInt<18>
    input io_SampleType : UInt<1>
    input io_ADCEnable : UInt<1>
    input io_DACEnable : UInt<1>
    output io_Completed : UInt<1>

    mem InputSampleMemory : @[IOFilter.scala 32:38]
      data-type => SInt<18>
      depth => 2048
      read-latency => 1
      write-latency => 1
      reader => ReadInputSample_MPORT
      writer => MPORT_2
      writer => MPORT_3
      read-under-write => undefined
    mem OutputSampleMemory : @[IOFilter.scala 33:39]
      data-type => SInt<18>
      depth => 2048
      read-latency => 1
      write-latency => 1
      reader => ReadOutputSample_MPORT
      writer => MPORT
      writer => MPORT_1
      read-under-write => undefined
    mem CoeffMemory : @[IOFilter.scala 34:32]
      data-type => SInt<18>
      depth => 1024
      read-latency => 1
      write-latency => 1
      reader => CoeffWire_MPORT
      read-under-write => undefined
    reg OutputReg : SInt<18>, clock with :
      reset => (UInt<1>("h0"), OutputReg) @[IOFilter.scala 36:22]
    reg MAccReg : SInt<18>, clock with :
      reset => (UInt<1>("h0"), MAccReg) @[IOFilter.scala 37:20]
    reg SampleCount : UInt<11>, clock with :
      reset => (UInt<1>("h0"), SampleCount) @[IOFilter.scala 40:24]
    reg InputSamplePointer : UInt<11>, clock with :
      reset => (UInt<1>("h0"), InputSamplePointer) @[IOFilter.scala 42:31]
    reg OutputSamplePointer : UInt<11>, clock with :
      reset => (UInt<1>("h0"), OutputSamplePointer) @[IOFilter.scala 43:32]
    node _T_19 = add(OutputSamplePointer, SampleCount) @[IOFilter.scala 95:30]
    node _T_20 = tail(_T_19, 1) @[IOFilter.scala 95:30]
    node maxcountwire = UInt<7>("h63") @[IOFilter.scala 28:26 55:16]
    node _T_21 = leq(_T_20, maxcountwire) @[IOFilter.scala 95:44]
    node _SampleAdress_T = add(OutputSamplePointer, SampleCount) @[IOFilter.scala 96:43]
    node _SampleAdress_T_1 = tail(_SampleAdress_T, 1) @[IOFilter.scala 96:43]
    node _SampleAdress_T_2 = add(OutputSamplePointer, SampleCount) @[IOFilter.scala 98:43]
    node _SampleAdress_T_3 = tail(_SampleAdress_T_2, 1) @[IOFilter.scala 98:43]
    node _SampleAdress_T_4 = sub(_SampleAdress_T_3, UInt<7>("h64")) @[IOFilter.scala 98:57]
    node _SampleAdress_T_5 = tail(_SampleAdress_T_4, 1) @[IOFilter.scala 98:57]
    node _GEN_19 = mux(_T_21, _SampleAdress_T_1, _SampleAdress_T_5) @[IOFilter.scala 95:61 96:20 98:20]
    node _T_33 = add(InputSamplePointer, SampleCount) @[IOFilter.scala 126:29]
    node _T_34 = tail(_T_33, 1) @[IOFilter.scala 126:29]
    node _T_35 = leq(_T_34, maxcountwire) @[IOFilter.scala 126:43]
    node _SampleAdress_T_6 = add(InputSamplePointer, SampleCount) @[IOFilter.scala 127:42]
    node _SampleAdress_T_7 = tail(_SampleAdress_T_6, 1) @[IOFilter.scala 127:42]
    node _SampleAdress_T_8 = add(InputSamplePointer, SampleCount) @[IOFilter.scala 129:42]
    node _SampleAdress_T_9 = tail(_SampleAdress_T_8, 1) @[IOFilter.scala 129:42]
    node _SampleAdress_T_10 = sub(_SampleAdress_T_9, UInt<7>("h64")) @[IOFilter.scala 129:56]
    node _SampleAdress_T_11 = tail(_SampleAdress_T_10, 1) @[IOFilter.scala 129:56]
    node _GEN_43 = mux(_T_35, _SampleAdress_T_7, _SampleAdress_T_11) @[IOFilter.scala 126:60 127:20 129:20]
    node _GEN_67 = mux(io_SampleType, _GEN_19, _GEN_43) @[IOFilter.scala 93:23]
    node SampleAdress = _GEN_67 @[IOFilter.scala 19:26]
    node _GEN_0 = validif(UInt<1>("h1"), SampleAdress) @[IOFilter.scala 52:{44,44}]
    node _ReadInputSample_WIRE = _GEN_0 @[IOFilter.scala 52:44]
    node _ReadInputSample_T = or(_ReadInputSample_WIRE, UInt<11>("h0")) @[IOFilter.scala 52:44]
    node _ReadInputSample_T_1 = bits(_ReadInputSample_T, 10, 0) @[IOFilter.scala 52:44]
    node _GEN_1 = mux(UInt<1>("h1"), UInt<1>("h1"), UInt<1>("h0")) @[IOFilter.scala 32:38 52:{44,44}]
    node _GEN_2 = validif(UInt<1>("h1"), _ReadInputSample_T_1) @[IOFilter.scala 52:{44,44}]
    node _GEN_3 = validif(UInt<1>("h1"), clock) @[IOFilter.scala 52:{44,44}]
    node _ReadOutputSample_WIRE = _GEN_0 @[IOFilter.scala 53:46]
    node _ReadOutputSample_T = or(_ReadOutputSample_WIRE, UInt<11>("h0")) @[IOFilter.scala 53:46]
    node _ReadOutputSample_T_1 = bits(_ReadOutputSample_T, 10, 0) @[IOFilter.scala 53:46]
    node _GEN_4 = validif(UInt<1>("h1"), _ReadOutputSample_T_1) @[IOFilter.scala 53:{46,46}]
    node _T_8 = eq(SampleCount, maxcountwire) @[IOFilter.scala 76:20]
    node _T_9 = gt(SampleCount, UInt<1>("h0")) @[IOFilter.scala 81:27]
    node Halfcountwire = UInt<6>("h31") @[IOFilter.scala 27:27 54:17]
    node _T_10 = lt(SampleCount, Halfcountwire) @[IOFilter.scala 81:49]
    node _T_11 = and(_T_9, _T_10) @[IOFilter.scala 81:34]
    node _T_12 = eq(io_ADCEnable, UInt<1>("h0")) @[IOFilter.scala 81:68]
    node _T_13 = eq(io_DACEnable, UInt<1>("h0")) @[IOFilter.scala 81:85]
    node _T_14 = and(_T_12, _T_13) @[IOFilter.scala 81:82]
    node _T_15 = eq(SampleCount, UInt<1>("h0")) @[IOFilter.scala 81:114]
    node _T_16 = and(_T_14, _T_15) @[IOFilter.scala 81:99]
    node _T_17 = or(_T_11, _T_16) @[IOFilter.scala 81:66]
    node _CoeffCount_T = add(SampleCount, UInt<1>("h1")) @[IOFilter.scala 83:31]
    node _CoeffCount_T_1 = tail(_CoeffCount_T, 1) @[IOFilter.scala 83:31]
    node _T_18 = geq(SampleCount, Halfcountwire) @[IOFilter.scala 86:26]
    node _CoeffCount_T_2 = sub(UInt<7>("h62"), SampleCount) @[IOFilter.scala 88:40]
    node _CoeffCount_T_3 = tail(_CoeffCount_T_2, 1) @[IOFilter.scala 88:40]
    node _GEN_12 = mux(_T_18, _CoeffCount_T_3, UInt<1>("h0")) @[IOFilter.scala 51:14 86:44 88:16]
    node _GEN_14 = mux(_T_17, _CoeffCount_T_1, _GEN_12) @[IOFilter.scala 81:123 83:16]
    node _GEN_18 = mux(_T_8, UInt<1>("h0"), _GEN_14) @[IOFilter.scala 51:14 76:38]
    node CoeffCount = _GEN_18 @[IOFilter.scala 18:24]
    node _GEN_5 = validif(UInt<1>("h1"), CoeffCount) @[IOFilter.scala 58:{32,32}]
    node _CoeffWire_WIRE = _GEN_5 @[IOFilter.scala 58:32]
    node _CoeffWire_T = or(_CoeffWire_WIRE, UInt<10>("h0")) @[IOFilter.scala 58:32]
    node _CoeffWire_T_1 = bits(_CoeffWire_T, 9, 0) @[IOFilter.scala 58:32]
    node _GEN_6 = validif(UInt<1>("h1"), _CoeffWire_T_1) @[IOFilter.scala 58:{32,32}]
    node _T = gt(SampleCount, UInt<1>("h0")) @[IOFilter.scala 62:20]
    node _T_1 = eq(io_ADCEnable, UInt<1>("h0")) @[IOFilter.scala 62:28]
    node _T_2 = eq(io_DACEnable, UInt<1>("h0")) @[IOFilter.scala 62:45]
    node _T_3 = and(_T_1, _T_2) @[IOFilter.scala 62:42]
    node _T_4 = eq(SampleCount, UInt<1>("h0")) @[IOFilter.scala 62:75]
    node _T_5 = and(_T_3, _T_4) @[IOFilter.scala 62:59]
    node _T_6 = or(_T, _T_5) @[IOFilter.scala 62:26]
    node CoeffWire = CoeffMemory.CoeffWire_MPORT.data @[IOFilter.scala 24:23 58:13]
    node _T_26 = eq(SampleCount, UInt<1>("h0")) @[IOFilter.scala 109:22]
    node ReadOutputSample = OutputSampleMemory.ReadOutputSample_MPORT.data @[IOFilter.scala 21:30 53:20]
    node _GEN_22 = mux(_T_26, io_DACWaveIn, ReadOutputSample) @[IOFilter.scala 109:31 110:16 112:16]
    node _T_40 = eq(SampleCount, UInt<1>("h0")) @[IOFilter.scala 140:22]
    node ReadInputSample = InputSampleMemory.ReadInputSample_MPORT.data @[IOFilter.scala 20:29 52:19]
    node _GEN_46 = mux(_T_40, io_ADCWaveIn, ReadInputSample) @[IOFilter.scala 140:31 141:16 143:16]
    node _GEN_69 = mux(io_SampleType, _GEN_22, _GEN_46) @[IOFilter.scala 93:23]
    node FIRInput = _GEN_69 @[IOFilter.scala 17:22]
    node _Fircomputation36_T = mul(CoeffWire, FIRInput) @[IOFilter.scala 65:35]
    node _GEN_7 = mux(_T_6, _Fircomputation36_T, asSInt(UInt<1>("h0"))) @[IOFilter.scala 59:20 62:85 65:22]
    node Fircomputation36 = _GEN_7 @[IOFilter.scala 25:30]
    node _Fircomputation18_T = shr(Fircomputation36, 17) @[IOFilter.scala 66:45]
    node _Fircomputation18_T_1 = bits(_Fircomputation18_T, 17, 0) @[IOFilter.scala 66:52]
    node _Fircomputation18_T_2 = asSInt(_Fircomputation18_T_1) @[IOFilter.scala 66:60]
    node _GEN_8 = mux(_T_6, _Fircomputation18_T_2, asSInt(UInt<1>("h0"))) @[IOFilter.scala 60:20 62:85 66:22]
    node Fircomputation18 = _GEN_8 @[IOFilter.scala 26:30]
    node _MAccReg_T = add(MAccReg, Fircomputation18) @[IOFilter.scala 67:24]
    node _MAccReg_T_1 = tail(_MAccReg_T, 1) @[IOFilter.scala 67:24]
    node _MAccReg_T_2 = asSInt(_MAccReg_T_1) @[IOFilter.scala 67:24]
    node _GEN_9 = mux(_T_6, _MAccReg_T_2, MAccReg) @[IOFilter.scala 62:85 67:13 37:20]
    node _T_7 = eq(SampleCount, UInt<1>("h0")) @[IOFilter.scala 72:20]
    node _GEN_10 = mux(_T_7, UInt<1>("h1"), UInt<1>("h0")) @[IOFilter.scala 49:16 72:29 73:18]
    node _OutputReg_T = add(MAccReg, Fircomputation18) @[IOFilter.scala 77:26]
    node _OutputReg_T_1 = tail(_OutputReg_T, 1) @[IOFilter.scala 77:26]
    node _OutputReg_T_2 = asSInt(_OutputReg_T_1) @[IOFilter.scala 77:26]
    node _SampleCount_T = add(SampleCount, UInt<1>("h1")) @[IOFilter.scala 82:32]
    node _SampleCount_T_1 = tail(_SampleCount_T, 1) @[IOFilter.scala 82:32]
    node _SampleCount_T_2 = add(SampleCount, UInt<1>("h1")) @[IOFilter.scala 87:32]
    node _SampleCount_T_3 = tail(_SampleCount_T_2, 1) @[IOFilter.scala 87:32]
    node _GEN_11 = mux(_T_18, _SampleCount_T_3, UInt<1>("h0")) @[IOFilter.scala 50:15 86:44 87:17]
    node _GEN_13 = mux(_T_17, _SampleCount_T_1, _GEN_11) @[IOFilter.scala 81:123 82:17]
    node _GEN_15 = mux(_T_8, _OutputReg_T_2, OutputReg) @[IOFilter.scala 76:38 77:15 36:22]
    node _GEN_16 = mux(_T_8, asSInt(UInt<1>("h0")), _GEN_9) @[IOFilter.scala 76:38 78:13]
    node _GEN_17 = mux(_T_8, UInt<1>("h0"), _GEN_13) @[IOFilter.scala 50:15 76:38]
    node _T_22 = gt(OutputSamplePointer, UInt<1>("h0")) @[IOFilter.scala 102:30]
    node _T_23 = and(_T_22, io_DACEnable) @[IOFilter.scala 102:36]
    node _OutputSamplePointer_T = sub(OutputSamplePointer, UInt<1>("h1")) @[IOFilter.scala 103:50]
    node _OutputSamplePointer_T_1 = tail(_OutputSamplePointer_T, 1) @[IOFilter.scala 103:50]
    node _T_24 = eq(OutputSamplePointer, UInt<1>("h0")) @[IOFilter.scala 104:36]
    node _T_25 = and(_T_24, io_DACEnable) @[IOFilter.scala 104:44]
    node _GEN_20 = mux(_T_25, maxcountwire, OutputSamplePointer) @[IOFilter.scala 104:60 105:27 43:32]
    node _GEN_21 = mux(_T_23, _OutputSamplePointer_T_1, _GEN_20) @[IOFilter.scala 102:52 103:27]
    node _T_27 = eq(io_DACEnable, UInt<1>("h1")) @[IOFilter.scala 116:23]
    node _T_28 = gt(OutputSamplePointer, UInt<1>("h0")) @[IOFilter.scala 117:32]
    node _T_29 = sub(OutputSamplePointer, UInt<1>("h1")) @[IOFilter.scala 118:54]
    node _T_30 = tail(_T_29, 1) @[IOFilter.scala 118:54]
    node _T_31 = or(maxcountwire, UInt<11>("h0"))
    node _T_32 = bits(_T_31, 10, 0)
    node _GEN_23 = validif(_T_28, _T_30) @[IOFilter.scala 117:39]
    node _GEN_24 = validif(_T_28, clock) @[IOFilter.scala 117:39]
    node _GEN_25 = mux(_T_28, UInt<1>("h1"), UInt<1>("h0")) @[IOFilter.scala 117:39 33:39]
    node _GEN_26 = validif(_T_28, UInt<1>("h1")) @[IOFilter.scala 117:39]
    node _GEN_27 = validif(_T_28, io_DACWaveIn) @[IOFilter.scala 117:39]
    node _GEN_28 = validif(eq(_T_28, UInt<1>("h0")), _T_32) @[IOFilter.scala 117:39]
    node _GEN_29 = validif(eq(_T_28, UInt<1>("h0")), clock) @[IOFilter.scala 117:39]
    node _GEN_30 = mux(_T_28, UInt<1>("h0"), UInt<1>("h1")) @[IOFilter.scala 117:39 33:39]
    node _GEN_31 = validif(eq(_T_28, UInt<1>("h0")), UInt<1>("h1")) @[IOFilter.scala 117:39]
    node _GEN_32 = validif(eq(_T_28, UInt<1>("h0")), io_DACWaveIn) @[IOFilter.scala 117:39]
    node _GEN_33 = validif(_T_27, _GEN_23) @[IOFilter.scala 116:32]
    node _GEN_34 = validif(_T_27, _GEN_24) @[IOFilter.scala 116:32]
    node _GEN_35 = mux(_T_27, _GEN_25, UInt<1>("h0")) @[IOFilter.scala 116:32 33:39]
    node _GEN_36 = validif(_T_27, _GEN_26) @[IOFilter.scala 116:32]
    node _GEN_37 = validif(_T_27, _GEN_27) @[IOFilter.scala 116:32]
    node _GEN_38 = validif(_T_27, _GEN_28) @[IOFilter.scala 116:32]
    node _GEN_39 = validif(_T_27, _GEN_29) @[IOFilter.scala 116:32]
    node _GEN_40 = mux(_T_27, _GEN_30, UInt<1>("h0")) @[IOFilter.scala 116:32 33:39]
    node _GEN_41 = validif(_T_27, _GEN_31) @[IOFilter.scala 116:32]
    node _GEN_42 = validif(_T_27, _GEN_32) @[IOFilter.scala 116:32]
    node _T_36 = gt(InputSamplePointer, UInt<1>("h0")) @[IOFilter.scala 133:29]
    node _T_37 = and(_T_36, io_ADCEnable) @[IOFilter.scala 133:35]
    node _InputSamplePointer_T = sub(InputSamplePointer, UInt<1>("h1")) @[IOFilter.scala 134:48]
    node _InputSamplePointer_T_1 = tail(_InputSamplePointer_T, 1) @[IOFilter.scala 134:48]
    node _T_38 = eq(InputSamplePointer, UInt<1>("h0")) @[IOFilter.scala 135:35]
    node _T_39 = and(_T_38, io_ADCEnable) @[IOFilter.scala 135:43]
    node _GEN_44 = mux(_T_39, maxcountwire, InputSamplePointer) @[IOFilter.scala 135:59 136:26 42:31]
    node _GEN_45 = mux(_T_37, _InputSamplePointer_T_1, _GEN_44) @[IOFilter.scala 133:51 134:26]
    node _T_41 = eq(io_ADCEnable, UInt<1>("h1")) @[IOFilter.scala 147:23]
    node _T_42 = gt(InputSamplePointer, UInt<1>("h0")) @[IOFilter.scala 148:31]
    node _T_43 = sub(InputSamplePointer, UInt<1>("h1")) @[IOFilter.scala 149:52]
    node _T_44 = tail(_T_43, 1) @[IOFilter.scala 149:52]
    node _T_45 = or(maxcountwire, UInt<11>("h0"))
    node _T_46 = bits(_T_45, 10, 0)
    node _GEN_47 = validif(_T_42, _T_44) @[IOFilter.scala 148:38]
    node _GEN_48 = validif(_T_42, clock) @[IOFilter.scala 148:38]
    node _GEN_49 = mux(_T_42, UInt<1>("h1"), UInt<1>("h0")) @[IOFilter.scala 148:38 32:38]
    node _GEN_50 = validif(_T_42, UInt<1>("h1")) @[IOFilter.scala 148:38]
    node _GEN_51 = validif(_T_42, io_ADCWaveIn) @[IOFilter.scala 148:38]
    node _GEN_52 = validif(eq(_T_42, UInt<1>("h0")), _T_46) @[IOFilter.scala 148:38]
    node _GEN_53 = validif(eq(_T_42, UInt<1>("h0")), clock) @[IOFilter.scala 148:38]
    node _GEN_54 = mux(_T_42, UInt<1>("h0"), UInt<1>("h1")) @[IOFilter.scala 148:38 32:38]
    node _GEN_55 = validif(eq(_T_42, UInt<1>("h0")), UInt<1>("h1")) @[IOFilter.scala 148:38]
    node _GEN_56 = validif(eq(_T_42, UInt<1>("h0")), io_ADCWaveIn) @[IOFilter.scala 148:38]
    node _GEN_57 = validif(_T_41, _GEN_47) @[IOFilter.scala 147:32]
    node _GEN_58 = validif(_T_41, _GEN_48) @[IOFilter.scala 147:32]
    node _GEN_59 = mux(_T_41, _GEN_49, UInt<1>("h0")) @[IOFilter.scala 147:32 32:38]
    node _GEN_60 = validif(_T_41, _GEN_50) @[IOFilter.scala 147:32]
    node _GEN_61 = validif(_T_41, _GEN_51) @[IOFilter.scala 147:32]
    node _GEN_62 = validif(_T_41, _GEN_52) @[IOFilter.scala 147:32]
    node _GEN_63 = validif(_T_41, _GEN_53) @[IOFilter.scala 147:32]
    node _GEN_64 = mux(_T_41, _GEN_54, UInt<1>("h0")) @[IOFilter.scala 147:32 32:38]
    node _GEN_65 = validif(_T_41, _GEN_55) @[IOFilter.scala 147:32]
    node _GEN_66 = validif(_T_41, _GEN_56) @[IOFilter.scala 147:32]
    node _GEN_68 = mux(io_SampleType, _GEN_21, OutputSamplePointer) @[IOFilter.scala 93:23 43:32]
    node _GEN_70 = validif(io_SampleType, _GEN_33) @[IOFilter.scala 93:23]
    node _GEN_71 = validif(io_SampleType, _GEN_34) @[IOFilter.scala 93:23]
    node _GEN_72 = mux(io_SampleType, _GEN_35, UInt<1>("h0")) @[IOFilter.scala 93:23 33:39]
    node _GEN_73 = validif(io_SampleType, _GEN_36) @[IOFilter.scala 93:23]
    node _GEN_74 = validif(io_SampleType, _GEN_37) @[IOFilter.scala 93:23]
    node _GEN_75 = validif(io_SampleType, _GEN_38) @[IOFilter.scala 93:23]
    node _GEN_76 = validif(io_SampleType, _GEN_39) @[IOFilter.scala 93:23]
    node _GEN_77 = mux(io_SampleType, _GEN_40, UInt<1>("h0")) @[IOFilter.scala 93:23 33:39]
    node _GEN_78 = validif(io_SampleType, _GEN_41) @[IOFilter.scala 93:23]
    node _GEN_79 = validif(io_SampleType, _GEN_42) @[IOFilter.scala 93:23]
    node _GEN_80 = mux(io_SampleType, InputSamplePointer, _GEN_45) @[IOFilter.scala 93:23 42:31]
    node _GEN_81 = validif(eq(io_SampleType, UInt<1>("h0")), _GEN_57) @[IOFilter.scala 93:23]
    node _GEN_82 = validif(eq(io_SampleType, UInt<1>("h0")), _GEN_58) @[IOFilter.scala 93:23]
    node _GEN_83 = mux(io_SampleType, UInt<1>("h0"), _GEN_59) @[IOFilter.scala 93:23 32:38]
    node _GEN_84 = validif(eq(io_SampleType, UInt<1>("h0")), _GEN_60) @[IOFilter.scala 93:23]
    node _GEN_85 = validif(eq(io_SampleType, UInt<1>("h0")), _GEN_61) @[IOFilter.scala 93:23]
    node _GEN_86 = validif(eq(io_SampleType, UInt<1>("h0")), _GEN_62) @[IOFilter.scala 93:23]
    node _GEN_87 = validif(eq(io_SampleType, UInt<1>("h0")), _GEN_63) @[IOFilter.scala 93:23]
    node _GEN_88 = mux(io_SampleType, UInt<1>("h0"), _GEN_64) @[IOFilter.scala 93:23 32:38]
    node _GEN_89 = validif(eq(io_SampleType, UInt<1>("h0")), _GEN_65) @[IOFilter.scala 93:23]
    node _GEN_90 = validif(eq(io_SampleType, UInt<1>("h0")), _GEN_66) @[IOFilter.scala 93:23]
    io_WaveOut <= OutputReg @[IOFilter.scala 48:14]
    io_Completed <= _GEN_10
    InputSampleMemory.ReadInputSample_MPORT.addr <= _GEN_2
    InputSampleMemory.ReadInputSample_MPORT.en <= _GEN_1
    InputSampleMemory.ReadInputSample_MPORT.clk <= _GEN_3
    InputSampleMemory.MPORT_2.addr <= _GEN_81
    InputSampleMemory.MPORT_2.en <= _GEN_83
    InputSampleMemory.MPORT_2.clk <= _GEN_82
    InputSampleMemory.MPORT_2.data <= _GEN_85
    InputSampleMemory.MPORT_2.mask <= _GEN_84
    InputSampleMemory.MPORT_3.addr <= _GEN_86
    InputSampleMemory.MPORT_3.en <= _GEN_88
    InputSampleMemory.MPORT_3.clk <= _GEN_87
    InputSampleMemory.MPORT_3.data <= _GEN_90
    InputSampleMemory.MPORT_3.mask <= _GEN_89
    OutputSampleMemory.ReadOutputSample_MPORT.addr <= _GEN_4
    OutputSampleMemory.ReadOutputSample_MPORT.en <= _GEN_1
    OutputSampleMemory.ReadOutputSample_MPORT.clk <= _GEN_3
    OutputSampleMemory.MPORT.addr <= _GEN_70
    OutputSampleMemory.MPORT.en <= _GEN_72
    OutputSampleMemory.MPORT.clk <= _GEN_71
    OutputSampleMemory.MPORT.data <= _GEN_74
    OutputSampleMemory.MPORT.mask <= _GEN_73
    OutputSampleMemory.MPORT_1.addr <= _GEN_75
    OutputSampleMemory.MPORT_1.en <= _GEN_77
    OutputSampleMemory.MPORT_1.clk <= _GEN_76
    OutputSampleMemory.MPORT_1.data <= _GEN_79
    OutputSampleMemory.MPORT_1.mask <= _GEN_78
    CoeffMemory.CoeffWire_MPORT.addr <= _GEN_6
    CoeffMemory.CoeffWire_MPORT.en <= _GEN_1
    CoeffMemory.CoeffWire_MPORT.clk <= _GEN_3
    OutputReg <= _GEN_15
    MAccReg <= _GEN_16
    SampleCount <= _GEN_17
    InputSamplePointer <= _GEN_80
    OutputSamplePointer <= _GEN_68

  module IOMaster :
    input clock : Clock
    input reset : UInt<1>
    input io_In_ADC : UInt<1>
    input io_In_DAC : SInt<18>
    output io_Out_ADC : SInt<18>
    output io_Out_DAC : UInt<1>

    inst ADC of InController @[IOMaster.scala 14:19]
    inst DAC of OutController @[IOMaster.scala 15:19]
    inst Filter of IOFilter @[IOMaster.scala 16:22]
    reg sampleType : UInt<1>, clock with :
      reset => (UInt<1>("h0"), sampleType) @[IOMaster.scala 20:27]
    reg lastSampleType : UInt<1>, clock with :
      reset => (UInt<1>("h0"), lastSampleType) @[IOMaster.scala 21:31]
    reg ADCReg : SInt<18>, clock with :
      reset => (UInt<1>("h0"), ADCReg) @[IOMaster.scala 22:23]
    reg DACReg : SInt<18>, clock with :
      reset => (UInt<1>("h0"), DACReg) @[IOMaster.scala 23:23]
    reg ADCHold : SInt<18>, clock with :
      reset => (UInt<1>("h0"), ADCHold) @[IOMaster.scala 24:24]
    reg DACHold : SInt<18>, clock with :
      reset => (UInt<1>("h0"), DACHold) @[IOMaster.scala 25:24]
    reg DACEn : UInt<1>, clock with :
      reset => (UInt<1>("h0"), DACEn) @[IOMaster.scala 26:22]
    reg ADCEn : UInt<1>, clock with :
      reset => (UInt<1>("h0"), ADCEn) @[IOMaster.scala 27:22]
    reg isLoading : UInt<1>, clock with :
      reset => (UInt<1>("h0"), isLoading) @[IOMaster.scala 28:26]
    node _isLoading_T = eq(ADCEn, UInt<1>("h0")) @[IOMaster.scala 30:23]
    node _isLoading_T_1 = eq(DACEn, UInt<1>("h1")) @[IOMaster.scala 30:40]
    node _isLoading_T_2 = and(_isLoading_T, _isLoading_T_1) @[IOMaster.scala 30:31]
    node _isLoading_T_3 = eq(ADCEn, UInt<1>("h1")) @[IOMaster.scala 30:59]
    node _isLoading_T_4 = eq(DACEn, UInt<1>("h0")) @[IOMaster.scala 30:76]
    node _isLoading_T_5 = and(_isLoading_T_3, _isLoading_T_4) @[IOMaster.scala 30:67]
    node _isLoading_T_6 = or(_isLoading_T_2, _isLoading_T_5) @[IOMaster.scala 30:49]
    reg cntReg : UInt<10>, clock with :
      reset => (UInt<1>("h0"), cntReg) @[IOMaster.scala 49:23]
    node _check1_T = eq(cntReg, UInt<7>("h64")) @[IOMaster.scala 50:23]
    node _check1_T_1 = eq(ADCEn, UInt<1>("h1")) @[IOMaster.scala 50:56]
    node check1 = and(_check1_T, _check1_T_1) @[IOMaster.scala 50:47]
    node _check2_T = eq(cntReg, UInt<7>("h64")) @[IOMaster.scala 51:23]
    node _check2_T_1 = eq(DACEn, UInt<1>("h1")) @[IOMaster.scala 51:56]
    node check2 = and(_check2_T, _check2_T_1) @[IOMaster.scala 51:47]
    node _cntReg_T = add(cntReg, UInt<1>("h1")) @[IOMaster.scala 53:22]
    node _cntReg_T_1 = tail(_cntReg_T, 1) @[IOMaster.scala 53:22]
    node _GEN_0 = mux(isLoading, _cntReg_T_1, cntReg) @[IOMaster.scala 52:19 53:12 49:23]
    node _GEN_1 = mux(check2, UInt<1>("h1"), ADCEn) @[IOMaster.scala 60:23 61:13 27:22]
    node _GEN_2 = mux(check2, UInt<1>("h0"), _GEN_0) @[IOMaster.scala 60:23 62:14]
    node _GEN_3 = mux(check1, UInt<1>("h1"), DACEn) @[IOMaster.scala 56:16 57:11 26:22]
    node _GEN_4 = mux(check1, UInt<1>("h0"), _GEN_2) @[IOMaster.scala 56:16 58:12]
    node _GEN_5 = mux(check1, ADCEn, _GEN_1) @[IOMaster.scala 56:16 27:22]
    node _T = eq(sampleType, UInt<1>("h1")) @[IOMaster.scala 64:21]
    node _T_1 = eq(sampleType, UInt<1>("h0")) @[IOMaster.scala 67:26]
    node _GEN_6 = mux(_T_1, UInt<1>("h1"), _GEN_5) @[IOMaster.scala 67:35 68:13]
    node _GEN_7 = mux(_T, UInt<1>("h1"), _GEN_3) @[IOMaster.scala 64:30 65:13]
    node _GEN_8 = mux(_T, _GEN_5, _GEN_6) @[IOMaster.scala 64:30]
    node _beginSample_T = eq(Filter.io_Completed, UInt<1>("h1")) @[IOMaster.scala 74:41]
    node _beginSample_T_1 = and(_beginSample_T, DACEn) @[IOMaster.scala 74:49]
    node beginSample = and(_beginSample_T_1, ADCEn) @[IOMaster.scala 74:58]
    node _T_2 = eq(UInt<1>("h1"), lastSampleType) @[IOMaster.scala 79:28]
    node _T_3 = eq(UInt<1>("h0"), lastSampleType) @[IOMaster.scala 79:28]
    node _GEN_9 = mux(_T_3, Filter.io_WaveOut, DACHold) @[IOMaster.scala 79:28 84:17 25:24]
    node _GEN_10 = mux(_T_2, Filter.io_WaveOut, ADCHold) @[IOMaster.scala 79:28 81:17 24:24]
    node _GEN_11 = mux(_T_2, DACHold, _GEN_9) @[IOMaster.scala 25:24 79:28]
    node _sampleType_T = not(sampleType) @[IOMaster.scala 94:19]
    node _GEN_12 = mux(beginSample, _GEN_10, ADCHold) @[IOMaster.scala 76:21 24:24]
    node _GEN_13 = mux(beginSample, _GEN_11, DACHold) @[IOMaster.scala 76:21 25:24]
    node _GEN_14 = mux(beginSample, UInt<1>("h0"), _GEN_7) @[IOMaster.scala 76:21 90:11]
    node _GEN_15 = mux(beginSample, UInt<1>("h0"), _GEN_8) @[IOMaster.scala 76:21 91:11]
    node _GEN_16 = mux(beginSample, sampleType, lastSampleType) @[IOMaster.scala 71:18 76:21 93:20]
    node _GEN_17 = mux(beginSample, _sampleType_T, sampleType) @[IOMaster.scala 72:14 76:21 94:16]
    io_Out_ADC <= ADC.io_Out @[IOMaster.scala 33:14]
    io_Out_DAC <= DAC.io_OutPWM @[IOMaster.scala 38:14]
    ADC.clock <= clock
    ADC.reset <= reset
    ADC.io_In <= io_In_ADC @[IOMaster.scala 32:13]
    ADC.io_InFIR <= ADCHold @[IOMaster.scala 34:16]
    DAC.clock <= clock
    DAC.reset <= reset
    DAC.io_In <= io_In_DAC @[IOMaster.scala 37:13]
    DAC.io_InFIR <= DACHold @[IOMaster.scala 39:16]
    Filter.clock <= clock
    Filter.reset <= reset
    Filter.io_ADCWaveIn <= ADCReg @[IOMaster.scala 43:23]
    Filter.io_DACWaveIn <= DACReg @[IOMaster.scala 44:23]
    Filter.io_SampleType <= sampleType @[IOMaster.scala 42:24]
    Filter.io_ADCEnable <= ADCEn @[IOMaster.scala 46:23]
    Filter.io_DACEnable <= DACEn @[IOMaster.scala 45:23]
    sampleType <= mux(reset, UInt<1>("h1"), _GEN_17) @[IOMaster.scala 20:{27,27}]
    lastSampleType <= mux(reset, UInt<1>("h0"), _GEN_16) @[IOMaster.scala 21:{31,31}]
    ADCReg <= mux(reset, asSInt(UInt<18>("h0")), ADC.io_OutFIR) @[IOMaster.scala 22:{23,23} 35:10]
    DACReg <= mux(reset, asSInt(UInt<18>("h0")), DAC.io_OutFIR) @[IOMaster.scala 23:{23,23} 40:10]
    ADCHold <= mux(reset, asSInt(UInt<18>("h0")), _GEN_12) @[IOMaster.scala 24:{24,24}]
    DACHold <= mux(reset, asSInt(UInt<18>("h0")), _GEN_13) @[IOMaster.scala 25:{24,24}]
    DACEn <= mux(reset, UInt<1>("h1"), _GEN_14) @[IOMaster.scala 26:{22,22}]
    ADCEn <= mux(reset, UInt<1>("h0"), _GEN_15) @[IOMaster.scala 27:{22,22}]
    isLoading <= mux(reset, UInt<1>("h0"), _isLoading_T_6) @[IOMaster.scala 28:{26,26} 30:13]
    cntReg <= mux(reset, UInt<10>("h0"), _GEN_4) @[IOMaster.scala 49:{23,23}]

  module DSP :
    input clock : Clock
    input reset : UInt<1>
    input io_In : UInt<1>
    output io_Out : UInt<1>

    inst IOC of IOMaster @[DSP.scala 120:20]
    io_Out <= IOC.io_Out_DAC @[DSP.scala 126:17]
    IOC.clock <= clock
    IOC.reset <= reset
    IOC.io_In_ADC <= io_In @[DSP.scala 122:17]
    IOC.io_In_DAC <= IOC.io_Out_ADC @[DSP.scala 124:17]
