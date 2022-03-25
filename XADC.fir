circuit XADC :
  extmodule xadc_wiz_0 :
    input di_in : UInt<16>
    input daddr_in : UInt<7>
    input den_in : UInt<1>
    input dwe_in : UInt<1>
    output drdy_out : UInt<1>
    output do_out : UInt<16>
    input dclk_in : Clock
    input reset_in : UInt<1>
    input convst_in : UInt<1>
    input vp_in : UInt<1>
    input vn_in : UInt<1>
    input vauxp5 : UInt<1>
    input vauxn5 : UInt<1>
    output channel_out : UInt<5>
    output eoc_out : UInt<1>
    output alarm_out : UInt<1>
    output eos_out : UInt<1>
    output busy_out : UInt<1>
    defname = xadc_wiz_0

  module XADC :
    input clock : Clock
    input reset : UInt<1>
    output io : { LED : UInt<16>, flip JA : UInt<8>}

    wire daddr_in : UInt<6> @[XADC.scala 12:22]
    wire eoc_out : UInt<1> @[XADC.scala 13:21]
    wire do_out : UInt<16> @[XADC.scala 14:20]
    wire anal_p : UInt<1> @[XADC.scala 15:20]
    wire anal_n : UInt<1> @[XADC.scala 16:20]
    wire channel_out : UInt<5> @[XADC.scala 17:25]
    reg cntReg : UInt<16>, clock with :
      reset => (reset, UInt<16>("h0")) @[XADC.scala 21:23]
    node tick = eq(cntReg, UInt<16>("hfde7")) @[XADC.scala 22:21]
    node _cntReg_T = add(cntReg, UInt<1>("h1")) @[XADC.scala 24:20]
    node _cntReg_T_1 = tail(_cntReg_T, 1) @[XADC.scala 24:20]
    cntReg <= _cntReg_T_1 @[XADC.scala 24:10]
    node _T = eq(cntReg, UInt<16>("hfde8")) @[XADC.scala 25:16]
    when _T : @[XADC.scala 25:29]
      cntReg <= UInt<1>("h0") @[XADC.scala 26:12]
    inst adc of xadc_wiz_0 @[XADC.scala 31:19]
    adc.busy_out is invalid
    adc.eos_out is invalid
    adc.alarm_out is invalid
    adc.eoc_out is invalid
    adc.channel_out is invalid
    adc.vauxn5 is invalid
    adc.vauxp5 is invalid
    adc.vn_in is invalid
    adc.vp_in is invalid
    adc.convst_in is invalid
    adc.reset_in is invalid
    adc.dclk_in is invalid
    adc.do_out is invalid
    adc.drdy_out is invalid
    adc.dwe_in is invalid
    adc.den_in is invalid
    adc.daddr_in is invalid
    adc.di_in is invalid
    adc.di_in <= UInt<16>("h0") @[XADC.scala 33:16]
    adc.daddr_in <= daddr_in @[XADC.scala 34:19]
    adc.den_in <= eoc_out @[XADC.scala 35:17]
    adc.dwe_in <= UInt<1>("h0") @[XADC.scala 36:17]
    adc.drdy_out is invalid @[XADC.scala 37:19]
    adc.dclk_in <= clock @[XADC.scala 38:18]
    adc.reset_in <= reset @[XADC.scala 39:19]
    adc.convst_in <= tick @[XADC.scala 40:20]
    adc.vp_in <= UInt<1>("h0") @[XADC.scala 41:16]
    adc.vn_in <= UInt<1>("h0") @[XADC.scala 42:16]
    adc.vauxp5 <= anal_p @[XADC.scala 43:17]
    adc.vauxn5 <= anal_n @[XADC.scala 44:17]
    adc.alarm_out is invalid @[XADC.scala 45:20]
    adc.eos_out is invalid @[XADC.scala 46:18]
    adc.busy_out is invalid @[XADC.scala 47:19]
    eoc_out <= adc.eoc_out @[XADC.scala 48:11]
    channel_out <= adc.channel_out @[XADC.scala 49:15]
    do_out <= adc.do_out @[XADC.scala 50:10]
    node _daddr_in_T = cat(UInt<1>("h0"), channel_out) @[Cat.scala 31:58]
    daddr_in <= _daddr_in_T @[XADC.scala 52:12]
    node _anal_p_T = bits(io.JA, 4, 4) @[XADC.scala 54:18]
    anal_p <= _anal_p_T @[XADC.scala 54:10]
    node _anal_n_T = bits(io.JA, 0, 0) @[XADC.scala 55:18]
    anal_n <= _anal_n_T @[XADC.scala 55:10]
    io.LED <= UInt<16>("hcccc") @[XADC.scala 57:10]
    node _T_1 = bits(do_out, 15, 12) @[XADC.scala 60:16]
    node _T_2 = eq(UInt<1>("h0"), _T_1) @[XADC.scala 60:26]
    when _T_2 : @[XADC.scala 60:26]
      io.LED <= UInt<1>("h0") @[XADC.scala 62:14]
    else :
      node _T_3 = eq(UInt<1>("h1"), _T_1) @[XADC.scala 60:26]
      when _T_3 : @[XADC.scala 60:26]
        io.LED <= UInt<1>("h1") @[XADC.scala 65:14]
      else :
        node _T_4 = eq(UInt<2>("h2"), _T_1) @[XADC.scala 60:26]
        when _T_4 : @[XADC.scala 60:26]
          io.LED <= UInt<2>("h3") @[XADC.scala 68:14]
        else :
          node _T_5 = eq(UInt<2>("h3"), _T_1) @[XADC.scala 60:26]
          when _T_5 : @[XADC.scala 60:26]
            io.LED <= UInt<3>("h7") @[XADC.scala 71:14]
          else :
            node _T_6 = eq(UInt<3>("h4"), _T_1) @[XADC.scala 60:26]
            when _T_6 : @[XADC.scala 60:26]
              io.LED <= UInt<4>("hf") @[XADC.scala 74:14]
            else :
              node _T_7 = eq(UInt<3>("h5"), _T_1) @[XADC.scala 60:26]
              when _T_7 : @[XADC.scala 60:26]
                io.LED <= UInt<5>("h1f") @[XADC.scala 77:14]
              else :
                node _T_8 = eq(UInt<3>("h6"), _T_1) @[XADC.scala 60:26]
                when _T_8 : @[XADC.scala 60:26]
                  io.LED <= UInt<6>("h3f") @[XADC.scala 80:14]
                else :
                  node _T_9 = eq(UInt<3>("h7"), _T_1) @[XADC.scala 60:26]
                  when _T_9 : @[XADC.scala 60:26]
                    io.LED <= UInt<7>("h7f") @[XADC.scala 83:14]
                  else :
                    node _T_10 = eq(UInt<4>("h8"), _T_1) @[XADC.scala 60:26]
                    when _T_10 : @[XADC.scala 60:26]
                      io.LED <= UInt<8>("hff") @[XADC.scala 86:14]
                    else :
                      node _T_11 = eq(UInt<4>("h9"), _T_1) @[XADC.scala 60:26]
                      when _T_11 : @[XADC.scala 60:26]
                        io.LED <= UInt<9>("h1ff") @[XADC.scala 89:14]
                      else :
                        node _T_12 = eq(UInt<4>("ha"), _T_1) @[XADC.scala 60:26]
                        when _T_12 : @[XADC.scala 60:26]
                          io.LED <= UInt<10>("h3ff") @[XADC.scala 92:14]
                        else :
                          node _T_13 = eq(UInt<4>("hb"), _T_1) @[XADC.scala 60:26]
                          when _T_13 : @[XADC.scala 60:26]
                            io.LED <= UInt<11>("h7ff") @[XADC.scala 95:14]
                          else :
                            node _T_14 = eq(UInt<4>("hc"), _T_1) @[XADC.scala 60:26]
                            when _T_14 : @[XADC.scala 60:26]
                              io.LED <= UInt<12>("hfff") @[XADC.scala 98:14]
                            else :
                              node _T_15 = eq(UInt<4>("hd"), _T_1) @[XADC.scala 60:26]
                              when _T_15 : @[XADC.scala 60:26]
                                io.LED <= UInt<13>("h1fff") @[XADC.scala 101:14]
                              else :
                                node _T_16 = eq(UInt<4>("he"), _T_1) @[XADC.scala 60:26]
                                when _T_16 : @[XADC.scala 60:26]
                                  io.LED <= UInt<14>("h3fff") @[XADC.scala 104:14]
                                else :
                                  node _T_17 = eq(UInt<4>("hf"), _T_1) @[XADC.scala 60:26]
                                  when _T_17 : @[XADC.scala 60:26]
                                    io.LED <= UInt<15>("h7fff") @[XADC.scala 107:14]

