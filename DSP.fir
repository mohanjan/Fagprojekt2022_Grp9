circuit DSP :
  module InController :
    input clock : Clock
    input reset : Reset
    output io : { flip In : UInt<1>, flip postFIR : SInt<18>, Out : SInt<18>, ADC_D_out : UInt<1>, preFIR : SInt<18>, flip Sync : UInt<1>}

    wire syncIn : UInt<1>
    syncIn <= UInt<1>("h0")
    syncIn <= io.Sync @[InController.scala 16:10]
    reg delay : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[InController.scala 18:22]
    io.ADC_D_out <= delay @[InController.scala 19:16]
    reg inReg : UInt<18>, clock with :
      reset => (reset, UInt<18>("h0")) @[InController.scala 22:22]
    reg sample : SInt<18>, clock with :
      reset => (reset, asSInt(UInt<18>("h0"))) @[InController.scala 23:23]
    reg cntReg : UInt<5>, clock with :
      reset => (reset, UInt<5>("h0")) @[InController.scala 26:23]
    node tick = eq(cntReg, UInt<5>("h12")) @[InController.scala 27:21]
    reg FIRReg : UInt<18>, clock with :
      reset => (reset, UInt<18>("h0")) @[InController.scala 30:23]
    reg OutReg : UInt<18>, clock with :
      reset => (reset, UInt<18>("h0")) @[InController.scala 31:23]
    node _T = eq(syncIn, UInt<1>("h1")) @[InController.scala 35:16]
    when _T : @[InController.scala 35:24]
      node _cntReg_T = add(cntReg, UInt<1>("h1")) @[InController.scala 36:22]
      node _cntReg_T_1 = tail(_cntReg_T, 1) @[InController.scala 36:22]
      cntReg <= _cntReg_T_1 @[InController.scala 36:12]
      node _inReg_T = bits(inReg, 17, 1) @[InController.scala 37:30]
      node _inReg_T_1 = cat(io.In, _inReg_T) @[Cat.scala 31:58]
      inReg <= _inReg_T_1 @[InController.scala 37:11]
      node _delay_T = bits(inReg, 17, 17) @[InController.scala 39:19]
      delay <= _delay_T @[InController.scala 39:11]
    when tick : @[InController.scala 43:14]
      cntReg <= UInt<1>("h0") @[InController.scala 44:12]
      sample <= io.postFIR @[InController.scala 45:12]
    node _io_preFIR_T = asSInt(inReg) @[InController.scala 52:22]
    io.preFIR <= _io_preFIR_T @[InController.scala 52:13]
    io.Out <= sample @[InController.scala 53:10]

  module OutController :
    input clock : Clock
    input reset : Reset
    output io : { flip In : SInt<18>, flip postFIR : SInt<18>, preFIR : SInt<18>, OutPWM : UInt<1>, flip Sync : UInt<1>}

    wire syncIn : UInt<1>
    syncIn <= UInt<1>("h0")
    syncIn <= io.Sync @[OutController.scala 15:10]
    reg ZReg : SInt<18>, clock with :
      reset => (reset, asSInt(UInt<18>("h0"))) @[OutController.scala 18:22]
    reg Diff : SInt<18>, clock with :
      reset => (reset, asSInt(UInt<18>("h0"))) @[OutController.scala 19:22]
    reg DDC : SInt<18>, clock with :
      reset => (reset, asSInt(UInt<18>("h0"))) @[OutController.scala 20:22]
    reg cntReg : UInt<5>, clock with :
      reset => (reset, UInt<5>("h0")) @[OutController.scala 21:23]
    node tick = eq(cntReg, UInt<1>("h0")) @[OutController.scala 22:21]
    reg PDMReg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[OutController.scala 25:23]
    reg pFIRReg : SInt<18>, clock with :
      reset => (reset, asSInt(UInt<18>("h0"))) @[OutController.scala 26:24]
    reg FIRpReg : SInt<18>, clock with :
      reset => (reset, asSInt(UInt<18>("h0"))) @[OutController.scala 27:24]
    node _cntReg_T = add(cntReg, UInt<1>("h1")) @[OutController.scala 28:20]
    node _cntReg_T_1 = tail(_cntReg_T, 1) @[OutController.scala 28:20]
    cntReg <= _cntReg_T_1 @[OutController.scala 28:10]
    io.preFIR <= pFIRReg @[OutController.scala 29:13]
    node _io_preFIR_T = mux(tick, io.In, asSInt(UInt<1>("h0"))) @[OutController.scala 31:19]
    io.preFIR <= _io_preFIR_T @[OutController.scala 31:13]
    node _T = eq(syncIn, UInt<1>("h1")) @[OutController.scala 34:15]
    when _T : @[OutController.scala 34:23]
      FIRpReg <= io.postFIR @[OutController.scala 36:13]
      node _Diff_T = sub(FIRpReg, DDC) @[OutController.scala 38:21]
      node _Diff_T_1 = tail(_Diff_T, 1) @[OutController.scala 38:21]
      node _Diff_T_2 = asSInt(_Diff_T_1) @[OutController.scala 38:21]
      Diff <= _Diff_T_2 @[OutController.scala 38:10]
      node _ZReg_T = add(ZReg, Diff) @[OutController.scala 39:19]
      node _ZReg_T_1 = tail(_ZReg_T, 1) @[OutController.scala 39:19]
      node _ZReg_T_2 = asSInt(_ZReg_T_1) @[OutController.scala 39:19]
      ZReg <= _ZReg_T_2 @[OutController.scala 39:11]
      node _DDC_T = eq(io.OutPWM, UInt<1>("h1")) @[OutController.scala 40:26]
      node _DDC_T_1 = mux(UInt<1>("h1"), UInt<17>("h1ffff"), UInt<17>("h0")) @[Bitwise.scala 74:12]
      node _DDC_T_2 = cvt(_DDC_T_1) @[OutController.scala 40:60]
      node _DDC_T_3 = mux(UInt<1>("h1"), UInt<17>("h1ffff"), UInt<17>("h0")) @[Bitwise.scala 74:12]
      node _DDC_T_4 = cvt(_DDC_T_3) @[OutController.scala 40:93]
      node _DDC_T_5 = not(_DDC_T_4) @[OutController.scala 40:66]
      node _DDC_T_6 = asSInt(_DDC_T_5) @[OutController.scala 40:66]
      node _DDC_T_7 = mux(_DDC_T, _DDC_T_2, _DDC_T_6) @[OutController.scala 40:15]
      DDC <= _DDC_T_7 @[OutController.scala 40:9]
      node _PDMReg_T = bits(ZReg, 17, 17) @[OutController.scala 41:20]
      node _PDMReg_T_1 = not(_PDMReg_T) @[OutController.scala 41:15]
      PDMReg <= _PDMReg_T_1 @[OutController.scala 41:12]
    io.OutPWM <= PDMReg @[OutController.scala 43:13]
    node _T_1 = eq(cntReg, UInt<5>("h12")) @[OutController.scala 45:15]
    when _T_1 : @[OutController.scala 45:26]
      cntReg <= UInt<1>("h0") @[OutController.scala 46:12]

  module IOFilter :
    input clock : Clock
    input reset : Reset
    output io : { flip WaveIn : SInt<18>, WaveOut : SInt<18>, flip LoadSamples : UInt<1>, flip ConvEnable : UInt<1>, Completed : UInt<1>}

    wire FIRInput : SInt @[IOFilter.scala 15:22]
    wire CoeffCount : UInt @[IOFilter.scala 16:24]
    wire SampleAddress : UInt @[IOFilter.scala 17:27]
    wire ReadSample : SInt @[IOFilter.scala 18:24]
    wire CoeffWire : SInt @[IOFilter.scala 21:23]
    wire Fircomputation36 : SInt @[IOFilter.scala 22:30]
    wire Fircomputation18 : SInt @[IOFilter.scala 23:30]
    wire Halfcountwire : UInt @[IOFilter.scala 24:27]
    wire maxcountwire : UInt @[IOFilter.scala 25:26]
    smem InputSampleMemory : SInt<18> [2048] @[IOFilter.scala 28:38]
    smem CoeffMemory : SInt<18> [1024] @[IOFilter.scala 29:32]
    reg OutputReg : SInt<18>, clock with :
      reset => (UInt<1>("h0"), OutputReg) @[IOFilter.scala 31:22]
    reg MAccReg : SInt<36>, clock with :
      reset => (UInt<1>("h0"), MAccReg) @[IOFilter.scala 32:20]
    reg SampleCount : UInt<11>, clock with :
      reset => (UInt<1>("h0"), SampleCount) @[IOFilter.scala 35:24]
    reg InputSamplePointer : UInt<11>, clock with :
      reset => (UInt<1>("h0"), InputSamplePointer) @[IOFilter.scala 37:31]
    reg OutputSamplePointer : UInt<11>, clock with :
      reset => (UInt<1>("h0"), OutputSamplePointer) @[IOFilter.scala 38:32]
    io.WaveOut <= OutputReg @[IOFilter.scala 43:14]
    io.Completed <= UInt<1>("h0") @[IOFilter.scala 44:16]
    SampleCount <= UInt<1>("h0") @[IOFilter.scala 45:15]
    CoeffCount <= UInt<1>("h0") @[IOFilter.scala 46:14]
    ReadSample <= asSInt(UInt<1>("h0")) @[IOFilter.scala 47:14]
    Halfcountwire <= UInt<9>("h19b") @[IOFilter.scala 48:17]
    maxcountwire <= UInt<10>("h337") @[IOFilter.scala 49:16]
    wire _CoeffWire_WIRE : UInt @[IOFilter.scala 52:32]
    _CoeffWire_WIRE is invalid @[IOFilter.scala 52:32]
    when UInt<1>("h1") : @[IOFilter.scala 52:32]
      _CoeffWire_WIRE <= CoeffCount @[IOFilter.scala 52:32]
      node _CoeffWire_T = or(_CoeffWire_WIRE, UInt<10>("h0")) @[IOFilter.scala 52:32]
      node _CoeffWire_T_1 = bits(_CoeffWire_T, 9, 0) @[IOFilter.scala 52:32]
      read mport CoeffWire_MPORT = CoeffMemory[_CoeffWire_T_1], clock @[IOFilter.scala 52:32]
    CoeffWire <= CoeffWire_MPORT @[IOFilter.scala 52:13]
    Fircomputation36 <= asSInt(UInt<1>("h0")) @[IOFilter.scala 53:20]
    Fircomputation18 <= asSInt(UInt<1>("h0")) @[IOFilter.scala 54:20]
    node _T = eq(io.LoadSamples, UInt<1>("h0")) @[IOFilter.scala 56:8]
    when _T : @[IOFilter.scala 56:24]
      wire _ReadSample_WIRE : UInt @[IOFilter.scala 57:40]
      _ReadSample_WIRE is invalid @[IOFilter.scala 57:40]
      when UInt<1>("h1") : @[IOFilter.scala 57:40]
        _ReadSample_WIRE <= SampleAddress @[IOFilter.scala 57:40]
        node _ReadSample_T = or(_ReadSample_WIRE, UInt<11>("h0")) @[IOFilter.scala 57:40]
        node _ReadSample_T_1 = bits(_ReadSample_T, 10, 0) @[IOFilter.scala 57:40]
        read mport ReadSample_MPORT = InputSampleMemory[_ReadSample_T_1], clock @[IOFilter.scala 57:40]
      ReadSample <= ReadSample_MPORT @[IOFilter.scala 57:16]
    node _T_1 = gt(SampleCount, UInt<1>("h0")) @[IOFilter.scala 61:17]
    node _T_2 = eq(SampleCount, UInt<1>("h0")) @[IOFilter.scala 61:56]
    node _T_3 = and(io.ConvEnable, _T_2) @[IOFilter.scala 61:41]
    node _T_4 = or(_T_1, _T_3) @[IOFilter.scala 61:23]
    when _T_4 : @[IOFilter.scala 61:66]
      node _Fircomputation36_T = mul(CoeffWire, FIRInput) @[IOFilter.scala 63:35]
      Fircomputation36 <= _Fircomputation36_T @[IOFilter.scala 63:22]
      node _MAccReg_T = add(MAccReg, Fircomputation36) @[IOFilter.scala 64:24]
      node _MAccReg_T_1 = tail(_MAccReg_T, 1) @[IOFilter.scala 64:24]
      node _MAccReg_T_2 = asSInt(_MAccReg_T_1) @[IOFilter.scala 64:24]
      MAccReg <= _MAccReg_T_2 @[IOFilter.scala 64:13]
    node _T_5 = eq(SampleCount, UInt<1>("h0")) @[IOFilter.scala 69:20]
    when _T_5 : @[IOFilter.scala 69:29]
      io.Completed <= UInt<1>("h1") @[IOFilter.scala 70:18]
    node _T_6 = eq(SampleCount, maxcountwire) @[IOFilter.scala 73:20]
    when _T_6 : @[IOFilter.scala 73:38]
      node _OutputReg_T = add(MAccReg, Fircomputation36) @[IOFilter.scala 74:27]
      node _OutputReg_T_1 = tail(_OutputReg_T, 1) @[IOFilter.scala 74:27]
      node _OutputReg_T_2 = asSInt(_OutputReg_T_1) @[IOFilter.scala 74:27]
      node _OutputReg_T_3 = shr(_OutputReg_T_2, 17) @[IOFilter.scala 74:46]
      node _OutputReg_T_4 = bits(_OutputReg_T_3, 17, 0) @[IOFilter.scala 74:53]
      node _OutputReg_T_5 = asSInt(_OutputReg_T_4) @[IOFilter.scala 74:61]
      OutputReg <= _OutputReg_T_5 @[IOFilter.scala 74:15]
      MAccReg <= asSInt(UInt<1>("h0")) @[IOFilter.scala 75:13]
    else :
      node _T_7 = gt(SampleCount, UInt<1>("h0")) @[IOFilter.scala 79:19]
      node _T_8 = lt(SampleCount, Halfcountwire) @[IOFilter.scala 79:42]
      node _T_9 = and(_T_7, _T_8) @[IOFilter.scala 79:26]
      node _T_10 = eq(SampleCount, UInt<1>("h0")) @[IOFilter.scala 79:92]
      node _T_11 = and(io.ConvEnable, _T_10) @[IOFilter.scala 79:77]
      node _T_12 = or(_T_9, _T_11) @[IOFilter.scala 79:59]
      when _T_12 : @[IOFilter.scala 80:5]
        node _SampleCount_T = add(SampleCount, UInt<1>("h1")) @[IOFilter.scala 81:32]
        node _SampleCount_T_1 = tail(_SampleCount_T, 1) @[IOFilter.scala 81:32]
        SampleCount <= _SampleCount_T_1 @[IOFilter.scala 81:17]
        node _CoeffCount_T = add(SampleCount, UInt<1>("h1")) @[IOFilter.scala 82:31]
        node _CoeffCount_T_1 = tail(_CoeffCount_T, 1) @[IOFilter.scala 82:31]
        CoeffCount <= _CoeffCount_T_1 @[IOFilter.scala 82:16]
      else :
        node _T_13 = geq(SampleCount, Halfcountwire) @[IOFilter.scala 85:26]
        when _T_13 : @[IOFilter.scala 85:44]
          node _SampleCount_T_2 = add(SampleCount, UInt<1>("h1")) @[IOFilter.scala 86:32]
          node _SampleCount_T_3 = tail(_SampleCount_T_2, 1) @[IOFilter.scala 86:32]
          SampleCount <= _SampleCount_T_3 @[IOFilter.scala 86:17]
          node _CoeffCount_T_2 = sub(UInt<10>("h336"), SampleCount) @[IOFilter.scala 87:40]
          node _CoeffCount_T_3 = tail(_CoeffCount_T_2, 1) @[IOFilter.scala 87:40]
          CoeffCount <= _CoeffCount_T_3 @[IOFilter.scala 87:16]
    node _T_14 = eq(SampleCount, UInt<1>("h0")) @[IOFilter.scala 91:20]
    when _T_14 : @[IOFilter.scala 91:29]
      FIRInput <= io.WaveIn @[IOFilter.scala 92:14]
    else :
      FIRInput <= ReadSample @[IOFilter.scala 94:14]
    node _T_15 = add(InputSamplePointer, SampleCount) @[IOFilter.scala 98:27]
    node _T_16 = tail(_T_15, 1) @[IOFilter.scala 98:27]
    node _T_17 = leq(_T_16, maxcountwire) @[IOFilter.scala 98:41]
    when _T_17 : @[IOFilter.scala 98:58]
      node _SampleAddress_T = add(InputSamplePointer, SampleCount) @[IOFilter.scala 99:41]
      node _SampleAddress_T_1 = tail(_SampleAddress_T, 1) @[IOFilter.scala 99:41]
      SampleAddress <= _SampleAddress_T_1 @[IOFilter.scala 99:19]
    else :
      node _SampleAddress_T_2 = add(InputSamplePointer, SampleCount) @[IOFilter.scala 101:41]
      node _SampleAddress_T_3 = tail(_SampleAddress_T_2, 1) @[IOFilter.scala 101:41]
      node _SampleAddress_T_4 = sub(_SampleAddress_T_3, UInt<10>("h338")) @[IOFilter.scala 101:55]
      node _SampleAddress_T_5 = tail(_SampleAddress_T_4, 1) @[IOFilter.scala 101:55]
      SampleAddress <= _SampleAddress_T_5 @[IOFilter.scala 101:19]
    node _T_18 = eq(SampleCount, UInt<1>("h0")) @[IOFilter.scala 104:38]
    node _T_19 = and(io.LoadSamples, _T_18) @[IOFilter.scala 104:23]
    when _T_19 : @[IOFilter.scala 104:47]
      node _T_20 = sub(InputSamplePointer, UInt<1>("h1")) @[IOFilter.scala 105:48]
      node _T_21 = tail(_T_20, 1) @[IOFilter.scala 105:48]
      write mport MPORT = InputSampleMemory[_T_21], clock
      MPORT <= io.WaveIn
      node _T_22 = gt(InputSamplePointer, UInt<1>("h0")) @[IOFilter.scala 106:29]
      when _T_22 : @[IOFilter.scala 106:36]
        node _InputSamplePointer_T = sub(InputSamplePointer, UInt<1>("h1")) @[IOFilter.scala 107:48]
        node _InputSamplePointer_T_1 = tail(_InputSamplePointer_T, 1) @[IOFilter.scala 107:48]
        InputSamplePointer <= _InputSamplePointer_T_1 @[IOFilter.scala 107:26]
      else :
        node _T_23 = eq(InputSamplePointer, UInt<1>("h0")) @[IOFilter.scala 108:35]
        when _T_23 : @[IOFilter.scala 108:44]
          InputSamplePointer <= maxcountwire @[IOFilter.scala 109:26]

  module IOFilter_1 :
    input clock : Clock
    input reset : Reset
    output io : { flip WaveIn : SInt<18>, WaveOut : SInt<18>, flip LoadSamples : UInt<1>, flip ConvEnable : UInt<1>, Completed : UInt<1>}

    wire FIRInput : SInt @[IOFilter.scala 15:22]
    wire CoeffCount : UInt @[IOFilter.scala 16:24]
    wire SampleAddress : UInt @[IOFilter.scala 17:27]
    wire ReadSample : SInt @[IOFilter.scala 18:24]
    wire CoeffWire : SInt @[IOFilter.scala 21:23]
    wire Fircomputation36 : SInt @[IOFilter.scala 22:30]
    wire Fircomputation18 : SInt @[IOFilter.scala 23:30]
    wire Halfcountwire : UInt @[IOFilter.scala 24:27]
    wire maxcountwire : UInt @[IOFilter.scala 25:26]
    smem InputSampleMemory : SInt<18> [2048] @[IOFilter.scala 28:38]
    smem CoeffMemory : SInt<18> [1024] @[IOFilter.scala 29:32]
    reg OutputReg : SInt<18>, clock with :
      reset => (UInt<1>("h0"), OutputReg) @[IOFilter.scala 31:22]
    reg MAccReg : SInt<36>, clock with :
      reset => (UInt<1>("h0"), MAccReg) @[IOFilter.scala 32:20]
    reg SampleCount : UInt<11>, clock with :
      reset => (UInt<1>("h0"), SampleCount) @[IOFilter.scala 35:24]
    reg InputSamplePointer : UInt<11>, clock with :
      reset => (UInt<1>("h0"), InputSamplePointer) @[IOFilter.scala 37:31]
    reg OutputSamplePointer : UInt<11>, clock with :
      reset => (UInt<1>("h0"), OutputSamplePointer) @[IOFilter.scala 38:32]
    io.WaveOut <= OutputReg @[IOFilter.scala 43:14]
    io.Completed <= UInt<1>("h0") @[IOFilter.scala 44:16]
    SampleCount <= UInt<1>("h0") @[IOFilter.scala 45:15]
    CoeffCount <= UInt<1>("h0") @[IOFilter.scala 46:14]
    ReadSample <= asSInt(UInt<1>("h0")) @[IOFilter.scala 47:14]
    Halfcountwire <= UInt<9>("h19b") @[IOFilter.scala 48:17]
    maxcountwire <= UInt<10>("h337") @[IOFilter.scala 49:16]
    wire _CoeffWire_WIRE : UInt @[IOFilter.scala 52:32]
    _CoeffWire_WIRE is invalid @[IOFilter.scala 52:32]
    when UInt<1>("h1") : @[IOFilter.scala 52:32]
      _CoeffWire_WIRE <= CoeffCount @[IOFilter.scala 52:32]
      node _CoeffWire_T = or(_CoeffWire_WIRE, UInt<10>("h0")) @[IOFilter.scala 52:32]
      node _CoeffWire_T_1 = bits(_CoeffWire_T, 9, 0) @[IOFilter.scala 52:32]
      read mport CoeffWire_MPORT = CoeffMemory[_CoeffWire_T_1], clock @[IOFilter.scala 52:32]
    CoeffWire <= CoeffWire_MPORT @[IOFilter.scala 52:13]
    Fircomputation36 <= asSInt(UInt<1>("h0")) @[IOFilter.scala 53:20]
    Fircomputation18 <= asSInt(UInt<1>("h0")) @[IOFilter.scala 54:20]
    node _T = eq(io.LoadSamples, UInt<1>("h0")) @[IOFilter.scala 56:8]
    when _T : @[IOFilter.scala 56:24]
      wire _ReadSample_WIRE : UInt @[IOFilter.scala 57:40]
      _ReadSample_WIRE is invalid @[IOFilter.scala 57:40]
      when UInt<1>("h1") : @[IOFilter.scala 57:40]
        _ReadSample_WIRE <= SampleAddress @[IOFilter.scala 57:40]
        node _ReadSample_T = or(_ReadSample_WIRE, UInt<11>("h0")) @[IOFilter.scala 57:40]
        node _ReadSample_T_1 = bits(_ReadSample_T, 10, 0) @[IOFilter.scala 57:40]
        read mport ReadSample_MPORT = InputSampleMemory[_ReadSample_T_1], clock @[IOFilter.scala 57:40]
      ReadSample <= ReadSample_MPORT @[IOFilter.scala 57:16]
    node _T_1 = gt(SampleCount, UInt<1>("h0")) @[IOFilter.scala 61:17]
    node _T_2 = eq(SampleCount, UInt<1>("h0")) @[IOFilter.scala 61:56]
    node _T_3 = and(io.ConvEnable, _T_2) @[IOFilter.scala 61:41]
    node _T_4 = or(_T_1, _T_3) @[IOFilter.scala 61:23]
    when _T_4 : @[IOFilter.scala 61:66]
      node _Fircomputation36_T = mul(CoeffWire, FIRInput) @[IOFilter.scala 63:35]
      Fircomputation36 <= _Fircomputation36_T @[IOFilter.scala 63:22]
      node _MAccReg_T = add(MAccReg, Fircomputation36) @[IOFilter.scala 64:24]
      node _MAccReg_T_1 = tail(_MAccReg_T, 1) @[IOFilter.scala 64:24]
      node _MAccReg_T_2 = asSInt(_MAccReg_T_1) @[IOFilter.scala 64:24]
      MAccReg <= _MAccReg_T_2 @[IOFilter.scala 64:13]
    node _T_5 = eq(SampleCount, UInt<1>("h0")) @[IOFilter.scala 69:20]
    when _T_5 : @[IOFilter.scala 69:29]
      io.Completed <= UInt<1>("h1") @[IOFilter.scala 70:18]
    node _T_6 = eq(SampleCount, maxcountwire) @[IOFilter.scala 73:20]
    when _T_6 : @[IOFilter.scala 73:38]
      node _OutputReg_T = add(MAccReg, Fircomputation36) @[IOFilter.scala 74:27]
      node _OutputReg_T_1 = tail(_OutputReg_T, 1) @[IOFilter.scala 74:27]
      node _OutputReg_T_2 = asSInt(_OutputReg_T_1) @[IOFilter.scala 74:27]
      node _OutputReg_T_3 = shr(_OutputReg_T_2, 17) @[IOFilter.scala 74:46]
      node _OutputReg_T_4 = bits(_OutputReg_T_3, 17, 0) @[IOFilter.scala 74:53]
      node _OutputReg_T_5 = asSInt(_OutputReg_T_4) @[IOFilter.scala 74:61]
      OutputReg <= _OutputReg_T_5 @[IOFilter.scala 74:15]
      MAccReg <= asSInt(UInt<1>("h0")) @[IOFilter.scala 75:13]
    else :
      node _T_7 = gt(SampleCount, UInt<1>("h0")) @[IOFilter.scala 79:19]
      node _T_8 = lt(SampleCount, Halfcountwire) @[IOFilter.scala 79:42]
      node _T_9 = and(_T_7, _T_8) @[IOFilter.scala 79:26]
      node _T_10 = eq(SampleCount, UInt<1>("h0")) @[IOFilter.scala 79:92]
      node _T_11 = and(io.ConvEnable, _T_10) @[IOFilter.scala 79:77]
      node _T_12 = or(_T_9, _T_11) @[IOFilter.scala 79:59]
      when _T_12 : @[IOFilter.scala 80:5]
        node _SampleCount_T = add(SampleCount, UInt<1>("h1")) @[IOFilter.scala 81:32]
        node _SampleCount_T_1 = tail(_SampleCount_T, 1) @[IOFilter.scala 81:32]
        SampleCount <= _SampleCount_T_1 @[IOFilter.scala 81:17]
        node _CoeffCount_T = add(SampleCount, UInt<1>("h1")) @[IOFilter.scala 82:31]
        node _CoeffCount_T_1 = tail(_CoeffCount_T, 1) @[IOFilter.scala 82:31]
        CoeffCount <= _CoeffCount_T_1 @[IOFilter.scala 82:16]
      else :
        node _T_13 = geq(SampleCount, Halfcountwire) @[IOFilter.scala 85:26]
        when _T_13 : @[IOFilter.scala 85:44]
          node _SampleCount_T_2 = add(SampleCount, UInt<1>("h1")) @[IOFilter.scala 86:32]
          node _SampleCount_T_3 = tail(_SampleCount_T_2, 1) @[IOFilter.scala 86:32]
          SampleCount <= _SampleCount_T_3 @[IOFilter.scala 86:17]
          node _CoeffCount_T_2 = sub(UInt<10>("h336"), SampleCount) @[IOFilter.scala 87:40]
          node _CoeffCount_T_3 = tail(_CoeffCount_T_2, 1) @[IOFilter.scala 87:40]
          CoeffCount <= _CoeffCount_T_3 @[IOFilter.scala 87:16]
    node _T_14 = eq(SampleCount, UInt<1>("h0")) @[IOFilter.scala 91:20]
    when _T_14 : @[IOFilter.scala 91:29]
      FIRInput <= io.WaveIn @[IOFilter.scala 92:14]
    else :
      FIRInput <= ReadSample @[IOFilter.scala 94:14]
    node _T_15 = add(InputSamplePointer, SampleCount) @[IOFilter.scala 98:27]
    node _T_16 = tail(_T_15, 1) @[IOFilter.scala 98:27]
    node _T_17 = leq(_T_16, maxcountwire) @[IOFilter.scala 98:41]
    when _T_17 : @[IOFilter.scala 98:58]
      node _SampleAddress_T = add(InputSamplePointer, SampleCount) @[IOFilter.scala 99:41]
      node _SampleAddress_T_1 = tail(_SampleAddress_T, 1) @[IOFilter.scala 99:41]
      SampleAddress <= _SampleAddress_T_1 @[IOFilter.scala 99:19]
    else :
      node _SampleAddress_T_2 = add(InputSamplePointer, SampleCount) @[IOFilter.scala 101:41]
      node _SampleAddress_T_3 = tail(_SampleAddress_T_2, 1) @[IOFilter.scala 101:41]
      node _SampleAddress_T_4 = sub(_SampleAddress_T_3, UInt<10>("h338")) @[IOFilter.scala 101:55]
      node _SampleAddress_T_5 = tail(_SampleAddress_T_4, 1) @[IOFilter.scala 101:55]
      SampleAddress <= _SampleAddress_T_5 @[IOFilter.scala 101:19]
    node _T_18 = eq(SampleCount, UInt<1>("h0")) @[IOFilter.scala 104:38]
    node _T_19 = and(io.LoadSamples, _T_18) @[IOFilter.scala 104:23]
    when _T_19 : @[IOFilter.scala 104:47]
      node _T_20 = sub(InputSamplePointer, UInt<1>("h1")) @[IOFilter.scala 105:48]
      node _T_21 = tail(_T_20, 1) @[IOFilter.scala 105:48]
      write mport MPORT = InputSampleMemory[_T_21], clock
      MPORT <= io.WaveIn
      node _T_22 = gt(InputSamplePointer, UInt<1>("h0")) @[IOFilter.scala 106:29]
      when _T_22 : @[IOFilter.scala 106:36]
        node _InputSamplePointer_T = sub(InputSamplePointer, UInt<1>("h1")) @[IOFilter.scala 107:48]
        node _InputSamplePointer_T_1 = tail(_InputSamplePointer_T, 1) @[IOFilter.scala 107:48]
        InputSamplePointer <= _InputSamplePointer_T_1 @[IOFilter.scala 107:26]
      else :
        node _T_23 = eq(InputSamplePointer, UInt<1>("h0")) @[IOFilter.scala 108:35]
        when _T_23 : @[IOFilter.scala 108:44]
          InputSamplePointer <= maxcountwire @[IOFilter.scala 109:26]

  module IOMaster :
    input clock : Clock
    input reset : Reset
    output io : { flip In_ADC : UInt<1>, flip In_DAC : SInt<18>, Out_ADC : SInt<18>, Out_DAC : UInt<1>, Out_ADC_D : UInt<1>, Sync : UInt<1>}

    inst ADC of InController @[IOMaster.scala 16:19]
    ADC.clock <= clock
    ADC.reset <= reset
    inst DAC of OutController @[IOMaster.scala 17:19]
    DAC.clock <= clock
    DAC.reset <= reset
    inst ADCFilter of IOFilter @[IOMaster.scala 18:25]
    ADCFilter.clock <= clock
    ADCFilter.reset <= reset
    inst DACFilter of IOFilter_1 @[IOMaster.scala 21:25]
    DACFilter.clock <= clock
    DACFilter.reset <= reset
    reg ADCReg : SInt<18>, clock with :
      reset => (reset, asSInt(UInt<18>("h0"))) @[IOMaster.scala 25:23]
    reg DACReg : SInt<18>, clock with :
      reset => (reset, asSInt(UInt<18>("h0"))) @[IOMaster.scala 26:23]
    reg ADCHold : SInt<18>, clock with :
      reset => (reset, asSInt(UInt<18>("h0"))) @[IOMaster.scala 27:24]
    reg DACHold : SInt<18>, clock with :
      reset => (reset, asSInt(UInt<18>("h0"))) @[IOMaster.scala 28:24]
    reg ADCLoad : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[IOMaster.scala 29:24]
    reg DACLoad : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[IOMaster.scala 30:24]
    reg syncReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[IOMaster.scala 33:24]
    node _syncReg_T = add(syncReg, UInt<1>("h1")) @[IOMaster.scala 34:22]
    node _syncReg_T_1 = tail(_syncReg_T, 1) @[IOMaster.scala 34:22]
    syncReg <= _syncReg_T_1 @[IOMaster.scala 34:11]
    node _T = eq(syncReg, UInt<1>("h1")) @[IOMaster.scala 35:16]
    when _T : @[IOMaster.scala 35:24]
      io.Sync <= UInt<1>("h1") @[IOMaster.scala 36:13]
    else :
      io.Sync <= UInt<1>("h0") @[IOMaster.scala 38:13]
    node _T_1 = eq(syncReg, UInt<7>("h7f")) @[IOMaster.scala 40:16]
    when _T_1 : @[IOMaster.scala 40:26]
      syncReg <= UInt<1>("h0") @[IOMaster.scala 41:13]
    ADC.io.Sync <= io.Sync @[IOMaster.scala 43:15]
    DAC.io.Sync <= io.Sync @[IOMaster.scala 44:15]
    ADC.io.In <= io.In_ADC @[IOMaster.scala 47:13]
    io.Out_ADC <= ADC.io.Out @[IOMaster.scala 48:14]
    ADC.io.postFIR <= ADCFilter.io.WaveOut @[IOMaster.scala 49:18]
    ADCReg <= ADC.io.preFIR @[IOMaster.scala 50:10]
    DAC.io.In <= io.In_DAC @[IOMaster.scala 52:13]
    io.Out_DAC <= DAC.io.OutPWM @[IOMaster.scala 53:14]
    DAC.io.postFIR <= DACFilter.io.WaveOut @[IOMaster.scala 54:18]
    DACReg <= DAC.io.preFIR @[IOMaster.scala 55:10]
    io.Out_ADC_D <= ADC.io.ADC_D_out @[IOMaster.scala 57:16]
    ADCFilter.io.WaveIn <= ADCReg @[IOMaster.scala 59:23]
    ADCFilter.io.LoadSamples <= ADCLoad @[IOMaster.scala 60:28]
    ADCFilter.io.ConvEnable <= UInt<1>("h0") @[IOMaster.scala 61:27]
    DACFilter.io.WaveIn <= DACReg @[IOMaster.scala 63:23]
    DACFilter.io.LoadSamples <= DACLoad @[IOMaster.scala 64:28]
    DACFilter.io.ConvEnable <= UInt<1>("h0") @[IOMaster.scala 65:27]
    reg cntReg1 : UInt<10>, clock with :
      reset => (reset, UInt<10>("h0")) @[IOMaster.scala 68:24]
    reg cntReg2 : UInt<10>, clock with :
      reset => (reset, UInt<10>("h0")) @[IOMaster.scala 69:24]
    node _doneLoading1_T = sub(UInt<10>("h338"), UInt<1>("h1")) @[IOMaster.scala 71:55]
    node _doneLoading1_T_1 = tail(_doneLoading1_T, 1) @[IOMaster.scala 71:55]
    node doneLoading1 = eq(cntReg1, _doneLoading1_T_1) @[IOMaster.scala 71:30]
    node _doneLoading2_T = sub(UInt<10>("h338"), UInt<1>("h1")) @[IOMaster.scala 72:55]
    node _doneLoading2_T_1 = tail(_doneLoading2_T, 1) @[IOMaster.scala 72:55]
    node doneLoading2 = eq(cntReg2, _doneLoading2_T_1) @[IOMaster.scala 72:30]
    reg count1 : UInt<1>, clock with :
      reset => (reset, UInt<1>("h1")) @[IOMaster.scala 73:23]
    reg count2 : UInt<1>, clock with :
      reset => (reset, UInt<1>("h1")) @[IOMaster.scala 74:23]
    when count1 : @[IOMaster.scala 76:16]
      node _cntReg1_T = add(cntReg1, UInt<1>("h1")) @[IOMaster.scala 77:24]
      node _cntReg1_T_1 = tail(_cntReg1_T, 1) @[IOMaster.scala 77:24]
      cntReg1 <= _cntReg1_T_1 @[IOMaster.scala 77:13]
    when count2 : @[IOMaster.scala 80:16]
      node _cntReg2_T = add(cntReg2, UInt<1>("h1")) @[IOMaster.scala 81:24]
      node _cntReg2_T_1 = tail(_cntReg2_T, 1) @[IOMaster.scala 81:24]
      cntReg2 <= _cntReg2_T_1 @[IOMaster.scala 81:13]
    when doneLoading1 : @[IOMaster.scala 84:22]
      ADCFilter.io.ConvEnable <= UInt<1>("h1") @[IOMaster.scala 86:29]
      ADCLoad <= UInt<1>("h0") @[IOMaster.scala 87:13]
      cntReg1 <= UInt<1>("h0") @[IOMaster.scala 88:13]
      count1 <= UInt<1>("h0") @[IOMaster.scala 89:12]
    when doneLoading2 : @[IOMaster.scala 91:22]
      DACFilter.io.ConvEnable <= UInt<1>("h1") @[IOMaster.scala 93:29]
      DACLoad <= UInt<1>("h0") @[IOMaster.scala 94:13]
      cntReg2 <= UInt<1>("h0") @[IOMaster.scala 95:13]
      count2 <= UInt<1>("h0") @[IOMaster.scala 96:12]
    node _T_2 = eq(ADCFilter.io.Completed, UInt<1>("h1")) @[IOMaster.scala 99:31]
    node _T_3 = eq(doneLoading1, UInt<1>("h0")) @[IOMaster.scala 99:55]
    node _T_4 = and(_T_2, _T_3) @[IOMaster.scala 99:39]
    when _T_4 : @[IOMaster.scala 99:64]
      ADCLoad <= UInt<1>("h1") @[IOMaster.scala 102:13]
      count1 <= UInt<1>("h1") @[IOMaster.scala 103:12]
    node _T_5 = eq(DACFilter.io.Completed, UInt<1>("h1")) @[IOMaster.scala 106:31]
    node _T_6 = eq(doneLoading2, UInt<1>("h0")) @[IOMaster.scala 106:55]
    node _T_7 = and(_T_5, _T_6) @[IOMaster.scala 106:39]
    when _T_7 : @[IOMaster.scala 106:64]
      DACLoad <= UInt<1>("h1") @[IOMaster.scala 109:13]
      count2 <= UInt<1>("h1") @[IOMaster.scala 110:12]

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

