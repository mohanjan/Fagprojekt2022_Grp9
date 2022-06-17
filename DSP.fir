circuit DSP :
  module InController :
    input clock : Clock
    input reset : Reset
    output io : { flip In : UInt<1>, flip postFIR : SInt<18>, Out : SInt<18>, ADC_D_out : UInt<1>, preFIR : SInt<18>}

    reg delay : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[InController.scala 16:22]
    delay <= io.In @[InController.scala 17:9]
    io.ADC_D_out <= delay @[InController.scala 18:16]
    reg inReg : UInt<18>, clock with :
      reset => (reset, UInt<18>("h0")) @[InController.scala 21:22]
    reg sample : SInt<18>, clock with :
      reset => (reset, asSInt(UInt<18>("h10"))) @[InController.scala 22:23]
    reg cntReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[InController.scala 25:23]
    reg cntReg2 : UInt<7>, clock with :
      reset => (reset, UInt<7>("h0")) @[InController.scala 26:24]
    node _cntReg2_T = add(cntReg2, UInt<1>("h1")) @[InController.scala 27:22]
    node _cntReg2_T_1 = tail(_cntReg2_T, 1) @[InController.scala 27:22]
    cntReg2 <= _cntReg2_T_1 @[InController.scala 27:11]
    node _T = eq(cntReg2, UInt<7>("h7f")) @[InController.scala 28:16]
    when _T : @[InController.scala 28:26]
      cntReg2 <= UInt<1>("h0") @[InController.scala 29:13]
      node _cntReg_T = add(cntReg, UInt<1>("h1")) @[InController.scala 30:22]
      node _cntReg_T_1 = tail(_cntReg_T, 1) @[InController.scala 30:22]
      cntReg <= _cntReg_T_1 @[InController.scala 30:12]
    node tick = eq(cntReg, UInt<5>("h12")) @[InController.scala 34:21]
    node _inReg_T = bits(inReg, 17, 1) @[InController.scala 36:28]
    node _inReg_T_1 = cat(io.In, _inReg_T) @[Cat.scala 31:58]
    inReg <= _inReg_T_1 @[InController.scala 36:9]
    io.ADC_D_out <= inReg @[InController.scala 37:16]
    when tick : @[InController.scala 39:14]
      cntReg <= UInt<1>("h0") @[InController.scala 40:12]
      sample <= io.postFIR @[InController.scala 41:12]
    node _io_preFIR_T = asSInt(inReg) @[InController.scala 45:23]
    node _io_preFIR_T_1 = not(_io_preFIR_T) @[InController.scala 45:16]
    node _io_preFIR_T_2 = asSInt(_io_preFIR_T_1) @[InController.scala 45:16]
    node _io_preFIR_T_3 = add(_io_preFIR_T_2, asSInt(UInt<2>("h1"))) @[InController.scala 45:30]
    node _io_preFIR_T_4 = tail(_io_preFIR_T_3, 1) @[InController.scala 45:30]
    node _io_preFIR_T_5 = asSInt(_io_preFIR_T_4) @[InController.scala 45:30]
    io.preFIR <= _io_preFIR_T_5 @[InController.scala 45:13]
    io.Out <= sample @[InController.scala 46:10]

  module OutController :
    input clock : Clock
    input reset : Reset
    output io : { flip In : SInt<18>, flip postFIR : SInt<18>, preFIR : SInt<18>, OutPWM : UInt<1>}

    reg ZReg : SInt<18>, clock with :
      reset => (reset, asSInt(UInt<18>("h0"))) @[OutController.scala 16:22]
    wire Diff : SInt<18> @[OutController.scala 17:19]
    wire ZIn : SInt<18> @[OutController.scala 18:19]
    wire DDC : UInt<18>
    DDC <= UInt<18>("h0")
    reg cntReg : UInt<5>, clock with :
      reset => (reset, UInt<5>("h0")) @[OutController.scala 21:23]
    reg cntReg2 : UInt<7>, clock with :
      reset => (reset, UInt<7>("h0")) @[OutController.scala 22:24]
    node _T = eq(cntReg2, UInt<7>("h7f")) @[OutController.scala 31:16]
    when _T : @[OutController.scala 31:26]
      cntReg2 <= UInt<1>("h0") @[OutController.scala 32:13]
      node _cntReg_T = add(cntReg, UInt<1>("h1")) @[OutController.scala 33:22]
      node _cntReg_T_1 = tail(_cntReg_T, 1) @[OutController.scala 33:22]
      cntReg <= _cntReg_T_1 @[OutController.scala 33:12]
    node tick = eq(cntReg, UInt<1>("h0")) @[OutController.scala 36:21]
    node _T_1 = eq(cntReg, UInt<5>("h12")) @[OutController.scala 38:15]
    when _T_1 : @[OutController.scala 38:26]
      cntReg <= UInt<1>("h0") @[OutController.scala 39:12]
    node _Diff_T = asSInt(DDC) @[OutController.scala 42:28]
    node _Diff_T_1 = sub(io.postFIR, _Diff_T) @[OutController.scala 42:22]
    node _Diff_T_2 = tail(_Diff_T_1, 1) @[OutController.scala 42:22]
    node _Diff_T_3 = asSInt(_Diff_T_2) @[OutController.scala 42:22]
    Diff <= _Diff_T_3 @[OutController.scala 42:8]
    node _ZIn_T = add(ZReg, Diff) @[OutController.scala 43:16]
    node _ZIn_T_1 = tail(_ZIn_T, 1) @[OutController.scala 43:16]
    node _ZIn_T_2 = asSInt(_ZIn_T_1) @[OutController.scala 43:16]
    ZIn <= _ZIn_T_2 @[OutController.scala 43:8]
    ZReg <= ZIn @[OutController.scala 44:8]
    node _DDC_T = eq(io.OutPWM, UInt<1>("h1")) @[OutController.scala 46:24]
    node _DDC_T_1 = mux(UInt<1>("h1"), UInt<18>("h3ffff"), UInt<18>("h0")) @[Bitwise.scala 74:12]
    node _DDC_T_2 = mux(_DDC_T, _DDC_T_1, UInt<1>("h0")) @[OutController.scala 46:13]
    DDC <= _DDC_T_2 @[OutController.scala 46:7]
    node _io_preFIR_T = mux(tick, io.In, asSInt(UInt<1>("h0"))) @[OutController.scala 48:19]
    io.preFIR <= _io_preFIR_T @[OutController.scala 48:13]
    node _io_OutPWM_T = bits(ZReg, 17, 17) @[OutController.scala 49:21]
    node _io_OutPWM_T_1 = not(_io_OutPWM_T) @[OutController.scala 49:16]
    io.OutPWM <= _io_OutPWM_T_1 @[OutController.scala 49:13]

  module IOFilter :
    input clock : Clock
    input reset : Reset
    output io : { flip ADCWaveIn : SInt<18>, flip DACWaveIn : SInt<18>, WaveOut : SInt<18>, flip SampleType : UInt<1>, flip ADCEnable : UInt<1>, flip DACEnable : UInt<1>, flip ConvEnable : UInt<1>, Completed : UInt<1>}

    wire FIRInput : SInt @[IOFilter.scala 18:22]
    wire CoeffCount : UInt @[IOFilter.scala 19:24]
    wire SampleAddress : UInt @[IOFilter.scala 20:27]
    wire ReadInputSample : SInt @[IOFilter.scala 21:29]
    wire ReadOutputSample : SInt @[IOFilter.scala 22:30]
    wire CoeffWire : SInt @[IOFilter.scala 25:23]
    wire Fircomputation36 : SInt @[IOFilter.scala 26:30]
    wire Fircomputation18 : SInt @[IOFilter.scala 27:30]
    wire Halfcountwire : UInt @[IOFilter.scala 28:27]
    wire maxcountwire : UInt @[IOFilter.scala 29:26]
    smem InputSampleMemory : SInt<18> [2048] @[IOFilter.scala 32:38]
    smem OutputSampleMemory : SInt<18> [2048] @[IOFilter.scala 33:39]
    smem CoeffMemory : SInt<18> [1024] @[IOFilter.scala 34:32]
    reg OutputReg : SInt<18>, clock with :
      reset => (UInt<1>("h0"), OutputReg) @[IOFilter.scala 36:22]
    reg MAccReg : SInt<36>, clock with :
      reset => (UInt<1>("h0"), MAccReg) @[IOFilter.scala 37:20]
    reg SampleCount : UInt<11>, clock with :
      reset => (UInt<1>("h0"), SampleCount) @[IOFilter.scala 40:24]
    reg InputSamplePointer : UInt<11>, clock with :
      reset => (UInt<1>("h0"), InputSamplePointer) @[IOFilter.scala 42:31]
    reg OutputSamplePointer : UInt<11>, clock with :
      reset => (UInt<1>("h0"), OutputSamplePointer) @[IOFilter.scala 43:32]
    io.WaveOut <= OutputReg @[IOFilter.scala 48:14]
    io.Completed <= UInt<1>("h0") @[IOFilter.scala 49:16]
    SampleCount <= UInt<1>("h0") @[IOFilter.scala 50:15]
    CoeffCount <= UInt<1>("h0") @[IOFilter.scala 51:14]
    wire _ReadInputSample_WIRE : UInt @[IOFilter.scala 52:44]
    _ReadInputSample_WIRE is invalid @[IOFilter.scala 52:44]
    when UInt<1>("h1") : @[IOFilter.scala 52:44]
      _ReadInputSample_WIRE <= SampleAddress @[IOFilter.scala 52:44]
      node _ReadInputSample_T = or(_ReadInputSample_WIRE, UInt<11>("h0")) @[IOFilter.scala 52:44]
      node _ReadInputSample_T_1 = bits(_ReadInputSample_T, 10, 0) @[IOFilter.scala 52:44]
      read mport ReadInputSample_MPORT = InputSampleMemory[_ReadInputSample_T_1], clock @[IOFilter.scala 52:44]
    ReadInputSample <= ReadInputSample_MPORT @[IOFilter.scala 52:19]
    wire _ReadOutputSample_WIRE : UInt @[IOFilter.scala 53:46]
    _ReadOutputSample_WIRE is invalid @[IOFilter.scala 53:46]
    when UInt<1>("h1") : @[IOFilter.scala 53:46]
      _ReadOutputSample_WIRE <= SampleAddress @[IOFilter.scala 53:46]
      node _ReadOutputSample_T = or(_ReadOutputSample_WIRE, UInt<11>("h0")) @[IOFilter.scala 53:46]
      node _ReadOutputSample_T_1 = bits(_ReadOutputSample_T, 10, 0) @[IOFilter.scala 53:46]
      read mport ReadOutputSample_MPORT = OutputSampleMemory[_ReadOutputSample_T_1], clock @[IOFilter.scala 53:46]
    ReadOutputSample <= ReadOutputSample_MPORT @[IOFilter.scala 53:20]
    Halfcountwire <= UInt<3>("h4") @[IOFilter.scala 54:17]
    maxcountwire <= UInt<4>("h9") @[IOFilter.scala 55:16]
    wire _CoeffWire_WIRE : UInt @[IOFilter.scala 58:32]
    _CoeffWire_WIRE is invalid @[IOFilter.scala 58:32]
    when UInt<1>("h1") : @[IOFilter.scala 58:32]
      _CoeffWire_WIRE <= CoeffCount @[IOFilter.scala 58:32]
      node _CoeffWire_T = or(_CoeffWire_WIRE, UInt<10>("h0")) @[IOFilter.scala 58:32]
      node _CoeffWire_T_1 = bits(_CoeffWire_T, 9, 0) @[IOFilter.scala 58:32]
      read mport CoeffWire_MPORT = CoeffMemory[_CoeffWire_T_1], clock @[IOFilter.scala 58:32]
    CoeffWire <= CoeffWire_MPORT @[IOFilter.scala 58:13]
    Fircomputation36 <= asSInt(UInt<1>("h0")) @[IOFilter.scala 59:20]
    Fircomputation18 <= asSInt(UInt<1>("h0")) @[IOFilter.scala 60:20]
    node _T = gt(SampleCount, UInt<1>("h0")) @[IOFilter.scala 63:17]
    node _T_1 = eq(SampleCount, UInt<1>("h0")) @[IOFilter.scala 63:56]
    node _T_2 = and(io.ConvEnable, _T_1) @[IOFilter.scala 63:40]
    node _T_3 = or(_T, _T_2) @[IOFilter.scala 63:23]
    when _T_3 : @[IOFilter.scala 64:5]
      node _Fircomputation36_T = mul(CoeffWire, FIRInput) @[IOFilter.scala 66:35]
      Fircomputation36 <= _Fircomputation36_T @[IOFilter.scala 66:22]
      node _MAccReg_T = add(MAccReg, Fircomputation36) @[IOFilter.scala 67:24]
      node _MAccReg_T_1 = tail(_MAccReg_T, 1) @[IOFilter.scala 67:24]
      node _MAccReg_T_2 = asSInt(_MAccReg_T_1) @[IOFilter.scala 67:24]
      MAccReg <= _MAccReg_T_2 @[IOFilter.scala 67:13]
    node _T_4 = eq(SampleCount, UInt<1>("h0")) @[IOFilter.scala 72:20]
    when _T_4 : @[IOFilter.scala 72:29]
      io.Completed <= UInt<1>("h1") @[IOFilter.scala 73:18]
    node _T_5 = eq(SampleCount, maxcountwire) @[IOFilter.scala 76:20]
    when _T_5 : @[IOFilter.scala 76:38]
      node _OutputReg_T = add(MAccReg, Fircomputation36) @[IOFilter.scala 77:27]
      node _OutputReg_T_1 = tail(_OutputReg_T, 1) @[IOFilter.scala 77:27]
      node _OutputReg_T_2 = asSInt(_OutputReg_T_1) @[IOFilter.scala 77:27]
      node _OutputReg_T_3 = shr(_OutputReg_T_2, 17) @[IOFilter.scala 77:46]
      node _OutputReg_T_4 = bits(_OutputReg_T_3, 17, 0) @[IOFilter.scala 77:52]
      node _OutputReg_T_5 = asSInt(_OutputReg_T_4) @[IOFilter.scala 77:60]
      OutputReg <= _OutputReg_T_5 @[IOFilter.scala 77:15]
      MAccReg <= asSInt(UInt<1>("h0")) @[IOFilter.scala 78:13]
    else :
      node _T_6 = gt(SampleCount, UInt<1>("h0")) @[IOFilter.scala 82:18]
      node _T_7 = lt(SampleCount, Halfcountwire) @[IOFilter.scala 82:41]
      node _T_8 = and(_T_6, _T_7) @[IOFilter.scala 82:25]
      node _T_9 = eq(SampleCount, UInt<1>("h0")) @[IOFilter.scala 82:90]
      node _T_10 = and(io.ConvEnable, _T_9) @[IOFilter.scala 82:75]
      node _T_11 = or(_T_8, _T_10) @[IOFilter.scala 82:58]
      when _T_11 : @[IOFilter.scala 83:5]
        node _SampleCount_T = add(SampleCount, UInt<1>("h1")) @[IOFilter.scala 84:32]
        node _SampleCount_T_1 = tail(_SampleCount_T, 1) @[IOFilter.scala 84:32]
        SampleCount <= _SampleCount_T_1 @[IOFilter.scala 84:17]
        node _CoeffCount_T = add(SampleCount, UInt<1>("h1")) @[IOFilter.scala 85:31]
        node _CoeffCount_T_1 = tail(_CoeffCount_T, 1) @[IOFilter.scala 85:31]
        CoeffCount <= _CoeffCount_T_1 @[IOFilter.scala 85:16]
      else :
        node _T_12 = geq(SampleCount, Halfcountwire) @[IOFilter.scala 88:26]
        when _T_12 : @[IOFilter.scala 88:44]
          node _SampleCount_T_2 = add(SampleCount, UInt<1>("h1")) @[IOFilter.scala 89:32]
          node _SampleCount_T_3 = tail(_SampleCount_T_2, 1) @[IOFilter.scala 89:32]
          SampleCount <= _SampleCount_T_3 @[IOFilter.scala 89:17]
          node _CoeffCount_T_2 = sub(UInt<4>("h8"), SampleCount) @[IOFilter.scala 90:40]
          node _CoeffCount_T_3 = tail(_CoeffCount_T_2, 1) @[IOFilter.scala 90:40]
          CoeffCount <= _CoeffCount_T_3 @[IOFilter.scala 90:16]
    node _T_13 = eq(SampleCount, UInt<1>("h0")) @[IOFilter.scala 93:39]
    node _T_14 = eq(io.SampleType, UInt<1>("h0")) @[IOFilter.scala 93:50]
    node _T_15 = or(_T_13, _T_14) @[IOFilter.scala 93:47]
    node _T_16 = and(io.ADCEnable, _T_15) @[IOFilter.scala 93:23]
    when _T_16 : @[IOFilter.scala 93:67]
      node _T_17 = gt(InputSamplePointer, UInt<1>("h0")) @[IOFilter.scala 94:31]
      when _T_17 : @[IOFilter.scala 94:38]
        node _InputSamplePointer_T = sub(InputSamplePointer, UInt<1>("h1")) @[IOFilter.scala 95:50]
        node _InputSamplePointer_T_1 = tail(_InputSamplePointer_T, 1) @[IOFilter.scala 95:50]
        InputSamplePointer <= _InputSamplePointer_T_1 @[IOFilter.scala 95:28]
        node _T_18 = sub(InputSamplePointer, UInt<1>("h1")) @[IOFilter.scala 96:52]
        node _T_19 = tail(_T_18, 1) @[IOFilter.scala 96:52]
        write mport MPORT = InputSampleMemory[_T_19], clock
        MPORT <= io.ADCWaveIn
      else :
        node _T_20 = eq(InputSamplePointer, UInt<1>("h0")) @[IOFilter.scala 97:37]
        when _T_20 : @[IOFilter.scala 97:46]
          InputSamplePointer <= maxcountwire @[IOFilter.scala 98:28]
          node _T_21 = or(maxcountwire, UInt<11>("h0"))
          node _T_22 = bits(_T_21, 10, 0)
          write mport MPORT_1 = InputSampleMemory[_T_22], clock
          MPORT_1 <= io.ADCWaveIn
    node _T_23 = eq(SampleCount, UInt<1>("h0")) @[IOFilter.scala 103:39]
    node _T_24 = or(_T_23, io.SampleType) @[IOFilter.scala 103:47]
    node _T_25 = and(io.DACEnable, _T_24) @[IOFilter.scala 103:23]
    when _T_25 : @[IOFilter.scala 103:66]
      node _T_26 = gt(OutputSamplePointer, UInt<1>("h0")) @[IOFilter.scala 104:32]
      when _T_26 : @[IOFilter.scala 104:39]
        node _OutputSamplePointer_T = sub(OutputSamplePointer, UInt<1>("h1")) @[IOFilter.scala 105:52]
        node _OutputSamplePointer_T_1 = tail(_OutputSamplePointer_T, 1) @[IOFilter.scala 105:52]
        OutputSamplePointer <= _OutputSamplePointer_T_1 @[IOFilter.scala 105:29]
        node _T_27 = sub(OutputSamplePointer, UInt<1>("h1")) @[IOFilter.scala 106:54]
        node _T_28 = tail(_T_27, 1) @[IOFilter.scala 106:54]
        write mport MPORT_2 = OutputSampleMemory[_T_28], clock
        MPORT_2 <= io.DACWaveIn
      else :
        node _T_29 = eq(OutputSamplePointer, UInt<1>("h0")) @[IOFilter.scala 107:38]
        when _T_29 : @[IOFilter.scala 107:47]
          OutputSamplePointer <= maxcountwire @[IOFilter.scala 108:29]
          node _T_30 = or(maxcountwire, UInt<11>("h0"))
          node _T_31 = bits(_T_30, 10, 0)
          write mport MPORT_3 = OutputSampleMemory[_T_31], clock
          MPORT_3 <= io.DACWaveIn
    when io.SampleType : @[IOFilter.scala 113:23]
      node _T_32 = eq(SampleCount, UInt<1>("h0")) @[IOFilter.scala 117:22]
      when _T_32 : @[IOFilter.scala 117:31]
        FIRInput <= io.DACWaveIn @[IOFilter.scala 118:16]
      else :
        FIRInput <= ReadOutputSample @[IOFilter.scala 120:16]
      node _T_33 = add(OutputSamplePointer, SampleCount) @[IOFilter.scala 124:30]
      node _T_34 = tail(_T_33, 1) @[IOFilter.scala 124:30]
      node _T_35 = leq(_T_34, maxcountwire) @[IOFilter.scala 124:44]
      when _T_35 : @[IOFilter.scala 124:61]
        node _SampleAddress_T = add(OutputSamplePointer, SampleCount) @[IOFilter.scala 125:44]
        node _SampleAddress_T_1 = tail(_SampleAddress_T, 1) @[IOFilter.scala 125:44]
        SampleAddress <= _SampleAddress_T_1 @[IOFilter.scala 125:21]
      else :
        node _SampleAddress_T_2 = add(OutputSamplePointer, SampleCount) @[IOFilter.scala 127:44]
        node _SampleAddress_T_3 = tail(_SampleAddress_T_2, 1) @[IOFilter.scala 127:44]
        node _SampleAddress_T_4 = sub(_SampleAddress_T_3, UInt<4>("ha")) @[IOFilter.scala 127:58]
        node _SampleAddress_T_5 = tail(_SampleAddress_T_4, 1) @[IOFilter.scala 127:58]
        SampleAddress <= _SampleAddress_T_5 @[IOFilter.scala 127:21]
      node _T_36 = eq(SampleCount, UInt<1>("h0")) @[IOFilter.scala 130:39]
      node _T_37 = and(io.ConvEnable, _T_36) @[IOFilter.scala 130:24]
      when _T_37 : @[IOFilter.scala 130:48]
        node _T_38 = sub(OutputSamplePointer, UInt<1>("h1")) @[IOFilter.scala 131:52]
        node _T_39 = tail(_T_38, 1) @[IOFilter.scala 131:52]
        write mport MPORT_4 = OutputSampleMemory[_T_39], clock
        MPORT_4 <= io.DACWaveIn
      else :
        node _T_40 = eq(SampleCount, maxcountwire) @[IOFilter.scala 132:28]
        when _T_40 : @[IOFilter.scala 132:46]
          node _T_41 = gt(OutputSamplePointer, UInt<1>("h0")) @[IOFilter.scala 133:32]
          when _T_41 : @[IOFilter.scala 133:39]
            node _OutputSamplePointer_T_2 = sub(OutputSamplePointer, UInt<1>("h1")) @[IOFilter.scala 134:52]
            node _OutputSamplePointer_T_3 = tail(_OutputSamplePointer_T_2, 1) @[IOFilter.scala 134:52]
            OutputSamplePointer <= _OutputSamplePointer_T_3 @[IOFilter.scala 134:29]
          else :
            node _T_42 = eq(OutputSamplePointer, UInt<1>("h0")) @[IOFilter.scala 135:38]
            when _T_42 : @[IOFilter.scala 135:47]
              OutputSamplePointer <= maxcountwire @[IOFilter.scala 136:29]
    else :
      node _T_43 = eq(SampleCount, UInt<1>("h0")) @[IOFilter.scala 144:22]
      when _T_43 : @[IOFilter.scala 144:31]
        FIRInput <= io.ADCWaveIn @[IOFilter.scala 145:16]
      else :
        FIRInput <= ReadInputSample @[IOFilter.scala 147:16]
      node _T_44 = add(InputSamplePointer, SampleCount) @[IOFilter.scala 151:29]
      node _T_45 = tail(_T_44, 1) @[IOFilter.scala 151:29]
      node _T_46 = leq(_T_45, maxcountwire) @[IOFilter.scala 151:43]
      when _T_46 : @[IOFilter.scala 151:60]
        node _SampleAddress_T_6 = add(InputSamplePointer, SampleCount) @[IOFilter.scala 152:43]
        node _SampleAddress_T_7 = tail(_SampleAddress_T_6, 1) @[IOFilter.scala 152:43]
        SampleAddress <= _SampleAddress_T_7 @[IOFilter.scala 152:21]
      else :
        node _SampleAddress_T_8 = add(InputSamplePointer, SampleCount) @[IOFilter.scala 154:43]
        node _SampleAddress_T_9 = tail(_SampleAddress_T_8, 1) @[IOFilter.scala 154:43]
        node _SampleAddress_T_10 = sub(_SampleAddress_T_9, UInt<4>("ha")) @[IOFilter.scala 154:57]
        node _SampleAddress_T_11 = tail(_SampleAddress_T_10, 1) @[IOFilter.scala 154:57]
        SampleAddress <= _SampleAddress_T_11 @[IOFilter.scala 154:21]
      node _T_47 = eq(SampleCount, UInt<1>("h0")) @[IOFilter.scala 157:39]
      node _T_48 = and(io.ConvEnable, _T_47) @[IOFilter.scala 157:24]
      when _T_48 : @[IOFilter.scala 157:48]
        node _T_49 = sub(InputSamplePointer, UInt<1>("h1")) @[IOFilter.scala 158:50]
        node _T_50 = tail(_T_49, 1) @[IOFilter.scala 158:50]
        write mport MPORT_5 = InputSampleMemory[_T_50], clock
        MPORT_5 <= io.ADCWaveIn
      else :
        node _T_51 = eq(SampleCount, maxcountwire) @[IOFilter.scala 159:28]
        when _T_51 : @[IOFilter.scala 159:46]
          node _T_52 = gt(InputSamplePointer, UInt<1>("h0")) @[IOFilter.scala 160:31]
          when _T_52 : @[IOFilter.scala 160:38]
            node _InputSamplePointer_T_2 = sub(InputSamplePointer, UInt<1>("h1")) @[IOFilter.scala 161:50]
            node _InputSamplePointer_T_3 = tail(_InputSamplePointer_T_2, 1) @[IOFilter.scala 161:50]
            InputSamplePointer <= _InputSamplePointer_T_3 @[IOFilter.scala 161:28]
          else :
            node _T_53 = eq(InputSamplePointer, UInt<1>("h0")) @[IOFilter.scala 162:37]
            when _T_53 : @[IOFilter.scala 162:46]
              InputSamplePointer <= maxcountwire @[IOFilter.scala 163:28]

  module IOFilter_1 :
    input clock : Clock
    input reset : Reset
    output io : { flip ADCWaveIn : SInt<18>, flip DACWaveIn : SInt<18>, WaveOut : SInt<18>, flip SampleType : UInt<1>, flip ADCEnable : UInt<1>, flip DACEnable : UInt<1>, flip ConvEnable : UInt<1>, Completed : UInt<1>}

    wire FIRInput : SInt @[IOFilter.scala 18:22]
    wire CoeffCount : UInt @[IOFilter.scala 19:24]
    wire SampleAddress : UInt @[IOFilter.scala 20:27]
    wire ReadInputSample : SInt @[IOFilter.scala 21:29]
    wire ReadOutputSample : SInt @[IOFilter.scala 22:30]
    wire CoeffWire : SInt @[IOFilter.scala 25:23]
    wire Fircomputation36 : SInt @[IOFilter.scala 26:30]
    wire Fircomputation18 : SInt @[IOFilter.scala 27:30]
    wire Halfcountwire : UInt @[IOFilter.scala 28:27]
    wire maxcountwire : UInt @[IOFilter.scala 29:26]
    smem InputSampleMemory : SInt<18> [2048] @[IOFilter.scala 32:38]
    smem OutputSampleMemory : SInt<18> [2048] @[IOFilter.scala 33:39]
    smem CoeffMemory : SInt<18> [1024] @[IOFilter.scala 34:32]
    reg OutputReg : SInt<18>, clock with :
      reset => (UInt<1>("h0"), OutputReg) @[IOFilter.scala 36:22]
    reg MAccReg : SInt<36>, clock with :
      reset => (UInt<1>("h0"), MAccReg) @[IOFilter.scala 37:20]
    reg SampleCount : UInt<11>, clock with :
      reset => (UInt<1>("h0"), SampleCount) @[IOFilter.scala 40:24]
    reg InputSamplePointer : UInt<11>, clock with :
      reset => (UInt<1>("h0"), InputSamplePointer) @[IOFilter.scala 42:31]
    reg OutputSamplePointer : UInt<11>, clock with :
      reset => (UInt<1>("h0"), OutputSamplePointer) @[IOFilter.scala 43:32]
    io.WaveOut <= OutputReg @[IOFilter.scala 48:14]
    io.Completed <= UInt<1>("h0") @[IOFilter.scala 49:16]
    SampleCount <= UInt<1>("h0") @[IOFilter.scala 50:15]
    CoeffCount <= UInt<1>("h0") @[IOFilter.scala 51:14]
    wire _ReadInputSample_WIRE : UInt @[IOFilter.scala 52:44]
    _ReadInputSample_WIRE is invalid @[IOFilter.scala 52:44]
    when UInt<1>("h1") : @[IOFilter.scala 52:44]
      _ReadInputSample_WIRE <= SampleAddress @[IOFilter.scala 52:44]
      node _ReadInputSample_T = or(_ReadInputSample_WIRE, UInt<11>("h0")) @[IOFilter.scala 52:44]
      node _ReadInputSample_T_1 = bits(_ReadInputSample_T, 10, 0) @[IOFilter.scala 52:44]
      read mport ReadInputSample_MPORT = InputSampleMemory[_ReadInputSample_T_1], clock @[IOFilter.scala 52:44]
    ReadInputSample <= ReadInputSample_MPORT @[IOFilter.scala 52:19]
    wire _ReadOutputSample_WIRE : UInt @[IOFilter.scala 53:46]
    _ReadOutputSample_WIRE is invalid @[IOFilter.scala 53:46]
    when UInt<1>("h1") : @[IOFilter.scala 53:46]
      _ReadOutputSample_WIRE <= SampleAddress @[IOFilter.scala 53:46]
      node _ReadOutputSample_T = or(_ReadOutputSample_WIRE, UInt<11>("h0")) @[IOFilter.scala 53:46]
      node _ReadOutputSample_T_1 = bits(_ReadOutputSample_T, 10, 0) @[IOFilter.scala 53:46]
      read mport ReadOutputSample_MPORT = OutputSampleMemory[_ReadOutputSample_T_1], clock @[IOFilter.scala 53:46]
    ReadOutputSample <= ReadOutputSample_MPORT @[IOFilter.scala 53:20]
    Halfcountwire <= UInt<3>("h4") @[IOFilter.scala 54:17]
    maxcountwire <= UInt<4>("h9") @[IOFilter.scala 55:16]
    wire _CoeffWire_WIRE : UInt @[IOFilter.scala 58:32]
    _CoeffWire_WIRE is invalid @[IOFilter.scala 58:32]
    when UInt<1>("h1") : @[IOFilter.scala 58:32]
      _CoeffWire_WIRE <= CoeffCount @[IOFilter.scala 58:32]
      node _CoeffWire_T = or(_CoeffWire_WIRE, UInt<10>("h0")) @[IOFilter.scala 58:32]
      node _CoeffWire_T_1 = bits(_CoeffWire_T, 9, 0) @[IOFilter.scala 58:32]
      read mport CoeffWire_MPORT = CoeffMemory[_CoeffWire_T_1], clock @[IOFilter.scala 58:32]
    CoeffWire <= CoeffWire_MPORT @[IOFilter.scala 58:13]
    Fircomputation36 <= asSInt(UInt<1>("h0")) @[IOFilter.scala 59:20]
    Fircomputation18 <= asSInt(UInt<1>("h0")) @[IOFilter.scala 60:20]
    node _T = gt(SampleCount, UInt<1>("h0")) @[IOFilter.scala 63:17]
    node _T_1 = eq(SampleCount, UInt<1>("h0")) @[IOFilter.scala 63:56]
    node _T_2 = and(io.ConvEnable, _T_1) @[IOFilter.scala 63:40]
    node _T_3 = or(_T, _T_2) @[IOFilter.scala 63:23]
    when _T_3 : @[IOFilter.scala 64:5]
      node _Fircomputation36_T = mul(CoeffWire, FIRInput) @[IOFilter.scala 66:35]
      Fircomputation36 <= _Fircomputation36_T @[IOFilter.scala 66:22]
      node _MAccReg_T = add(MAccReg, Fircomputation36) @[IOFilter.scala 67:24]
      node _MAccReg_T_1 = tail(_MAccReg_T, 1) @[IOFilter.scala 67:24]
      node _MAccReg_T_2 = asSInt(_MAccReg_T_1) @[IOFilter.scala 67:24]
      MAccReg <= _MAccReg_T_2 @[IOFilter.scala 67:13]
    node _T_4 = eq(SampleCount, UInt<1>("h0")) @[IOFilter.scala 72:20]
    when _T_4 : @[IOFilter.scala 72:29]
      io.Completed <= UInt<1>("h1") @[IOFilter.scala 73:18]
    node _T_5 = eq(SampleCount, maxcountwire) @[IOFilter.scala 76:20]
    when _T_5 : @[IOFilter.scala 76:38]
      node _OutputReg_T = add(MAccReg, Fircomputation36) @[IOFilter.scala 77:27]
      node _OutputReg_T_1 = tail(_OutputReg_T, 1) @[IOFilter.scala 77:27]
      node _OutputReg_T_2 = asSInt(_OutputReg_T_1) @[IOFilter.scala 77:27]
      node _OutputReg_T_3 = shr(_OutputReg_T_2, 17) @[IOFilter.scala 77:46]
      node _OutputReg_T_4 = bits(_OutputReg_T_3, 17, 0) @[IOFilter.scala 77:52]
      node _OutputReg_T_5 = asSInt(_OutputReg_T_4) @[IOFilter.scala 77:60]
      OutputReg <= _OutputReg_T_5 @[IOFilter.scala 77:15]
      MAccReg <= asSInt(UInt<1>("h0")) @[IOFilter.scala 78:13]
    else :
      node _T_6 = gt(SampleCount, UInt<1>("h0")) @[IOFilter.scala 82:18]
      node _T_7 = lt(SampleCount, Halfcountwire) @[IOFilter.scala 82:41]
      node _T_8 = and(_T_6, _T_7) @[IOFilter.scala 82:25]
      node _T_9 = eq(SampleCount, UInt<1>("h0")) @[IOFilter.scala 82:90]
      node _T_10 = and(io.ConvEnable, _T_9) @[IOFilter.scala 82:75]
      node _T_11 = or(_T_8, _T_10) @[IOFilter.scala 82:58]
      when _T_11 : @[IOFilter.scala 83:5]
        node _SampleCount_T = add(SampleCount, UInt<1>("h1")) @[IOFilter.scala 84:32]
        node _SampleCount_T_1 = tail(_SampleCount_T, 1) @[IOFilter.scala 84:32]
        SampleCount <= _SampleCount_T_1 @[IOFilter.scala 84:17]
        node _CoeffCount_T = add(SampleCount, UInt<1>("h1")) @[IOFilter.scala 85:31]
        node _CoeffCount_T_1 = tail(_CoeffCount_T, 1) @[IOFilter.scala 85:31]
        CoeffCount <= _CoeffCount_T_1 @[IOFilter.scala 85:16]
      else :
        node _T_12 = geq(SampleCount, Halfcountwire) @[IOFilter.scala 88:26]
        when _T_12 : @[IOFilter.scala 88:44]
          node _SampleCount_T_2 = add(SampleCount, UInt<1>("h1")) @[IOFilter.scala 89:32]
          node _SampleCount_T_3 = tail(_SampleCount_T_2, 1) @[IOFilter.scala 89:32]
          SampleCount <= _SampleCount_T_3 @[IOFilter.scala 89:17]
          node _CoeffCount_T_2 = sub(UInt<4>("h8"), SampleCount) @[IOFilter.scala 90:40]
          node _CoeffCount_T_3 = tail(_CoeffCount_T_2, 1) @[IOFilter.scala 90:40]
          CoeffCount <= _CoeffCount_T_3 @[IOFilter.scala 90:16]
    node _T_13 = eq(SampleCount, UInt<1>("h0")) @[IOFilter.scala 93:39]
    node _T_14 = eq(io.SampleType, UInt<1>("h0")) @[IOFilter.scala 93:50]
    node _T_15 = or(_T_13, _T_14) @[IOFilter.scala 93:47]
    node _T_16 = and(io.ADCEnable, _T_15) @[IOFilter.scala 93:23]
    when _T_16 : @[IOFilter.scala 93:67]
      node _T_17 = gt(InputSamplePointer, UInt<1>("h0")) @[IOFilter.scala 94:31]
      when _T_17 : @[IOFilter.scala 94:38]
        node _InputSamplePointer_T = sub(InputSamplePointer, UInt<1>("h1")) @[IOFilter.scala 95:50]
        node _InputSamplePointer_T_1 = tail(_InputSamplePointer_T, 1) @[IOFilter.scala 95:50]
        InputSamplePointer <= _InputSamplePointer_T_1 @[IOFilter.scala 95:28]
        node _T_18 = sub(InputSamplePointer, UInt<1>("h1")) @[IOFilter.scala 96:52]
        node _T_19 = tail(_T_18, 1) @[IOFilter.scala 96:52]
        write mport MPORT = InputSampleMemory[_T_19], clock
        MPORT <= io.ADCWaveIn
      else :
        node _T_20 = eq(InputSamplePointer, UInt<1>("h0")) @[IOFilter.scala 97:37]
        when _T_20 : @[IOFilter.scala 97:46]
          InputSamplePointer <= maxcountwire @[IOFilter.scala 98:28]
          node _T_21 = or(maxcountwire, UInt<11>("h0"))
          node _T_22 = bits(_T_21, 10, 0)
          write mport MPORT_1 = InputSampleMemory[_T_22], clock
          MPORT_1 <= io.ADCWaveIn
    node _T_23 = eq(SampleCount, UInt<1>("h0")) @[IOFilter.scala 103:39]
    node _T_24 = or(_T_23, io.SampleType) @[IOFilter.scala 103:47]
    node _T_25 = and(io.DACEnable, _T_24) @[IOFilter.scala 103:23]
    when _T_25 : @[IOFilter.scala 103:66]
      node _T_26 = gt(OutputSamplePointer, UInt<1>("h0")) @[IOFilter.scala 104:32]
      when _T_26 : @[IOFilter.scala 104:39]
        node _OutputSamplePointer_T = sub(OutputSamplePointer, UInt<1>("h1")) @[IOFilter.scala 105:52]
        node _OutputSamplePointer_T_1 = tail(_OutputSamplePointer_T, 1) @[IOFilter.scala 105:52]
        OutputSamplePointer <= _OutputSamplePointer_T_1 @[IOFilter.scala 105:29]
        node _T_27 = sub(OutputSamplePointer, UInt<1>("h1")) @[IOFilter.scala 106:54]
        node _T_28 = tail(_T_27, 1) @[IOFilter.scala 106:54]
        write mport MPORT_2 = OutputSampleMemory[_T_28], clock
        MPORT_2 <= io.DACWaveIn
      else :
        node _T_29 = eq(OutputSamplePointer, UInt<1>("h0")) @[IOFilter.scala 107:38]
        when _T_29 : @[IOFilter.scala 107:47]
          OutputSamplePointer <= maxcountwire @[IOFilter.scala 108:29]
          node _T_30 = or(maxcountwire, UInt<11>("h0"))
          node _T_31 = bits(_T_30, 10, 0)
          write mport MPORT_3 = OutputSampleMemory[_T_31], clock
          MPORT_3 <= io.DACWaveIn
    when io.SampleType : @[IOFilter.scala 113:23]
      node _T_32 = eq(SampleCount, UInt<1>("h0")) @[IOFilter.scala 117:22]
      when _T_32 : @[IOFilter.scala 117:31]
        FIRInput <= io.DACWaveIn @[IOFilter.scala 118:16]
      else :
        FIRInput <= ReadOutputSample @[IOFilter.scala 120:16]
      node _T_33 = add(OutputSamplePointer, SampleCount) @[IOFilter.scala 124:30]
      node _T_34 = tail(_T_33, 1) @[IOFilter.scala 124:30]
      node _T_35 = leq(_T_34, maxcountwire) @[IOFilter.scala 124:44]
      when _T_35 : @[IOFilter.scala 124:61]
        node _SampleAddress_T = add(OutputSamplePointer, SampleCount) @[IOFilter.scala 125:44]
        node _SampleAddress_T_1 = tail(_SampleAddress_T, 1) @[IOFilter.scala 125:44]
        SampleAddress <= _SampleAddress_T_1 @[IOFilter.scala 125:21]
      else :
        node _SampleAddress_T_2 = add(OutputSamplePointer, SampleCount) @[IOFilter.scala 127:44]
        node _SampleAddress_T_3 = tail(_SampleAddress_T_2, 1) @[IOFilter.scala 127:44]
        node _SampleAddress_T_4 = sub(_SampleAddress_T_3, UInt<4>("ha")) @[IOFilter.scala 127:58]
        node _SampleAddress_T_5 = tail(_SampleAddress_T_4, 1) @[IOFilter.scala 127:58]
        SampleAddress <= _SampleAddress_T_5 @[IOFilter.scala 127:21]
      node _T_36 = eq(SampleCount, UInt<1>("h0")) @[IOFilter.scala 130:39]
      node _T_37 = and(io.ConvEnable, _T_36) @[IOFilter.scala 130:24]
      when _T_37 : @[IOFilter.scala 130:48]
        node _T_38 = sub(OutputSamplePointer, UInt<1>("h1")) @[IOFilter.scala 131:52]
        node _T_39 = tail(_T_38, 1) @[IOFilter.scala 131:52]
        write mport MPORT_4 = OutputSampleMemory[_T_39], clock
        MPORT_4 <= io.DACWaveIn
      else :
        node _T_40 = eq(SampleCount, maxcountwire) @[IOFilter.scala 132:28]
        when _T_40 : @[IOFilter.scala 132:46]
          node _T_41 = gt(OutputSamplePointer, UInt<1>("h0")) @[IOFilter.scala 133:32]
          when _T_41 : @[IOFilter.scala 133:39]
            node _OutputSamplePointer_T_2 = sub(OutputSamplePointer, UInt<1>("h1")) @[IOFilter.scala 134:52]
            node _OutputSamplePointer_T_3 = tail(_OutputSamplePointer_T_2, 1) @[IOFilter.scala 134:52]
            OutputSamplePointer <= _OutputSamplePointer_T_3 @[IOFilter.scala 134:29]
          else :
            node _T_42 = eq(OutputSamplePointer, UInt<1>("h0")) @[IOFilter.scala 135:38]
            when _T_42 : @[IOFilter.scala 135:47]
              OutputSamplePointer <= maxcountwire @[IOFilter.scala 136:29]
    else :
      node _T_43 = eq(SampleCount, UInt<1>("h0")) @[IOFilter.scala 144:22]
      when _T_43 : @[IOFilter.scala 144:31]
        FIRInput <= io.ADCWaveIn @[IOFilter.scala 145:16]
      else :
        FIRInput <= ReadInputSample @[IOFilter.scala 147:16]
      node _T_44 = add(InputSamplePointer, SampleCount) @[IOFilter.scala 151:29]
      node _T_45 = tail(_T_44, 1) @[IOFilter.scala 151:29]
      node _T_46 = leq(_T_45, maxcountwire) @[IOFilter.scala 151:43]
      when _T_46 : @[IOFilter.scala 151:60]
        node _SampleAddress_T_6 = add(InputSamplePointer, SampleCount) @[IOFilter.scala 152:43]
        node _SampleAddress_T_7 = tail(_SampleAddress_T_6, 1) @[IOFilter.scala 152:43]
        SampleAddress <= _SampleAddress_T_7 @[IOFilter.scala 152:21]
      else :
        node _SampleAddress_T_8 = add(InputSamplePointer, SampleCount) @[IOFilter.scala 154:43]
        node _SampleAddress_T_9 = tail(_SampleAddress_T_8, 1) @[IOFilter.scala 154:43]
        node _SampleAddress_T_10 = sub(_SampleAddress_T_9, UInt<4>("ha")) @[IOFilter.scala 154:57]
        node _SampleAddress_T_11 = tail(_SampleAddress_T_10, 1) @[IOFilter.scala 154:57]
        SampleAddress <= _SampleAddress_T_11 @[IOFilter.scala 154:21]
      node _T_47 = eq(SampleCount, UInt<1>("h0")) @[IOFilter.scala 157:39]
      node _T_48 = and(io.ConvEnable, _T_47) @[IOFilter.scala 157:24]
      when _T_48 : @[IOFilter.scala 157:48]
        node _T_49 = sub(InputSamplePointer, UInt<1>("h1")) @[IOFilter.scala 158:50]
        node _T_50 = tail(_T_49, 1) @[IOFilter.scala 158:50]
        write mport MPORT_5 = InputSampleMemory[_T_50], clock
        MPORT_5 <= io.ADCWaveIn
      else :
        node _T_51 = eq(SampleCount, maxcountwire) @[IOFilter.scala 159:28]
        when _T_51 : @[IOFilter.scala 159:46]
          node _T_52 = gt(InputSamplePointer, UInt<1>("h0")) @[IOFilter.scala 160:31]
          when _T_52 : @[IOFilter.scala 160:38]
            node _InputSamplePointer_T_2 = sub(InputSamplePointer, UInt<1>("h1")) @[IOFilter.scala 161:50]
            node _InputSamplePointer_T_3 = tail(_InputSamplePointer_T_2, 1) @[IOFilter.scala 161:50]
            InputSamplePointer <= _InputSamplePointer_T_3 @[IOFilter.scala 161:28]
          else :
            node _T_53 = eq(InputSamplePointer, UInt<1>("h0")) @[IOFilter.scala 162:37]
            when _T_53 : @[IOFilter.scala 162:46]
              InputSamplePointer <= maxcountwire @[IOFilter.scala 163:28]

  module IOMaster :
    input clock : Clock
    input reset : Reset
    output io : { flip In_ADC : UInt<1>, flip In_DAC : SInt<18>, Out_ADC_D : UInt<1>, Out_ADC : SInt<18>, Out_DAC : UInt<1>}

    inst ADC of InController @[IOMaster.scala 15:19]
    ADC.clock <= clock
    ADC.reset <= reset
    inst DAC of OutController @[IOMaster.scala 16:19]
    DAC.clock <= clock
    DAC.reset <= reset
    inst ADCFilter of IOFilter @[IOMaster.scala 17:25]
    ADCFilter.clock <= clock
    ADCFilter.reset <= reset
    inst DACFilter of IOFilter_1 @[IOMaster.scala 20:25]
    DACFilter.clock <= clock
    DACFilter.reset <= reset
    reg ADCReg : SInt<18>, clock with :
      reset => (reset, asSInt(UInt<18>("h0"))) @[IOMaster.scala 24:23]
    reg DACReg : SInt<18>, clock with :
      reset => (reset, asSInt(UInt<18>("h0"))) @[IOMaster.scala 25:23]
    reg ADCHold : SInt<18>, clock with :
      reset => (reset, asSInt(UInt<18>("h0"))) @[IOMaster.scala 26:24]
    reg DACHold : SInt<18>, clock with :
      reset => (reset, asSInt(UInt<18>("h0"))) @[IOMaster.scala 27:24]
    ADC.io.In <= io.In_ADC @[IOMaster.scala 29:13]
    io.Out_ADC <= ADC.io.Out @[IOMaster.scala 30:14]
    ADC.io.postFIR <= ADCHold @[IOMaster.scala 31:18]
    ADCReg <= ADC.io.preFIR @[IOMaster.scala 32:10]
    DAC.io.In <= io.In_DAC @[IOMaster.scala 33:13]
    io.Out_DAC <= DAC.io.OutPWM @[IOMaster.scala 34:14]
    DAC.io.postFIR <= DACHold @[IOMaster.scala 35:18]
    DACReg <= DAC.io.preFIR @[IOMaster.scala 36:10]
    io.Out_ADC_D <= ADC.io.ADC_D_out @[IOMaster.scala 38:16]
    ADCFilter.io.SampleType <= UInt<1>("h0") @[IOMaster.scala 40:27]
    ADCFilter.io.ADCWaveIn <= ADCReg @[IOMaster.scala 41:26]
    ADCFilter.io.DACWaveIn <= asSInt(UInt<1>("h0")) @[IOMaster.scala 42:26]
    ADCFilter.io.DACEnable <= UInt<1>("h0") @[IOMaster.scala 43:26]
    ADCFilter.io.ADCEnable <= UInt<1>("h1") @[IOMaster.scala 44:26]
    ADCFilter.io.ConvEnable <= UInt<1>("h0") @[IOMaster.scala 45:27]
    DACFilter.io.SampleType <= UInt<1>("h1") @[IOMaster.scala 47:27]
    DACFilter.io.ADCWaveIn <= asSInt(UInt<1>("h0")) @[IOMaster.scala 48:26]
    DACFilter.io.DACWaveIn <= DACReg @[IOMaster.scala 49:26]
    DACFilter.io.DACEnable <= UInt<1>("h1") @[IOMaster.scala 50:26]
    DACFilter.io.ADCEnable <= UInt<1>("h0") @[IOMaster.scala 51:26]
    DACFilter.io.ConvEnable <= UInt<1>("h0") @[IOMaster.scala 52:27]
    reg cntReg : UInt<10>, clock with :
      reset => (reset, UInt<10>("h0")) @[IOMaster.scala 55:23]
    node check1 = eq(cntReg, UInt<4>("ha")) @[IOMaster.scala 56:23]
    node _cntReg_T = add(cntReg, UInt<1>("h1")) @[IOMaster.scala 58:20]
    node _cntReg_T_1 = tail(_cntReg_T, 1) @[IOMaster.scala 58:20]
    cntReg <= _cntReg_T_1 @[IOMaster.scala 58:10]
    when check1 : @[IOMaster.scala 60:16]
      ADCFilter.io.ConvEnable <= UInt<1>("h1") @[IOMaster.scala 61:29]
      DACFilter.io.ConvEnable <= UInt<1>("h1") @[IOMaster.scala 62:29]
      cntReg <= UInt<1>("h0") @[IOMaster.scala 63:12]
    node _T = eq(ADCFilter.io.Completed, UInt<1>("h1")) @[IOMaster.scala 68:31]
    when _T : @[IOMaster.scala 68:40]
      ADCHold <= ADCFilter.io.WaveOut @[IOMaster.scala 71:17]
    node _T_1 = eq(DACFilter.io.Completed, UInt<1>("h1")) @[IOMaster.scala 74:33]
    when _T_1 : @[IOMaster.scala 74:42]
      DACHold <= ADCFilter.io.WaveOut @[IOMaster.scala 77:17]

  module DSP :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip In : UInt<1>, Out_AD : UInt<1>, Out : UInt<1>}

    inst IOC of IOMaster @[DSP.scala 134:20]
    IOC.clock <= clock
    IOC.reset <= reset
    IOC.io.In_ADC <= io.In @[DSP.scala 136:17]
    IOC.io.In_DAC <= IOC.io.Out_ADC @[DSP.scala 138:17]
    io.Out_AD <= IOC.io.Out_ADC_D @[DSP.scala 140:17]
    io.Out <= IOC.io.Out_DAC @[DSP.scala 141:17]

