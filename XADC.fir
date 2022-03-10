circuit XADC :
  module xadc_wiz_0 :
    input clock : Clock
    input reset : Reset
    output io : { flip di_in : UInt<16>, flip daddr_in : UInt<7>, flip den_in : UInt<1>, flip dwe_in : UInt<1>, flip drdy_out : UInt<1>, flip do_out : UInt<16>, flip dclk_in : UInt<1>, flip reset_in : UInt<1>, flip vp_in : UInt<1>, flip vn_in : UInt<1>, flip vauxp5 : UInt<1>, flip vauxn5 : UInt<1>, flip channel_out : UInt<5>, flip eoc_out : UInt<1>, flip alarm_out : UInt<1>, flip eos_out : UInt<1>, flip busy_out : UInt<1>}

    skip

  module XADC :
    input clock : Clock
    input reset : UInt<1>
    output io : { LED : UInt<16>, JA : UInt<8>, flip clk : UInt<1>, flip sw : UInt<1>}

    wire daddr_in : UInt<6> @[XADC.scala 13:22]
    wire eoc_out : UInt<1> @[XADC.scala 14:21]
    wire do_out : UInt<16> @[XADC.scala 15:20]
    wire anal_p : UInt<1> @[XADC.scala 16:20]
    wire anal_n : UInt<1> @[XADC.scala 17:20]
    wire channel_out : UInt<5> @[XADC.scala 18:25]
    inst adc of xadc_wiz_0 @[XADC.scala 22:19]
    adc.clock <= clock
    adc.reset <= reset
    adc.io.di_in <= UInt<16>("h0") @[XADC.scala 24:16]
    adc.io.daddr_in <= daddr_in @[XADC.scala 25:19]
    adc.io.den_in <= eoc_out @[XADC.scala 26:17]
    adc.io.dwe_in <= UInt<1>("h0") @[XADC.scala 27:17]
    adc.io.drdy_out is invalid @[XADC.scala 28:19]
    adc.io.do_out <= do_out @[XADC.scala 29:17]
    adc.io.dclk_in <= io.clk @[XADC.scala 30:18]
    adc.io.reset_in <= io.sw @[XADC.scala 31:19]
    adc.io.vp_in <= UInt<1>("h0") @[XADC.scala 32:16]
    adc.io.vn_in <= UInt<1>("h0") @[XADC.scala 33:16]
    adc.io.vauxp5 <= anal_p @[XADC.scala 34:17]
    adc.io.vauxn5 <= anal_n @[XADC.scala 35:17]
    adc.io.channel_out <= channel_out @[XADC.scala 36:22]
    adc.io.eoc_out <= eoc_out @[XADC.scala 37:18]
    adc.io.alarm_out is invalid @[XADC.scala 38:20]
    adc.io.eos_out is invalid @[XADC.scala 39:18]
    adc.io.busy_out is invalid @[XADC.scala 40:19]
    io.JA <= UInt<1>("h0") @[XADC.scala 42:9]
    daddr_in <= UInt<1>("h0") @[XADC.scala 43:12]
    eoc_out <= UInt<1>("h0") @[XADC.scala 44:11]
    do_out <= UInt<1>("h0") @[XADC.scala 45:10]
    anal_p <= UInt<1>("h0") @[XADC.scala 46:10]
    anal_n <= UInt<1>("h0") @[XADC.scala 47:10]
    channel_out <= UInt<1>("h0") @[XADC.scala 48:15]
    node _daddr_in_T = cat(UInt<1>("h0"), channel_out) @[Cat.scala 31:58]
    daddr_in <= _daddr_in_T @[XADC.scala 51:12]
    node _anal_p_T = bits(io.JA, 4, 4) @[XADC.scala 52:18]
    anal_p <= _anal_p_T @[XADC.scala 52:10]
    node _anal_n_T = bits(io.JA, 0, 0) @[XADC.scala 53:18]
    anal_n <= _anal_n_T @[XADC.scala 53:10]
    io.LED <= UInt<16>("hcccc") @[XADC.scala 54:10]
    node _T = bits(do_out, 15, 11) @[XADC.scala 56:16]
    node _T_1 = eq(UInt<1>("h0"), _T) @[XADC.scala 56:26]
    when _T_1 : @[XADC.scala 56:26]
      io.LED <= UInt<1>("h0") @[XADC.scala 58:14]
    else :
      node _T_2 = eq(UInt<1>("h1"), _T) @[XADC.scala 56:26]
      when _T_2 : @[XADC.scala 56:26]
        io.LED <= UInt<1>("h1") @[XADC.scala 61:14]
      else :
        node _T_3 = eq(UInt<2>("h2"), _T) @[XADC.scala 56:26]
        when _T_3 : @[XADC.scala 56:26]
          io.LED <= UInt<2>("h3") @[XADC.scala 64:14]
        else :
          node _T_4 = eq(UInt<2>("h3"), _T) @[XADC.scala 56:26]
          when _T_4 : @[XADC.scala 56:26]
            io.LED <= UInt<3>("h7") @[XADC.scala 67:14]
          else :
            node _T_5 = eq(UInt<3>("h4"), _T) @[XADC.scala 56:26]
            when _T_5 : @[XADC.scala 56:26]
              io.LED <= UInt<4>("hf") @[XADC.scala 70:14]
            else :
              node _T_6 = eq(UInt<3>("h5"), _T) @[XADC.scala 56:26]
              when _T_6 : @[XADC.scala 56:26]
                io.LED <= UInt<5>("h1f") @[XADC.scala 73:14]
              else :
                node _T_7 = eq(UInt<3>("h6"), _T) @[XADC.scala 56:26]
                when _T_7 : @[XADC.scala 56:26]
                  io.LED <= UInt<6>("h3f") @[XADC.scala 76:14]
                else :
                  node _T_8 = eq(UInt<3>("h7"), _T) @[XADC.scala 56:26]
                  when _T_8 : @[XADC.scala 56:26]
                    io.LED <= UInt<7>("h7f") @[XADC.scala 79:14]
                  else :
                    node _T_9 = eq(UInt<4>("h8"), _T) @[XADC.scala 56:26]
                    when _T_9 : @[XADC.scala 56:26]
                      io.LED <= UInt<8>("hff") @[XADC.scala 82:14]
                    else :
                      node _T_10 = eq(UInt<4>("h9"), _T) @[XADC.scala 56:26]
                      when _T_10 : @[XADC.scala 56:26]
                        io.LED <= UInt<9>("h1ff") @[XADC.scala 85:14]
                      else :
                        node _T_11 = eq(UInt<4>("ha"), _T) @[XADC.scala 56:26]
                        when _T_11 : @[XADC.scala 56:26]
                          io.LED <= UInt<10>("h3ff") @[XADC.scala 88:14]
                        else :
                          node _T_12 = eq(UInt<4>("hb"), _T) @[XADC.scala 56:26]
                          when _T_12 : @[XADC.scala 56:26]
                            io.LED <= UInt<11>("h7ff") @[XADC.scala 91:14]
                          else :
                            node _T_13 = eq(UInt<4>("hc"), _T) @[XADC.scala 56:26]
                            when _T_13 : @[XADC.scala 56:26]
                              io.LED <= UInt<12>("hfff") @[XADC.scala 94:14]
                            else :
                              node _T_14 = eq(UInt<4>("hd"), _T) @[XADC.scala 56:26]
                              when _T_14 : @[XADC.scala 56:26]
                                io.LED <= UInt<13>("h1fff") @[XADC.scala 97:14]
                              else :
                                node _T_15 = eq(UInt<4>("he"), _T) @[XADC.scala 56:26]
                                when _T_15 : @[XADC.scala 56:26]
                                  io.LED <= UInt<14>("h3fff") @[XADC.scala 100:14]
                                else :
                                  node _T_16 = eq(UInt<4>("hf"), _T) @[XADC.scala 56:26]
                                  when _T_16 : @[XADC.scala 56:26]
                                    io.LED <= UInt<15>("h7fff") @[XADC.scala 103:14]

