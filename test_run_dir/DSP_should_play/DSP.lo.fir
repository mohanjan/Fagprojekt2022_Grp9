circuit DSP :
  module MemoryController :
    input clock : Clock
    input reset : UInt<1>
    input io_ReadEnable : UInt<1>
    input io_WriteEnable : UInt<1>
    input io_Address : UInt<24>
    input io_WriteData : UInt<18>
    output io_ReadData : UInt<18>
    output io_Ready : UInt<1>
    output io_Completed : UInt<1>
    output SPI_SCLK : UInt<1>
    output SPI_CE : UInt<1>
    input SPI_SO_0 : UInt<1>
    input SPI_SO_1 : UInt<1>
    input SPI_SO_2 : UInt<1>
    input SPI_SO_3 : UInt<1>
    output SPI_SI_0 : UInt<1>
    output SPI_SI_1 : UInt<1>
    output SPI_SI_2 : UInt<1>
    output SPI_SI_3 : UInt<1>
    output SPI_Drive : UInt<1>

    reg DataReg : UInt<16>, clock with :
      reset => (UInt<1>("h0"), DataReg) @[MemoryController.scala 40:24]
    reg StateReg : UInt<4>, clock with :
      reset => (UInt<1>("h0"), StateReg) @[MemoryController.scala 53:25]
    reg SubStateReg : UInt<3>, clock with :
      reset => (UInt<1>("h0"), SubStateReg) @[MemoryController.scala 56:28]
    reg CntReg : UInt<14>, clock with :
      reset => (UInt<1>("h0"), CntReg) @[MemoryController.scala 58:23]
    reg WriteDataReg : UInt<16>, clock with :
      reset => (UInt<1>("h0"), WriteDataReg) @[MemoryController.scala 60:29]
    reg AddressReg : UInt<24>, clock with :
      reset => (UInt<1>("h0"), AddressReg) @[MemoryController.scala 61:27]
    reg SPI_mode : UInt<1>, clock with :
      reset => (UInt<1>("h0"), SPI_mode) @[MemoryController.scala 63:25]
    reg ClkReg : UInt<1>, clock with :
      reset => (UInt<1>("h0"), ClkReg) @[MemoryController.scala 67:23]
    reg ClkCounter : UInt<8>, clock with :
      reset => (UInt<1>("h0"), ClkCounter) @[MemoryController.scala 68:27]
    reg ClkRegDelay : UInt<1>, clock with :
      reset => (UInt<1>("h0"), ClkRegDelay) @[MemoryController.scala 70:28]
    node _T_12 = eq(UInt<4>("h0"), StateReg) @[MemoryController.scala 123:20]
    node _T_14 = eq(UInt<4>("h1"), StateReg) @[MemoryController.scala 123:20]
    node _T_17 = eq(UInt<4>("h2"), StateReg) @[MemoryController.scala 123:20]
    node _T_18 = eq(UInt<4>("h3"), StateReg) @[MemoryController.scala 123:20]
    node _T_21 = eq(UInt<4>("h4"), StateReg) @[MemoryController.scala 123:20]
    node _T_26 = eq(UInt<4>("h5"), StateReg) @[MemoryController.scala 123:20]
    node _T_27 = eq(UInt<3>("h0"), SubStateReg) @[MemoryController.scala 217:27]
    node _T_30 = eq(UInt<3>("h1"), SubStateReg) @[MemoryController.scala 217:27]
    node _T_33 = eq(UInt<3>("h4"), SubStateReg) @[MemoryController.scala 217:27]
    node _GEN_52 = mux(_T_33, UInt<1>("h1"), UInt<1>("h0")) @[MemoryController.scala 217:27 253:19 85:11]
    node _GEN_58 = mux(_T_30, UInt<1>("h1"), _GEN_52) @[MemoryController.scala 217:27 237:19]
    node _GEN_67 = mux(_T_27, UInt<1>("h1"), _GEN_58) @[MemoryController.scala 217:27 220:19]
    node _T_36 = eq(UInt<4>("h6"), StateReg) @[MemoryController.scala 123:20]
    node _T_37 = eq(UInt<3>("h0"), SubStateReg) @[MemoryController.scala 270:27]
    node _T_40 = eq(UInt<3>("h1"), SubStateReg) @[MemoryController.scala 270:27]
    node _T_43 = eq(UInt<3>("h2"), SubStateReg) @[MemoryController.scala 270:27]
    node _GEN_86 = mux(_T_43, UInt<1>("h1"), UInt<1>("h0")) @[MemoryController.scala 270:27 305:19 85:11]
    node _GEN_92 = mux(_T_40, UInt<1>("h1"), _GEN_86) @[MemoryController.scala 270:27 289:19]
    node _GEN_99 = mux(_T_37, UInt<1>("h1"), _GEN_92) @[MemoryController.scala 270:27 273:19]
    node _T_46 = eq(UInt<4>("h8"), StateReg) @[MemoryController.scala 123:20]
    node _T_47 = eq(UInt<3>("h0"), SubStateReg) @[MemoryController.scala 324:27]
    node _T_50 = eq(UInt<3>("h1"), SubStateReg) @[MemoryController.scala 324:27]
    node _T_89 = eq(UInt<3>("h4"), SubStateReg) @[MemoryController.scala 324:27]
    node _GEN_140 = mux(_T_89, UInt<1>("h1"), UInt<1>("h0")) @[MemoryController.scala 324:27 366:19 85:11]
    node _GEN_146 = mux(_T_50, UInt<1>("h1"), _GEN_140) @[MemoryController.scala 324:27 344:19]
    node _GEN_158 = mux(_T_47, UInt<1>("h1"), _GEN_146) @[MemoryController.scala 324:27 327:19]
    node _T_92 = eq(UInt<4>("h7"), StateReg) @[MemoryController.scala 123:20]
    node _T_93 = eq(UInt<3>("h0"), SubStateReg) @[MemoryController.scala 381:27]
    node _T_96 = eq(UInt<3>("h1"), SubStateReg) @[MemoryController.scala 381:27]
    node _T_135 = eq(UInt<3>("h2"), SubStateReg) @[MemoryController.scala 381:27]
    node _GEN_220 = mux(_T_135, UInt<1>("h1"), UInt<1>("h0")) @[MemoryController.scala 381:27 422:19 85:11]
    node _GEN_229 = mux(_T_96, UInt<1>("h1"), _GEN_220) @[MemoryController.scala 381:27 400:19]
    node _GEN_239 = mux(_T_93, UInt<1>("h1"), _GEN_229) @[MemoryController.scala 381:27 384:19]
    node _GEN_249 = mux(_T_92, _GEN_239, UInt<1>("h0")) @[MemoryController.scala 123:20 85:11]
    node _GEN_259 = mux(_T_46, _GEN_158, _GEN_249) @[MemoryController.scala 123:20]
    node _GEN_271 = mux(_T_36, _GEN_99, _GEN_259) @[MemoryController.scala 123:20]
    node _GEN_283 = mux(_T_26, _GEN_67, _GEN_271) @[MemoryController.scala 123:20]
    node _GEN_301 = mux(_T_21, UInt<1>("h0"), _GEN_283) @[MemoryController.scala 123:20 85:11]
    node _GEN_311 = mux(_T_18, UInt<1>("h1"), _GEN_301) @[MemoryController.scala 123:20 165:15]
    node _GEN_329 = mux(_T_17, UInt<1>("h0"), _GEN_311) @[MemoryController.scala 123:20 85:11]
    node _GEN_343 = mux(_T_14, UInt<1>("h1"), _GEN_329) @[MemoryController.scala 123:20 138:15]
    node _GEN_362 = mux(_T_12, UInt<1>("h0"), _GEN_343) @[MemoryController.scala 123:20 85:11]
    node ClockEn = _GEN_362 @[MemoryController.scala 76:21]
    node _SPI_SCLK_T = and(ClkReg, ClockEn) @[MemoryController.scala 91:23]
    node _ClkCounter_T = add(ClkCounter, UInt<1>("h1")) @[MemoryController.scala 93:28]
    node _ClkCounter_T_1 = tail(_ClkCounter_T, 1) @[MemoryController.scala 93:28]
    node _T = eq(ClkCounter, UInt<1>("h0")) @[MemoryController.scala 95:19]
    node _ClkReg_T = eq(ClkReg, UInt<1>("h0")) @[MemoryController.scala 96:15]
    node _T_1 = bits(ClkReg, 0, 0) @[MemoryController.scala 99:18]
    node _T_2 = eq(_T_1, UInt<1>("h0")) @[MemoryController.scala 99:10]
    node _GEN_0 = mux(_T_2, UInt<1>("h1"), UInt<1>("h0")) @[MemoryController.scala 100:17 82:13 99:25]
    node _T_3 = bits(ClkReg, 0, 0) @[MemoryController.scala 102:17]
    node _GEN_1 = mux(_T_3, UInt<1>("h1"), UInt<1>("h0")) @[MemoryController.scala 102:24 103:20 83:16]
    node _GEN_2 = mux(_T, _ClkReg_T, ClkReg) @[MemoryController.scala 95:31 96:12 67:23]
    node _GEN_3 = mux(_T, UInt<1>("h0"), _ClkCounter_T_1) @[MemoryController.scala 93:14 95:31 97:16]
    node _GEN_4 = mux(_T, _GEN_0, UInt<1>("h0")) @[MemoryController.scala 82:13 95:31]
    node _GEN_5 = mux(_T, _GEN_1, UInt<1>("h0")) @[MemoryController.scala 83:16 95:31]
    node _T_13 = eq(CntReg, UInt<1>("h1")) @[MemoryController.scala 129:19]
    node _GEN_11 = mux(_T_13, UInt<1>("h1"), UInt<1>("h0")) @[MemoryController.scala 129:27 131:20 86:14]
    node NextStateInv = _GEN_5 @[MemoryController.scala 74:26]
    node _GEN_19 = mux(NextStateInv, UInt<1>("h1"), UInt<1>("h0")) @[MemoryController.scala 158:25 159:20 86:14]
    node _GEN_32 = mux(io_WriteEnable, UInt<1>("h1"), UInt<1>("h0")) @[MemoryController.scala 200:34 211:20 86:14]
    node _GEN_38 = mux(io_ReadEnable, UInt<1>("h1"), _GEN_32) @[MemoryController.scala 187:27 198:20]
    node _GEN_298 = mux(_T_21, _GEN_38, UInt<1>("h0")) @[MemoryController.scala 123:20 86:14]
    node _GEN_318 = mux(_T_18, UInt<1>("h0"), _GEN_298) @[MemoryController.scala 123:20 86:14]
    node _GEN_327 = mux(_T_17, _GEN_19, _GEN_318) @[MemoryController.scala 123:20]
    node _GEN_348 = mux(_T_14, UInt<1>("h0"), _GEN_327) @[MemoryController.scala 123:20 86:14]
    node _GEN_360 = mux(_T_12, _GEN_11, _GEN_348) @[MemoryController.scala 123:20]
    node ClockReset = _GEN_360 @[MemoryController.scala 77:24]
    node _GEN_6 = mux(ClockReset, UInt<1>("h0"), _GEN_2) @[MemoryController.scala 107:19 108:12]
    node _GEN_7 = mux(ClockReset, UInt<1>("h0"), _GEN_3) @[MemoryController.scala 107:19 109:16]
    node _T_4 = bits(ClkReg, 0, 0) @[MemoryController.scala 112:15]
    node _T_5 = bits(ClkRegDelay, 0, 0) @[MemoryController.scala 112:38]
    node _T_6 = eq(_T_5, UInt<1>("h0")) @[MemoryController.scala 112:25]
    node _T_7 = and(_T_4, _T_6) @[MemoryController.scala 112:22]
    node _GEN_8 = mux(_T_7, UInt<1>("h1"), UInt<1>("h0")) @[MemoryController.scala 112:45 113:16 88:14]
    node _T_8 = bits(ClkReg, 0, 0) @[MemoryController.scala 116:16]
    node _T_9 = eq(_T_8, UInt<1>("h0")) @[MemoryController.scala 116:8]
    node _T_10 = bits(ClkRegDelay, 0, 0) @[MemoryController.scala 116:38]
    node _T_11 = and(_T_9, _T_10) @[MemoryController.scala 116:23]
    node _GEN_9 = mux(_T_11, UInt<1>("h1"), UInt<1>("h0")) @[MemoryController.scala 116:45 117:17 89:15]
    node _CntReg_T = add(CntReg, UInt<1>("h1")) @[MemoryController.scala 127:24]
    node _CntReg_T_1 = tail(_CntReg_T, 1) @[MemoryController.scala 127:24]
    node _GEN_10 = mux(_T_13, UInt<1>("h0"), UInt<1>("h1")) @[MemoryController.scala 129:27 130:16 42:10]
    node _GEN_12 = mux(_T_13, UInt<4>("h1"), StateReg) @[MemoryController.scala 129:27 132:18 53:25]
    node _GEN_13 = mux(_T_13, UInt<1>("h0"), _CntReg_T_1) @[MemoryController.scala 127:14 129:27 133:16]
    node _SPI_SI_1_T = sub(UInt<3>("h7"), CntReg) @[MemoryController.scala 141:39]
    node _SPI_SI_1_T_1 = tail(_SPI_SI_1_T, 1) @[MemoryController.scala 141:39]
    node _SPI_SI_1_T_2 = dshr(UInt<8>("h66"), _SPI_SI_1_T_1) @[MemoryController.scala 141:34]
    node _SPI_SI_1_T_3 = bits(_SPI_SI_1_T_2, 0, 0) @[MemoryController.scala 141:34]
    node _CntReg_T_2 = add(CntReg, UInt<1>("h1")) @[MemoryController.scala 144:26]
    node _CntReg_T_3 = tail(_CntReg_T_2, 1) @[MemoryController.scala 144:26]
    node _GEN_14 = mux(NextStateInv, _CntReg_T_3, CntReg) @[MemoryController.scala 143:25 144:16 58:23]
    node _T_15 = eq(CntReg, UInt<3>("h7")) @[MemoryController.scala 147:19]
    node _T_16 = and(_T_15, NextStateInv) @[MemoryController.scala 147:27]
    node _GEN_15 = mux(_T_16, UInt<1>("h1"), UInt<1>("h0")) @[MemoryController.scala 137:14 147:44 148:16]
    node _GEN_16 = mux(_T_16, UInt<1>("h0"), _GEN_14) @[MemoryController.scala 147:44 149:16]
    node _GEN_17 = mux(_T_16, UInt<1>("h0"), _SPI_SI_1_T_3) @[MemoryController.scala 141:17 147:44 150:19]
    node _GEN_18 = mux(_T_16, UInt<4>("h2"), StateReg) @[MemoryController.scala 147:44 151:18 53:25]
    node _GEN_20 = mux(NextStateInv, UInt<4>("h3"), StateReg) @[MemoryController.scala 158:25 160:18 53:25]
    node _SPI_SI_1_T_4 = sub(UInt<3>("h7"), CntReg) @[MemoryController.scala 168:33]
    node _SPI_SI_1_T_5 = tail(_SPI_SI_1_T_4, 1) @[MemoryController.scala 168:33]
    node _SPI_SI_1_T_6 = dshr(UInt<8>("h99"), _SPI_SI_1_T_5) @[MemoryController.scala 168:28]
    node _SPI_SI_1_T_7 = bits(_SPI_SI_1_T_6, 0, 0) @[MemoryController.scala 168:28]
    node _CntReg_T_4 = add(CntReg, UInt<1>("h1")) @[MemoryController.scala 171:26]
    node _CntReg_T_5 = tail(_CntReg_T_4, 1) @[MemoryController.scala 171:26]
    node _GEN_21 = mux(NextStateInv, _CntReg_T_5, CntReg) @[MemoryController.scala 170:25 171:16 58:23]
    node _T_19 = eq(CntReg, UInt<3>("h7")) @[MemoryController.scala 174:19]
    node _T_20 = and(_T_19, NextStateInv) @[MemoryController.scala 174:27]
    node _GEN_22 = mux(_T_20, UInt<1>("h1"), UInt<1>("h0")) @[MemoryController.scala 164:14 174:44 175:16]
    node _GEN_23 = mux(_T_20, UInt<1>("h0"), _GEN_21) @[MemoryController.scala 174:44 176:16]
    node _GEN_24 = mux(_T_20, UInt<4>("h4"), StateReg) @[MemoryController.scala 174:44 178:18 53:25]
    node _T_22 = eq(UInt<1>("h0"), SPI_mode) @[MemoryController.scala 188:25]
    node _T_23 = eq(UInt<1>("h1"), SPI_mode) @[MemoryController.scala 188:25]
    node _GEN_25 = mux(_T_23, UInt<4>("h8"), StateReg) @[MemoryController.scala 188:25 193:22 53:25]
    node _GEN_26 = mux(_T_22, UInt<4>("h5"), _GEN_25) @[MemoryController.scala 188:25 190:22]
    node _T_24 = eq(UInt<1>("h0"), SPI_mode) @[MemoryController.scala 201:25]
    node _T_25 = eq(UInt<1>("h1"), SPI_mode) @[MemoryController.scala 201:25]
    node _GEN_27 = mux(_T_25, UInt<4>("h7"), StateReg) @[MemoryController.scala 201:25 206:22 53:25]
    node _GEN_28 = mux(_T_24, UInt<4>("h6"), _GEN_27) @[MemoryController.scala 201:25 203:22]
    node _GEN_29 = mux(io_WriteEnable, _GEN_28, StateReg) @[MemoryController.scala 200:34 53:25]
    node _GEN_30 = mux(io_WriteEnable, UInt<3>("h0"), SubStateReg) @[MemoryController.scala 200:34 209:21 56:28]
    node _GEN_31 = mux(io_WriteEnable, UInt<1>("h0"), UInt<1>("h1")) @[MemoryController.scala 184:14 200:34 210:16]
    node _GEN_33 = mux(io_WriteEnable, io_Address, AddressReg) @[MemoryController.scala 200:34 212:20 61:27]
    node _GEN_34 = mux(io_WriteEnable, io_WriteData, WriteDataReg) @[MemoryController.scala 200:34 213:22 60:29]
    node _GEN_35 = mux(io_ReadEnable, _GEN_26, _GEN_29) @[MemoryController.scala 187:27]
    node _GEN_36 = mux(io_ReadEnable, UInt<3>("h0"), _GEN_30) @[MemoryController.scala 187:27 196:21]
    node _GEN_37 = mux(io_ReadEnable, UInt<1>("h0"), _GEN_31) @[MemoryController.scala 187:27 197:16]
    node _GEN_39 = mux(io_ReadEnable, io_Address, _GEN_33) @[MemoryController.scala 187:27 199:20]
    node _GEN_40 = mux(io_ReadEnable, WriteDataReg, _GEN_34) @[MemoryController.scala 187:27 60:29]
    node _SPI_SI_1_T_8 = sub(UInt<3>("h7"), CntReg) @[MemoryController.scala 223:39]
    node _SPI_SI_1_T_9 = tail(_SPI_SI_1_T_8, 1) @[MemoryController.scala 223:39]
    node _SPI_SI_1_T_10 = dshr(UInt<8>("h3"), _SPI_SI_1_T_9) @[MemoryController.scala 223:34]
    node _SPI_SI_1_T_11 = bits(_SPI_SI_1_T_10, 0, 0) @[MemoryController.scala 223:34]
    node _CntReg_T_6 = add(CntReg, UInt<1>("h1")) @[MemoryController.scala 226:30]
    node _CntReg_T_7 = tail(_CntReg_T_6, 1) @[MemoryController.scala 226:30]
    node _GEN_41 = mux(NextStateInv, _CntReg_T_7, CntReg) @[MemoryController.scala 225:29 226:20 58:23]
    node _T_28 = eq(CntReg, UInt<3>("h7")) @[MemoryController.scala 229:23]
    node _T_29 = and(_T_28, NextStateInv) @[MemoryController.scala 229:31]
    node _GEN_42 = mux(_T_29, UInt<1>("h0"), _GEN_41) @[MemoryController.scala 229:48 230:20]
    node _GEN_43 = mux(_T_29, UInt<3>("h1"), SubStateReg) @[MemoryController.scala 229:48 231:25 56:28]
    node _SPI_SI_1_T_12 = sub(UInt<5>("h17"), CntReg) @[MemoryController.scala 240:40]
    node _SPI_SI_1_T_13 = tail(_SPI_SI_1_T_12, 1) @[MemoryController.scala 240:40]
    node _SPI_SI_1_T_14 = dshr(AddressReg, _SPI_SI_1_T_13) @[MemoryController.scala 240:34]
    node _SPI_SI_1_T_15 = bits(_SPI_SI_1_T_14, 0, 0) @[MemoryController.scala 240:34]
    node _CntReg_T_8 = add(CntReg, UInt<1>("h1")) @[MemoryController.scala 243:30]
    node _CntReg_T_9 = tail(_CntReg_T_8, 1) @[MemoryController.scala 243:30]
    node _GEN_44 = mux(NextStateInv, _CntReg_T_9, CntReg) @[MemoryController.scala 242:29 243:20 58:23]
    node _T_31 = eq(CntReg, UInt<5>("h17")) @[MemoryController.scala 246:23]
    node _T_32 = and(_T_31, NextStateInv) @[MemoryController.scala 246:32]
    node _GEN_45 = mux(_T_32, UInt<1>("h0"), _GEN_44) @[MemoryController.scala 246:49 247:20]
    node _GEN_46 = mux(_T_32, UInt<3>("h4"), SubStateReg) @[MemoryController.scala 246:49 248:25 56:28]
    node _DataReg_T = cat(DataReg, SPI_SO_0) @[Cat.scala 31:58]
    node _CntReg_T_10 = add(CntReg, UInt<1>("h1")) @[MemoryController.scala 259:30]
    node _CntReg_T_11 = tail(_CntReg_T_10, 1) @[MemoryController.scala 259:30]
    node RisingEdge = _GEN_8 @[MemoryController.scala 79:24]
    node _GEN_47 = mux(RisingEdge, _DataReg_T, DataReg) @[MemoryController.scala 257:27 258:21 40:24]
    node _GEN_48 = mux(RisingEdge, _CntReg_T_11, CntReg) @[MemoryController.scala 257:27 259:20 58:23]
    node _T_34 = eq(CntReg, UInt<4>("hf")) @[MemoryController.scala 262:23]
    node _T_35 = and(_T_34, NextStateInv) @[MemoryController.scala 262:32]
    node _GEN_49 = mux(_T_35, UInt<1>("h1"), UInt<1>("h0")) @[MemoryController.scala 262:49 263:26 43:16]
    node _GEN_50 = mux(_T_35, UInt<4>("h4"), StateReg) @[MemoryController.scala 262:49 264:22 53:25]
    node _GEN_51 = mux(_T_33, UInt<1>("h0"), UInt<1>("h1")) @[MemoryController.scala 217:27 252:18 42:10]
    node _GEN_53 = mux(_T_33, _GEN_47, DataReg) @[MemoryController.scala 217:27 40:24]
    node _GEN_54 = mux(_T_33, _GEN_48, CntReg) @[MemoryController.scala 217:27 58:23]
    node _GEN_55 = mux(_T_33, _GEN_49, UInt<1>("h0")) @[MemoryController.scala 217:27 43:16]
    node _GEN_56 = mux(_T_33, _GEN_50, StateReg) @[MemoryController.scala 217:27 53:25]
    node _GEN_57 = mux(_T_30, UInt<1>("h0"), _GEN_51) @[MemoryController.scala 217:27 236:18]
    node _GEN_59 = mux(_T_30, UInt<1>("h1"), UInt<1>("h0")) @[MemoryController.scala 217:27 238:21 50:13]
    node _GEN_60 = mux(_T_30, _SPI_SI_1_T_15, UInt<1>("h0")) @[MemoryController.scala 217:27 240:21 48:10]
    node _GEN_61 = mux(_T_30, _GEN_45, _GEN_54) @[MemoryController.scala 217:27]
    node _GEN_62 = mux(_T_30, _GEN_46, SubStateReg) @[MemoryController.scala 217:27 56:28]
    node _GEN_63 = mux(_T_30, DataReg, _GEN_53) @[MemoryController.scala 217:27 40:24]
    node _GEN_64 = mux(_T_30, UInt<1>("h0"), _GEN_55) @[MemoryController.scala 217:27 43:16]
    node _GEN_65 = mux(_T_30, StateReg, _GEN_56) @[MemoryController.scala 217:27 53:25]
    node _GEN_66 = mux(_T_27, UInt<1>("h0"), _GEN_57) @[MemoryController.scala 217:27 219:18]
    node _GEN_68 = mux(_T_27, UInt<1>("h1"), _GEN_59) @[MemoryController.scala 217:27 221:21]
    node _GEN_69 = mux(_T_27, _SPI_SI_1_T_11, _GEN_60) @[MemoryController.scala 217:27 223:21]
    node _GEN_70 = mux(_T_27, _GEN_42, _GEN_61) @[MemoryController.scala 217:27]
    node _GEN_71 = mux(_T_27, _GEN_43, _GEN_62) @[MemoryController.scala 217:27]
    node _GEN_72 = mux(_T_27, DataReg, _GEN_63) @[MemoryController.scala 217:27 40:24]
    node _GEN_73 = mux(_T_27, UInt<1>("h0"), _GEN_64) @[MemoryController.scala 217:27 43:16]
    node _GEN_74 = mux(_T_27, StateReg, _GEN_65) @[MemoryController.scala 217:27 53:25]
    node _SPI_SI_1_T_16 = sub(UInt<3>("h7"), CntReg) @[MemoryController.scala 276:40]
    node _SPI_SI_1_T_17 = tail(_SPI_SI_1_T_16, 1) @[MemoryController.scala 276:40]
    node _SPI_SI_1_T_18 = dshr(UInt<8>("h2"), _SPI_SI_1_T_17) @[MemoryController.scala 276:35]
    node _SPI_SI_1_T_19 = bits(_SPI_SI_1_T_18, 0, 0) @[MemoryController.scala 276:35]
    node _CntReg_T_12 = add(CntReg, UInt<1>("h1")) @[MemoryController.scala 279:30]
    node _CntReg_T_13 = tail(_CntReg_T_12, 1) @[MemoryController.scala 279:30]
    node _GEN_75 = mux(NextStateInv, _CntReg_T_13, CntReg) @[MemoryController.scala 278:29 279:20 58:23]
    node _T_38 = eq(CntReg, UInt<3>("h7")) @[MemoryController.scala 282:23]
    node _T_39 = and(_T_38, NextStateInv) @[MemoryController.scala 282:31]
    node _GEN_76 = mux(_T_39, UInt<1>("h0"), _GEN_75) @[MemoryController.scala 282:48 283:20]
    node _GEN_77 = mux(_T_39, UInt<3>("h1"), SubStateReg) @[MemoryController.scala 282:48 284:25 56:28]
    node _SPI_SI_1_T_20 = sub(UInt<5>("h17"), CntReg) @[MemoryController.scala 292:40]
    node _SPI_SI_1_T_21 = tail(_SPI_SI_1_T_20, 1) @[MemoryController.scala 292:40]
    node _SPI_SI_1_T_22 = dshr(AddressReg, _SPI_SI_1_T_21) @[MemoryController.scala 292:34]
    node _SPI_SI_1_T_23 = bits(_SPI_SI_1_T_22, 0, 0) @[MemoryController.scala 292:34]
    node _CntReg_T_14 = add(CntReg, UInt<1>("h1")) @[MemoryController.scala 295:30]
    node _CntReg_T_15 = tail(_CntReg_T_14, 1) @[MemoryController.scala 295:30]
    node _GEN_78 = mux(NextStateInv, _CntReg_T_15, CntReg) @[MemoryController.scala 294:29 295:20 58:23]
    node _T_41 = eq(CntReg, UInt<5>("h17")) @[MemoryController.scala 298:23]
    node _T_42 = and(_T_41, NextStateInv) @[MemoryController.scala 298:32]
    node _GEN_79 = mux(_T_42, UInt<1>("h0"), _GEN_78) @[MemoryController.scala 298:48 299:20]
    node _GEN_80 = mux(_T_42, UInt<3>("h2"), SubStateReg) @[MemoryController.scala 298:48 300:25 56:28]
    node _SPI_SI_1_T_24 = sub(UInt<4>("hf"), CntReg) @[MemoryController.scala 308:42]
    node _SPI_SI_1_T_25 = tail(_SPI_SI_1_T_24, 1) @[MemoryController.scala 308:42]
    node _SPI_SI_1_T_26 = dshr(WriteDataReg, _SPI_SI_1_T_25) @[MemoryController.scala 308:36]
    node _SPI_SI_1_T_27 = bits(_SPI_SI_1_T_26, 0, 0) @[MemoryController.scala 308:36]
    node _CntReg_T_16 = add(CntReg, UInt<1>("h1")) @[MemoryController.scala 311:30]
    node _CntReg_T_17 = tail(_CntReg_T_16, 1) @[MemoryController.scala 311:30]
    node _GEN_81 = mux(NextStateInv, _CntReg_T_17, CntReg) @[MemoryController.scala 310:29 311:20 58:23]
    node _T_44 = eq(CntReg, UInt<4>("hf")) @[MemoryController.scala 314:23]
    node _T_45 = and(_T_44, NextStateInv) @[MemoryController.scala 314:32]
    node _GEN_82 = mux(_T_45, UInt<1>("h0"), _GEN_81) @[MemoryController.scala 314:49 315:20]
    node _GEN_83 = mux(_T_45, UInt<1>("h1"), UInt<1>("h0")) @[MemoryController.scala 314:49 316:26 43:16]
    node _GEN_84 = mux(_T_45, UInt<4>("h4"), StateReg) @[MemoryController.scala 314:49 317:22 53:25]
    node _GEN_85 = mux(_T_43, _GEN_83, UInt<1>("h1")) @[MemoryController.scala 270:27 42:10]
    node _GEN_87 = mux(_T_43, _SPI_SI_1_T_27, UInt<1>("h0")) @[MemoryController.scala 270:27 308:21 48:10]
    node _GEN_88 = mux(_T_43, _GEN_82, CntReg) @[MemoryController.scala 270:27 58:23]
    node _GEN_89 = mux(_T_43, _GEN_83, UInt<1>("h0")) @[MemoryController.scala 270:27 43:16]
    node _GEN_90 = mux(_T_43, _GEN_84, StateReg) @[MemoryController.scala 270:27 53:25]
    node _GEN_91 = mux(_T_40, UInt<1>("h0"), _GEN_85) @[MemoryController.scala 270:27 288:18]
    node _GEN_93 = mux(_T_40, _SPI_SI_1_T_23, _GEN_87) @[MemoryController.scala 270:27 292:21]
    node _GEN_94 = mux(_T_40, _GEN_79, _GEN_88) @[MemoryController.scala 270:27]
    node _GEN_95 = mux(_T_40, _GEN_80, SubStateReg) @[MemoryController.scala 270:27 56:28]
    node _GEN_96 = mux(_T_40, UInt<1>("h0"), _GEN_89) @[MemoryController.scala 270:27 43:16]
    node _GEN_97 = mux(_T_40, StateReg, _GEN_90) @[MemoryController.scala 270:27 53:25]
    node _GEN_98 = mux(_T_37, UInt<1>("h0"), _GEN_91) @[MemoryController.scala 270:27 272:18]
    node _GEN_100 = mux(_T_37, _SPI_SI_1_T_19, _GEN_93) @[MemoryController.scala 270:27 276:21]
    node _GEN_101 = mux(_T_37, _GEN_76, _GEN_94) @[MemoryController.scala 270:27]
    node _GEN_102 = mux(_T_37, _GEN_77, _GEN_95) @[MemoryController.scala 270:27]
    node _GEN_103 = mux(_T_37, UInt<1>("h0"), _GEN_96) @[MemoryController.scala 270:27 43:16]
    node _GEN_104 = mux(_T_37, StateReg, _GEN_97) @[MemoryController.scala 270:27 53:25]
    node _SPI_SI_1_T_28 = sub(UInt<3>("h7"), CntReg) @[MemoryController.scala 330:39]
    node _SPI_SI_1_T_29 = tail(_SPI_SI_1_T_28, 1) @[MemoryController.scala 330:39]
    node _SPI_SI_1_T_30 = dshr(UInt<8>("heb"), _SPI_SI_1_T_29) @[MemoryController.scala 330:34]
    node _SPI_SI_1_T_31 = bits(_SPI_SI_1_T_30, 0, 0) @[MemoryController.scala 330:34]
    node _CntReg_T_18 = add(CntReg, UInt<1>("h1")) @[MemoryController.scala 333:30]
    node _CntReg_T_19 = tail(_CntReg_T_18, 1) @[MemoryController.scala 333:30]
    node _GEN_105 = mux(NextStateInv, _CntReg_T_19, CntReg) @[MemoryController.scala 332:29 333:20 58:23]
    node _T_48 = eq(CntReg, UInt<3>("h7")) @[MemoryController.scala 336:23]
    node _T_49 = and(_T_48, NextStateInv) @[MemoryController.scala 336:31]
    node _GEN_106 = mux(_T_49, UInt<1>("h0"), _GEN_105) @[MemoryController.scala 336:48 337:20]
    node _GEN_107 = mux(_T_49, UInt<3>("h1"), SubStateReg) @[MemoryController.scala 336:48 338:25 56:28]
    node _T_51 = eq(UInt<1>("h0"), CntReg) @[MemoryController.scala 348:27]
    node _T_52 = bits(AddressReg, 23, 20) @[MemoryController.scala 350:37]
    node _T_53 = bits(_T_52, 0, 0) @[MemoryController.scala 350:49]
    node _T_54 = bits(_T_52, 1, 1) @[MemoryController.scala 350:49]
    node _T_55 = bits(_T_52, 2, 2) @[MemoryController.scala 350:49]
    node _T_56 = bits(_T_52, 3, 3) @[MemoryController.scala 350:49]
    node _GEN_108 = mux(_T_51, _T_53, UInt<1>("h0")) @[MemoryController.scala 348:27 350:24 48:10]
    node _GEN_109 = mux(_T_51, _T_54, UInt<1>("h0")) @[MemoryController.scala 348:27 350:24 48:10]
    node _GEN_110 = mux(_T_51, _T_55, UInt<1>("h0")) @[MemoryController.scala 348:27 350:24 48:10]
    node _GEN_111 = mux(_T_51, _T_56, UInt<1>("h0")) @[MemoryController.scala 348:27 350:24 48:10]
    node _T_57 = eq(UInt<3>("h4"), CntReg) @[MemoryController.scala 348:27]
    node _T_58 = bits(AddressReg, 19, 16) @[MemoryController.scala 350:37]
    node _T_59 = bits(_T_58, 0, 0) @[MemoryController.scala 350:49]
    node _T_60 = bits(_T_58, 1, 1) @[MemoryController.scala 350:49]
    node _T_61 = bits(_T_58, 2, 2) @[MemoryController.scala 350:49]
    node _T_62 = bits(_T_58, 3, 3) @[MemoryController.scala 350:49]
    node _GEN_112 = mux(_T_57, _T_59, _GEN_108) @[MemoryController.scala 348:27 350:24]
    node _GEN_113 = mux(_T_57, _T_60, _GEN_109) @[MemoryController.scala 348:27 350:24]
    node _GEN_114 = mux(_T_57, _T_61, _GEN_110) @[MemoryController.scala 348:27 350:24]
    node _GEN_115 = mux(_T_57, _T_62, _GEN_111) @[MemoryController.scala 348:27 350:24]
    node _T_63 = eq(UInt<4>("h8"), CntReg) @[MemoryController.scala 348:27]
    node _T_64 = bits(AddressReg, 15, 12) @[MemoryController.scala 350:37]
    node _T_65 = bits(_T_64, 0, 0) @[MemoryController.scala 350:49]
    node _T_66 = bits(_T_64, 1, 1) @[MemoryController.scala 350:49]
    node _T_67 = bits(_T_64, 2, 2) @[MemoryController.scala 350:49]
    node _T_68 = bits(_T_64, 3, 3) @[MemoryController.scala 350:49]
    node _GEN_116 = mux(_T_63, _T_65, _GEN_112) @[MemoryController.scala 348:27 350:24]
    node _GEN_117 = mux(_T_63, _T_66, _GEN_113) @[MemoryController.scala 348:27 350:24]
    node _GEN_118 = mux(_T_63, _T_67, _GEN_114) @[MemoryController.scala 348:27 350:24]
    node _GEN_119 = mux(_T_63, _T_68, _GEN_115) @[MemoryController.scala 348:27 350:24]
    node _T_69 = eq(UInt<4>("hc"), CntReg) @[MemoryController.scala 348:27]
    node _T_70 = bits(AddressReg, 11, 8) @[MemoryController.scala 350:37]
    node _T_71 = bits(_T_70, 0, 0) @[MemoryController.scala 350:49]
    node _T_72 = bits(_T_70, 1, 1) @[MemoryController.scala 350:49]
    node _T_73 = bits(_T_70, 2, 2) @[MemoryController.scala 350:49]
    node _T_74 = bits(_T_70, 3, 3) @[MemoryController.scala 350:49]
    node _GEN_120 = mux(_T_69, _T_71, _GEN_116) @[MemoryController.scala 348:27 350:24]
    node _GEN_121 = mux(_T_69, _T_72, _GEN_117) @[MemoryController.scala 348:27 350:24]
    node _GEN_122 = mux(_T_69, _T_73, _GEN_118) @[MemoryController.scala 348:27 350:24]
    node _GEN_123 = mux(_T_69, _T_74, _GEN_119) @[MemoryController.scala 348:27 350:24]
    node _T_75 = eq(UInt<5>("h10"), CntReg) @[MemoryController.scala 348:27]
    node _T_76 = bits(AddressReg, 7, 4) @[MemoryController.scala 350:37]
    node _T_77 = bits(_T_76, 0, 0) @[MemoryController.scala 350:49]
    node _T_78 = bits(_T_76, 1, 1) @[MemoryController.scala 350:49]
    node _T_79 = bits(_T_76, 2, 2) @[MemoryController.scala 350:49]
    node _T_80 = bits(_T_76, 3, 3) @[MemoryController.scala 350:49]
    node _GEN_124 = mux(_T_75, _T_77, _GEN_120) @[MemoryController.scala 348:27 350:24]
    node _GEN_125 = mux(_T_75, _T_78, _GEN_121) @[MemoryController.scala 348:27 350:24]
    node _GEN_126 = mux(_T_75, _T_79, _GEN_122) @[MemoryController.scala 348:27 350:24]
    node _GEN_127 = mux(_T_75, _T_80, _GEN_123) @[MemoryController.scala 348:27 350:24]
    node _T_81 = eq(UInt<5>("h14"), CntReg) @[MemoryController.scala 348:27]
    node _T_82 = bits(AddressReg, 3, 0) @[MemoryController.scala 350:37]
    node _T_83 = bits(_T_82, 0, 0) @[MemoryController.scala 350:49]
    node _T_84 = bits(_T_82, 1, 1) @[MemoryController.scala 350:49]
    node _T_85 = bits(_T_82, 2, 2) @[MemoryController.scala 350:49]
    node _T_86 = bits(_T_82, 3, 3) @[MemoryController.scala 350:49]
    node _GEN_128 = mux(_T_81, _T_83, _GEN_124) @[MemoryController.scala 348:27 350:24]
    node _GEN_129 = mux(_T_81, _T_84, _GEN_125) @[MemoryController.scala 348:27 350:24]
    node _GEN_130 = mux(_T_81, _T_85, _GEN_126) @[MemoryController.scala 348:27 350:24]
    node _GEN_131 = mux(_T_81, _T_86, _GEN_127) @[MemoryController.scala 348:27 350:24]
    node _CntReg_T_20 = add(CntReg, UInt<3>("h4")) @[MemoryController.scala 356:30]
    node _CntReg_T_21 = tail(_CntReg_T_20, 1) @[MemoryController.scala 356:30]
    node _GEN_132 = mux(NextStateInv, _CntReg_T_21, CntReg) @[MemoryController.scala 355:29 356:20 58:23]
    node _T_87 = eq(CntReg, UInt<5>("h14")) @[MemoryController.scala 359:23]
    node _T_88 = and(_T_87, NextStateInv) @[MemoryController.scala 359:32]
    node _GEN_133 = mux(_T_88, UInt<1>("h0"), _GEN_132) @[MemoryController.scala 359:49 360:20]
    node _GEN_134 = mux(_T_88, UInt<3>("h4"), SubStateReg) @[MemoryController.scala 359:49 361:25 56:28]
    node DataReg_lo = cat(SPI_SO_1, SPI_SO_0) @[MemoryController.scala 369:44]
    node DataReg_hi = cat(SPI_SO_3, SPI_SO_2) @[MemoryController.scala 369:44]
    node _DataReg_T_1 = cat(DataReg_hi, DataReg_lo) @[MemoryController.scala 369:44]
    node _DataReg_T_2 = cat(DataReg, _DataReg_T_1) @[Cat.scala 31:58]
    node _CntReg_T_22 = add(CntReg, UInt<3>("h4")) @[MemoryController.scala 370:30]
    node _CntReg_T_23 = tail(_CntReg_T_22, 1) @[MemoryController.scala 370:30]
    node _GEN_135 = mux(RisingEdge, _DataReg_T_2, DataReg) @[MemoryController.scala 368:27 369:21 40:24]
    node _GEN_136 = mux(RisingEdge, _CntReg_T_23, CntReg) @[MemoryController.scala 368:27 370:20 58:23]
    node _T_90 = eq(CntReg, UInt<4>("hc")) @[MemoryController.scala 373:23]
    node _T_91 = and(_T_90, NextStateInv) @[MemoryController.scala 373:32]
    node _GEN_137 = mux(_T_91, UInt<1>("h1"), UInt<1>("h0")) @[MemoryController.scala 373:49 374:26 43:16]
    node _GEN_138 = mux(_T_91, UInt<4>("h4"), StateReg) @[MemoryController.scala 373:49 375:22 53:25]
    node _GEN_139 = mux(_T_89, UInt<1>("h0"), UInt<1>("h1")) @[MemoryController.scala 324:27 365:18 42:10]
    node _GEN_141 = mux(_T_89, _GEN_135, DataReg) @[MemoryController.scala 324:27 40:24]
    node _GEN_142 = mux(_T_89, _GEN_136, CntReg) @[MemoryController.scala 324:27 58:23]
    node _GEN_143 = mux(_T_89, _GEN_137, UInt<1>("h0")) @[MemoryController.scala 324:27 43:16]
    node _GEN_144 = mux(_T_89, _GEN_138, StateReg) @[MemoryController.scala 324:27 53:25]
    node _GEN_145 = mux(_T_50, UInt<1>("h0"), _GEN_139) @[MemoryController.scala 324:27 343:18]
    node _GEN_147 = mux(_T_50, UInt<1>("h1"), UInt<1>("h0")) @[MemoryController.scala 324:27 345:21 50:13]
    node _GEN_148 = mux(_T_50, _GEN_128, UInt<1>("h0")) @[MemoryController.scala 324:27 48:10]
    node _GEN_149 = mux(_T_50, _GEN_129, UInt<1>("h0")) @[MemoryController.scala 324:27 48:10]
    node _GEN_150 = mux(_T_50, _GEN_130, UInt<1>("h0")) @[MemoryController.scala 324:27 48:10]
    node _GEN_151 = mux(_T_50, _GEN_131, UInt<1>("h0")) @[MemoryController.scala 324:27 48:10]
    node _GEN_152 = mux(_T_50, _GEN_133, _GEN_142) @[MemoryController.scala 324:27]
    node _GEN_153 = mux(_T_50, _GEN_134, SubStateReg) @[MemoryController.scala 324:27 56:28]
    node _GEN_154 = mux(_T_50, DataReg, _GEN_141) @[MemoryController.scala 324:27 40:24]
    node _GEN_155 = mux(_T_50, UInt<1>("h0"), _GEN_143) @[MemoryController.scala 324:27 43:16]
    node _GEN_156 = mux(_T_50, StateReg, _GEN_144) @[MemoryController.scala 324:27 53:25]
    node _GEN_157 = mux(_T_47, UInt<1>("h0"), _GEN_145) @[MemoryController.scala 324:27 326:18]
    node _GEN_159 = mux(_T_47, UInt<1>("h1"), _GEN_147) @[MemoryController.scala 324:27 328:21]
    node _GEN_160 = mux(_T_47, _SPI_SI_1_T_31, _GEN_149) @[MemoryController.scala 324:27 330:21]
    node _GEN_161 = mux(_T_47, _GEN_106, _GEN_152) @[MemoryController.scala 324:27]
    node _GEN_162 = mux(_T_47, _GEN_107, _GEN_153) @[MemoryController.scala 324:27]
    node _GEN_163 = mux(_T_47, UInt<1>("h0"), _GEN_148) @[MemoryController.scala 324:27 48:10]
    node _GEN_164 = mux(_T_47, UInt<1>("h0"), _GEN_150) @[MemoryController.scala 324:27 48:10]
    node _GEN_165 = mux(_T_47, UInt<1>("h0"), _GEN_151) @[MemoryController.scala 324:27 48:10]
    node _GEN_166 = mux(_T_47, DataReg, _GEN_154) @[MemoryController.scala 324:27 40:24]
    node _GEN_167 = mux(_T_47, UInt<1>("h0"), _GEN_155) @[MemoryController.scala 324:27 43:16]
    node _GEN_168 = mux(_T_47, StateReg, _GEN_156) @[MemoryController.scala 324:27 53:25]
    node _SPI_SI_1_T_32 = sub(UInt<3>("h7"), CntReg) @[MemoryController.scala 387:40]
    node _SPI_SI_1_T_33 = tail(_SPI_SI_1_T_32, 1) @[MemoryController.scala 387:40]
    node _SPI_SI_1_T_34 = dshr(UInt<8>("h38"), _SPI_SI_1_T_33) @[MemoryController.scala 387:35]
    node _SPI_SI_1_T_35 = bits(_SPI_SI_1_T_34, 0, 0) @[MemoryController.scala 387:35]
    node _CntReg_T_24 = add(CntReg, UInt<1>("h1")) @[MemoryController.scala 390:30]
    node _CntReg_T_25 = tail(_CntReg_T_24, 1) @[MemoryController.scala 390:30]
    node _GEN_169 = mux(NextStateInv, _CntReg_T_25, CntReg) @[MemoryController.scala 389:29 390:20 58:23]
    node _T_94 = eq(CntReg, UInt<3>("h7")) @[MemoryController.scala 393:23]
    node _T_95 = and(_T_94, NextStateInv) @[MemoryController.scala 393:31]
    node _GEN_170 = mux(_T_95, UInt<1>("h0"), _GEN_169) @[MemoryController.scala 393:48 394:20]
    node _GEN_171 = mux(_T_95, UInt<3>("h1"), SubStateReg) @[MemoryController.scala 393:48 395:25 56:28]
    node _T_97 = eq(UInt<1>("h0"), CntReg) @[MemoryController.scala 404:27]
    node _T_98 = bits(AddressReg, 23, 20) @[MemoryController.scala 406:37]
    node _T_99 = bits(_T_98, 0, 0) @[MemoryController.scala 406:49]
    node _T_100 = bits(_T_98, 1, 1) @[MemoryController.scala 406:49]
    node _T_101 = bits(_T_98, 2, 2) @[MemoryController.scala 406:49]
    node _T_102 = bits(_T_98, 3, 3) @[MemoryController.scala 406:49]
    node _GEN_172 = mux(_T_97, _T_99, UInt<1>("h0")) @[MemoryController.scala 404:27 406:24 48:10]
    node _GEN_173 = mux(_T_97, _T_100, UInt<1>("h0")) @[MemoryController.scala 404:27 406:24 48:10]
    node _GEN_174 = mux(_T_97, _T_101, UInt<1>("h0")) @[MemoryController.scala 404:27 406:24 48:10]
    node _GEN_175 = mux(_T_97, _T_102, UInt<1>("h0")) @[MemoryController.scala 404:27 406:24 48:10]
    node _T_103 = eq(UInt<3>("h4"), CntReg) @[MemoryController.scala 404:27]
    node _T_104 = bits(AddressReg, 19, 16) @[MemoryController.scala 406:37]
    node _T_105 = bits(_T_104, 0, 0) @[MemoryController.scala 406:49]
    node _T_106 = bits(_T_104, 1, 1) @[MemoryController.scala 406:49]
    node _T_107 = bits(_T_104, 2, 2) @[MemoryController.scala 406:49]
    node _T_108 = bits(_T_104, 3, 3) @[MemoryController.scala 406:49]
    node _GEN_176 = mux(_T_103, _T_105, _GEN_172) @[MemoryController.scala 404:27 406:24]
    node _GEN_177 = mux(_T_103, _T_106, _GEN_173) @[MemoryController.scala 404:27 406:24]
    node _GEN_178 = mux(_T_103, _T_107, _GEN_174) @[MemoryController.scala 404:27 406:24]
    node _GEN_179 = mux(_T_103, _T_108, _GEN_175) @[MemoryController.scala 404:27 406:24]
    node _T_109 = eq(UInt<4>("h8"), CntReg) @[MemoryController.scala 404:27]
    node _T_110 = bits(AddressReg, 15, 12) @[MemoryController.scala 406:37]
    node _T_111 = bits(_T_110, 0, 0) @[MemoryController.scala 406:49]
    node _T_112 = bits(_T_110, 1, 1) @[MemoryController.scala 406:49]
    node _T_113 = bits(_T_110, 2, 2) @[MemoryController.scala 406:49]
    node _T_114 = bits(_T_110, 3, 3) @[MemoryController.scala 406:49]
    node _GEN_180 = mux(_T_109, _T_111, _GEN_176) @[MemoryController.scala 404:27 406:24]
    node _GEN_181 = mux(_T_109, _T_112, _GEN_177) @[MemoryController.scala 404:27 406:24]
    node _GEN_182 = mux(_T_109, _T_113, _GEN_178) @[MemoryController.scala 404:27 406:24]
    node _GEN_183 = mux(_T_109, _T_114, _GEN_179) @[MemoryController.scala 404:27 406:24]
    node _T_115 = eq(UInt<4>("hc"), CntReg) @[MemoryController.scala 404:27]
    node _T_116 = bits(AddressReg, 11, 8) @[MemoryController.scala 406:37]
    node _T_117 = bits(_T_116, 0, 0) @[MemoryController.scala 406:49]
    node _T_118 = bits(_T_116, 1, 1) @[MemoryController.scala 406:49]
    node _T_119 = bits(_T_116, 2, 2) @[MemoryController.scala 406:49]
    node _T_120 = bits(_T_116, 3, 3) @[MemoryController.scala 406:49]
    node _GEN_184 = mux(_T_115, _T_117, _GEN_180) @[MemoryController.scala 404:27 406:24]
    node _GEN_185 = mux(_T_115, _T_118, _GEN_181) @[MemoryController.scala 404:27 406:24]
    node _GEN_186 = mux(_T_115, _T_119, _GEN_182) @[MemoryController.scala 404:27 406:24]
    node _GEN_187 = mux(_T_115, _T_120, _GEN_183) @[MemoryController.scala 404:27 406:24]
    node _T_121 = eq(UInt<5>("h10"), CntReg) @[MemoryController.scala 404:27]
    node _T_122 = bits(AddressReg, 7, 4) @[MemoryController.scala 406:37]
    node _T_123 = bits(_T_122, 0, 0) @[MemoryController.scala 406:49]
    node _T_124 = bits(_T_122, 1, 1) @[MemoryController.scala 406:49]
    node _T_125 = bits(_T_122, 2, 2) @[MemoryController.scala 406:49]
    node _T_126 = bits(_T_122, 3, 3) @[MemoryController.scala 406:49]
    node _GEN_188 = mux(_T_121, _T_123, _GEN_184) @[MemoryController.scala 404:27 406:24]
    node _GEN_189 = mux(_T_121, _T_124, _GEN_185) @[MemoryController.scala 404:27 406:24]
    node _GEN_190 = mux(_T_121, _T_125, _GEN_186) @[MemoryController.scala 404:27 406:24]
    node _GEN_191 = mux(_T_121, _T_126, _GEN_187) @[MemoryController.scala 404:27 406:24]
    node _T_127 = eq(UInt<5>("h14"), CntReg) @[MemoryController.scala 404:27]
    node _T_128 = bits(AddressReg, 3, 0) @[MemoryController.scala 406:37]
    node _T_129 = bits(_T_128, 0, 0) @[MemoryController.scala 406:49]
    node _T_130 = bits(_T_128, 1, 1) @[MemoryController.scala 406:49]
    node _T_131 = bits(_T_128, 2, 2) @[MemoryController.scala 406:49]
    node _T_132 = bits(_T_128, 3, 3) @[MemoryController.scala 406:49]
    node _GEN_192 = mux(_T_127, _T_129, _GEN_188) @[MemoryController.scala 404:27 406:24]
    node _GEN_193 = mux(_T_127, _T_130, _GEN_189) @[MemoryController.scala 404:27 406:24]
    node _GEN_194 = mux(_T_127, _T_131, _GEN_190) @[MemoryController.scala 404:27 406:24]
    node _GEN_195 = mux(_T_127, _T_132, _GEN_191) @[MemoryController.scala 404:27 406:24]
    node _CntReg_T_26 = add(CntReg, UInt<3>("h4")) @[MemoryController.scala 412:30]
    node _CntReg_T_27 = tail(_CntReg_T_26, 1) @[MemoryController.scala 412:30]
    node _GEN_196 = mux(NextStateInv, _CntReg_T_27, CntReg) @[MemoryController.scala 411:29 412:20 58:23]
    node _T_133 = eq(CntReg, UInt<5>("h14")) @[MemoryController.scala 415:23]
    node _T_134 = and(_T_133, NextStateInv) @[MemoryController.scala 415:32]
    node _GEN_197 = mux(_T_134, UInt<1>("h0"), _GEN_196) @[MemoryController.scala 415:49 416:20]
    node _GEN_198 = mux(_T_134, UInt<3>("h2"), SubStateReg) @[MemoryController.scala 415:49 417:25 56:28]
    node _T_136 = eq(UInt<1>("h0"), CntReg) @[MemoryController.scala 426:27]
    node _T_137 = bits(WriteDataReg, 15, 12) @[MemoryController.scala 428:39]
    node _T_138 = bits(_T_137, 0, 0) @[MemoryController.scala 428:51]
    node _T_139 = bits(_T_137, 1, 1) @[MemoryController.scala 428:51]
    node _T_140 = bits(_T_137, 2, 2) @[MemoryController.scala 428:51]
    node _T_141 = bits(_T_137, 3, 3) @[MemoryController.scala 428:51]
    node _GEN_199 = mux(_T_136, _T_138, UInt<1>("h0")) @[MemoryController.scala 426:27 428:24 48:10]
    node _GEN_200 = mux(_T_136, _T_139, UInt<1>("h0")) @[MemoryController.scala 426:27 428:24 48:10]
    node _GEN_201 = mux(_T_136, _T_140, UInt<1>("h0")) @[MemoryController.scala 426:27 428:24 48:10]
    node _GEN_202 = mux(_T_136, _T_141, UInt<1>("h0")) @[MemoryController.scala 426:27 428:24 48:10]
    node _T_142 = eq(UInt<3>("h4"), CntReg) @[MemoryController.scala 426:27]
    node _T_143 = bits(WriteDataReg, 11, 8) @[MemoryController.scala 428:39]
    node _T_144 = bits(_T_143, 0, 0) @[MemoryController.scala 428:51]
    node _T_145 = bits(_T_143, 1, 1) @[MemoryController.scala 428:51]
    node _T_146 = bits(_T_143, 2, 2) @[MemoryController.scala 428:51]
    node _T_147 = bits(_T_143, 3, 3) @[MemoryController.scala 428:51]
    node _GEN_203 = mux(_T_142, _T_144, _GEN_199) @[MemoryController.scala 426:27 428:24]
    node _GEN_204 = mux(_T_142, _T_145, _GEN_200) @[MemoryController.scala 426:27 428:24]
    node _GEN_205 = mux(_T_142, _T_146, _GEN_201) @[MemoryController.scala 426:27 428:24]
    node _GEN_206 = mux(_T_142, _T_147, _GEN_202) @[MemoryController.scala 426:27 428:24]
    node _T_148 = eq(UInt<4>("h8"), CntReg) @[MemoryController.scala 426:27]
    node _T_149 = bits(WriteDataReg, 7, 4) @[MemoryController.scala 428:39]
    node _T_150 = bits(_T_149, 0, 0) @[MemoryController.scala 428:51]
    node _T_151 = bits(_T_149, 1, 1) @[MemoryController.scala 428:51]
    node _T_152 = bits(_T_149, 2, 2) @[MemoryController.scala 428:51]
    node _T_153 = bits(_T_149, 3, 3) @[MemoryController.scala 428:51]
    node _GEN_207 = mux(_T_148, _T_150, _GEN_203) @[MemoryController.scala 426:27 428:24]
    node _GEN_208 = mux(_T_148, _T_151, _GEN_204) @[MemoryController.scala 426:27 428:24]
    node _GEN_209 = mux(_T_148, _T_152, _GEN_205) @[MemoryController.scala 426:27 428:24]
    node _GEN_210 = mux(_T_148, _T_153, _GEN_206) @[MemoryController.scala 426:27 428:24]
    node _T_154 = eq(UInt<4>("hc"), CntReg) @[MemoryController.scala 426:27]
    node _T_155 = bits(WriteDataReg, 3, 0) @[MemoryController.scala 428:39]
    node _T_156 = bits(_T_155, 0, 0) @[MemoryController.scala 428:51]
    node _T_157 = bits(_T_155, 1, 1) @[MemoryController.scala 428:51]
    node _T_158 = bits(_T_155, 2, 2) @[MemoryController.scala 428:51]
    node _T_159 = bits(_T_155, 3, 3) @[MemoryController.scala 428:51]
    node _GEN_211 = mux(_T_154, _T_156, _GEN_207) @[MemoryController.scala 426:27 428:24]
    node _GEN_212 = mux(_T_154, _T_157, _GEN_208) @[MemoryController.scala 426:27 428:24]
    node _GEN_213 = mux(_T_154, _T_158, _GEN_209) @[MemoryController.scala 426:27 428:24]
    node _GEN_214 = mux(_T_154, _T_159, _GEN_210) @[MemoryController.scala 426:27 428:24]
    node _CntReg_T_28 = add(CntReg, UInt<3>("h4")) @[MemoryController.scala 434:30]
    node _CntReg_T_29 = tail(_CntReg_T_28, 1) @[MemoryController.scala 434:30]
    node _GEN_215 = mux(NextStateInv, _CntReg_T_29, CntReg) @[MemoryController.scala 433:29 434:20 58:23]
    node _T_160 = eq(CntReg, UInt<4>("hc")) @[MemoryController.scala 437:23]
    node _T_161 = and(_T_160, NextStateInv) @[MemoryController.scala 437:32]
    node _GEN_216 = mux(_T_161, UInt<1>("h0"), _GEN_215) @[MemoryController.scala 437:49 438:20]
    node _GEN_217 = mux(_T_161, UInt<1>("h1"), UInt<1>("h0")) @[MemoryController.scala 43:16 437:49 439:26]
    node _GEN_218 = mux(_T_161, UInt<4>("h4"), StateReg) @[MemoryController.scala 437:49 440:22 53:25]
    node _GEN_219 = mux(_T_135, _GEN_217, UInt<1>("h1")) @[MemoryController.scala 381:27 42:10]
    node _GEN_221 = mux(_T_135, _GEN_211, UInt<1>("h0")) @[MemoryController.scala 381:27 48:10]
    node _GEN_222 = mux(_T_135, _GEN_212, UInt<1>("h0")) @[MemoryController.scala 381:27 48:10]
    node _GEN_223 = mux(_T_135, _GEN_213, UInt<1>("h0")) @[MemoryController.scala 381:27 48:10]
    node _GEN_224 = mux(_T_135, _GEN_214, UInt<1>("h0")) @[MemoryController.scala 381:27 48:10]
    node _GEN_225 = mux(_T_135, _GEN_216, CntReg) @[MemoryController.scala 381:27 58:23]
    node _GEN_226 = mux(_T_135, _GEN_217, UInt<1>("h0")) @[MemoryController.scala 381:27 43:16]
    node _GEN_227 = mux(_T_135, _GEN_218, StateReg) @[MemoryController.scala 381:27 53:25]
    node _GEN_228 = mux(_T_96, UInt<1>("h0"), _GEN_219) @[MemoryController.scala 381:27 399:18]
    node _GEN_230 = mux(_T_96, _GEN_192, _GEN_221) @[MemoryController.scala 381:27]
    node _GEN_231 = mux(_T_96, _GEN_193, _GEN_222) @[MemoryController.scala 381:27]
    node _GEN_232 = mux(_T_96, _GEN_194, _GEN_223) @[MemoryController.scala 381:27]
    node _GEN_233 = mux(_T_96, _GEN_195, _GEN_224) @[MemoryController.scala 381:27]
    node _GEN_234 = mux(_T_96, _GEN_197, _GEN_225) @[MemoryController.scala 381:27]
    node _GEN_235 = mux(_T_96, _GEN_198, SubStateReg) @[MemoryController.scala 381:27 56:28]
    node _GEN_236 = mux(_T_96, UInt<1>("h0"), _GEN_226) @[MemoryController.scala 381:27 43:16]
    node _GEN_237 = mux(_T_96, StateReg, _GEN_227) @[MemoryController.scala 381:27 53:25]
    node _GEN_238 = mux(_T_93, UInt<1>("h0"), _GEN_228) @[MemoryController.scala 381:27 383:18]
    node _GEN_240 = mux(_T_93, _SPI_SI_1_T_35, _GEN_231) @[MemoryController.scala 381:27 387:21]
    node _GEN_241 = mux(_T_93, _GEN_170, _GEN_234) @[MemoryController.scala 381:27]
    node _GEN_242 = mux(_T_93, _GEN_171, _GEN_235) @[MemoryController.scala 381:27]
    node _GEN_243 = mux(_T_93, UInt<1>("h0"), _GEN_230) @[MemoryController.scala 381:27 48:10]
    node _GEN_244 = mux(_T_93, UInt<1>("h0"), _GEN_232) @[MemoryController.scala 381:27 48:10]
    node _GEN_245 = mux(_T_93, UInt<1>("h0"), _GEN_233) @[MemoryController.scala 381:27 48:10]
    node _GEN_246 = mux(_T_93, UInt<1>("h0"), _GEN_236) @[MemoryController.scala 381:27 43:16]
    node _GEN_247 = mux(_T_93, StateReg, _GEN_237) @[MemoryController.scala 381:27 53:25]
    node _GEN_248 = mux(_T_92, _GEN_238, UInt<1>("h1")) @[MemoryController.scala 123:20 42:10]
    node _GEN_250 = mux(_T_92, _GEN_240, UInt<1>("h0")) @[MemoryController.scala 123:20 48:10]
    node _GEN_251 = mux(_T_92, _GEN_241, CntReg) @[MemoryController.scala 123:20 58:23]
    node _GEN_252 = mux(_T_92, _GEN_242, SubStateReg) @[MemoryController.scala 123:20 56:28]
    node _GEN_253 = mux(_T_92, _GEN_243, UInt<1>("h0")) @[MemoryController.scala 123:20 48:10]
    node _GEN_254 = mux(_T_92, _GEN_244, UInt<1>("h0")) @[MemoryController.scala 123:20 48:10]
    node _GEN_255 = mux(_T_92, _GEN_245, UInt<1>("h0")) @[MemoryController.scala 123:20 48:10]
    node _GEN_256 = mux(_T_92, _GEN_246, UInt<1>("h0")) @[MemoryController.scala 123:20 43:16]
    node _GEN_257 = mux(_T_92, _GEN_247, StateReg) @[MemoryController.scala 123:20 53:25]
    node _GEN_258 = mux(_T_46, _GEN_157, _GEN_248) @[MemoryController.scala 123:20]
    node _GEN_260 = mux(_T_46, _GEN_159, _GEN_249) @[MemoryController.scala 123:20]
    node _GEN_261 = mux(_T_46, _GEN_160, _GEN_250) @[MemoryController.scala 123:20]
    node _GEN_262 = mux(_T_46, _GEN_161, _GEN_251) @[MemoryController.scala 123:20]
    node _GEN_263 = mux(_T_46, _GEN_162, _GEN_252) @[MemoryController.scala 123:20]
    node _GEN_264 = mux(_T_46, _GEN_163, _GEN_253) @[MemoryController.scala 123:20]
    node _GEN_265 = mux(_T_46, _GEN_164, _GEN_254) @[MemoryController.scala 123:20]
    node _GEN_266 = mux(_T_46, _GEN_165, _GEN_255) @[MemoryController.scala 123:20]
    node _GEN_267 = mux(_T_46, _GEN_166, DataReg) @[MemoryController.scala 123:20 40:24]
    node _GEN_268 = mux(_T_46, _GEN_167, _GEN_256) @[MemoryController.scala 123:20]
    node _GEN_269 = mux(_T_46, _GEN_168, _GEN_257) @[MemoryController.scala 123:20]
    node _GEN_270 = mux(_T_36, _GEN_98, _GEN_258) @[MemoryController.scala 123:20]
    node _GEN_272 = mux(_T_36, _GEN_99, _GEN_260) @[MemoryController.scala 123:20]
    node _GEN_273 = mux(_T_36, _GEN_100, _GEN_261) @[MemoryController.scala 123:20]
    node _GEN_274 = mux(_T_36, _GEN_101, _GEN_262) @[MemoryController.scala 123:20]
    node _GEN_275 = mux(_T_36, _GEN_102, _GEN_263) @[MemoryController.scala 123:20]
    node _GEN_276 = mux(_T_36, _GEN_103, _GEN_268) @[MemoryController.scala 123:20]
    node _GEN_277 = mux(_T_36, _GEN_104, _GEN_269) @[MemoryController.scala 123:20]
    node _GEN_278 = mux(_T_36, UInt<1>("h0"), _GEN_264) @[MemoryController.scala 123:20 48:10]
    node _GEN_279 = mux(_T_36, UInt<1>("h0"), _GEN_265) @[MemoryController.scala 123:20 48:10]
    node _GEN_280 = mux(_T_36, UInt<1>("h0"), _GEN_266) @[MemoryController.scala 123:20 48:10]
    node _GEN_281 = mux(_T_36, DataReg, _GEN_267) @[MemoryController.scala 123:20 40:24]
    node _GEN_282 = mux(_T_26, _GEN_66, _GEN_270) @[MemoryController.scala 123:20]
    node _GEN_284 = mux(_T_26, _GEN_68, _GEN_272) @[MemoryController.scala 123:20]
    node _GEN_285 = mux(_T_26, _GEN_69, _GEN_273) @[MemoryController.scala 123:20]
    node _GEN_286 = mux(_T_26, _GEN_70, _GEN_274) @[MemoryController.scala 123:20]
    node _GEN_287 = mux(_T_26, _GEN_71, _GEN_275) @[MemoryController.scala 123:20]
    node _GEN_288 = mux(_T_26, _GEN_72, _GEN_281) @[MemoryController.scala 123:20]
    node _GEN_289 = mux(_T_26, _GEN_73, _GEN_276) @[MemoryController.scala 123:20]
    node _GEN_290 = mux(_T_26, _GEN_74, _GEN_277) @[MemoryController.scala 123:20]
    node _GEN_291 = mux(_T_26, UInt<1>("h0"), _GEN_278) @[MemoryController.scala 123:20 48:10]
    node _GEN_292 = mux(_T_26, UInt<1>("h0"), _GEN_279) @[MemoryController.scala 123:20 48:10]
    node _GEN_293 = mux(_T_26, UInt<1>("h0"), _GEN_280) @[MemoryController.scala 123:20 48:10]
    node _GEN_294 = mux(_T_21, _GEN_37, _GEN_282) @[MemoryController.scala 123:20]
    node _GEN_295 = mux(_T_21, UInt<1>("h1"), UInt<1>("h0")) @[MemoryController.scala 123:20 185:16 44:12]
    node _GEN_296 = mux(_T_21, _GEN_35, _GEN_290) @[MemoryController.scala 123:20]
    node _GEN_297 = mux(_T_21, _GEN_36, _GEN_287) @[MemoryController.scala 123:20]
    node _GEN_299 = mux(_T_21, _GEN_39, AddressReg) @[MemoryController.scala 123:20 61:27]
    node _GEN_300 = mux(_T_21, _GEN_40, WriteDataReg) @[MemoryController.scala 123:20 60:29]
    node _GEN_302 = mux(_T_21, UInt<1>("h0"), _GEN_284) @[MemoryController.scala 123:20 50:13]
    node _GEN_303 = mux(_T_21, UInt<1>("h0"), _GEN_285) @[MemoryController.scala 123:20 48:10]
    node _GEN_304 = mux(_T_21, CntReg, _GEN_286) @[MemoryController.scala 123:20 58:23]
    node _GEN_305 = mux(_T_21, DataReg, _GEN_288) @[MemoryController.scala 123:20 40:24]
    node _GEN_306 = mux(_T_21, UInt<1>("h0"), _GEN_289) @[MemoryController.scala 123:20 43:16]
    node _GEN_307 = mux(_T_21, UInt<1>("h0"), _GEN_291) @[MemoryController.scala 123:20 48:10]
    node _GEN_308 = mux(_T_21, UInt<1>("h0"), _GEN_292) @[MemoryController.scala 123:20 48:10]
    node _GEN_309 = mux(_T_21, UInt<1>("h0"), _GEN_293) @[MemoryController.scala 123:20 48:10]
    node _GEN_310 = mux(_T_18, _GEN_22, _GEN_294) @[MemoryController.scala 123:20]
    node _GEN_312 = mux(_T_18, UInt<1>("h1"), _GEN_302) @[MemoryController.scala 123:20 166:17]
    node _GEN_313 = mux(_T_18, _SPI_SI_1_T_7, _GEN_303) @[MemoryController.scala 123:20 168:17]
    node _GEN_314 = mux(_T_18, _GEN_23, _GEN_304) @[MemoryController.scala 123:20]
    node _GEN_315 = mux(_T_18, _GEN_24, _GEN_296) @[MemoryController.scala 123:20]
    node _GEN_316 = mux(_T_18, UInt<1>("h0"), _GEN_295) @[MemoryController.scala 123:20 44:12]
    node _GEN_317 = mux(_T_18, SubStateReg, _GEN_297) @[MemoryController.scala 123:20 56:28]
    node _GEN_319 = mux(_T_18, AddressReg, _GEN_299) @[MemoryController.scala 123:20 61:27]
    node _GEN_320 = mux(_T_18, WriteDataReg, _GEN_300) @[MemoryController.scala 123:20 60:29]
    node _GEN_321 = mux(_T_18, DataReg, _GEN_305) @[MemoryController.scala 123:20 40:24]
    node _GEN_322 = mux(_T_18, UInt<1>("h0"), _GEN_306) @[MemoryController.scala 123:20 43:16]
    node _GEN_323 = mux(_T_18, UInt<1>("h0"), _GEN_307) @[MemoryController.scala 123:20 48:10]
    node _GEN_324 = mux(_T_18, UInt<1>("h0"), _GEN_308) @[MemoryController.scala 123:20 48:10]
    node _GEN_325 = mux(_T_18, UInt<1>("h0"), _GEN_309) @[MemoryController.scala 123:20 48:10]
    node _GEN_326 = mux(_T_17, UInt<1>("h1"), _GEN_310) @[MemoryController.scala 123:20 156:14]
    node _GEN_328 = mux(_T_17, _GEN_20, _GEN_315) @[MemoryController.scala 123:20]
    node _GEN_330 = mux(_T_17, UInt<1>("h0"), _GEN_312) @[MemoryController.scala 123:20 50:13]
    node _GEN_331 = mux(_T_17, UInt<1>("h0"), _GEN_313) @[MemoryController.scala 123:20 48:10]
    node _GEN_332 = mux(_T_17, CntReg, _GEN_314) @[MemoryController.scala 123:20 58:23]
    node _GEN_333 = mux(_T_17, UInt<1>("h0"), _GEN_316) @[MemoryController.scala 123:20 44:12]
    node _GEN_334 = mux(_T_17, SubStateReg, _GEN_317) @[MemoryController.scala 123:20 56:28]
    node _GEN_335 = mux(_T_17, AddressReg, _GEN_319) @[MemoryController.scala 123:20 61:27]
    node _GEN_336 = mux(_T_17, WriteDataReg, _GEN_320) @[MemoryController.scala 123:20 60:29]
    node _GEN_337 = mux(_T_17, DataReg, _GEN_321) @[MemoryController.scala 123:20 40:24]
    node _GEN_338 = mux(_T_17, UInt<1>("h0"), _GEN_322) @[MemoryController.scala 123:20 43:16]
    node _GEN_339 = mux(_T_17, UInt<1>("h0"), _GEN_323) @[MemoryController.scala 123:20 48:10]
    node _GEN_340 = mux(_T_17, UInt<1>("h0"), _GEN_324) @[MemoryController.scala 123:20 48:10]
    node _GEN_341 = mux(_T_17, UInt<1>("h0"), _GEN_325) @[MemoryController.scala 123:20 48:10]
    node _GEN_342 = mux(_T_14, _GEN_15, _GEN_326) @[MemoryController.scala 123:20]
    node _GEN_344 = mux(_T_14, UInt<1>("h1"), _GEN_330) @[MemoryController.scala 123:20 139:17]
    node _GEN_345 = mux(_T_14, _GEN_17, _GEN_331) @[MemoryController.scala 123:20]
    node _GEN_346 = mux(_T_14, _GEN_16, _GEN_332) @[MemoryController.scala 123:20]
    node _GEN_347 = mux(_T_14, _GEN_18, _GEN_328) @[MemoryController.scala 123:20]
    node _GEN_349 = mux(_T_14, UInt<1>("h0"), _GEN_333) @[MemoryController.scala 123:20 44:12]
    node _GEN_350 = mux(_T_14, SubStateReg, _GEN_334) @[MemoryController.scala 123:20 56:28]
    node _GEN_351 = mux(_T_14, AddressReg, _GEN_335) @[MemoryController.scala 123:20 61:27]
    node _GEN_352 = mux(_T_14, WriteDataReg, _GEN_336) @[MemoryController.scala 123:20 60:29]
    node _GEN_353 = mux(_T_14, DataReg, _GEN_337) @[MemoryController.scala 123:20 40:24]
    node _GEN_354 = mux(_T_14, UInt<1>("h0"), _GEN_338) @[MemoryController.scala 123:20 43:16]
    node _GEN_355 = mux(_T_14, UInt<1>("h0"), _GEN_339) @[MemoryController.scala 123:20 48:10]
    node _GEN_356 = mux(_T_14, UInt<1>("h0"), _GEN_340) @[MemoryController.scala 123:20 48:10]
    node _GEN_357 = mux(_T_14, UInt<1>("h0"), _GEN_341) @[MemoryController.scala 123:20 48:10]
    node _GEN_358 = mux(_T_12, _GEN_13, _GEN_346) @[MemoryController.scala 123:20]
    node _GEN_359 = mux(_T_12, _GEN_10, _GEN_342) @[MemoryController.scala 123:20]
    node _GEN_361 = mux(_T_12, _GEN_12, _GEN_347) @[MemoryController.scala 123:20]
    node _GEN_363 = mux(_T_12, UInt<1>("h0"), _GEN_344) @[MemoryController.scala 123:20 50:13]
    node _GEN_364 = mux(_T_12, UInt<1>("h0"), _GEN_345) @[MemoryController.scala 123:20 48:10]
    node _GEN_365 = mux(_T_12, UInt<1>("h0"), _GEN_349) @[MemoryController.scala 123:20 44:12]
    node _GEN_366 = mux(_T_12, SubStateReg, _GEN_350) @[MemoryController.scala 123:20 56:28]
    node _GEN_367 = mux(_T_12, AddressReg, _GEN_351) @[MemoryController.scala 123:20 61:27]
    node _GEN_368 = mux(_T_12, WriteDataReg, _GEN_352) @[MemoryController.scala 123:20 60:29]
    node _GEN_369 = mux(_T_12, DataReg, _GEN_353) @[MemoryController.scala 123:20 40:24]
    node _GEN_370 = mux(_T_12, UInt<1>("h0"), _GEN_354) @[MemoryController.scala 123:20 43:16]
    node _GEN_371 = mux(_T_12, UInt<1>("h0"), _GEN_355) @[MemoryController.scala 123:20 48:10]
    node _GEN_372 = mux(_T_12, UInt<1>("h0"), _GEN_356) @[MemoryController.scala 123:20 48:10]
    node _GEN_373 = mux(_T_12, UInt<1>("h0"), _GEN_357) @[MemoryController.scala 123:20 48:10]
    node NextState = _GEN_4 @[MemoryController.scala 73:23]
    node FallingEdge = _GEN_9 @[MemoryController.scala 80:25]
    io_ReadData <= pad(DataReg, 18) @[MemoryController.scala 46:15]
    io_Ready <= _GEN_365
    io_Completed <= _GEN_370
    SPI_SCLK <= _SPI_SCLK_T @[MemoryController.scala 91:12]
    SPI_CE <= _GEN_359
    SPI_SI_0 <= _GEN_371
    SPI_SI_1 <= _GEN_364
    SPI_SI_2 <= _GEN_372
    SPI_SI_3 <= _GEN_373
    SPI_Drive <= _GEN_363
    DataReg <= bits(mux(reset, UInt<16>("h0"), _GEN_369), 15, 0) @[MemoryController.scala 40:{24,24}]
    StateReg <= mux(reset, UInt<4>("h0"), _GEN_361) @[MemoryController.scala 53:{25,25}]
    SubStateReg <= mux(reset, UInt<3>("h0"), _GEN_366) @[MemoryController.scala 56:{28,28}]
    CntReg <= mux(reset, UInt<14>("h0"), _GEN_358) @[MemoryController.scala 58:{23,23}]
    WriteDataReg <= bits(mux(reset, UInt<16>("h0"), _GEN_368), 15, 0) @[MemoryController.scala 60:{29,29}]
    AddressReg <= mux(reset, UInt<24>("h0"), _GEN_367) @[MemoryController.scala 61:{27,27}]
    SPI_mode <= mux(reset, UInt<1>("h0"), SPI_mode) @[MemoryController.scala 63:{25,25,25}]
    ClkReg <= mux(reset, UInt<1>("h0"), _GEN_6) @[MemoryController.scala 67:{23,23}]
    ClkCounter <= mux(reset, UInt<8>("h0"), _GEN_7) @[MemoryController.scala 68:{27,27}]
    ClkRegDelay <= mux(reset, UInt<1>("h0"), ClkReg) @[MemoryController.scala 70:{28,28} 71:15]

  module SPIArbiter :
    input clock : Clock
    input reset : UInt<1>
    input io_MemPort_0_Address : UInt<18>
    input io_MemPort_0_WriteData : UInt<18>
    input io_MemPort_0_Enable : UInt<1>
    input io_MemPort_0_WriteEn : UInt<1>
    output io_MemPort_0_ReadData : UInt<18>
    output io_MemPort_0_Completed : UInt<1>
    output SPI_SCLK : UInt<1>
    output SPI_CE : UInt<1>
    input SPI_SO_0 : UInt<1>
    input SPI_SO_1 : UInt<1>
    input SPI_SO_2 : UInt<1>
    input SPI_SO_3 : UInt<1>
    output SPI_SI_0 : UInt<1>
    output SPI_SI_1 : UInt<1>
    output SPI_SI_2 : UInt<1>
    output SPI_SI_3 : UInt<1>
    output SPI_Drive : UInt<1>

    inst ExternalMemory of MemoryController @[SPIArbiter.scala 25:30]
    reg ProducerReg : UInt<2>, clock with :
      reset => (UInt<1>("h0"), ProducerReg) @[SPIArbiter.scala 34:28]
    reg Taken : UInt<1>, clock with :
      reset => (UInt<1>("h0"), Taken) @[SPIArbiter.scala 35:22]
    node _T = bits(Taken, 0, 0) @[SPIArbiter.scala 42:17]
    node _T_1 = eq(_T, UInt<1>("h0")) @[SPIArbiter.scala 42:10]
    node _T_2 = and(_T_1, io_MemPort_0_Enable) @[SPIArbiter.scala 42:24]
    node _GEN_0 = mux(_T_2, UInt<1>("h1"), Taken) @[SPIArbiter.scala 42:48 43:13 35:22]
    node _GEN_1 = mux(_T_2, UInt<1>("h0"), ProducerReg) @[SPIArbiter.scala 37:12 42:48 44:16]
    node _T_3 = eq(io_MemPort_0_Completed, UInt<1>("h1")) @[SPIArbiter.scala 49:39]
    node _GEN_2 = mux(_T_3, UInt<1>("h0"), _GEN_0) @[SPIArbiter.scala 49:50 50:11]
    node _GEN_3 = mux(ExternalMemory.io_Ready, UInt<1>("h1"), UInt<1>("h0")) @[SPIArbiter.scala 29:33 59:36 60:39]
    node _GEN_4 = mux(ExternalMemory.io_Ready, io_MemPort_0_WriteData, UInt<1>("h0")) @[SPIArbiter.scala 27:31 59:36 61:37]
    node _GEN_5 = mux(io_MemPort_0_WriteEn, _GEN_3, UInt<1>("h0")) @[SPIArbiter.scala 29:33 58:39]
    node _GEN_6 = mux(io_MemPort_0_WriteEn, _GEN_4, UInt<1>("h0")) @[SPIArbiter.scala 27:31 58:39]
    node _GEN_7 = mux(io_MemPort_0_WriteEn, ExternalMemory.io_Completed, ExternalMemory.io_Completed) @[SPIArbiter.scala 58:39 64:38 70:38]
    node _GEN_8 = mux(io_MemPort_0_WriteEn, UInt<1>("h0"), _GEN_3) @[SPIArbiter.scala 28:32 58:39]
    node _GEN_9 = mux(io_MemPort_0_WriteEn, UInt<1>("h0"), ExternalMemory.io_ReadData) @[SPIArbiter.scala 21:28 58:39 71:37]
    node _GEN_10 = mux(io_MemPort_0_Enable, io_MemPort_0_Address, UInt<1>("h0")) @[SPIArbiter.scala 30:29 55:36 56:31]
    node _GEN_11 = mux(io_MemPort_0_Enable, _GEN_5, UInt<1>("h0")) @[SPIArbiter.scala 29:33 55:36]
    node _GEN_12 = mux(io_MemPort_0_Enable, _GEN_6, UInt<1>("h0")) @[SPIArbiter.scala 27:31 55:36]
    node _GEN_13 = mux(io_MemPort_0_Enable, _GEN_7, UInt<1>("h0")) @[SPIArbiter.scala 22:29 55:36]
    node _GEN_14 = mux(io_MemPort_0_Enable, _GEN_8, UInt<1>("h0")) @[SPIArbiter.scala 28:32 55:36]
    node _GEN_15 = mux(io_MemPort_0_Enable, _GEN_9, UInt<1>("h0")) @[SPIArbiter.scala 21:28 55:36]
    node Producer = _GEN_1 @[SPIArbiter.scala 33:22]
    io_MemPort_0_ReadData <= _GEN_15
    io_MemPort_0_Completed <= _GEN_13
    SPI_SCLK <= ExternalMemory.SPI_SCLK @[SPIArbiter.scala 31:22]
    SPI_CE <= ExternalMemory.SPI_CE @[SPIArbiter.scala 31:22]
    SPI_SI_0 <= ExternalMemory.SPI_SI_0 @[SPIArbiter.scala 31:22]
    SPI_SI_1 <= ExternalMemory.SPI_SI_1 @[SPIArbiter.scala 31:22]
    SPI_SI_2 <= ExternalMemory.SPI_SI_2 @[SPIArbiter.scala 31:22]
    SPI_SI_3 <= ExternalMemory.SPI_SI_3 @[SPIArbiter.scala 31:22]
    SPI_Drive <= ExternalMemory.SPI_Drive @[SPIArbiter.scala 31:22]
    ExternalMemory.clock <= clock
    ExternalMemory.reset <= reset
    ExternalMemory.io_ReadEnable <= _GEN_14
    ExternalMemory.io_WriteEnable <= _GEN_11
    ExternalMemory.io_Address <= pad(_GEN_10, 24)
    ExternalMemory.io_WriteData <= _GEN_12
    ExternalMemory.SPI_SO_0 <= SPI_SO_0 @[SPIArbiter.scala 31:22]
    ExternalMemory.SPI_SO_1 <= SPI_SO_1 @[SPIArbiter.scala 31:22]
    ExternalMemory.SPI_SO_2 <= SPI_SO_2 @[SPIArbiter.scala 31:22]
    ExternalMemory.SPI_SO_3 <= SPI_SO_3 @[SPIArbiter.scala 31:22]
    ProducerReg <= mux(reset, UInt<2>("h0"), _GEN_1) @[SPIArbiter.scala 34:{28,28}]
    Taken <= mux(reset, UInt<1>("h0"), _GEN_2) @[SPIArbiter.scala 35:{22,22}]

  extmodule LCDBusDriver :
    output busData : UInt<4>
    input driveData : UInt<4>
    output bus : Analog<4>
    input drive : UInt<1>
    defname = LCDBusDriver

  module InstuctionMemory :
    input clock : Clock
    input reset : UInt<1>
    input io_enable : UInt<1>
    input io_write : UInt<1>
    input io_Address : UInt<10>
    input io_DataIn : UInt<18>
    output io_Instruction : UInt<18>

    mem mem : @[InstructionMemory.scala 30:24]
      data-type => UInt<18>
      depth => 1024
      read-latency => 1
      write-latency => 1
      readwriter => rdwrPort
      read-under-write => undefined
    node _GEN_0 = validif(io_write, io_DataIn) @[InstructionMemory.scala 37:{21,32}]
    node _GEN_1 = mux(io_write, UInt<1>("h1"), UInt<1>("h0")) @[InstructionMemory.scala 37:21 36:23 37:32]
    node _GEN_2 = validif(eq(io_write, UInt<1>("h0")), mem.rdwrPort.rdata) @[InstructionMemory.scala 37:21 38:38]
    node _GEN_3 = validif(io_enable, io_Address) @[InstructionMemory.scala 35:19 36:23]
    node _GEN_4 = validif(io_enable, clock) @[InstructionMemory.scala 35:19 36:23]
    node _GEN_5 = mux(io_enable, UInt<1>("h1"), UInt<1>("h0")) @[InstructionMemory.scala 35:19 36:23 30:24]
    node _GEN_6 = validif(io_enable, _GEN_1) @[InstructionMemory.scala 35:19]
    node _GEN_7 = validif(io_enable, _GEN_0) @[InstructionMemory.scala 35:19]
    node _GEN_8 = mux(io_enable, _GEN_1, UInt<1>("h0")) @[InstructionMemory.scala 35:19 30:24]
    node _GEN_9 = validif(io_enable, _GEN_2) @[InstructionMemory.scala 35:19]
    io_Instruction <= _GEN_9
    mem.rdwrPort.addr <= _GEN_3
    mem.rdwrPort.en <= _GEN_5
    mem.rdwrPort.clk <= _GEN_4
    mem.rdwrPort.wmode <= _GEN_8
    mem.rdwrPort.wdata <= _GEN_7
    mem.rdwrPort.wmask <= _GEN_6

  module FetchStage :
    input clock : Clock
    input reset : UInt<1>
    input io_Stall : UInt<1>
    input io_Clear : UInt<1>
    input In_PC : UInt<18>
    output Out_Instruction : UInt<18>

    inst InstructionMem of InstuctionMemory @[FetchStage.scala 21:30]
    reg ClearDelay : UInt<1>, clock with :
      reset => (UInt<1>("h0"), ClearDelay) @[FetchStage.scala 19:27]
    node _GEN_0 = mux(io_Clear, UInt<1>("h0"), UInt<1>("h1")) @[FetchStage.scala 38:18 34:28 39:30]
    Out_Instruction <= InstructionMem.io_Instruction @[FetchStage.scala 36:19]
    ClearDelay <= io_Clear @[FetchStage.scala 19:27]
    InstructionMem.clock <= clock
    InstructionMem.reset <= reset
    InstructionMem.io_enable <= _GEN_0
    InstructionMem.io_write <= UInt<1>("h0") @[FetchStage.scala 28:27]
    InstructionMem.io_Address <= bits(In_PC, 9, 0) @[FetchStage.scala 32:29]
    InstructionMem.io_DataIn <= UInt<18>("h0") @[FetchStage.scala 33:28]

  module InstuctionDecoder :
    input clock : Clock
    input reset : UInt<1>
    input io_Instruction : UInt<18>
    output io_Type : UInt<2>
    output io_rs1 : UInt<4>
    output io_rs2 : UInt<4>
    output io_rd : UInt<4>
    output io_AImmidiate : UInt<11>
    output io_ASImmidiate : SInt<11>
    output io_AOperation : UInt<4>
    output io_MemOp : UInt<2>
    output io_MemAdress : UInt<11>
    output io_COperation : UInt<2>
    output io_COffset : SInt<6>

    node _io_Type_T = bits(io_Instruction, 17, 16) @[InstuctionDecoder.scala 26:28]
    node _T = bits(io_Instruction, 17, 16) @[InstuctionDecoder.scala 38:24]
    node _T_1 = eq(UInt<1>("h0"), _T) @[InstuctionDecoder.scala 38:32]
    node _io_AOperation_T = bits(io_Instruction, 15, 12) @[InstuctionDecoder.scala 40:38]
    node _io_rd_T = bits(io_Instruction, 11, 8) @[InstuctionDecoder.scala 41:30]
    node _io_rs1_T = bits(io_Instruction, 7, 4) @[InstuctionDecoder.scala 42:31]
    node _io_rs2_T = bits(io_Instruction, 3, 0) @[InstuctionDecoder.scala 43:31]
    node _T_2 = eq(UInt<1>("h1"), _T) @[InstuctionDecoder.scala 38:32]
    node _io_AOperation_T_1 = bits(io_Instruction, 15, 14) @[InstuctionDecoder.scala 46:38]
    node _io_rd_T_1 = bits(io_Instruction, 13, 10) @[InstuctionDecoder.scala 47:30]
    node _io_AImmidiate_T = bits(io_Instruction, 9, 0) @[InstuctionDecoder.scala 48:38]
    node _io_ASImmidiate_T = bits(io_Instruction, 9, 0) @[InstuctionDecoder.scala 49:39]
    node _io_ASImmidiate_T_1 = asSInt(_io_ASImmidiate_T) @[InstuctionDecoder.scala 49:45]
    node _T_3 = eq(UInt<2>("h2"), _T) @[InstuctionDecoder.scala 38:32]
    node _io_MemOp_T = bits(io_Instruction, 15, 15) @[InstuctionDecoder.scala 52:33]
    node _io_rd_T_2 = bits(io_Instruction, 14, 11) @[InstuctionDecoder.scala 53:30]
    node _io_MemAdress_T = bits(io_Instruction, 10, 0) @[InstuctionDecoder.scala 54:37]
    node _T_4 = eq(UInt<2>("h3"), _T) @[InstuctionDecoder.scala 38:32]
    node _io_COperation_T = bits(io_Instruction, 15, 14) @[InstuctionDecoder.scala 57:38]
    node _io_rs1_T_1 = bits(io_Instruction, 13, 10) @[InstuctionDecoder.scala 58:31]
    node _io_rs2_T_1 = bits(io_Instruction, 9, 6) @[InstuctionDecoder.scala 59:31]
    node _io_COffset_T = bits(io_Instruction, 5, 0) @[InstuctionDecoder.scala 60:35]
    node _io_COffset_T_1 = asSInt(_io_COffset_T) @[InstuctionDecoder.scala 60:41]
    node _GEN_0 = mux(_T_4, _io_COperation_T, UInt<1>("h0")) @[InstuctionDecoder.scala 35:17 38:32 57:21]
    node _GEN_1 = mux(_T_4, _io_rs1_T_1, UInt<1>("h0")) @[InstuctionDecoder.scala 27:10 38:32 58:14]
    node _GEN_2 = mux(_T_4, _io_rs2_T_1, UInt<1>("h0")) @[InstuctionDecoder.scala 28:10 38:32 59:14]
    node _GEN_3 = mux(_T_4, _io_COffset_T_1, asSInt(UInt<1>("h0"))) @[InstuctionDecoder.scala 36:14 38:32 60:18]
    node _GEN_4 = mux(_T_3, _io_MemOp_T, UInt<1>("h0")) @[InstuctionDecoder.scala 33:12 38:32 52:16]
    node _GEN_5 = mux(_T_3, _io_rd_T_2, UInt<1>("h0")) @[InstuctionDecoder.scala 38:32 53:13 29:9]
    node _GEN_6 = mux(_T_3, _io_MemAdress_T, UInt<1>("h0")) @[InstuctionDecoder.scala 34:16 38:32 54:20]
    node _GEN_7 = mux(_T_3, UInt<1>("h0"), _GEN_0) @[InstuctionDecoder.scala 35:17 38:32]
    node _GEN_8 = mux(_T_3, UInt<1>("h0"), _GEN_1) @[InstuctionDecoder.scala 27:10 38:32]
    node _GEN_9 = mux(_T_3, UInt<1>("h0"), _GEN_2) @[InstuctionDecoder.scala 28:10 38:32]
    node _GEN_10 = mux(_T_3, asSInt(UInt<1>("h0")), _GEN_3) @[InstuctionDecoder.scala 36:14 38:32]
    node _GEN_11 = mux(_T_2, _io_AOperation_T_1, UInt<1>("h0")) @[InstuctionDecoder.scala 32:17 38:32 46:21]
    node _GEN_12 = mux(_T_2, _io_rd_T_1, _GEN_5) @[InstuctionDecoder.scala 38:32 47:13]
    node _GEN_13 = mux(_T_2, _io_AImmidiate_T, UInt<1>("h0")) @[InstuctionDecoder.scala 30:17 38:32 48:21]
    node _GEN_14 = mux(_T_2, _io_ASImmidiate_T_1, asSInt(UInt<1>("h0"))) @[InstuctionDecoder.scala 31:18 38:32 49:22]
    node _GEN_15 = mux(_T_2, UInt<1>("h0"), _GEN_4) @[InstuctionDecoder.scala 33:12 38:32]
    node _GEN_16 = mux(_T_2, UInt<1>("h0"), _GEN_6) @[InstuctionDecoder.scala 34:16 38:32]
    node _GEN_17 = mux(_T_2, UInt<1>("h0"), _GEN_7) @[InstuctionDecoder.scala 35:17 38:32]
    node _GEN_18 = mux(_T_2, UInt<1>("h0"), _GEN_8) @[InstuctionDecoder.scala 27:10 38:32]
    node _GEN_19 = mux(_T_2, UInt<1>("h0"), _GEN_9) @[InstuctionDecoder.scala 28:10 38:32]
    node _GEN_20 = mux(_T_2, asSInt(UInt<1>("h0")), _GEN_10) @[InstuctionDecoder.scala 36:14 38:32]
    node _GEN_21 = mux(_T_1, _io_AOperation_T, _GEN_11) @[InstuctionDecoder.scala 38:32 40:21]
    node _GEN_22 = mux(_T_1, _io_rd_T, _GEN_12) @[InstuctionDecoder.scala 38:32 41:13]
    node _GEN_23 = mux(_T_1, _io_rs1_T, _GEN_18) @[InstuctionDecoder.scala 38:32 42:14]
    node _GEN_24 = mux(_T_1, _io_rs2_T, _GEN_19) @[InstuctionDecoder.scala 38:32 43:14]
    node _GEN_25 = mux(_T_1, UInt<1>("h0"), _GEN_13) @[InstuctionDecoder.scala 30:17 38:32]
    node _GEN_26 = mux(_T_1, asSInt(UInt<1>("h0")), _GEN_14) @[InstuctionDecoder.scala 31:18 38:32]
    node _GEN_27 = mux(_T_1, UInt<1>("h0"), _GEN_15) @[InstuctionDecoder.scala 33:12 38:32]
    node _GEN_28 = mux(_T_1, UInt<1>("h0"), _GEN_16) @[InstuctionDecoder.scala 34:16 38:32]
    node _GEN_29 = mux(_T_1, UInt<1>("h0"), _GEN_17) @[InstuctionDecoder.scala 35:17 38:32]
    node _GEN_30 = mux(_T_1, asSInt(UInt<1>("h0")), _GEN_20) @[InstuctionDecoder.scala 36:14 38:32]
    io_Type <= _io_Type_T @[InstuctionDecoder.scala 26:11]
    io_rs1 <= _GEN_23
    io_rs2 <= _GEN_24
    io_rd <= _GEN_22
    io_AImmidiate <= pad(_GEN_25, 11)
    io_ASImmidiate <= pad(_GEN_26, 11)
    io_AOperation <= _GEN_21
    io_MemOp <= pad(_GEN_27, 2)
    io_MemAdress <= _GEN_28
    io_COperation <= _GEN_29
    io_COffset <= _GEN_30

  module DecodeStage :
    input clock : Clock
    input reset : UInt<1>
    input io_Clear : UInt<1>
    input io_Stall : UInt<1>
    output io_MiniStall : UInt<1>
    input In_Instruction : UInt<18>
    output Out_Type : UInt<2>
    output Out_rs1 : UInt<4>
    output Out_rs2 : UInt<4>
    output Out_rd : UInt<4>
    output Out_AImmediate : UInt<11>
    output Out_ASImmediate : SInt<11>
    output Out_AOperation : UInt<4>
    output Out_MemOp : UInt<1>
    output Out_MemAddress : UInt<11>
    output Out_COperation : UInt<2>
    output Out_COffset : SInt<6>

    inst InstDec of InstuctionDecoder @[DecodeStage.scala 31:23]
    reg AddressReg : UInt<10>, clock with :
      reset => (UInt<1>("h0"), AddressReg) @[DecodeStage.scala 33:27]
    reg TypeReg : UInt<2>, clock with :
      reset => (UInt<1>("h0"), TypeReg) @[DecodeStage.scala 34:24]
    reg rs1Reg : UInt<4>, clock with :
      reset => (UInt<1>("h0"), rs1Reg) @[DecodeStage.scala 35:23]
    reg rs2Reg : UInt<4>, clock with :
      reset => (UInt<1>("h0"), rs2Reg) @[DecodeStage.scala 36:23]
    reg rdReg : UInt<4>, clock with :
      reset => (UInt<1>("h0"), rdReg) @[DecodeStage.scala 37:22]
    reg AImmediateReg : UInt<11>, clock with :
      reset => (UInt<1>("h0"), AImmediateReg) @[DecodeStage.scala 39:30]
    reg ASImmediateReg : SInt<11>, clock with :
      reset => (UInt<1>("h0"), ASImmediateReg) @[DecodeStage.scala 40:31]
    reg AOperationReg : UInt<4>, clock with :
      reset => (UInt<1>("h0"), AOperationReg) @[DecodeStage.scala 42:30]
    reg MemOpReg : UInt<1>, clock with :
      reset => (UInt<1>("h0"), MemOpReg) @[DecodeStage.scala 44:25]
    reg MemAddressReg : UInt<11>, clock with :
      reset => (UInt<1>("h0"), MemAddressReg) @[DecodeStage.scala 45:30]
    reg COperationReg : UInt<2>, clock with :
      reset => (UInt<1>("h0"), COperationReg) @[DecodeStage.scala 47:30]
    reg COffsetReg : SInt<6>, clock with :
      reset => (UInt<1>("h0"), COffsetReg) @[DecodeStage.scala 48:27]
    node _T = eq(io_Stall, UInt<1>("h0")) @[DecodeStage.scala 70:8]
    node _GEN_0 = mux(_T, InstDec.io_Type, TypeReg) @[DecodeStage.scala 70:18 71:13 34:24]
    node _GEN_1 = mux(_T, InstDec.io_rs1, rs1Reg) @[DecodeStage.scala 70:18 72:12 35:23]
    node _GEN_2 = mux(_T, InstDec.io_rs2, rs2Reg) @[DecodeStage.scala 70:18 73:12 36:23]
    node _GEN_3 = mux(_T, InstDec.io_rd, rdReg) @[DecodeStage.scala 70:18 74:11 37:22]
    node _GEN_4 = mux(_T, InstDec.io_AImmidiate, AImmediateReg) @[DecodeStage.scala 70:18 76:19 39:30]
    node _GEN_5 = mux(_T, InstDec.io_ASImmidiate, ASImmediateReg) @[DecodeStage.scala 70:18 77:20 40:31]
    node _GEN_6 = mux(_T, InstDec.io_AOperation, AOperationReg) @[DecodeStage.scala 70:18 79:19 42:30]
    node _GEN_7 = mux(_T, InstDec.io_MemOp, MemOpReg) @[DecodeStage.scala 70:18 81:14 44:25]
    node _GEN_8 = mux(_T, InstDec.io_MemAdress, MemAddressReg) @[DecodeStage.scala 70:18 82:19 45:30]
    node _GEN_9 = mux(_T, InstDec.io_COperation, COperationReg) @[DecodeStage.scala 70:18 84:19 47:30]
    node _GEN_10 = mux(_T, InstDec.io_COffset, COffsetReg) @[DecodeStage.scala 70:18 85:16 48:27]
    node _GEN_11 = mux(io_Clear, UInt<1>("h0"), In_Instruction) @[DecodeStage.scala 88:17 52:26 89:28]
    node _GEN_12 = mux(io_Clear, UInt<1>("h0"), _GEN_0) @[DecodeStage.scala 88:17 91:13]
    node _GEN_13 = mux(io_Clear, UInt<1>("h0"), _GEN_1) @[DecodeStage.scala 88:17 92:12]
    node _GEN_14 = mux(io_Clear, UInt<1>("h0"), _GEN_2) @[DecodeStage.scala 88:17 93:12]
    node _GEN_15 = mux(io_Clear, UInt<1>("h0"), _GEN_3) @[DecodeStage.scala 88:17 94:11]
    node _GEN_16 = mux(io_Clear, UInt<1>("h0"), _GEN_4) @[DecodeStage.scala 88:17 96:19]
    node _GEN_17 = mux(io_Clear, asSInt(UInt<1>("h0")), _GEN_5) @[DecodeStage.scala 88:17 97:20]
    node _GEN_18 = mux(io_Clear, UInt<1>("h0"), _GEN_6) @[DecodeStage.scala 88:17 99:19]
    node _GEN_19 = mux(io_Clear, UInt<1>("h0"), _GEN_7) @[DecodeStage.scala 101:14 88:17]
    node _GEN_20 = mux(io_Clear, UInt<1>("h0"), _GEN_8) @[DecodeStage.scala 88:17 102:19]
    node _GEN_21 = mux(io_Clear, UInt<1>("h0"), _GEN_9) @[DecodeStage.scala 88:17 104:19]
    node _GEN_22 = mux(io_Clear, asSInt(UInt<1>("h0")), _GEN_10) @[DecodeStage.scala 105:16 88:17]
    node _GEN_23 = mux(io_Clear, UInt<1>("h0"), TypeReg) @[DecodeStage.scala 107:14 54:12 88:17]
    node _GEN_24 = mux(io_Clear, UInt<1>("h0"), rs1Reg) @[DecodeStage.scala 108:13 55:11 88:17]
    node _GEN_25 = mux(io_Clear, UInt<1>("h0"), rs2Reg) @[DecodeStage.scala 109:13 56:11 88:17]
    node _GEN_26 = mux(io_Clear, UInt<1>("h0"), rdReg) @[DecodeStage.scala 110:12 57:10 88:17]
    node _GEN_27 = mux(io_Clear, UInt<1>("h0"), AImmediateReg) @[DecodeStage.scala 88:17 112:20 59:18]
    node _GEN_28 = mux(io_Clear, asSInt(UInt<1>("h0")), ASImmediateReg) @[DecodeStage.scala 88:17 113:20 60:18]
    node _GEN_29 = mux(io_Clear, UInt<1>("h0"), AOperationReg) @[DecodeStage.scala 88:17 115:20 62:18]
    node _GEN_30 = mux(io_Clear, UInt<1>("h0"), MemOpReg) @[DecodeStage.scala 117:15 64:13 88:17]
    node _GEN_31 = mux(io_Clear, UInt<1>("h0"), MemAddressReg) @[DecodeStage.scala 88:17 118:20 65:18]
    node _GEN_32 = mux(io_Clear, UInt<1>("h0"), COperationReg) @[DecodeStage.scala 88:17 120:20 67:18]
    node _GEN_33 = mux(io_Clear, asSInt(UInt<1>("h0")), COffsetReg) @[DecodeStage.scala 121:17 68:15 88:17]
    node _T_1 = eq(InstDec.io_AOperation, UInt<4>("h9")) @[DecodeStage.scala 126:30]
    node _T_2 = eq(InstDec.io_AOperation, UInt<4>("ha")) @[DecodeStage.scala 126:63]
    node _T_3 = or(_T_1, _T_2) @[DecodeStage.scala 126:38]
    node _T_4 = eq(InstDec.io_Type, UInt<2>("h3")) @[DecodeStage.scala 126:91]
    node _T_5 = or(_T_3, _T_4) @[DecodeStage.scala 126:72]
    node _GEN_34 = mux(_T_5, UInt<1>("h1"), UInt<1>("h0")) @[DecodeStage.scala 126:99 127:18 29:16]
    io_MiniStall <= _GEN_34
    Out_Type <= _GEN_23
    Out_rs1 <= _GEN_24
    Out_rs2 <= _GEN_25
    Out_rd <= _GEN_26
    Out_AImmediate <= _GEN_27
    Out_ASImmediate <= _GEN_28
    Out_AOperation <= _GEN_29
    Out_MemOp <= _GEN_30
    Out_MemAddress <= _GEN_31
    Out_COperation <= _GEN_32
    Out_COffset <= _GEN_33
    InstDec.clock <= clock
    InstDec.reset <= reset
    InstDec.io_Instruction <= _GEN_11
    AddressReg <= mux(reset, UInt<10>("h0"), AddressReg) @[DecodeStage.scala 33:{27,27,27}]
    TypeReg <= mux(reset, UInt<2>("h0"), _GEN_12) @[DecodeStage.scala 34:{24,24}]
    rs1Reg <= mux(reset, UInt<4>("h0"), _GEN_13) @[DecodeStage.scala 35:{23,23}]
    rs2Reg <= mux(reset, UInt<4>("h0"), _GEN_14) @[DecodeStage.scala 36:{23,23}]
    rdReg <= mux(reset, UInt<4>("h0"), _GEN_15) @[DecodeStage.scala 37:{22,22}]
    AImmediateReg <= mux(reset, UInt<11>("h0"), _GEN_16) @[DecodeStage.scala 39:{30,30}]
    ASImmediateReg <= mux(reset, asSInt(UInt<11>("h0")), _GEN_17) @[DecodeStage.scala 40:{31,31}]
    AOperationReg <= mux(reset, UInt<4>("h0"), _GEN_18) @[DecodeStage.scala 42:{30,30}]
    MemOpReg <= bits(mux(reset, UInt<1>("h0"), _GEN_19), 0, 0) @[DecodeStage.scala 44:{25,25}]
    MemAddressReg <= mux(reset, UInt<11>("h0"), _GEN_20) @[DecodeStage.scala 45:{30,30}]
    COperationReg <= mux(reset, UInt<2>("h0"), _GEN_21) @[DecodeStage.scala 47:{30,30}]
    COffsetReg <= mux(reset, asSInt(UInt<6>("h0")), _GEN_22) @[DecodeStage.scala 48:{27,27}]

  module ALU :
    input clock : Clock
    input reset : UInt<1>
    input io_rs1 : UInt<18>
    input io_rs2 : UInt<18>
    input io_rd : UInt<18>
    input io_Operation : UInt<8>
    output io_Out : UInt<18>

    node _Temp_T = asSInt(io_rs1) @[ALU.scala 22:18]
    node _T = eq(UInt<1>("h0"), io_Operation) @[ALU.scala 26:24]
    node _io_Out_T = add(io_rs1, io_rs2) @[ALU.scala 29:24]
    node _io_Out_T_1 = tail(_io_Out_T, 1) @[ALU.scala 29:24]
    node _T_1 = eq(UInt<1>("h1"), io_Operation) @[ALU.scala 26:24]
    node _io_Out_T_2 = sub(io_rs1, io_rs2) @[ALU.scala 33:24]
    node _io_Out_T_3 = tail(_io_Out_T_2, 1) @[ALU.scala 33:24]
    node _T_2 = eq(UInt<2>("h2"), io_Operation) @[ALU.scala 26:24]
    node _io_Out_T_4 = mul(io_rs1, io_rs2) @[ALU.scala 37:25]
    node _io_Out_T_5 = bits(_io_Out_T_4, 17, 0) @[ALU.scala 37:34]
    node _T_3 = eq(UInt<2>("h3"), io_Operation) @[ALU.scala 26:24]
    node _io_Out_T_6 = bits(io_rs2, 5, 0) @[ALU.scala 41:34]
    node _io_Out_T_7 = dshl(io_rs1, _io_Out_T_6) @[ALU.scala 41:25]
    node _io_Out_T_8 = bits(_io_Out_T_7, 17, 0) @[ALU.scala 41:40]
    node _T_4 = eq(UInt<3>("h4"), io_Operation) @[ALU.scala 26:24]
    node _io_Out_T_9 = dshr(io_rs1, io_rs2) @[ALU.scala 45:25]
    node _io_Out_T_10 = bits(_io_Out_T_9, 17, 0) @[ALU.scala 45:35]
    node _T_5 = eq(UInt<3>("h5"), io_Operation) @[ALU.scala 26:24]
    node _io_Out_T_11 = bits(io_rs2, 5, 0) @[ALU.scala 49:32]
    node Temp = _Temp_T @[ALU.scala 20:18 22:8]
    node _io_Out_T_12 = dshl(Temp, _io_Out_T_11) @[ALU.scala 49:23]
    node _io_Out_T_13 = bits(_io_Out_T_12, 17, 0) @[ALU.scala 49:38]
    node _T_6 = eq(UInt<3>("h6"), io_Operation) @[ALU.scala 26:24]
    node _io_Out_T_14 = dshr(Temp, io_rs2) @[ALU.scala 53:23]
    node _io_Out_T_15 = bits(_io_Out_T_14, 17, 0) @[ALU.scala 53:33]
    node _T_7 = eq(UInt<3>("h7"), io_Operation) @[ALU.scala 26:24]
    node _io_Out_T_16 = and(io_rs1, io_rs2) @[ALU.scala 57:24]
    node _T_8 = eq(UInt<4>("h8"), io_Operation) @[ALU.scala 26:24]
    node _io_Out_T_17 = or(io_rs1, io_rs2) @[ALU.scala 61:24]
    node _T_9 = eq(UInt<4>("h9"), io_Operation) @[ALU.scala 26:24]
    node _io_Out_T_18 = xor(io_rs1, io_rs2) @[ALU.scala 65:24]
    node _T_10 = eq(UInt<4>("ha"), io_Operation) @[ALU.scala 26:24]
    node _io_Out_T_19 = mul(io_rs1, io_rs2) @[ALU.scala 68:25]
    node _io_Out_T_20 = shr(_io_Out_T_19, 9) @[ALU.scala 68:35]
    node _T_11 = eq(UInt<4>("hb"), io_Operation) @[ALU.scala 26:24]
    node _io_Out_T_21 = mul(io_rs1, io_rs2) @[ALU.scala 72:33]
    node _io_Out_T_22 = bits(_io_Out_T_21, 17, 0) @[ALU.scala 72:42]
    node _io_Out_T_23 = add(io_rd, _io_Out_T_22) @[ALU.scala 72:23]
    node _io_Out_T_24 = tail(_io_Out_T_23, 1) @[ALU.scala 72:23]
    node _GEN_0 = mux(_T_11, _io_Out_T_24, UInt<1>("h0")) @[ALU.scala 24:10 26:24 72:14]
    node _GEN_1 = mux(_T_10, _io_Out_T_20, _GEN_0) @[ALU.scala 26:24 68:14]
    node _GEN_2 = mux(_T_9, _io_Out_T_18, _GEN_1) @[ALU.scala 26:24 65:14]
    node _GEN_3 = mux(_T_8, _io_Out_T_17, _GEN_2) @[ALU.scala 26:24 61:14]
    node _GEN_4 = mux(_T_7, _io_Out_T_16, _GEN_3) @[ALU.scala 26:24 57:14]
    node _GEN_5 = mux(_T_6, _io_Out_T_15, _GEN_4) @[ALU.scala 26:24 53:14]
    node _GEN_6 = mux(_T_5, _io_Out_T_13, _GEN_5) @[ALU.scala 26:24 49:14]
    node _GEN_7 = mux(_T_4, _io_Out_T_10, _GEN_6) @[ALU.scala 26:24 45:14]
    node _GEN_8 = mux(_T_3, _io_Out_T_8, _GEN_7) @[ALU.scala 26:24 41:14]
    node _GEN_9 = mux(_T_2, _io_Out_T_5, _GEN_8) @[ALU.scala 26:24 37:14]
    node _GEN_10 = mux(_T_1, _io_Out_T_3, _GEN_9) @[ALU.scala 26:24 33:14]
    node _GEN_11 = mux(_T, _io_Out_T_1, _GEN_10) @[ALU.scala 26:24 29:14]
    io_Out <= bits(_GEN_11, 17, 0)

  module BranchComp :
    input clock : Clock
    input reset : UInt<1>
    input io_rs2 : UInt<18>
    input io_rs1 : UInt<18>
    input io_PC : UInt<18>
    input io_Offset : SInt<11>
    input io_Operation : UInt<2>
    output io_CondCheck : UInt<1>
    output io_Out : UInt<18>

    node _T = eq(UInt<1>("h0"), io_Operation) @[BranchComp.scala 21:23]
    node _CondCheck_T = eq(io_rs2, io_rs1) @[BranchComp.scala 23:28]
    node _T_1 = eq(UInt<1>("h1"), io_Operation) @[BranchComp.scala 21:23]
    node _CondCheck_T_1 = neq(io_rs2, io_rs1) @[BranchComp.scala 26:28]
    node _T_2 = eq(UInt<2>("h2"), io_Operation) @[BranchComp.scala 21:23]
    node _CondCheck_T_2 = geq(io_rs2, io_rs1) @[BranchComp.scala 29:28]
    node _T_3 = eq(UInt<2>("h3"), io_Operation) @[BranchComp.scala 21:23]
    node _CondCheck_T_3 = gt(io_rs2, io_rs1) @[BranchComp.scala 32:28]
    node _GEN_0 = mux(_T_3, _CondCheck_T_3, UInt<1>("h0")) @[BranchComp.scala 19:13 21:23 32:17]
    node _GEN_1 = mux(_T_2, _CondCheck_T_2, _GEN_0) @[BranchComp.scala 21:23 29:17]
    node _GEN_2 = mux(_T_1, _CondCheck_T_1, _GEN_1) @[BranchComp.scala 21:23 26:17]
    node _GEN_3 = mux(_T, _CondCheck_T, _GEN_2) @[BranchComp.scala 21:23 23:17]
    node _io_Out_T = asSInt(io_PC) @[BranchComp.scala 37:22]
    node _io_Out_T_1 = add(_io_Out_T, io_Offset) @[BranchComp.scala 37:29]
    node _io_Out_T_2 = tail(_io_Out_T_1, 1) @[BranchComp.scala 37:29]
    node _io_Out_T_3 = asSInt(_io_Out_T_2) @[BranchComp.scala 37:29]
    node _io_Out_T_4 = asUInt(_io_Out_T_3) @[BranchComp.scala 37:42]
    node _io_Out_T_5 = add(io_PC, UInt<1>("h1")) @[BranchComp.scala 39:21]
    node _io_Out_T_6 = tail(_io_Out_T_5, 1) @[BranchComp.scala 39:21]
    node CondCheck = _GEN_3 @[BranchComp.scala 17:23]
    node _GEN_4 = mux(CondCheck, _io_Out_T_4, _io_Out_T_6) @[BranchComp.scala 36:18 37:12 39:12]
    io_CondCheck <= CondCheck @[BranchComp.scala 42:16]
    io_Out <= _GEN_4

  module ExecuteStage :
    input clock : Clock
    input reset : UInt<1>
    input io_x_0 : UInt<18>
    input io_x_1 : UInt<18>
    input io_x_2 : UInt<18>
    input io_x_3 : UInt<18>
    input io_x_4 : UInt<18>
    input io_x_5 : UInt<18>
    input io_x_6 : UInt<18>
    input io_x_7 : UInt<18>
    input io_x_8 : UInt<18>
    input io_x_9 : UInt<18>
    input io_x_10 : UInt<18>
    input io_x_11 : UInt<18>
    input io_x_12 : UInt<18>
    input io_x_13 : UInt<18>
    input io_x_14 : UInt<18>
    input io_x_15 : UInt<18>
    output io_MemPort_Address : UInt<18>
    output io_MemPort_WriteData : UInt<18>
    output io_MemPort_Enable : UInt<1>
    output io_MemPort_WriteEn : UInt<1>
    input io_MemPort_ReadData : UInt<18>
    input io_MemPort_Completed : UInt<1>
    output io_Stall : UInt<1>
    input io_Clear : UInt<1>
    input In_Type : UInt<2>
    input In_rs1 : UInt<4>
    input In_rs2 : UInt<4>
    input In_rd : UInt<4>
    input In_AImmediate : UInt<11>
    input In_ASImmediate : SInt<11>
    input In_AOperation : UInt<4>
    input In_MemOp : UInt<1>
    input In_MemAddress : UInt<11>
    input In_COperation : UInt<2>
    input In_COffset : SInt<6>
    output Out_WritebackMode : UInt<4>
    output Out_WritebackRegister : UInt<4>
    output Out_ALUOut : UInt<18>
    output Out_JumpValue : UInt<18>

    inst ALU of ALU @[ExecuteStage.scala 34:19]
    inst BranchComp of BranchComp @[ExecuteStage.scala 35:26]
    reg WritebackMode : UInt<4>, clock with :
      reset => (UInt<1>("h0"), WritebackMode) @[ExecuteStage.scala 57:30]
    reg WritebackRegister : UInt<4>, clock with :
      reset => (UInt<1>("h0"), WritebackRegister) @[ExecuteStage.scala 58:34]
    reg ALUOutReg : UInt<18>, clock with :
      reset => (UInt<1>("h0"), ALUOutReg) @[ExecuteStage.scala 59:26]
    reg COffsetReg : UInt<6>, clock with :
      reset => (UInt<1>("h0"), COffsetReg) @[ExecuteStage.scala 60:27]
    reg DataHazard : UInt<4>, clock with :
      reset => (UInt<1>("h0"), DataHazard) @[ExecuteStage.scala 62:27]
    reg swStall : UInt<1>, clock with :
      reset => (UInt<1>("h0"), swStall) @[ExecuteStage.scala 68:24]
    reg lwStall : UInt<1>, clock with :
      reset => (UInt<1>("h0"), lwStall) @[ExecuteStage.scala 69:24]
    node _GEN_0 = validif(eq(UInt<1>("h0"), In_rs1), io_x_0) @[ExecuteStage.scala 73:{7,7}]
    node _GEN_1 = mux(eq(UInt<1>("h1"), In_rs1), io_x_1, _GEN_0) @[ExecuteStage.scala 73:{7,7}]
    node _GEN_2 = mux(eq(UInt<2>("h2"), In_rs1), io_x_2, _GEN_1) @[ExecuteStage.scala 73:{7,7}]
    node _GEN_3 = mux(eq(UInt<2>("h3"), In_rs1), io_x_3, _GEN_2) @[ExecuteStage.scala 73:{7,7}]
    node _GEN_4 = mux(eq(UInt<3>("h4"), In_rs1), io_x_4, _GEN_3) @[ExecuteStage.scala 73:{7,7}]
    node _GEN_5 = mux(eq(UInt<3>("h5"), In_rs1), io_x_5, _GEN_4) @[ExecuteStage.scala 73:{7,7}]
    node _GEN_6 = mux(eq(UInt<3>("h6"), In_rs1), io_x_6, _GEN_5) @[ExecuteStage.scala 73:{7,7}]
    node _GEN_7 = mux(eq(UInt<3>("h7"), In_rs1), io_x_7, _GEN_6) @[ExecuteStage.scala 73:{7,7}]
    node _GEN_8 = mux(eq(UInt<4>("h8"), In_rs1), io_x_8, _GEN_7) @[ExecuteStage.scala 73:{7,7}]
    node _GEN_9 = mux(eq(UInt<4>("h9"), In_rs1), io_x_9, _GEN_8) @[ExecuteStage.scala 73:{7,7}]
    node _GEN_10 = mux(eq(UInt<4>("ha"), In_rs1), io_x_10, _GEN_9) @[ExecuteStage.scala 73:{7,7}]
    node _GEN_11 = mux(eq(UInt<4>("hb"), In_rs1), io_x_11, _GEN_10) @[ExecuteStage.scala 73:{7,7}]
    node _GEN_12 = mux(eq(UInt<4>("hc"), In_rs1), io_x_12, _GEN_11) @[ExecuteStage.scala 73:{7,7}]
    node _GEN_13 = mux(eq(UInt<4>("hd"), In_rs1), io_x_13, _GEN_12) @[ExecuteStage.scala 73:{7,7}]
    node _GEN_14 = mux(eq(UInt<4>("he"), In_rs1), io_x_14, _GEN_13) @[ExecuteStage.scala 73:{7,7}]
    node _GEN_15 = mux(eq(UInt<4>("hf"), In_rs1), io_x_15, _GEN_14) @[ExecuteStage.scala 73:{7,7}]
    node _GEN_16 = validif(eq(UInt<1>("h0"), In_rs2), io_x_0) @[ExecuteStage.scala 74:{7,7}]
    node _GEN_17 = mux(eq(UInt<1>("h1"), In_rs2), io_x_1, _GEN_16) @[ExecuteStage.scala 74:{7,7}]
    node _GEN_18 = mux(eq(UInt<2>("h2"), In_rs2), io_x_2, _GEN_17) @[ExecuteStage.scala 74:{7,7}]
    node _GEN_19 = mux(eq(UInt<2>("h3"), In_rs2), io_x_3, _GEN_18) @[ExecuteStage.scala 74:{7,7}]
    node _GEN_20 = mux(eq(UInt<3>("h4"), In_rs2), io_x_4, _GEN_19) @[ExecuteStage.scala 74:{7,7}]
    node _GEN_21 = mux(eq(UInt<3>("h5"), In_rs2), io_x_5, _GEN_20) @[ExecuteStage.scala 74:{7,7}]
    node _GEN_22 = mux(eq(UInt<3>("h6"), In_rs2), io_x_6, _GEN_21) @[ExecuteStage.scala 74:{7,7}]
    node _GEN_23 = mux(eq(UInt<3>("h7"), In_rs2), io_x_7, _GEN_22) @[ExecuteStage.scala 74:{7,7}]
    node _GEN_24 = mux(eq(UInt<4>("h8"), In_rs2), io_x_8, _GEN_23) @[ExecuteStage.scala 74:{7,7}]
    node _GEN_25 = mux(eq(UInt<4>("h9"), In_rs2), io_x_9, _GEN_24) @[ExecuteStage.scala 74:{7,7}]
    node _GEN_26 = mux(eq(UInt<4>("ha"), In_rs2), io_x_10, _GEN_25) @[ExecuteStage.scala 74:{7,7}]
    node _GEN_27 = mux(eq(UInt<4>("hb"), In_rs2), io_x_11, _GEN_26) @[ExecuteStage.scala 74:{7,7}]
    node _GEN_28 = mux(eq(UInt<4>("hc"), In_rs2), io_x_12, _GEN_27) @[ExecuteStage.scala 74:{7,7}]
    node _GEN_29 = mux(eq(UInt<4>("hd"), In_rs2), io_x_13, _GEN_28) @[ExecuteStage.scala 74:{7,7}]
    node _GEN_30 = mux(eq(UInt<4>("he"), In_rs2), io_x_14, _GEN_29) @[ExecuteStage.scala 74:{7,7}]
    node _GEN_31 = mux(eq(UInt<4>("hf"), In_rs2), io_x_15, _GEN_30) @[ExecuteStage.scala 74:{7,7}]
    node _GEN_32 = validif(eq(UInt<1>("h0"), In_rd), io_x_0) @[ExecuteStage.scala 75:{6,6}]
    node _GEN_33 = mux(eq(UInt<1>("h1"), In_rd), io_x_1, _GEN_32) @[ExecuteStage.scala 75:{6,6}]
    node _GEN_34 = mux(eq(UInt<2>("h2"), In_rd), io_x_2, _GEN_33) @[ExecuteStage.scala 75:{6,6}]
    node _GEN_35 = mux(eq(UInt<2>("h3"), In_rd), io_x_3, _GEN_34) @[ExecuteStage.scala 75:{6,6}]
    node _GEN_36 = mux(eq(UInt<3>("h4"), In_rd), io_x_4, _GEN_35) @[ExecuteStage.scala 75:{6,6}]
    node _GEN_37 = mux(eq(UInt<3>("h5"), In_rd), io_x_5, _GEN_36) @[ExecuteStage.scala 75:{6,6}]
    node _GEN_38 = mux(eq(UInt<3>("h6"), In_rd), io_x_6, _GEN_37) @[ExecuteStage.scala 75:{6,6}]
    node _GEN_39 = mux(eq(UInt<3>("h7"), In_rd), io_x_7, _GEN_38) @[ExecuteStage.scala 75:{6,6}]
    node _GEN_40 = mux(eq(UInt<4>("h8"), In_rd), io_x_8, _GEN_39) @[ExecuteStage.scala 75:{6,6}]
    node _GEN_41 = mux(eq(UInt<4>("h9"), In_rd), io_x_9, _GEN_40) @[ExecuteStage.scala 75:{6,6}]
    node _GEN_42 = mux(eq(UInt<4>("ha"), In_rd), io_x_10, _GEN_41) @[ExecuteStage.scala 75:{6,6}]
    node _GEN_43 = mux(eq(UInt<4>("hb"), In_rd), io_x_11, _GEN_42) @[ExecuteStage.scala 75:{6,6}]
    node _GEN_44 = mux(eq(UInt<4>("hc"), In_rd), io_x_12, _GEN_43) @[ExecuteStage.scala 75:{6,6}]
    node _GEN_45 = mux(eq(UInt<4>("hd"), In_rd), io_x_13, _GEN_44) @[ExecuteStage.scala 75:{6,6}]
    node _GEN_46 = mux(eq(UInt<4>("he"), In_rd), io_x_14, _GEN_45) @[ExecuteStage.scala 75:{6,6}]
    node _GEN_47 = mux(eq(UInt<4>("hf"), In_rd), io_x_15, _GEN_46) @[ExecuteStage.scala 75:{6,6}]
    node _T = eq(In_rs1, DataHazard) @[ExecuteStage.scala 80:15]
    node _T_1 = eq(UInt<1>("h1"), WritebackMode) @[ExecuteStage.scala 81:26]
    node _T_2 = eq(UInt<2>("h2"), WritebackMode) @[ExecuteStage.scala 81:26]
    node _T_3 = eq(UInt<2>("h3"), WritebackMode) @[ExecuteStage.scala 81:26]
    node _io_x_In_rs1 = _GEN_15 @[ExecuteStage.scala 73:7]
    node _GEN_48 = mux(_T_3, io_MemPort_ReadData, _io_x_In_rs1) @[ExecuteStage.scala 81:26 89:13 73:7]
    node _GEN_49 = mux(_T_2, ALUOutReg, _GEN_48) @[ExecuteStage.scala 81:26 86:13]
    node _GEN_50 = mux(_T_1, ALUOutReg, _GEN_49) @[ExecuteStage.scala 81:26 83:13]
    node _GEN_51 = mux(_T, _GEN_50, _io_x_In_rs1) @[ExecuteStage.scala 80:30 73:7]
    node _T_4 = eq(In_rs2, DataHazard) @[ExecuteStage.scala 94:15]
    node _T_5 = eq(UInt<1>("h1"), WritebackMode) @[ExecuteStage.scala 95:26]
    node _T_6 = eq(UInt<2>("h2"), WritebackMode) @[ExecuteStage.scala 95:26]
    node _T_7 = eq(UInt<2>("h3"), WritebackMode) @[ExecuteStage.scala 95:26]
    node _io_x_In_rs2 = _GEN_31 @[ExecuteStage.scala 74:7]
    node _GEN_52 = mux(_T_7, io_MemPort_ReadData, _io_x_In_rs2) @[ExecuteStage.scala 103:13 95:26 74:7]
    node _GEN_53 = mux(_T_6, ALUOutReg, _GEN_52) @[ExecuteStage.scala 100:13 95:26]
    node _GEN_54 = mux(_T_5, ALUOutReg, _GEN_53) @[ExecuteStage.scala 95:26 97:13]
    node _GEN_55 = mux(_T_4, _GEN_54, _io_x_In_rs2) @[ExecuteStage.scala 94:30 74:7]
    node _T_8 = eq(In_rd, DataHazard) @[ExecuteStage.scala 108:14]
    node _T_9 = eq(UInt<1>("h1"), WritebackMode) @[ExecuteStage.scala 109:26]
    node _T_10 = eq(UInt<2>("h2"), WritebackMode) @[ExecuteStage.scala 109:26]
    node _T_11 = eq(UInt<2>("h3"), WritebackMode) @[ExecuteStage.scala 109:26]
    node _io_x_In_rd = _GEN_47 @[ExecuteStage.scala 75:6]
    node _GEN_56 = mux(_T_11, io_MemPort_ReadData, _io_x_In_rd) @[ExecuteStage.scala 109:26 117:12 75:6]
    node _GEN_57 = mux(_T_10, ALUOutReg, _GEN_56) @[ExecuteStage.scala 109:26 114:12]
    node _GEN_58 = mux(_T_9, ALUOutReg, _GEN_57) @[ExecuteStage.scala 109:26 111:12]
    node _GEN_59 = mux(_T_8, _GEN_58, _io_x_In_rd) @[ExecuteStage.scala 108:29 75:6]
    node _GEN_60 = mux(io_Clear, UInt<1>("h0"), ALU.io_Out) @[ExecuteStage.scala 127:13 131:17 132:15]
    node _GEN_61 = mux(io_Clear, UInt<1>("h0"), WritebackMode) @[ExecuteStage.scala 131:17 133:19 57:30]
    node _GEN_62 = mux(io_Clear, UInt<1>("h0"), WritebackRegister) @[ExecuteStage.scala 131:17 134:23 58:34]
    node _GEN_63 = mux(io_Clear, UInt<1>("h0"), COffsetReg) @[ExecuteStage.scala 131:17 135:16 60:27]
    node _T_12 = eq(UInt<1>("h0"), In_Type) @[ExecuteStage.scala 141:18]
    node _T_13 = leq(In_AOperation, UInt<4>("ha")) @[ExecuteStage.scala 143:26]
    node _T_14 = eq(In_AOperation, UInt<4>("hb")) @[ExecuteStage.scala 153:32]
    node _T_15 = eq(In_AOperation, UInt<4>("hc")) @[ExecuteStage.scala 167:32]
    node _T_16 = eq(In_rs1, DataHazard) @[ExecuteStage.scala 177:21]
    node _T_17 = neq(In_rs1, UInt<1>("h0")) @[ExecuteStage.scala 177:46]
    node _T_18 = and(_T_16, _T_17) @[ExecuteStage.scala 177:36]
    node _T_19 = eq(UInt<1>("h1"), WritebackMode) @[ExecuteStage.scala 178:32]
    node _T_20 = eq(UInt<2>("h2"), WritebackMode) @[ExecuteStage.scala 178:32]
    node _GEN_64 = mux(_T_20, ALUOutReg, UInt<1>("h0")) @[ExecuteStage.scala 178:32 183:34 40:22]
    node _GEN_65 = mux(_T_19, ALUOutReg, _GEN_64) @[ExecuteStage.scala 178:32 180:34]
    node _io_x_In_rs1_0 = _GEN_15 @[ExecuteStage.scala 187:30]
    node _GEN_66 = mux(_T_18, _GEN_65, _io_x_In_rs1_0) @[ExecuteStage.scala 177:54 187:30]
    node _T_21 = eq(io_MemPort_Completed, UInt<1>("h0")) @[ExecuteStage.scala 195:14]
    node _GEN_67 = mux(_T_21, UInt<1>("h1"), UInt<1>("h0")) @[ExecuteStage.scala 195:36 196:20 44:12]
    node _T_22 = eq(In_AOperation, UInt<4>("hd")) @[ExecuteStage.scala 198:32]
    node _T_23 = eq(In_rs1, DataHazard) @[ExecuteStage.scala 205:21]
    node _T_24 = eq(UInt<1>("h1"), WritebackMode) @[ExecuteStage.scala 206:32]
    node _T_25 = eq(UInt<2>("h2"), WritebackMode) @[ExecuteStage.scala 206:32]
    node _GEN_68 = mux(_T_25, ALUOutReg, UInt<1>("h0")) @[ExecuteStage.scala 206:32 211:34 40:22]
    node _GEN_69 = mux(_T_24, ALUOutReg, _GEN_68) @[ExecuteStage.scala 206:32 208:34]
    node _io_x_In_rs1_1 = _GEN_15 @[ExecuteStage.scala 215:30]
    node _GEN_70 = mux(_T_23, _GEN_69, _io_x_In_rs1_1) @[ExecuteStage.scala 205:36 215:30]
    node _T_26 = eq(io_MemPort_Completed, UInt<1>("h0")) @[ExecuteStage.scala 222:14]
    node _GEN_71 = mux(_T_26, UInt<1>("h1"), UInt<1>("h0")) @[ExecuteStage.scala 222:36 223:20 44:12]
    node _GEN_72 = mux(_T_22, UInt<1>("h1"), UInt<1>("h0")) @[ExecuteStage.scala 198:41 202:27 39:21]
    node _GEN_73 = mux(_T_22, _GEN_70, UInt<1>("h0")) @[ExecuteStage.scala 198:41 40:22]
    node rd = _GEN_59 @[ExecuteStage.scala 66:16]
    node _GEN_74 = mux(_T_22, rd, UInt<1>("h0")) @[ExecuteStage.scala 198:41 218:30 41:24]
    node _GEN_75 = mux(_T_22, UInt<1>("h0"), _GEN_61) @[ExecuteStage.scala 198:41 220:23]
    node _GEN_76 = mux(_T_22, _GEN_71, UInt<1>("h0")) @[ExecuteStage.scala 198:41 44:12]
    node _GEN_77 = mux(_T_15, UInt<1>("h1"), _GEN_72) @[ExecuteStage.scala 167:41 171:27]
    node _GEN_78 = mux(_T_15, _GEN_66, _GEN_73) @[ExecuteStage.scala 167:41]
    node _GEN_79 = mux(_T_15, UInt<2>("h3"), _GEN_75) @[ExecuteStage.scala 167:41 190:23]
    node _GEN_80 = mux(_T_15, In_rd, _GEN_62) @[ExecuteStage.scala 167:41 191:27]
    node _GEN_81 = mux(_T_15, In_rd, DataHazard) @[ExecuteStage.scala 167:41 193:20 62:27]
    node _GEN_82 = mux(_T_15, _GEN_67, _GEN_76) @[ExecuteStage.scala 167:41]
    node _GEN_83 = mux(_T_15, UInt<1>("h0"), _GEN_72) @[ExecuteStage.scala 167:41 42:22]
    node _GEN_84 = mux(_T_15, UInt<1>("h0"), _GEN_74) @[ExecuteStage.scala 167:41 41:24]
    node _GEN_85 = mux(_T_14, In_AOperation, UInt<1>("h0")) @[ExecuteStage.scala 153:41 157:26 49:20]
    node rs2 = _GEN_55 @[ExecuteStage.scala 65:17]
    node _GEN_86 = mux(_T_14, rs2, UInt<1>("h0")) @[ExecuteStage.scala 153:41 159:20 46:14]
    node rs1 = _GEN_51 @[ExecuteStage.scala 64:17]
    node _GEN_87 = mux(_T_14, rs1, UInt<1>("h0")) @[ExecuteStage.scala 153:41 160:20 47:14]
    node _GEN_88 = mux(_T_14, rd, UInt<1>("h0")) @[ExecuteStage.scala 153:41 161:19 48:13]
    node _GEN_89 = mux(_T_14, UInt<1>("h1"), _GEN_79) @[ExecuteStage.scala 153:41 163:23]
    node _GEN_90 = mux(_T_14, In_rd, _GEN_80) @[ExecuteStage.scala 153:41 164:27]
    node _GEN_91 = mux(_T_14, In_rd, _GEN_81) @[ExecuteStage.scala 153:41 166:20]
    node _GEN_92 = mux(_T_14, UInt<1>("h0"), _GEN_77) @[ExecuteStage.scala 153:41 39:21]
    node _GEN_93 = mux(_T_14, UInt<1>("h0"), _GEN_78) @[ExecuteStage.scala 153:41 40:22]
    node _GEN_94 = mux(_T_14, UInt<1>("h0"), _GEN_82) @[ExecuteStage.scala 153:41 44:12]
    node _GEN_95 = mux(_T_14, UInt<1>("h0"), _GEN_83) @[ExecuteStage.scala 153:41 42:22]
    node _GEN_96 = mux(_T_14, UInt<1>("h0"), _GEN_84) @[ExecuteStage.scala 153:41 41:24]
    node _GEN_97 = mux(_T_13, In_AOperation, _GEN_85) @[ExecuteStage.scala 143:34 144:26]
    node _GEN_98 = mux(_T_13, rs2, _GEN_86) @[ExecuteStage.scala 143:34 146:20]
    node _GEN_99 = mux(_T_13, rs1, _GEN_87) @[ExecuteStage.scala 143:34 147:20]
    node _GEN_100 = mux(_T_13, UInt<1>("h1"), _GEN_89) @[ExecuteStage.scala 143:34 149:23]
    node _GEN_101 = mux(_T_13, In_rd, _GEN_90) @[ExecuteStage.scala 143:34 150:27]
    node _GEN_102 = mux(_T_13, In_rd, _GEN_91) @[ExecuteStage.scala 143:34 152:20]
    node _GEN_103 = mux(_T_13, UInt<1>("h0"), _GEN_88) @[ExecuteStage.scala 143:34 48:13]
    node _GEN_104 = mux(_T_13, UInt<1>("h0"), _GEN_92) @[ExecuteStage.scala 143:34 39:21]
    node _GEN_105 = mux(_T_13, UInt<1>("h0"), _GEN_93) @[ExecuteStage.scala 143:34 40:22]
    node _GEN_106 = mux(_T_13, UInt<1>("h0"), _GEN_94) @[ExecuteStage.scala 143:34 44:12]
    node _GEN_107 = mux(_T_13, UInt<1>("h0"), _GEN_95) @[ExecuteStage.scala 143:34 42:22]
    node _GEN_108 = mux(_T_13, UInt<1>("h0"), _GEN_96) @[ExecuteStage.scala 143:34 41:24]
    node _T_27 = eq(UInt<1>("h1"), In_Type) @[ExecuteStage.scala 141:18]
    node _T_28 = eq(In_AOperation, UInt<1>("h1")) @[ExecuteStage.scala 228:26]
    node _T_29 = eq(In_AOperation, UInt<2>("h2")) @[ExecuteStage.scala 235:32]
    node _upper_T = bits(In_AImmediate, 8, 0) @[ExecuteStage.scala 242:31]
    node _lower_T = bits(rd, 8, 0) @[ExecuteStage.scala 245:20]
    node upper = _upper_T @[ExecuteStage.scala 241:25 242:15]
    node lower = _lower_T @[ExecuteStage.scala 243:25 245:15]
    node _cat_T = cat(upper, lower) @[Cat.scala 31:58]
    node _T_30 = lt(In_ASImmediate, asSInt(UInt<1>("h0"))) @[ExecuteStage.scala 252:29]
    node _ALU_io_rs2_T = sub(asSInt(UInt<1>("h0")), In_ASImmediate) @[ExecuteStage.scala 254:30]
    node _ALU_io_rs2_T_1 = tail(_ALU_io_rs2_T, 1) @[ExecuteStage.scala 254:30]
    node _ALU_io_rs2_T_2 = asSInt(_ALU_io_rs2_T_1) @[ExecuteStage.scala 254:30]
    node _ALU_io_rs2_T_3 = asUInt(_ALU_io_rs2_T_2) @[ExecuteStage.scala 254:48]
    node _ALU_io_rs2_T_4 = asUInt(In_ASImmediate) @[ExecuteStage.scala 258:40]
    node _GEN_109 = mux(_T_30, UInt<1>("h1"), UInt<1>("h0")) @[ExecuteStage.scala 252:35 253:28 260:28]
    node _GEN_110 = mux(_T_30, _ALU_io_rs2_T_3, _ALU_io_rs2_T_4) @[ExecuteStage.scala 252:35 254:22 258:22]
    node _GEN_111 = mux(_T_30, rd, rd) @[ExecuteStage.scala 252:35 255:22 259:22]
    node _GEN_112 = mux(_T_29, UInt<1>("h0"), _GEN_110) @[ExecuteStage.scala 235:40 239:20]
    node cat = _cat_T @[ExecuteStage.scala 246:23 247:13]
    node _GEN_113 = mux(_T_29, cat, _GEN_111) @[ExecuteStage.scala 235:40 249:20]
    node _GEN_114 = mux(_T_29, UInt<1>("h0"), _GEN_109) @[ExecuteStage.scala 235:40 250:26]
    node _GEN_115 = mux(_T_28, UInt<1>("h0"), _GEN_112) @[ExecuteStage.scala 228:34 232:20]
    node _GEN_116 = mux(_T_28, In_AImmediate, _GEN_113) @[ExecuteStage.scala 228:34 233:20]
    node _GEN_117 = mux(_T_28, UInt<1>("h0"), _GEN_114) @[ExecuteStage.scala 228:34 234:26]
    node _T_31 = eq(UInt<2>("h2"), In_Type) @[ExecuteStage.scala 141:18]
    node _T_32 = eq(UInt<1>("h0"), In_MemOp) @[ExecuteStage.scala 274:23]
    node _T_33 = eq(UInt<1>("h1"), In_MemOp) @[ExecuteStage.scala 274:23]
    node _GEN_118 = mux(_T_33, UInt<1>("h0"), _GEN_61) @[ExecuteStage.scala 274:23 280:25]
    node _GEN_119 = mux(_T_32, UInt<2>("h3"), _GEN_118) @[ExecuteStage.scala 274:23 276:25]
    node _GEN_120 = mux(_T_32, In_rd, DataHazard) @[ExecuteStage.scala 274:23 277:22 62:27]
    node _T_34 = eq(io_MemPort_Completed, UInt<1>("h0")) @[ExecuteStage.scala 284:12]
    node _GEN_121 = mux(_T_34, UInt<1>("h1"), UInt<1>("h0")) @[ExecuteStage.scala 284:34 285:18 44:12]
    node _T_35 = eq(UInt<2>("h3"), In_Type) @[ExecuteStage.scala 141:18]
    node _BranchComp_io_PC_T = sub(io_x_1, UInt<2>("h2")) @[ExecuteStage.scala 295:35]
    node _BranchComp_io_PC_T_1 = tail(_BranchComp_io_PC_T, 1) @[ExecuteStage.scala 295:35]
    node _GEN_122 = mux(BranchComp.io_CondCheck, UInt<3>("h4"), UInt<1>("h0")) @[ExecuteStage.scala 300:36 301:23 303:23]
    node _GEN_123 = mux(io_Clear, UInt<1>("h0"), _GEN_122) @[ExecuteStage.scala 306:21 307:23]
    node _GEN_124 = mux(_T_35, rs2, UInt<1>("h0")) @[ExecuteStage.scala 141:18 291:25 51:21]
    node _GEN_125 = mux(_T_35, rs1, UInt<1>("h0")) @[ExecuteStage.scala 141:18 292:25 52:21]
    node _GEN_126 = mux(_T_35, In_COperation, UInt<1>("h0")) @[ExecuteStage.scala 141:18 294:31 55:27]
    node _GEN_127 = mux(_T_35, _BranchComp_io_PC_T_1, UInt<1>("h0")) @[ExecuteStage.scala 141:18 295:24 53:20]
    node _GEN_128 = mux(_T_35, In_COffset, asSInt(UInt<1>("h0"))) @[ExecuteStage.scala 141:18 296:28 54:24]
    node _GEN_129 = mux(_T_35, BranchComp.io_Out, _GEN_63) @[ExecuteStage.scala 141:18 298:18]
    node _GEN_130 = mux(_T_35, _GEN_123, _GEN_61) @[ExecuteStage.scala 141:18]
    node _GEN_131 = mux(_T_35, UInt<1>("h0"), _GEN_62) @[ExecuteStage.scala 141:18 310:25]
    node _GEN_132 = mux(_T_31, In_MemAddress, UInt<1>("h0")) @[ExecuteStage.scala 141:18 269:26 40:22]
    node _GEN_133 = mux(_T_31, rd, UInt<1>("h0")) @[ExecuteStage.scala 141:18 270:28 41:24]
    node _GEN_134 = mux(_T_31, UInt<1>("h1"), UInt<1>("h0")) @[ExecuteStage.scala 141:18 271:25 39:21]
    node _GEN_135 = mux(_T_31, In_MemOp, UInt<1>("h0")) @[ExecuteStage.scala 141:18 272:26 42:22]
    node _GEN_136 = mux(_T_31, _GEN_119, _GEN_130) @[ExecuteStage.scala 141:18]
    node _GEN_137 = mux(_T_31, _GEN_120, DataHazard) @[ExecuteStage.scala 141:18 62:27]
    node _GEN_138 = mux(_T_31, _GEN_121, UInt<1>("h0")) @[ExecuteStage.scala 141:18 44:12]
    node _GEN_139 = mux(_T_31, In_rd, _GEN_131) @[ExecuteStage.scala 141:18 288:25]
    node _GEN_140 = mux(_T_31, UInt<1>("h0"), _GEN_124) @[ExecuteStage.scala 141:18 51:21]
    node _GEN_141 = mux(_T_31, UInt<1>("h0"), _GEN_125) @[ExecuteStage.scala 141:18 52:21]
    node _GEN_142 = mux(_T_31, UInt<1>("h0"), _GEN_126) @[ExecuteStage.scala 141:18 55:27]
    node _GEN_143 = mux(_T_31, UInt<1>("h0"), _GEN_127) @[ExecuteStage.scala 141:18 53:20]
    node _GEN_144 = mux(_T_31, asSInt(UInt<1>("h0")), _GEN_128) @[ExecuteStage.scala 141:18 54:24]
    node _GEN_145 = mux(_T_31, _GEN_63, _GEN_129) @[ExecuteStage.scala 141:18]
    node _GEN_146 = mux(_T_27, _GEN_115, UInt<1>("h0")) @[ExecuteStage.scala 141:18 46:14]
    node _GEN_147 = mux(_T_27, _GEN_116, UInt<1>("h0")) @[ExecuteStage.scala 141:18 47:14]
    node _GEN_148 = mux(_T_27, _GEN_117, UInt<1>("h0")) @[ExecuteStage.scala 141:18 49:20]
    node _GEN_149 = mux(_T_27, UInt<1>("h1"), _GEN_136) @[ExecuteStage.scala 141:18 263:21]
    node _GEN_150 = mux(_T_27, In_rd, _GEN_139) @[ExecuteStage.scala 141:18 264:25]
    node _GEN_151 = mux(_T_27, In_rd, _GEN_137) @[ExecuteStage.scala 141:18 266:18]
    node _GEN_152 = mux(_T_27, UInt<1>("h0"), _GEN_132) @[ExecuteStage.scala 141:18 40:22]
    node _GEN_153 = mux(_T_27, UInt<1>("h0"), _GEN_133) @[ExecuteStage.scala 141:18 41:24]
    node _GEN_154 = mux(_T_27, UInt<1>("h0"), _GEN_134) @[ExecuteStage.scala 141:18 39:21]
    node _GEN_155 = mux(_T_27, UInt<1>("h0"), _GEN_135) @[ExecuteStage.scala 141:18 42:22]
    node _GEN_156 = mux(_T_27, UInt<1>("h0"), _GEN_138) @[ExecuteStage.scala 141:18 44:12]
    node _GEN_157 = mux(_T_27, UInt<1>("h0"), _GEN_140) @[ExecuteStage.scala 141:18 51:21]
    node _GEN_158 = mux(_T_27, UInt<1>("h0"), _GEN_141) @[ExecuteStage.scala 141:18 52:21]
    node _GEN_159 = mux(_T_27, UInt<1>("h0"), _GEN_142) @[ExecuteStage.scala 141:18 55:27]
    node _GEN_160 = mux(_T_27, UInt<1>("h0"), _GEN_143) @[ExecuteStage.scala 141:18 53:20]
    node _GEN_161 = mux(_T_27, asSInt(UInt<1>("h0")), _GEN_144) @[ExecuteStage.scala 141:18 54:24]
    node _GEN_162 = mux(_T_27, _GEN_63, _GEN_145) @[ExecuteStage.scala 141:18]
    node _GEN_163 = mux(_T_12, _GEN_97, _GEN_148) @[ExecuteStage.scala 141:18]
    node _GEN_164 = mux(_T_12, _GEN_98, _GEN_146) @[ExecuteStage.scala 141:18]
    node _GEN_165 = mux(_T_12, _GEN_99, _GEN_147) @[ExecuteStage.scala 141:18]
    node _GEN_166 = mux(_T_12, _GEN_100, _GEN_149) @[ExecuteStage.scala 141:18]
    node _GEN_167 = mux(_T_12, _GEN_101, _GEN_150) @[ExecuteStage.scala 141:18]
    node _GEN_168 = mux(_T_12, _GEN_102, _GEN_151) @[ExecuteStage.scala 141:18]
    node _GEN_169 = mux(_T_12, _GEN_103, UInt<1>("h0")) @[ExecuteStage.scala 141:18 48:13]
    node _GEN_170 = mux(_T_12, _GEN_104, _GEN_154) @[ExecuteStage.scala 141:18]
    node _GEN_171 = mux(_T_12, _GEN_105, _GEN_152) @[ExecuteStage.scala 141:18]
    node _GEN_172 = mux(_T_12, _GEN_106, _GEN_156) @[ExecuteStage.scala 141:18]
    node _GEN_173 = mux(_T_12, _GEN_107, _GEN_155) @[ExecuteStage.scala 141:18]
    node _GEN_174 = mux(_T_12, _GEN_108, _GEN_153) @[ExecuteStage.scala 141:18]
    node _GEN_175 = mux(_T_12, UInt<1>("h0"), _GEN_157) @[ExecuteStage.scala 141:18 51:21]
    node _GEN_176 = mux(_T_12, UInt<1>("h0"), _GEN_158) @[ExecuteStage.scala 141:18 52:21]
    node _GEN_177 = mux(_T_12, UInt<1>("h0"), _GEN_159) @[ExecuteStage.scala 141:18 55:27]
    node _GEN_178 = mux(_T_12, UInt<1>("h0"), _GEN_160) @[ExecuteStage.scala 141:18 53:20]
    node _GEN_179 = mux(_T_12, asSInt(UInt<1>("h0")), _GEN_161) @[ExecuteStage.scala 141:18 54:24]
    node _GEN_180 = mux(_T_12, _GEN_63, _GEN_162) @[ExecuteStage.scala 141:18]
    io_MemPort_Address <= _GEN_171
    io_MemPort_WriteData <= _GEN_174
    io_MemPort_Enable <= _GEN_170
    io_MemPort_WriteEn <= _GEN_173
    io_Stall <= _GEN_172
    Out_WritebackMode <= WritebackMode @[ExecuteStage.scala 123:21]
    Out_WritebackRegister <= WritebackRegister @[ExecuteStage.scala 124:25]
    Out_ALUOut <= ALUOutReg @[ExecuteStage.scala 122:14]
    Out_JumpValue <= pad(COffsetReg, 18) @[ExecuteStage.scala 125:17]
    ALU.clock <= clock
    ALU.reset <= reset
    ALU.io_rs1 <= _GEN_165
    ALU.io_rs2 <= _GEN_164
    ALU.io_rd <= _GEN_169
    ALU.io_Operation <= pad(_GEN_163, 8)
    BranchComp.clock <= clock
    BranchComp.reset <= reset
    BranchComp.io_rs2 <= _GEN_175
    BranchComp.io_rs1 <= _GEN_176
    BranchComp.io_PC <= _GEN_178
    BranchComp.io_Offset <= pad(_GEN_179, 11)
    BranchComp.io_Operation <= _GEN_177
    WritebackMode <= mux(reset, UInt<4>("h0"), _GEN_166) @[ExecuteStage.scala 57:{30,30}]
    WritebackRegister <= mux(reset, UInt<4>("h0"), _GEN_167) @[ExecuteStage.scala 58:{34,34}]
    ALUOutReg <= mux(reset, UInt<18>("h0"), _GEN_60) @[ExecuteStage.scala 59:{26,26}]
    COffsetReg <= bits(mux(reset, UInt<6>("h0"), _GEN_180), 5, 0) @[ExecuteStage.scala 60:{27,27}]
    DataHazard <= mux(reset, UInt<4>("h0"), _GEN_168) @[ExecuteStage.scala 62:{27,27}]
    swStall <= mux(reset, UInt<1>("h0"), swStall) @[ExecuteStage.scala 68:{24,24,24}]
    lwStall <= mux(reset, UInt<1>("h0"), lwStall) @[ExecuteStage.scala 69:{24,24,24}]

  module Core :
    input clock : Clock
    input reset : UInt<1>
    input io_WaveIn : UInt<18>
    output io_WaveOut : UInt<18>
    output io_MemPort_Address : UInt<18>
    output io_MemPort_WriteData : UInt<18>
    output io_MemPort_Enable : UInt<1>
    output io_MemPort_WriteEn : UInt<1>
    input io_MemPort_ReadData : UInt<18>
    input io_MemPort_Completed : UInt<1>

    inst FetchStage of FetchStage @[Core.scala 25:26]
    inst DecodeStage of DecodeStage @[Core.scala 26:27]
    inst ExecuteStage of ExecuteStage @[Core.scala 27:28]
    reg x_0 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), x_0) @[Core.scala 37:14]
    reg x_1 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), x_1) @[Core.scala 37:14]
    reg x_2 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), x_2) @[Core.scala 37:14]
    reg x_3 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), x_3) @[Core.scala 37:14]
    reg x_4 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), x_4) @[Core.scala 37:14]
    reg x_5 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), x_5) @[Core.scala 37:14]
    reg x_6 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), x_6) @[Core.scala 37:14]
    reg x_7 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), x_7) @[Core.scala 37:14]
    reg x_8 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), x_8) @[Core.scala 37:14]
    reg x_9 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), x_9) @[Core.scala 37:14]
    reg x_10 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), x_10) @[Core.scala 37:14]
    reg x_11 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), x_11) @[Core.scala 37:14]
    reg x_12 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), x_12) @[Core.scala 37:14]
    reg x_13 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), x_13) @[Core.scala 37:14]
    reg x_14 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), x_14) @[Core.scala 37:14]
    reg x_15 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), x_15) @[Core.scala 37:14]
    node _T = eq(ExecuteStage.io_Stall, UInt<1>("h0")) @[Core.scala 63:8]
    node _T_1 = eq(DecodeStage.io_MiniStall, UInt<1>("h0")) @[Core.scala 63:34]
    node _T_2 = and(_T, _T_1) @[Core.scala 63:31]
    node _x_1_T = add(x_1, UInt<1>("h1")) @[Core.scala 64:18]
    node _x_1_T_1 = tail(_x_1_T, 1) @[Core.scala 64:18]
    node _GEN_0 = mux(_T_2, _x_1_T_1, x_1) @[Core.scala 63:60 64:10 37:14]
    node _T_3 = eq(UInt<1>("h1"), ExecuteStage.Out_WritebackMode) @[Core.scala 81:41]
    node _x_ExecuteStage_Out_WritebackRegister = ExecuteStage.Out_ALUOut @[Core.scala 83:{45,45}]
    node _GEN_1 = mux(eq(UInt<1>("h0"), ExecuteStage.Out_WritebackRegister), _x_ExecuteStage_Out_WritebackRegister, UInt<16>("h0")) @[Core.scala 83:{45,45} 39:8]
    node _GEN_2 = mux(eq(UInt<1>("h1"), ExecuteStage.Out_WritebackRegister), _x_ExecuteStage_Out_WritebackRegister, _GEN_0) @[Core.scala 83:{45,45}]
    node _GEN_3 = mux(eq(UInt<2>("h2"), ExecuteStage.Out_WritebackRegister), _x_ExecuteStage_Out_WritebackRegister, io_WaveIn) @[Core.scala 83:{45,45} 40:8]
    node _GEN_4 = mux(eq(UInt<2>("h3"), ExecuteStage.Out_WritebackRegister), _x_ExecuteStage_Out_WritebackRegister, x_3) @[Core.scala 37:14 83:{45,45}]
    node _GEN_5 = mux(eq(UInt<3>("h4"), ExecuteStage.Out_WritebackRegister), _x_ExecuteStage_Out_WritebackRegister, x_4) @[Core.scala 37:14 83:{45,45}]
    node _GEN_6 = mux(eq(UInt<3>("h5"), ExecuteStage.Out_WritebackRegister), _x_ExecuteStage_Out_WritebackRegister, x_5) @[Core.scala 37:14 83:{45,45}]
    node _GEN_7 = mux(eq(UInt<3>("h6"), ExecuteStage.Out_WritebackRegister), _x_ExecuteStage_Out_WritebackRegister, x_6) @[Core.scala 37:14 83:{45,45}]
    node _GEN_8 = mux(eq(UInt<3>("h7"), ExecuteStage.Out_WritebackRegister), _x_ExecuteStage_Out_WritebackRegister, x_7) @[Core.scala 37:14 83:{45,45}]
    node _GEN_9 = mux(eq(UInt<4>("h8"), ExecuteStage.Out_WritebackRegister), _x_ExecuteStage_Out_WritebackRegister, x_8) @[Core.scala 37:14 83:{45,45}]
    node _GEN_10 = mux(eq(UInt<4>("h9"), ExecuteStage.Out_WritebackRegister), _x_ExecuteStage_Out_WritebackRegister, x_9) @[Core.scala 37:14 83:{45,45}]
    node _GEN_11 = mux(eq(UInt<4>("ha"), ExecuteStage.Out_WritebackRegister), _x_ExecuteStage_Out_WritebackRegister, x_10) @[Core.scala 37:14 83:{45,45}]
    node _GEN_12 = mux(eq(UInt<4>("hb"), ExecuteStage.Out_WritebackRegister), _x_ExecuteStage_Out_WritebackRegister, x_11) @[Core.scala 37:14 83:{45,45}]
    node _GEN_13 = mux(eq(UInt<4>("hc"), ExecuteStage.Out_WritebackRegister), _x_ExecuteStage_Out_WritebackRegister, x_12) @[Core.scala 37:14 83:{45,45}]
    node _GEN_14 = mux(eq(UInt<4>("hd"), ExecuteStage.Out_WritebackRegister), _x_ExecuteStage_Out_WritebackRegister, x_13) @[Core.scala 37:14 83:{45,45}]
    node _GEN_15 = mux(eq(UInt<4>("he"), ExecuteStage.Out_WritebackRegister), _x_ExecuteStage_Out_WritebackRegister, x_14) @[Core.scala 37:14 83:{45,45}]
    node _GEN_16 = mux(eq(UInt<4>("hf"), ExecuteStage.Out_WritebackRegister), _x_ExecuteStage_Out_WritebackRegister, x_15) @[Core.scala 37:14 83:{45,45}]
    node _T_4 = eq(ExecuteStage.Out_WritebackRegister, UInt<1>("h1")) @[Core.scala 87:47]
    node _GEN_17 = mux(_T_4, UInt<1>("h1"), UInt<1>("h0")) @[Core.scala 47:23 87:55 88:29]
    node _T_5 = eq(UInt<2>("h3"), ExecuteStage.Out_WritebackMode) @[Core.scala 81:41]
    node _x_ExecuteStage_Out_WritebackRegister_0 = io_MemPort_ReadData @[Core.scala 94:{45,45}]
    node _GEN_18 = mux(eq(UInt<1>("h0"), ExecuteStage.Out_WritebackRegister), _x_ExecuteStage_Out_WritebackRegister_0, UInt<16>("h0")) @[Core.scala 94:{45,45} 39:8]
    node _GEN_19 = mux(eq(UInt<1>("h1"), ExecuteStage.Out_WritebackRegister), _x_ExecuteStage_Out_WritebackRegister_0, _GEN_0) @[Core.scala 94:{45,45}]
    node _GEN_20 = mux(eq(UInt<2>("h2"), ExecuteStage.Out_WritebackRegister), _x_ExecuteStage_Out_WritebackRegister_0, io_WaveIn) @[Core.scala 94:{45,45} 40:8]
    node _GEN_21 = mux(eq(UInt<2>("h3"), ExecuteStage.Out_WritebackRegister), _x_ExecuteStage_Out_WritebackRegister_0, x_3) @[Core.scala 37:14 94:{45,45}]
    node _GEN_22 = mux(eq(UInt<3>("h4"), ExecuteStage.Out_WritebackRegister), _x_ExecuteStage_Out_WritebackRegister_0, x_4) @[Core.scala 37:14 94:{45,45}]
    node _GEN_23 = mux(eq(UInt<3>("h5"), ExecuteStage.Out_WritebackRegister), _x_ExecuteStage_Out_WritebackRegister_0, x_5) @[Core.scala 37:14 94:{45,45}]
    node _GEN_24 = mux(eq(UInt<3>("h6"), ExecuteStage.Out_WritebackRegister), _x_ExecuteStage_Out_WritebackRegister_0, x_6) @[Core.scala 37:14 94:{45,45}]
    node _GEN_25 = mux(eq(UInt<3>("h7"), ExecuteStage.Out_WritebackRegister), _x_ExecuteStage_Out_WritebackRegister_0, x_7) @[Core.scala 37:14 94:{45,45}]
    node _GEN_26 = mux(eq(UInt<4>("h8"), ExecuteStage.Out_WritebackRegister), _x_ExecuteStage_Out_WritebackRegister_0, x_8) @[Core.scala 37:14 94:{45,45}]
    node _GEN_27 = mux(eq(UInt<4>("h9"), ExecuteStage.Out_WritebackRegister), _x_ExecuteStage_Out_WritebackRegister_0, x_9) @[Core.scala 37:14 94:{45,45}]
    node _GEN_28 = mux(eq(UInt<4>("ha"), ExecuteStage.Out_WritebackRegister), _x_ExecuteStage_Out_WritebackRegister_0, x_10) @[Core.scala 37:14 94:{45,45}]
    node _GEN_29 = mux(eq(UInt<4>("hb"), ExecuteStage.Out_WritebackRegister), _x_ExecuteStage_Out_WritebackRegister_0, x_11) @[Core.scala 37:14 94:{45,45}]
    node _GEN_30 = mux(eq(UInt<4>("hc"), ExecuteStage.Out_WritebackRegister), _x_ExecuteStage_Out_WritebackRegister_0, x_12) @[Core.scala 37:14 94:{45,45}]
    node _GEN_31 = mux(eq(UInt<4>("hd"), ExecuteStage.Out_WritebackRegister), _x_ExecuteStage_Out_WritebackRegister_0, x_13) @[Core.scala 37:14 94:{45,45}]
    node _GEN_32 = mux(eq(UInt<4>("he"), ExecuteStage.Out_WritebackRegister), _x_ExecuteStage_Out_WritebackRegister_0, x_14) @[Core.scala 37:14 94:{45,45}]
    node _GEN_33 = mux(eq(UInt<4>("hf"), ExecuteStage.Out_WritebackRegister), _x_ExecuteStage_Out_WritebackRegister_0, x_15) @[Core.scala 37:14 94:{45,45}]
    node _T_6 = eq(UInt<3>("h4"), ExecuteStage.Out_WritebackMode) @[Core.scala 81:41]
    node _GEN_34 = mux(_T_6, ExecuteStage.Out_JumpValue, _GEN_0) @[Core.scala 81:41 97:12]
    node _GEN_35 = mux(_T_6, UInt<1>("h1"), UInt<1>("h0")) @[Core.scala 47:23 81:41 98:27]
    node _GEN_36 = mux(_T_5, _GEN_18, UInt<16>("h0")) @[Core.scala 81:41 39:8]
    node _GEN_37 = mux(_T_5, _GEN_19, _GEN_34) @[Core.scala 81:41]
    node _GEN_38 = mux(_T_5, _GEN_20, io_WaveIn) @[Core.scala 81:41 40:8]
    node _GEN_39 = mux(_T_5, _GEN_21, x_3) @[Core.scala 37:14 81:41]
    node _GEN_40 = mux(_T_5, _GEN_22, x_4) @[Core.scala 37:14 81:41]
    node _GEN_41 = mux(_T_5, _GEN_23, x_5) @[Core.scala 37:14 81:41]
    node _GEN_42 = mux(_T_5, _GEN_24, x_6) @[Core.scala 37:14 81:41]
    node _GEN_43 = mux(_T_5, _GEN_25, x_7) @[Core.scala 37:14 81:41]
    node _GEN_44 = mux(_T_5, _GEN_26, x_8) @[Core.scala 37:14 81:41]
    node _GEN_45 = mux(_T_5, _GEN_27, x_9) @[Core.scala 37:14 81:41]
    node _GEN_46 = mux(_T_5, _GEN_28, x_10) @[Core.scala 37:14 81:41]
    node _GEN_47 = mux(_T_5, _GEN_29, x_11) @[Core.scala 37:14 81:41]
    node _GEN_48 = mux(_T_5, _GEN_30, x_12) @[Core.scala 37:14 81:41]
    node _GEN_49 = mux(_T_5, _GEN_31, x_13) @[Core.scala 37:14 81:41]
    node _GEN_50 = mux(_T_5, _GEN_32, x_14) @[Core.scala 37:14 81:41]
    node _GEN_51 = mux(_T_5, _GEN_33, x_15) @[Core.scala 37:14 81:41]
    node _GEN_52 = mux(_T_5, UInt<1>("h0"), _GEN_35) @[Core.scala 47:23 81:41]
    node _GEN_53 = mux(_T_3, _GEN_1, _GEN_36) @[Core.scala 81:41]
    node _GEN_54 = mux(_T_3, _GEN_2, _GEN_37) @[Core.scala 81:41]
    node _GEN_55 = mux(_T_3, _GEN_3, _GEN_38) @[Core.scala 81:41]
    node _GEN_56 = mux(_T_3, _GEN_4, _GEN_39) @[Core.scala 81:41]
    node _GEN_57 = mux(_T_3, _GEN_5, _GEN_40) @[Core.scala 81:41]
    node _GEN_58 = mux(_T_3, _GEN_6, _GEN_41) @[Core.scala 81:41]
    node _GEN_59 = mux(_T_3, _GEN_7, _GEN_42) @[Core.scala 81:41]
    node _GEN_60 = mux(_T_3, _GEN_8, _GEN_43) @[Core.scala 81:41]
    node _GEN_61 = mux(_T_3, _GEN_9, _GEN_44) @[Core.scala 81:41]
    node _GEN_62 = mux(_T_3, _GEN_10, _GEN_45) @[Core.scala 81:41]
    node _GEN_63 = mux(_T_3, _GEN_11, _GEN_46) @[Core.scala 81:41]
    node _GEN_64 = mux(_T_3, _GEN_12, _GEN_47) @[Core.scala 81:41]
    node _GEN_65 = mux(_T_3, _GEN_13, _GEN_48) @[Core.scala 81:41]
    node _GEN_66 = mux(_T_3, _GEN_14, _GEN_49) @[Core.scala 81:41]
    node _GEN_67 = mux(_T_3, _GEN_15, _GEN_50) @[Core.scala 81:41]
    node _GEN_68 = mux(_T_3, _GEN_16, _GEN_51) @[Core.scala 81:41]
    node _GEN_69 = mux(_T_3, _GEN_17, _GEN_52) @[Core.scala 81:41]
    io_WaveOut <= x_3 @[Core.scala 41:14]
    io_MemPort_Address <= ExecuteStage.io_MemPort_Address @[Core.scala 52:27]
    io_MemPort_WriteData <= ExecuteStage.io_MemPort_WriteData @[Core.scala 52:27]
    io_MemPort_Enable <= ExecuteStage.io_MemPort_Enable @[Core.scala 52:27]
    io_MemPort_WriteEn <= ExecuteStage.io_MemPort_WriteEn @[Core.scala 52:27]
    FetchStage.clock <= clock
    FetchStage.reset <= reset
    FetchStage.io_Stall <= ExecuteStage.io_Stall @[Core.scala 61:23]
    FetchStage.io_Clear <= _GEN_69
    FetchStage.In_PC <= x_1 @[Core.scala 60:20]
    DecodeStage.clock <= clock
    DecodeStage.reset <= reset
    DecodeStage.io_Clear <= _GEN_69
    DecodeStage.io_Stall <= ExecuteStage.io_Stall @[Core.scala 71:24]
    DecodeStage.In_Instruction <= FetchStage.Out_Instruction @[Core.scala 70:18]
    ExecuteStage.clock <= clock
    ExecuteStage.reset <= reset
    ExecuteStage.io_x_0 <= x_0 @[Core.scala 54:21]
    ExecuteStage.io_x_1 <= x_1 @[Core.scala 54:21]
    ExecuteStage.io_x_2 <= x_2 @[Core.scala 54:21]
    ExecuteStage.io_x_3 <= x_3 @[Core.scala 54:21]
    ExecuteStage.io_x_4 <= x_4 @[Core.scala 54:21]
    ExecuteStage.io_x_5 <= x_5 @[Core.scala 54:21]
    ExecuteStage.io_x_6 <= x_6 @[Core.scala 54:21]
    ExecuteStage.io_x_7 <= x_7 @[Core.scala 54:21]
    ExecuteStage.io_x_8 <= x_8 @[Core.scala 54:21]
    ExecuteStage.io_x_9 <= x_9 @[Core.scala 54:21]
    ExecuteStage.io_x_10 <= x_10 @[Core.scala 54:21]
    ExecuteStage.io_x_11 <= x_11 @[Core.scala 54:21]
    ExecuteStage.io_x_12 <= x_12 @[Core.scala 54:21]
    ExecuteStage.io_x_13 <= x_13 @[Core.scala 54:21]
    ExecuteStage.io_x_14 <= x_14 @[Core.scala 54:21]
    ExecuteStage.io_x_15 <= x_15 @[Core.scala 54:21]
    ExecuteStage.io_MemPort_ReadData <= io_MemPort_ReadData @[Core.scala 52:27]
    ExecuteStage.io_MemPort_Completed <= io_MemPort_Completed @[Core.scala 52:27]
    ExecuteStage.io_Clear <= _GEN_69
    ExecuteStage.In_Type <= DecodeStage.Out_Type @[Core.scala 76:19]
    ExecuteStage.In_rs1 <= DecodeStage.Out_rs1 @[Core.scala 76:19]
    ExecuteStage.In_rs2 <= DecodeStage.Out_rs2 @[Core.scala 76:19]
    ExecuteStage.In_rd <= DecodeStage.Out_rd @[Core.scala 76:19]
    ExecuteStage.In_AImmediate <= DecodeStage.Out_AImmediate @[Core.scala 76:19]
    ExecuteStage.In_ASImmediate <= DecodeStage.Out_ASImmediate @[Core.scala 76:19]
    ExecuteStage.In_AOperation <= DecodeStage.Out_AOperation @[Core.scala 76:19]
    ExecuteStage.In_MemOp <= DecodeStage.Out_MemOp @[Core.scala 76:19]
    ExecuteStage.In_MemAddress <= DecodeStage.Out_MemAddress @[Core.scala 76:19]
    ExecuteStage.In_COperation <= DecodeStage.Out_COperation @[Core.scala 76:19]
    ExecuteStage.In_COffset <= DecodeStage.Out_COffset @[Core.scala 76:19]
    x_0 <= _GEN_53
    x_1 <= _GEN_54
    x_2 <= _GEN_55
    x_3 <= _GEN_56
    x_4 <= _GEN_57
    x_5 <= _GEN_58
    x_6 <= _GEN_59
    x_7 <= _GEN_60
    x_8 <= _GEN_61
    x_9 <= _GEN_62
    x_10 <= _GEN_63
    x_11 <= _GEN_64
    x_12 <= _GEN_65
    x_13 <= _GEN_66
    x_14 <= _GEN_67
    x_15 <= _GEN_68

  module DataMemory :
    input clock : Clock
    input reset : UInt<1>
    input io_MemPort_0_Address : UInt<18>
    input io_MemPort_0_WriteData : UInt<18>
    input io_MemPort_0_Enable : UInt<1>
    input io_MemPort_0_WriteEn : UInt<1>
    output io_MemPort_0_ReadData : UInt<18>
    output io_MemPort_0_Completed : UInt<1>
    input io_MemPort_1_Address : UInt<18>
    input io_MemPort_1_WriteData : UInt<18>
    input io_MemPort_1_Enable : UInt<1>
    input io_MemPort_1_WriteEn : UInt<1>
    output io_MemPort_1_ReadData : UInt<18>
    output io_MemPort_1_Completed : UInt<1>
    output io_Registers_Address : UInt<18>
    output io_Registers_WriteData : UInt<18>
    output io_Registers_Enable : UInt<1>
    output io_Registers_WriteEn : UInt<1>
    input io_Registers_ReadData : UInt<18>
    input io_Registers_Completed : UInt<1>
    output io_SPIMemPort_Address : UInt<18>
    output io_SPIMemPort_WriteData : UInt<18>
    output io_SPIMemPort_Enable : UInt<1>
    output io_SPIMemPort_WriteEn : UInt<1>
    input io_SPIMemPort_ReadData : UInt<18>
    input io_SPIMemPort_Completed : UInt<1>

    mem Memory : @[DataMemory.scala 16:27]
      data-type => UInt<18>
      depth => 2048
      read-latency => 1
      write-latency => 1
      reader => io_MemPort_ReadData_MPORT
      writer => MPORT
      read-under-write => undefined
    reg CompleteDelayInternal : UInt<1>, clock with :
      reset => (UInt<1>("h0"), CompleteDelayInternal) @[DataMemory.scala 29:38]
    reg CompleteDelayRegister : UInt<1>, clock with :
      reset => (UInt<1>("h0"), CompleteDelayRegister) @[DataMemory.scala 30:38]
    reg ProducerReg : UInt<2>, clock with :
      reset => (UInt<1>("h0"), ProducerReg) @[DataMemory.scala 45:28]
    reg Taken : UInt<1>, clock with :
      reset => (UInt<1>("h0"), Taken) @[DataMemory.scala 46:22]
    node _T = bits(Taken, 0, 0) @[DataMemory.scala 51:17]
    node _T_1 = eq(_T, UInt<1>("h0")) @[DataMemory.scala 51:10]
    node _T_2 = and(_T_1, io_MemPort_0_Enable) @[DataMemory.scala 51:24]
    node _GEN_0 = mux(_T_2, UInt<1>("h1"), Taken) @[DataMemory.scala 51:48 52:13 46:22]
    node _GEN_1 = mux(_T_2, UInt<1>("h0"), ProducerReg) @[DataMemory.scala 48:12 51:48 53:16]
    node _T_3 = bits(Taken, 0, 0) @[DataMemory.scala 51:17]
    node _T_4 = eq(_T_3, UInt<1>("h0")) @[DataMemory.scala 51:10]
    node _T_5 = and(_T_4, io_MemPort_1_Enable) @[DataMemory.scala 51:24]
    node _GEN_2 = mux(_T_5, UInt<1>("h1"), _GEN_0) @[DataMemory.scala 51:48 52:13]
    node _GEN_3 = mux(_T_5, UInt<1>("h1"), _GEN_1) @[DataMemory.scala 51:48 53:16]
    node _T_6 = bits(CompleteDelayInternal, 0, 0) @[DataMemory.scala 58:30]
    node _T_7 = bits(CompleteDelayRegister, 0, 0) @[DataMemory.scala 58:62]
    node _T_8 = or(_T_6, _T_7) @[DataMemory.scala 58:37]
    node _GEN_4 = mux(_T_8, UInt<1>("h0"), CompleteDelayInternal) @[DataMemory.scala 58:69 60:27 29:38]
    node _GEN_5 = mux(_T_8, UInt<1>("h0"), _GEN_2) @[DataMemory.scala 58:69 61:11]
    node Producer = _GEN_3 @[DataMemory.scala 44:22]
    node _T_9 = bits(Producer, 0, 0)
    node _GEN_6 = validif(eq(UInt<1>("h0"), _T_9), io_MemPort_0_Enable) @[DataMemory.scala 66:{36,36}]
    node _GEN_7 = mux(eq(UInt<1>("h1"), _T_9), io_MemPort_1_Enable, _GEN_6) @[DataMemory.scala 66:{36,36}]
    node _T_10 = bits(Producer, 0, 0)
    node _GEN_8 = validif(eq(UInt<1>("h0"), _T_10), io_MemPort_0_Address) @[DataMemory.scala 67:{39,39}]
    node _GEN_9 = mux(eq(UInt<1>("h1"), _T_10), io_MemPort_1_Address, _GEN_8) @[DataMemory.scala 67:{39,39}]
    node _io_MemPort_T_10_Address = _GEN_9 @[DataMemory.scala 67:39]
    node _T_11 = leq(_io_MemPort_T_10_Address, UInt<11>("h7ff")) @[DataMemory.scala 67:39]
    node _T_12 = bits(CompleteDelayInternal, 0, 0) @[DataMemory.scala 67:74]
    node _T_13 = or(_T_11, _T_12) @[DataMemory.scala 67:49]
    node _T_14 = bits(Producer, 0, 0)
    node _io_MemPort_T_14_Completed = UInt<1>("h1") @[DataMemory.scala 86:{38,38}]
    node _GEN_10 = mux(eq(UInt<1>("h0"), _T_14), _io_MemPort_T_14_Completed, UInt<1>("h0")) @[DataMemory.scala 36:29 86:{38,38}]
    node _GEN_11 = mux(eq(UInt<1>("h1"), _T_14), _io_MemPort_T_14_Completed, UInt<1>("h0")) @[DataMemory.scala 36:29 86:{38,38}]
    node _T_15 = bits(Producer, 0, 0)
    node _GEN_12 = validif(eq(UInt<1>("h0"), _T_15), io_MemPort_0_WriteEn) @[DataMemory.scala 88:{41,41}]
    node _GEN_13 = mux(eq(UInt<1>("h1"), _T_15), io_MemPort_1_WriteEn, _GEN_12) @[DataMemory.scala 88:{41,41}]
    node _T_16 = bits(Producer, 0, 0)
    node _T_17 = bits(Producer, 0, 0)
    node _GEN_14 = validif(eq(UInt<1>("h0"), _T_16), io_MemPort_0_Address)
    node _GEN_15 = mux(eq(UInt<1>("h1"), _T_16), io_MemPort_1_Address, _GEN_14)
    node _io_MemPort_T_16_Address = _GEN_15
    node _T_18 = bits(_io_MemPort_T_16_Address, 10, 0)
    node _GEN_16 = validif(eq(UInt<1>("h0"), _T_17), io_MemPort_0_WriteData)
    node _GEN_17 = mux(eq(UInt<1>("h1"), _T_17), io_MemPort_1_WriteData, _GEN_16)
    node _T_19 = bits(Producer, 0, 0)
    node _io_MemPort_ReadData_T = bits(Producer, 0, 0)
    node _GEN_18 = validif(eq(UInt<1>("h0"), _io_MemPort_ReadData_T), io_MemPort_0_Address) @[DataMemory.scala 91:{53,53}]
    node _GEN_19 = mux(eq(UInt<1>("h1"), _io_MemPort_ReadData_T), io_MemPort_1_Address, _GEN_18) @[DataMemory.scala 91:{53,53}]
    node _io_MemPort_io_MemPort_ReadData_T_Address = _GEN_19 @[DataMemory.scala 91:53]
    node _GEN_20 = validif(UInt<1>("h1"), _io_MemPort_io_MemPort_ReadData_T_Address) @[DataMemory.scala 91:{53,53}]
    node _io_MemPort_ReadData_WIRE = _GEN_20 @[DataMemory.scala 91:53]
    node _io_MemPort_ReadData_T_1 = or(_io_MemPort_ReadData_WIRE, UInt<11>("h0")) @[DataMemory.scala 91:53]
    node _io_MemPort_ReadData_T_2 = bits(_io_MemPort_ReadData_T_1, 10, 0) @[DataMemory.scala 91:53]
    node _GEN_21 = mux(UInt<1>("h1"), UInt<1>("h1"), UInt<1>("h0")) @[DataMemory.scala 16:27 91:{53,53}]
    node _GEN_22 = validif(UInt<1>("h1"), _io_MemPort_ReadData_T_2) @[DataMemory.scala 91:{53,53}]
    node _GEN_23 = validif(UInt<1>("h1"), clock) @[DataMemory.scala 91:{53,53}]
    node _io_MemPort_T_19_ReadData = Memory.io_MemPort_ReadData_MPORT.data @[DataMemory.scala 91:{39,39}]
    node _GEN_24 = mux(eq(UInt<1>("h0"), _T_19), _io_MemPort_T_19_ReadData, UInt<1>("h0")) @[DataMemory.scala 35:28 91:{39,39}]
    node _GEN_25 = mux(eq(UInt<1>("h1"), _T_19), _io_MemPort_T_19_ReadData, UInt<1>("h0")) @[DataMemory.scala 35:28 91:{39,39}]
    node _T_20 = bits(Producer, 0, 0)
    node _io_MemPort_T_15_WriteEn = _GEN_13 @[DataMemory.scala 88:41]
    node _GEN_26 = validif(_io_MemPort_T_15_WriteEn, _T_18) @[DataMemory.scala 88:41]
    node _GEN_27 = validif(_io_MemPort_T_15_WriteEn, clock) @[DataMemory.scala 88:41]
    node _GEN_28 = mux(_io_MemPort_T_15_WriteEn, UInt<1>("h1"), UInt<1>("h0")) @[DataMemory.scala 16:27 88:41]
    node _GEN_29 = validif(_io_MemPort_T_15_WriteEn, UInt<1>("h1")) @[DataMemory.scala 88:41]
    node _io_MemPort_T_17_WriteData = _GEN_17
    node _GEN_30 = validif(_io_MemPort_T_15_WriteEn, _io_MemPort_T_17_WriteData) @[DataMemory.scala 88:41]
    node _GEN_31 = mux(_io_MemPort_T_15_WriteEn, UInt<1>("h0"), _GEN_21) @[DataMemory.scala 16:27 88:41]
    node _GEN_32 = validif(eq(_io_MemPort_T_15_WriteEn, UInt<1>("h0")), _GEN_22) @[DataMemory.scala 88:41]
    node _GEN_33 = validif(eq(_io_MemPort_T_15_WriteEn, UInt<1>("h0")), _GEN_23) @[DataMemory.scala 88:41]
    node _GEN_34 = mux(_io_MemPort_T_15_WriteEn, UInt<1>("h0"), _GEN_24) @[DataMemory.scala 35:28 88:41]
    node _GEN_35 = mux(_io_MemPort_T_15_WriteEn, UInt<1>("h0"), _GEN_25) @[DataMemory.scala 35:28 88:41]
    node _GEN_36 = mux(_io_MemPort_T_15_WriteEn, _GEN_4, UInt<1>("h1")) @[DataMemory.scala 88:41 93:31]
    node _T_21 = bits(Producer, 0, 0)
    node _GEN_37 = validif(eq(UInt<1>("h0"), _T_21), io_MemPort_0_Address) @[DataMemory.scala 112:{45,45}]
    node _GEN_38 = mux(eq(UInt<1>("h1"), _T_21), io_MemPort_1_Address, _GEN_37) @[DataMemory.scala 112:{45,45}]
    node _io_MemPort_T_21_Address = _GEN_38 @[DataMemory.scala 112:45]
    node _T_22 = leq(_io_MemPort_T_21_Address, UInt<12>("h87f")) @[DataMemory.scala 112:45]
    node _io_Registers_Address_T = bits(Producer, 0, 0)
    node _GEN_39 = validif(eq(UInt<1>("h0"), _io_Registers_Address_T), io_MemPort_0_Address) @[DataMemory.scala 114:{61,61}]
    node _GEN_40 = mux(eq(UInt<1>("h1"), _io_Registers_Address_T), io_MemPort_1_Address, _GEN_39) @[DataMemory.scala 114:{61,61}]
    node _io_MemPort_io_Registers_Address_T_Address = _GEN_40 @[DataMemory.scala 114:61]
    node _io_Registers_Address_T_1 = sub(_io_MemPort_io_Registers_Address_T_Address, UInt<12>("h87f")) @[DataMemory.scala 114:61]
    node _io_Registers_Address_T_2 = tail(_io_Registers_Address_T_1, 1) @[DataMemory.scala 114:61]
    node _io_Registers_Address_T_3 = bits(_io_Registers_Address_T_2, 5, 0) @[DataMemory.scala 114:70]
    node _T_23 = bits(Producer, 0, 0)
    node _io_MemPort_T_23_Completed = UInt<1>("h1") @[DataMemory.scala 116:{38,38}]
    node _GEN_41 = mux(eq(UInt<1>("h0"), _T_23), _io_MemPort_T_23_Completed, UInt<1>("h0")) @[DataMemory.scala 116:{38,38} 36:29]
    node _GEN_42 = mux(eq(UInt<1>("h1"), _T_23), _io_MemPort_T_23_Completed, UInt<1>("h0")) @[DataMemory.scala 116:{38,38} 36:29]
    node _T_24 = bits(Producer, 0, 0)
    node _GEN_43 = validif(eq(UInt<1>("h0"), _T_24), io_MemPort_0_WriteEn) @[DataMemory.scala 118:{41,41}]
    node _GEN_44 = mux(eq(UInt<1>("h1"), _T_24), io_MemPort_1_WriteEn, _GEN_43) @[DataMemory.scala 118:{41,41}]
    node _io_Registers_WriteData_T = bits(Producer, 0, 0)
    node _GEN_45 = validif(eq(UInt<1>("h0"), _io_Registers_WriteData_T), io_MemPort_0_WriteData) @[DataMemory.scala 119:{32,32}]
    node _GEN_46 = mux(eq(UInt<1>("h1"), _io_Registers_WriteData_T), io_MemPort_1_WriteData, _GEN_45) @[DataMemory.scala 119:{32,32}]
    node _T_25 = bits(Producer, 0, 0)
    node _io_MemPort_T_25_ReadData = io_Registers_ReadData @[DataMemory.scala 121:{39,39}]
    node _GEN_47 = mux(eq(UInt<1>("h0"), _T_25), _io_MemPort_T_25_ReadData, UInt<1>("h0")) @[DataMemory.scala 121:{39,39} 35:28]
    node _GEN_48 = mux(eq(UInt<1>("h1"), _T_25), _io_MemPort_T_25_ReadData, UInt<1>("h0")) @[DataMemory.scala 121:{39,39} 35:28]
    node _io_MemPort_T_24_WriteEn = _GEN_44 @[DataMemory.scala 118:41]
    node _io_MemPort_io_Registers_WriteData_T_WriteData = _GEN_46 @[DataMemory.scala 119:32]
    node _GEN_49 = mux(_io_MemPort_T_24_WriteEn, _io_MemPort_io_Registers_WriteData_T_WriteData, UInt<1>("h0")) @[DataMemory.scala 118:41 119:32 23:26]
    node _GEN_50 = mux(_io_MemPort_T_24_WriteEn, UInt<1>("h0"), _GEN_47) @[DataMemory.scala 118:41 35:28]
    node _GEN_51 = mux(_io_MemPort_T_24_WriteEn, UInt<1>("h0"), _GEN_48) @[DataMemory.scala 118:41 35:28]
    node _T_26 = bits(Producer, 0, 0)
    node _io_MemPort_T_26_ReadData = io_SPIMemPort_ReadData @[DataMemory.scala 126:{37,37}]
    node _GEN_52 = mux(eq(UInt<1>("h0"), _T_26), _io_MemPort_T_26_ReadData, UInt<1>("h0")) @[DataMemory.scala 126:{37,37} 35:28]
    node _GEN_53 = mux(eq(UInt<1>("h1"), _T_26), _io_MemPort_T_26_ReadData, UInt<1>("h0")) @[DataMemory.scala 126:{37,37} 35:28]
    node _T_27 = bits(Producer, 0, 0)
    node _io_MemPort_T_27_Completed = io_SPIMemPort_Completed @[DataMemory.scala 127:{38,38}]
    node _GEN_54 = mux(eq(UInt<1>("h0"), _T_27), _io_MemPort_T_27_Completed, UInt<1>("h0")) @[DataMemory.scala 127:{38,38} 36:29]
    node _GEN_55 = mux(eq(UInt<1>("h1"), _T_27), _io_MemPort_T_27_Completed, UInt<1>("h0")) @[DataMemory.scala 127:{38,38} 36:29]
    node _io_SPIMemPort_Address_T = bits(Producer, 0, 0)
    node _GEN_56 = validif(eq(UInt<1>("h0"), _io_SPIMemPort_Address_T), io_MemPort_0_Address) @[DataMemory.scala 129:{61,61}]
    node _GEN_57 = mux(eq(UInt<1>("h1"), _io_SPIMemPort_Address_T), io_MemPort_1_Address, _GEN_56) @[DataMemory.scala 129:{61,61}]
    node _io_MemPort_io_SPIMemPort_Address_T_Address = _GEN_57 @[DataMemory.scala 129:61]
    node _io_SPIMemPort_Address_T_1 = add(_io_MemPort_io_SPIMemPort_Address_T_Address, UInt<1>("h0")) @[DataMemory.scala 129:61]
    node _io_SPIMemPort_Address_T_2 = tail(_io_SPIMemPort_Address_T_1, 1) @[DataMemory.scala 129:61]
    node _io_SPIMemPort_WriteData_T = bits(Producer, 0, 0)
    node _GEN_58 = validif(eq(UInt<1>("h0"), _io_SPIMemPort_WriteData_T), io_MemPort_0_WriteData) @[DataMemory.scala 130:{31,31}]
    node _GEN_59 = mux(eq(UInt<1>("h1"), _io_SPIMemPort_WriteData_T), io_MemPort_1_WriteData, _GEN_58) @[DataMemory.scala 130:{31,31}]
    node _io_SPIMemPort_Enable_T = bits(Producer, 0, 0)
    node _GEN_60 = validif(eq(UInt<1>("h0"), _io_SPIMemPort_Enable_T), io_MemPort_0_Enable) @[DataMemory.scala 131:{28,28}]
    node _GEN_61 = mux(eq(UInt<1>("h1"), _io_SPIMemPort_Enable_T), io_MemPort_1_Enable, _GEN_60) @[DataMemory.scala 131:{28,28}]
    node _io_SPIMemPort_WriteEn_T = bits(Producer, 0, 0)
    node _GEN_62 = validif(eq(UInt<1>("h0"), _io_SPIMemPort_WriteEn_T), io_MemPort_0_WriteEn) @[DataMemory.scala 132:{29,29}]
    node _GEN_63 = mux(eq(UInt<1>("h1"), _io_SPIMemPort_WriteEn_T), io_MemPort_1_WriteEn, _GEN_62) @[DataMemory.scala 132:{29,29}]
    node _GEN_64 = mux(_T_22, _io_Registers_Address_T_3, UInt<1>("h0")) @[DataMemory.scala 112:55 114:28 22:24]
    node _GEN_65 = mux(_T_22, UInt<1>("h1"), UInt<1>("h0")) @[DataMemory.scala 112:55 115:28 25:24]
    node _GEN_66 = mux(_T_22, _GEN_41, _GEN_54) @[DataMemory.scala 112:55]
    node _GEN_67 = mux(_T_22, _GEN_42, _GEN_55) @[DataMemory.scala 112:55]
    node _GEN_68 = mux(_T_22, _GEN_49, UInt<1>("h0")) @[DataMemory.scala 112:55 23:26]
    node _GEN_69 = mux(_T_22, _GEN_50, _GEN_52) @[DataMemory.scala 112:55]
    node _GEN_70 = mux(_T_22, _GEN_51, _GEN_53) @[DataMemory.scala 112:55]
    node _GEN_71 = mux(_T_22, UInt<1>("h0"), _io_SPIMemPort_Address_T_2) @[DataMemory.scala 112:55 40:25 129:29]
    node _io_MemPort_io_SPIMemPort_WriteData_T_WriteData = _GEN_59 @[DataMemory.scala 130:31]
    node _GEN_72 = mux(_T_22, UInt<1>("h0"), _io_MemPort_io_SPIMemPort_WriteData_T_WriteData) @[DataMemory.scala 112:55 41:27 130:31]
    node _io_MemPort_io_SPIMemPort_Enable_T_Enable = _GEN_61 @[DataMemory.scala 131:28]
    node _GEN_73 = mux(_T_22, UInt<1>("h0"), _io_MemPort_io_SPIMemPort_Enable_T_Enable) @[DataMemory.scala 112:55 39:24 131:28]
    node _io_MemPort_io_SPIMemPort_WriteEn_T_WriteEn = _GEN_63 @[DataMemory.scala 132:29]
    node _GEN_74 = mux(_T_22, UInt<1>("h0"), _io_MemPort_io_SPIMemPort_WriteEn_T_WriteEn) @[DataMemory.scala 112:55 42:25 132:29]
    node _GEN_75 = mux(_T_13, _GEN_10, _GEN_66) @[DataMemory.scala 67:81]
    node _GEN_76 = mux(_T_13, _GEN_11, _GEN_67) @[DataMemory.scala 67:81]
    node _GEN_77 = validif(_T_13, _GEN_26) @[DataMemory.scala 67:81]
    node _GEN_78 = validif(_T_13, _GEN_27) @[DataMemory.scala 67:81]
    node _GEN_79 = mux(_T_13, _GEN_28, UInt<1>("h0")) @[DataMemory.scala 16:27 67:81]
    node _GEN_80 = validif(_T_13, _GEN_29) @[DataMemory.scala 67:81]
    node _GEN_81 = validif(_T_13, _GEN_30) @[DataMemory.scala 67:81]
    node _GEN_82 = mux(_T_13, _GEN_31, UInt<1>("h0")) @[DataMemory.scala 16:27 67:81]
    node _GEN_83 = validif(_T_13, _GEN_32) @[DataMemory.scala 67:81]
    node _GEN_84 = validif(_T_13, _GEN_33) @[DataMemory.scala 67:81]
    node _GEN_85 = mux(_T_13, _GEN_34, _GEN_69) @[DataMemory.scala 67:81]
    node _GEN_86 = mux(_T_13, _GEN_35, _GEN_70) @[DataMemory.scala 67:81]
    node _GEN_87 = mux(_T_13, _GEN_36, _GEN_4) @[DataMemory.scala 67:81]
    node _GEN_88 = mux(_T_13, UInt<1>("h0"), _GEN_64) @[DataMemory.scala 22:24 67:81]
    node _GEN_89 = mux(_T_13, UInt<1>("h0"), _GEN_65) @[DataMemory.scala 25:24 67:81]
    node _GEN_90 = mux(_T_13, UInt<1>("h0"), _GEN_68) @[DataMemory.scala 23:26 67:81]
    node _GEN_91 = mux(_T_13, UInt<1>("h0"), _GEN_71) @[DataMemory.scala 40:25 67:81]
    node _GEN_92 = mux(_T_13, UInt<1>("h0"), _GEN_72) @[DataMemory.scala 41:27 67:81]
    node _GEN_93 = mux(_T_13, UInt<1>("h0"), _GEN_73) @[DataMemory.scala 39:24 67:81]
    node _GEN_94 = mux(_T_13, UInt<1>("h0"), _GEN_74) @[DataMemory.scala 42:25 67:81]
    node _io_MemPort_T_9_Enable = _GEN_7 @[DataMemory.scala 66:36]
    node _GEN_95 = mux(_io_MemPort_T_9_Enable, _GEN_75, UInt<1>("h0")) @[DataMemory.scala 36:29 66:36]
    node _GEN_96 = mux(_io_MemPort_T_9_Enable, _GEN_76, UInt<1>("h0")) @[DataMemory.scala 36:29 66:36]
    node _GEN_97 = validif(_io_MemPort_T_9_Enable, _GEN_77) @[DataMemory.scala 66:36]
    node _GEN_98 = validif(_io_MemPort_T_9_Enable, _GEN_78) @[DataMemory.scala 66:36]
    node _GEN_99 = mux(_io_MemPort_T_9_Enable, _GEN_79, UInt<1>("h0")) @[DataMemory.scala 16:27 66:36]
    node _GEN_100 = validif(_io_MemPort_T_9_Enable, _GEN_80) @[DataMemory.scala 66:36]
    node _GEN_101 = validif(_io_MemPort_T_9_Enable, _GEN_81) @[DataMemory.scala 66:36]
    node _GEN_102 = mux(_io_MemPort_T_9_Enable, _GEN_82, UInt<1>("h0")) @[DataMemory.scala 16:27 66:36]
    node _GEN_103 = validif(_io_MemPort_T_9_Enable, _GEN_83) @[DataMemory.scala 66:36]
    node _GEN_104 = validif(_io_MemPort_T_9_Enable, _GEN_84) @[DataMemory.scala 66:36]
    node _GEN_105 = mux(_io_MemPort_T_9_Enable, _GEN_85, UInt<1>("h0")) @[DataMemory.scala 35:28 66:36]
    node _GEN_106 = mux(_io_MemPort_T_9_Enable, _GEN_86, UInt<1>("h0")) @[DataMemory.scala 35:28 66:36]
    node _GEN_107 = mux(_io_MemPort_T_9_Enable, _GEN_87, _GEN_4) @[DataMemory.scala 66:36]
    node _GEN_108 = mux(_io_MemPort_T_9_Enable, _GEN_88, UInt<1>("h0")) @[DataMemory.scala 22:24 66:36]
    node _GEN_109 = mux(_io_MemPort_T_9_Enable, _GEN_89, UInt<1>("h0")) @[DataMemory.scala 25:24 66:36]
    node _GEN_110 = mux(_io_MemPort_T_9_Enable, _GEN_90, UInt<1>("h0")) @[DataMemory.scala 23:26 66:36]
    node _GEN_111 = mux(_io_MemPort_T_9_Enable, _GEN_91, UInt<1>("h0")) @[DataMemory.scala 40:25 66:36]
    node _GEN_112 = mux(_io_MemPort_T_9_Enable, _GEN_92, UInt<1>("h0")) @[DataMemory.scala 41:27 66:36]
    node _GEN_113 = mux(_io_MemPort_T_9_Enable, _GEN_93, UInt<1>("h0")) @[DataMemory.scala 39:24 66:36]
    node _GEN_114 = mux(_io_MemPort_T_9_Enable, _GEN_94, UInt<1>("h0")) @[DataMemory.scala 42:25 66:36]
    io_MemPort_0_ReadData <= _GEN_105
    io_MemPort_0_Completed <= _GEN_95
    io_MemPort_1_ReadData <= _GEN_106
    io_MemPort_1_Completed <= _GEN_96
    io_Registers_Address <= pad(_GEN_108, 18)
    io_Registers_WriteData <= _GEN_110
    io_Registers_Enable <= UInt<1>("h0") @[DataMemory.scala 24:23]
    io_Registers_WriteEn <= _GEN_109
    io_SPIMemPort_Address <= _GEN_111
    io_SPIMemPort_WriteData <= _GEN_112
    io_SPIMemPort_Enable <= _GEN_113
    io_SPIMemPort_WriteEn <= _GEN_114
    Memory.io_MemPort_ReadData_MPORT.addr <= _GEN_103
    Memory.io_MemPort_ReadData_MPORT.en <= _GEN_102
    Memory.io_MemPort_ReadData_MPORT.clk <= _GEN_104
    Memory.MPORT.addr <= _GEN_97
    Memory.MPORT.en <= _GEN_99
    Memory.MPORT.clk <= _GEN_98
    Memory.MPORT.data <= _GEN_101
    Memory.MPORT.mask <= _GEN_100
    CompleteDelayInternal <= mux(reset, UInt<1>("h0"), _GEN_107) @[DataMemory.scala 29:{38,38}]
    CompleteDelayRegister <= mux(reset, UInt<1>("h0"), CompleteDelayRegister) @[DataMemory.scala 30:{38,38,38}]
    ProducerReg <= mux(reset, UInt<2>("h0"), _GEN_3) @[DataMemory.scala 45:{28,28}]
    Taken <= mux(reset, UInt<1>("h0"), _GEN_5) @[DataMemory.scala 46:{22,22}]

  module FirEngine :
    input clock : Clock
    input reset : UInt<1>
    input io_WaveIn : UInt<18>
    output io_WaveOut : UInt<18>
    input io_Registers_Address : UInt<18>
    input io_Registers_WriteData : UInt<18>
    input io_Registers_Enable : UInt<1>
    input io_Registers_WriteEn : UInt<1>
    output io_Registers_ReadData : UInt<18>
    output io_Registers_Completed : UInt<1>
    output io_MemPort_Address : UInt<18>
    output io_MemPort_WriteData : UInt<18>
    output io_MemPort_Enable : UInt<1>
    output io_MemPort_WriteEn : UInt<1>
    input io_MemPort_ReadData : UInt<18>
    input io_MemPort_Completed : UInt<1>

    reg DataReg_0 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_0) @[FirEngine.scala 26:20]
    reg DataReg_1 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_1) @[FirEngine.scala 26:20]
    reg DataReg_2 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_2) @[FirEngine.scala 26:20]
    reg DataReg_3 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_3) @[FirEngine.scala 26:20]
    reg DataReg_4 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_4) @[FirEngine.scala 26:20]
    reg DataReg_5 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_5) @[FirEngine.scala 26:20]
    reg DataReg_6 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_6) @[FirEngine.scala 26:20]
    reg DataReg_7 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_7) @[FirEngine.scala 26:20]
    reg DataReg_8 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_8) @[FirEngine.scala 26:20]
    reg DataReg_9 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_9) @[FirEngine.scala 26:20]
    reg DataReg_10 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_10) @[FirEngine.scala 26:20]
    reg DataReg_11 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_11) @[FirEngine.scala 26:20]
    reg DataReg_12 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_12) @[FirEngine.scala 26:20]
    reg DataReg_13 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_13) @[FirEngine.scala 26:20]
    reg DataReg_14 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_14) @[FirEngine.scala 26:20]
    reg DataReg_15 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_15) @[FirEngine.scala 26:20]
    reg DataReg_16 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_16) @[FirEngine.scala 26:20]
    reg DataReg_17 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_17) @[FirEngine.scala 26:20]
    reg DataReg_18 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_18) @[FirEngine.scala 26:20]
    reg DataReg_19 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_19) @[FirEngine.scala 26:20]
    reg DataReg_20 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_20) @[FirEngine.scala 26:20]
    reg DataReg_21 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_21) @[FirEngine.scala 26:20]
    reg DataReg_22 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_22) @[FirEngine.scala 26:20]
    reg DataReg_23 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_23) @[FirEngine.scala 26:20]
    reg DataReg_24 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_24) @[FirEngine.scala 26:20]
    reg DataReg_25 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_25) @[FirEngine.scala 26:20]
    reg DataReg_26 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_26) @[FirEngine.scala 26:20]
    reg DataReg_27 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_27) @[FirEngine.scala 26:20]
    reg DataReg_28 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_28) @[FirEngine.scala 26:20]
    reg DataReg_29 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_29) @[FirEngine.scala 26:20]
    reg DataReg_30 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_30) @[FirEngine.scala 26:20]
    reg DataReg_31 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_31) @[FirEngine.scala 26:20]
    reg DataReg_32 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_32) @[FirEngine.scala 26:20]
    reg DataReg_33 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_33) @[FirEngine.scala 26:20]
    reg DataReg_34 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_34) @[FirEngine.scala 26:20]
    reg DataReg_35 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_35) @[FirEngine.scala 26:20]
    reg DataReg_36 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_36) @[FirEngine.scala 26:20]
    reg DataReg_37 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_37) @[FirEngine.scala 26:20]
    reg DataReg_38 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_38) @[FirEngine.scala 26:20]
    reg DataReg_39 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_39) @[FirEngine.scala 26:20]
    reg DataReg_40 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_40) @[FirEngine.scala 26:20]
    reg DataReg_41 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_41) @[FirEngine.scala 26:20]
    reg DataReg_42 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_42) @[FirEngine.scala 26:20]
    reg DataReg_43 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_43) @[FirEngine.scala 26:20]
    reg DataReg_44 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_44) @[FirEngine.scala 26:20]
    reg DataReg_45 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_45) @[FirEngine.scala 26:20]
    reg DataReg_46 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_46) @[FirEngine.scala 26:20]
    reg DataReg_47 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_47) @[FirEngine.scala 26:20]
    reg DataReg_48 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_48) @[FirEngine.scala 26:20]
    reg DataReg_49 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_49) @[FirEngine.scala 26:20]
    reg DataReg_50 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_50) @[FirEngine.scala 26:20]
    reg DataReg_51 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_51) @[FirEngine.scala 26:20]
    reg DataReg_52 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_52) @[FirEngine.scala 26:20]
    reg DataReg_53 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_53) @[FirEngine.scala 26:20]
    reg DataReg_54 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_54) @[FirEngine.scala 26:20]
    reg DataReg_55 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_55) @[FirEngine.scala 26:20]
    reg DataReg_56 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_56) @[FirEngine.scala 26:20]
    reg DataReg_57 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_57) @[FirEngine.scala 26:20]
    reg DataReg_58 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_58) @[FirEngine.scala 26:20]
    reg DataReg_59 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_59) @[FirEngine.scala 26:20]
    reg DataReg_60 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_60) @[FirEngine.scala 26:20]
    reg DataReg_61 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_61) @[FirEngine.scala 26:20]
    reg DataReg_62 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_62) @[FirEngine.scala 26:20]
    reg DataReg_63 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_63) @[FirEngine.scala 26:20]
    reg DataReg_64 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_64) @[FirEngine.scala 26:20]
    reg DataReg_65 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_65) @[FirEngine.scala 26:20]
    reg DataReg_66 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_66) @[FirEngine.scala 26:20]
    reg DataReg_67 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_67) @[FirEngine.scala 26:20]
    reg DataReg_68 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_68) @[FirEngine.scala 26:20]
    reg DataReg_69 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_69) @[FirEngine.scala 26:20]
    reg DataReg_70 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_70) @[FirEngine.scala 26:20]
    reg DataReg_71 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_71) @[FirEngine.scala 26:20]
    reg DataReg_72 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_72) @[FirEngine.scala 26:20]
    reg DataReg_73 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_73) @[FirEngine.scala 26:20]
    reg DataReg_74 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_74) @[FirEngine.scala 26:20]
    reg DataReg_75 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_75) @[FirEngine.scala 26:20]
    reg DataReg_76 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_76) @[FirEngine.scala 26:20]
    reg DataReg_77 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_77) @[FirEngine.scala 26:20]
    reg DataReg_78 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_78) @[FirEngine.scala 26:20]
    reg DataReg_79 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_79) @[FirEngine.scala 26:20]
    reg DataReg_80 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_80) @[FirEngine.scala 26:20]
    reg DataReg_81 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_81) @[FirEngine.scala 26:20]
    reg DataReg_82 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_82) @[FirEngine.scala 26:20]
    reg DataReg_83 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_83) @[FirEngine.scala 26:20]
    reg DataReg_84 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_84) @[FirEngine.scala 26:20]
    reg DataReg_85 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_85) @[FirEngine.scala 26:20]
    reg DataReg_86 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_86) @[FirEngine.scala 26:20]
    reg DataReg_87 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_87) @[FirEngine.scala 26:20]
    reg DataReg_88 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_88) @[FirEngine.scala 26:20]
    reg DataReg_89 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_89) @[FirEngine.scala 26:20]
    reg DataReg_90 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_90) @[FirEngine.scala 26:20]
    reg DataReg_91 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_91) @[FirEngine.scala 26:20]
    reg DataReg_92 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_92) @[FirEngine.scala 26:20]
    reg DataReg_93 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_93) @[FirEngine.scala 26:20]
    reg DataReg_94 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_94) @[FirEngine.scala 26:20]
    reg DataReg_95 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_95) @[FirEngine.scala 26:20]
    reg DataReg_96 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_96) @[FirEngine.scala 26:20]
    reg DataReg_97 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_97) @[FirEngine.scala 26:20]
    reg DataReg_98 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_98) @[FirEngine.scala 26:20]
    reg DataReg_99 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_99) @[FirEngine.scala 26:20]
    reg DataReg_100 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_100) @[FirEngine.scala 26:20]
    reg DataReg_101 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_101) @[FirEngine.scala 26:20]
    reg DataReg_102 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_102) @[FirEngine.scala 26:20]
    reg DataReg_103 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_103) @[FirEngine.scala 26:20]
    reg DataReg_104 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_104) @[FirEngine.scala 26:20]
    reg DataReg_105 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_105) @[FirEngine.scala 26:20]
    reg DataReg_106 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_106) @[FirEngine.scala 26:20]
    reg DataReg_107 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_107) @[FirEngine.scala 26:20]
    reg DataReg_108 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_108) @[FirEngine.scala 26:20]
    reg DataReg_109 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_109) @[FirEngine.scala 26:20]
    reg DataReg_110 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_110) @[FirEngine.scala 26:20]
    reg DataReg_111 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_111) @[FirEngine.scala 26:20]
    reg DataReg_112 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_112) @[FirEngine.scala 26:20]
    reg DataReg_113 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_113) @[FirEngine.scala 26:20]
    reg DataReg_114 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_114) @[FirEngine.scala 26:20]
    reg DataReg_115 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_115) @[FirEngine.scala 26:20]
    reg DataReg_116 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_116) @[FirEngine.scala 26:20]
    reg DataReg_117 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_117) @[FirEngine.scala 26:20]
    reg DataReg_118 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_118) @[FirEngine.scala 26:20]
    reg DataReg_119 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_119) @[FirEngine.scala 26:20]
    reg DataReg_120 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_120) @[FirEngine.scala 26:20]
    reg DataReg_121 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_121) @[FirEngine.scala 26:20]
    reg DataReg_122 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_122) @[FirEngine.scala 26:20]
    reg DataReg_123 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_123) @[FirEngine.scala 26:20]
    reg DataReg_124 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_124) @[FirEngine.scala 26:20]
    reg DataReg_125 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_125) @[FirEngine.scala 26:20]
    reg DataReg_126 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_126) @[FirEngine.scala 26:20]
    reg DataReg_127 : UInt<18>, clock with :
      reset => (UInt<1>("h0"), DataReg_127) @[FirEngine.scala 26:20]
    node _ReadWritePort_T = bits(io_Registers_Address, 6, 0)
    node _DataReg_ReadWritePort_T = io_Registers_WriteData @[FirEngine.scala 31:{21,21}]
    node _GEN_0 = mux(eq(UInt<1>("h0"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_0) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_1 = mux(eq(UInt<1>("h1"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_1) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_2 = mux(eq(UInt<2>("h2"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_2) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_3 = mux(eq(UInt<2>("h3"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_3) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_4 = mux(eq(UInt<3>("h4"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_4) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_5 = mux(eq(UInt<3>("h5"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_5) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_6 = mux(eq(UInt<3>("h6"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_6) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_7 = mux(eq(UInt<3>("h7"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_7) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_8 = mux(eq(UInt<4>("h8"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_8) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_9 = mux(eq(UInt<4>("h9"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_9) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_10 = mux(eq(UInt<4>("ha"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_10) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_11 = mux(eq(UInt<4>("hb"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_11) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_12 = mux(eq(UInt<4>("hc"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_12) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_13 = mux(eq(UInt<4>("hd"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_13) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_14 = mux(eq(UInt<4>("he"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_14) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_15 = mux(eq(UInt<4>("hf"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_15) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_16 = mux(eq(UInt<5>("h10"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_16) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_17 = mux(eq(UInt<5>("h11"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_17) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_18 = mux(eq(UInt<5>("h12"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_18) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_19 = mux(eq(UInt<5>("h13"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_19) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_20 = mux(eq(UInt<5>("h14"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_20) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_21 = mux(eq(UInt<5>("h15"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_21) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_22 = mux(eq(UInt<5>("h16"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_22) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_23 = mux(eq(UInt<5>("h17"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_23) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_24 = mux(eq(UInt<5>("h18"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_24) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_25 = mux(eq(UInt<5>("h19"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_25) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_26 = mux(eq(UInt<5>("h1a"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_26) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_27 = mux(eq(UInt<5>("h1b"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_27) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_28 = mux(eq(UInt<5>("h1c"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_28) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_29 = mux(eq(UInt<5>("h1d"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_29) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_30 = mux(eq(UInt<5>("h1e"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_30) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_31 = mux(eq(UInt<5>("h1f"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_31) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_32 = mux(eq(UInt<6>("h20"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_32) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_33 = mux(eq(UInt<6>("h21"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_33) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_34 = mux(eq(UInt<6>("h22"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_34) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_35 = mux(eq(UInt<6>("h23"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_35) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_36 = mux(eq(UInt<6>("h24"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_36) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_37 = mux(eq(UInt<6>("h25"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_37) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_38 = mux(eq(UInt<6>("h26"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_38) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_39 = mux(eq(UInt<6>("h27"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_39) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_40 = mux(eq(UInt<6>("h28"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_40) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_41 = mux(eq(UInt<6>("h29"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_41) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_42 = mux(eq(UInt<6>("h2a"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_42) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_43 = mux(eq(UInt<6>("h2b"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_43) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_44 = mux(eq(UInt<6>("h2c"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_44) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_45 = mux(eq(UInt<6>("h2d"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_45) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_46 = mux(eq(UInt<6>("h2e"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_46) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_47 = mux(eq(UInt<6>("h2f"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_47) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_48 = mux(eq(UInt<6>("h30"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_48) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_49 = mux(eq(UInt<6>("h31"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_49) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_50 = mux(eq(UInt<6>("h32"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_50) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_51 = mux(eq(UInt<6>("h33"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_51) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_52 = mux(eq(UInt<6>("h34"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_52) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_53 = mux(eq(UInt<6>("h35"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_53) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_54 = mux(eq(UInt<6>("h36"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_54) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_55 = mux(eq(UInt<6>("h37"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_55) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_56 = mux(eq(UInt<6>("h38"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_56) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_57 = mux(eq(UInt<6>("h39"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_57) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_58 = mux(eq(UInt<6>("h3a"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_58) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_59 = mux(eq(UInt<6>("h3b"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_59) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_60 = mux(eq(UInt<6>("h3c"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_60) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_61 = mux(eq(UInt<6>("h3d"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_61) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_62 = mux(eq(UInt<6>("h3e"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_62) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_63 = mux(eq(UInt<6>("h3f"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_63) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_64 = mux(eq(UInt<7>("h40"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_64) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_65 = mux(eq(UInt<7>("h41"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_65) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_66 = mux(eq(UInt<7>("h42"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_66) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_67 = mux(eq(UInt<7>("h43"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_67) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_68 = mux(eq(UInt<7>("h44"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_68) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_69 = mux(eq(UInt<7>("h45"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_69) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_70 = mux(eq(UInt<7>("h46"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_70) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_71 = mux(eq(UInt<7>("h47"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_71) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_72 = mux(eq(UInt<7>("h48"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_72) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_73 = mux(eq(UInt<7>("h49"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_73) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_74 = mux(eq(UInt<7>("h4a"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_74) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_75 = mux(eq(UInt<7>("h4b"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_75) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_76 = mux(eq(UInt<7>("h4c"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_76) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_77 = mux(eq(UInt<7>("h4d"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_77) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_78 = mux(eq(UInt<7>("h4e"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_78) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_79 = mux(eq(UInt<7>("h4f"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_79) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_80 = mux(eq(UInt<7>("h50"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_80) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_81 = mux(eq(UInt<7>("h51"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_81) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_82 = mux(eq(UInt<7>("h52"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_82) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_83 = mux(eq(UInt<7>("h53"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_83) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_84 = mux(eq(UInt<7>("h54"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_84) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_85 = mux(eq(UInt<7>("h55"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_85) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_86 = mux(eq(UInt<7>("h56"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_86) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_87 = mux(eq(UInt<7>("h57"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_87) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_88 = mux(eq(UInt<7>("h58"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_88) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_89 = mux(eq(UInt<7>("h59"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_89) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_90 = mux(eq(UInt<7>("h5a"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_90) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_91 = mux(eq(UInt<7>("h5b"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_91) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_92 = mux(eq(UInt<7>("h5c"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_92) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_93 = mux(eq(UInt<7>("h5d"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_93) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_94 = mux(eq(UInt<7>("h5e"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_94) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_95 = mux(eq(UInt<7>("h5f"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_95) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_96 = mux(eq(UInt<7>("h60"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_96) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_97 = mux(eq(UInt<7>("h61"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_97) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_98 = mux(eq(UInt<7>("h62"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_98) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_99 = mux(eq(UInt<7>("h63"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_99) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_100 = mux(eq(UInt<7>("h64"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_100) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_101 = mux(eq(UInt<7>("h65"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_101) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_102 = mux(eq(UInt<7>("h66"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_102) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_103 = mux(eq(UInt<7>("h67"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_103) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_104 = mux(eq(UInt<7>("h68"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_104) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_105 = mux(eq(UInt<7>("h69"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_105) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_106 = mux(eq(UInt<7>("h6a"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_106) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_107 = mux(eq(UInt<7>("h6b"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_107) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_108 = mux(eq(UInt<7>("h6c"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_108) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_109 = mux(eq(UInt<7>("h6d"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_109) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_110 = mux(eq(UInt<7>("h6e"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_110) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_111 = mux(eq(UInt<7>("h6f"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_111) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_112 = mux(eq(UInt<7>("h70"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_112) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_113 = mux(eq(UInt<7>("h71"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_113) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_114 = mux(eq(UInt<7>("h72"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_114) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_115 = mux(eq(UInt<7>("h73"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_115) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_116 = mux(eq(UInt<7>("h74"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_116) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_117 = mux(eq(UInt<7>("h75"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_117) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_118 = mux(eq(UInt<7>("h76"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_118) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_119 = mux(eq(UInt<7>("h77"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_119) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_120 = mux(eq(UInt<7>("h78"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_120) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_121 = mux(eq(UInt<7>("h79"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_121) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_122 = mux(eq(UInt<7>("h7a"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_122) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_123 = mux(eq(UInt<7>("h7b"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_123) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_124 = mux(eq(UInt<7>("h7c"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_124) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_125 = mux(eq(UInt<7>("h7d"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_125) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_126 = mux(eq(UInt<7>("h7e"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_126) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_127 = mux(eq(UInt<7>("h7f"), _ReadWritePort_T), _DataReg_ReadWritePort_T, DataReg_127) @[FirEngine.scala 26:20 31:{21,21}]
    node _GEN_128 = validif(eq(UInt<1>("h0"), _ReadWritePort_T), DataReg_0) @[FirEngine.scala 33:{29,29}]
    node _GEN_129 = mux(eq(UInt<1>("h1"), _ReadWritePort_T), DataReg_1, _GEN_128) @[FirEngine.scala 33:{29,29}]
    node _GEN_130 = mux(eq(UInt<2>("h2"), _ReadWritePort_T), DataReg_2, _GEN_129) @[FirEngine.scala 33:{29,29}]
    node _GEN_131 = mux(eq(UInt<2>("h3"), _ReadWritePort_T), DataReg_3, _GEN_130) @[FirEngine.scala 33:{29,29}]
    node _GEN_132 = mux(eq(UInt<3>("h4"), _ReadWritePort_T), DataReg_4, _GEN_131) @[FirEngine.scala 33:{29,29}]
    node _GEN_133 = mux(eq(UInt<3>("h5"), _ReadWritePort_T), DataReg_5, _GEN_132) @[FirEngine.scala 33:{29,29}]
    node _GEN_134 = mux(eq(UInt<3>("h6"), _ReadWritePort_T), DataReg_6, _GEN_133) @[FirEngine.scala 33:{29,29}]
    node _GEN_135 = mux(eq(UInt<3>("h7"), _ReadWritePort_T), DataReg_7, _GEN_134) @[FirEngine.scala 33:{29,29}]
    node _GEN_136 = mux(eq(UInt<4>("h8"), _ReadWritePort_T), DataReg_8, _GEN_135) @[FirEngine.scala 33:{29,29}]
    node _GEN_137 = mux(eq(UInt<4>("h9"), _ReadWritePort_T), DataReg_9, _GEN_136) @[FirEngine.scala 33:{29,29}]
    node _GEN_138 = mux(eq(UInt<4>("ha"), _ReadWritePort_T), DataReg_10, _GEN_137) @[FirEngine.scala 33:{29,29}]
    node _GEN_139 = mux(eq(UInt<4>("hb"), _ReadWritePort_T), DataReg_11, _GEN_138) @[FirEngine.scala 33:{29,29}]
    node _GEN_140 = mux(eq(UInt<4>("hc"), _ReadWritePort_T), DataReg_12, _GEN_139) @[FirEngine.scala 33:{29,29}]
    node _GEN_141 = mux(eq(UInt<4>("hd"), _ReadWritePort_T), DataReg_13, _GEN_140) @[FirEngine.scala 33:{29,29}]
    node _GEN_142 = mux(eq(UInt<4>("he"), _ReadWritePort_T), DataReg_14, _GEN_141) @[FirEngine.scala 33:{29,29}]
    node _GEN_143 = mux(eq(UInt<4>("hf"), _ReadWritePort_T), DataReg_15, _GEN_142) @[FirEngine.scala 33:{29,29}]
    node _GEN_144 = mux(eq(UInt<5>("h10"), _ReadWritePort_T), DataReg_16, _GEN_143) @[FirEngine.scala 33:{29,29}]
    node _GEN_145 = mux(eq(UInt<5>("h11"), _ReadWritePort_T), DataReg_17, _GEN_144) @[FirEngine.scala 33:{29,29}]
    node _GEN_146 = mux(eq(UInt<5>("h12"), _ReadWritePort_T), DataReg_18, _GEN_145) @[FirEngine.scala 33:{29,29}]
    node _GEN_147 = mux(eq(UInt<5>("h13"), _ReadWritePort_T), DataReg_19, _GEN_146) @[FirEngine.scala 33:{29,29}]
    node _GEN_148 = mux(eq(UInt<5>("h14"), _ReadWritePort_T), DataReg_20, _GEN_147) @[FirEngine.scala 33:{29,29}]
    node _GEN_149 = mux(eq(UInt<5>("h15"), _ReadWritePort_T), DataReg_21, _GEN_148) @[FirEngine.scala 33:{29,29}]
    node _GEN_150 = mux(eq(UInt<5>("h16"), _ReadWritePort_T), DataReg_22, _GEN_149) @[FirEngine.scala 33:{29,29}]
    node _GEN_151 = mux(eq(UInt<5>("h17"), _ReadWritePort_T), DataReg_23, _GEN_150) @[FirEngine.scala 33:{29,29}]
    node _GEN_152 = mux(eq(UInt<5>("h18"), _ReadWritePort_T), DataReg_24, _GEN_151) @[FirEngine.scala 33:{29,29}]
    node _GEN_153 = mux(eq(UInt<5>("h19"), _ReadWritePort_T), DataReg_25, _GEN_152) @[FirEngine.scala 33:{29,29}]
    node _GEN_154 = mux(eq(UInt<5>("h1a"), _ReadWritePort_T), DataReg_26, _GEN_153) @[FirEngine.scala 33:{29,29}]
    node _GEN_155 = mux(eq(UInt<5>("h1b"), _ReadWritePort_T), DataReg_27, _GEN_154) @[FirEngine.scala 33:{29,29}]
    node _GEN_156 = mux(eq(UInt<5>("h1c"), _ReadWritePort_T), DataReg_28, _GEN_155) @[FirEngine.scala 33:{29,29}]
    node _GEN_157 = mux(eq(UInt<5>("h1d"), _ReadWritePort_T), DataReg_29, _GEN_156) @[FirEngine.scala 33:{29,29}]
    node _GEN_158 = mux(eq(UInt<5>("h1e"), _ReadWritePort_T), DataReg_30, _GEN_157) @[FirEngine.scala 33:{29,29}]
    node _GEN_159 = mux(eq(UInt<5>("h1f"), _ReadWritePort_T), DataReg_31, _GEN_158) @[FirEngine.scala 33:{29,29}]
    node _GEN_160 = mux(eq(UInt<6>("h20"), _ReadWritePort_T), DataReg_32, _GEN_159) @[FirEngine.scala 33:{29,29}]
    node _GEN_161 = mux(eq(UInt<6>("h21"), _ReadWritePort_T), DataReg_33, _GEN_160) @[FirEngine.scala 33:{29,29}]
    node _GEN_162 = mux(eq(UInt<6>("h22"), _ReadWritePort_T), DataReg_34, _GEN_161) @[FirEngine.scala 33:{29,29}]
    node _GEN_163 = mux(eq(UInt<6>("h23"), _ReadWritePort_T), DataReg_35, _GEN_162) @[FirEngine.scala 33:{29,29}]
    node _GEN_164 = mux(eq(UInt<6>("h24"), _ReadWritePort_T), DataReg_36, _GEN_163) @[FirEngine.scala 33:{29,29}]
    node _GEN_165 = mux(eq(UInt<6>("h25"), _ReadWritePort_T), DataReg_37, _GEN_164) @[FirEngine.scala 33:{29,29}]
    node _GEN_166 = mux(eq(UInt<6>("h26"), _ReadWritePort_T), DataReg_38, _GEN_165) @[FirEngine.scala 33:{29,29}]
    node _GEN_167 = mux(eq(UInt<6>("h27"), _ReadWritePort_T), DataReg_39, _GEN_166) @[FirEngine.scala 33:{29,29}]
    node _GEN_168 = mux(eq(UInt<6>("h28"), _ReadWritePort_T), DataReg_40, _GEN_167) @[FirEngine.scala 33:{29,29}]
    node _GEN_169 = mux(eq(UInt<6>("h29"), _ReadWritePort_T), DataReg_41, _GEN_168) @[FirEngine.scala 33:{29,29}]
    node _GEN_170 = mux(eq(UInt<6>("h2a"), _ReadWritePort_T), DataReg_42, _GEN_169) @[FirEngine.scala 33:{29,29}]
    node _GEN_171 = mux(eq(UInt<6>("h2b"), _ReadWritePort_T), DataReg_43, _GEN_170) @[FirEngine.scala 33:{29,29}]
    node _GEN_172 = mux(eq(UInt<6>("h2c"), _ReadWritePort_T), DataReg_44, _GEN_171) @[FirEngine.scala 33:{29,29}]
    node _GEN_173 = mux(eq(UInt<6>("h2d"), _ReadWritePort_T), DataReg_45, _GEN_172) @[FirEngine.scala 33:{29,29}]
    node _GEN_174 = mux(eq(UInt<6>("h2e"), _ReadWritePort_T), DataReg_46, _GEN_173) @[FirEngine.scala 33:{29,29}]
    node _GEN_175 = mux(eq(UInt<6>("h2f"), _ReadWritePort_T), DataReg_47, _GEN_174) @[FirEngine.scala 33:{29,29}]
    node _GEN_176 = mux(eq(UInt<6>("h30"), _ReadWritePort_T), DataReg_48, _GEN_175) @[FirEngine.scala 33:{29,29}]
    node _GEN_177 = mux(eq(UInt<6>("h31"), _ReadWritePort_T), DataReg_49, _GEN_176) @[FirEngine.scala 33:{29,29}]
    node _GEN_178 = mux(eq(UInt<6>("h32"), _ReadWritePort_T), DataReg_50, _GEN_177) @[FirEngine.scala 33:{29,29}]
    node _GEN_179 = mux(eq(UInt<6>("h33"), _ReadWritePort_T), DataReg_51, _GEN_178) @[FirEngine.scala 33:{29,29}]
    node _GEN_180 = mux(eq(UInt<6>("h34"), _ReadWritePort_T), DataReg_52, _GEN_179) @[FirEngine.scala 33:{29,29}]
    node _GEN_181 = mux(eq(UInt<6>("h35"), _ReadWritePort_T), DataReg_53, _GEN_180) @[FirEngine.scala 33:{29,29}]
    node _GEN_182 = mux(eq(UInt<6>("h36"), _ReadWritePort_T), DataReg_54, _GEN_181) @[FirEngine.scala 33:{29,29}]
    node _GEN_183 = mux(eq(UInt<6>("h37"), _ReadWritePort_T), DataReg_55, _GEN_182) @[FirEngine.scala 33:{29,29}]
    node _GEN_184 = mux(eq(UInt<6>("h38"), _ReadWritePort_T), DataReg_56, _GEN_183) @[FirEngine.scala 33:{29,29}]
    node _GEN_185 = mux(eq(UInt<6>("h39"), _ReadWritePort_T), DataReg_57, _GEN_184) @[FirEngine.scala 33:{29,29}]
    node _GEN_186 = mux(eq(UInt<6>("h3a"), _ReadWritePort_T), DataReg_58, _GEN_185) @[FirEngine.scala 33:{29,29}]
    node _GEN_187 = mux(eq(UInt<6>("h3b"), _ReadWritePort_T), DataReg_59, _GEN_186) @[FirEngine.scala 33:{29,29}]
    node _GEN_188 = mux(eq(UInt<6>("h3c"), _ReadWritePort_T), DataReg_60, _GEN_187) @[FirEngine.scala 33:{29,29}]
    node _GEN_189 = mux(eq(UInt<6>("h3d"), _ReadWritePort_T), DataReg_61, _GEN_188) @[FirEngine.scala 33:{29,29}]
    node _GEN_190 = mux(eq(UInt<6>("h3e"), _ReadWritePort_T), DataReg_62, _GEN_189) @[FirEngine.scala 33:{29,29}]
    node _GEN_191 = mux(eq(UInt<6>("h3f"), _ReadWritePort_T), DataReg_63, _GEN_190) @[FirEngine.scala 33:{29,29}]
    node _GEN_192 = mux(eq(UInt<7>("h40"), _ReadWritePort_T), DataReg_64, _GEN_191) @[FirEngine.scala 33:{29,29}]
    node _GEN_193 = mux(eq(UInt<7>("h41"), _ReadWritePort_T), DataReg_65, _GEN_192) @[FirEngine.scala 33:{29,29}]
    node _GEN_194 = mux(eq(UInt<7>("h42"), _ReadWritePort_T), DataReg_66, _GEN_193) @[FirEngine.scala 33:{29,29}]
    node _GEN_195 = mux(eq(UInt<7>("h43"), _ReadWritePort_T), DataReg_67, _GEN_194) @[FirEngine.scala 33:{29,29}]
    node _GEN_196 = mux(eq(UInt<7>("h44"), _ReadWritePort_T), DataReg_68, _GEN_195) @[FirEngine.scala 33:{29,29}]
    node _GEN_197 = mux(eq(UInt<7>("h45"), _ReadWritePort_T), DataReg_69, _GEN_196) @[FirEngine.scala 33:{29,29}]
    node _GEN_198 = mux(eq(UInt<7>("h46"), _ReadWritePort_T), DataReg_70, _GEN_197) @[FirEngine.scala 33:{29,29}]
    node _GEN_199 = mux(eq(UInt<7>("h47"), _ReadWritePort_T), DataReg_71, _GEN_198) @[FirEngine.scala 33:{29,29}]
    node _GEN_200 = mux(eq(UInt<7>("h48"), _ReadWritePort_T), DataReg_72, _GEN_199) @[FirEngine.scala 33:{29,29}]
    node _GEN_201 = mux(eq(UInt<7>("h49"), _ReadWritePort_T), DataReg_73, _GEN_200) @[FirEngine.scala 33:{29,29}]
    node _GEN_202 = mux(eq(UInt<7>("h4a"), _ReadWritePort_T), DataReg_74, _GEN_201) @[FirEngine.scala 33:{29,29}]
    node _GEN_203 = mux(eq(UInt<7>("h4b"), _ReadWritePort_T), DataReg_75, _GEN_202) @[FirEngine.scala 33:{29,29}]
    node _GEN_204 = mux(eq(UInt<7>("h4c"), _ReadWritePort_T), DataReg_76, _GEN_203) @[FirEngine.scala 33:{29,29}]
    node _GEN_205 = mux(eq(UInt<7>("h4d"), _ReadWritePort_T), DataReg_77, _GEN_204) @[FirEngine.scala 33:{29,29}]
    node _GEN_206 = mux(eq(UInt<7>("h4e"), _ReadWritePort_T), DataReg_78, _GEN_205) @[FirEngine.scala 33:{29,29}]
    node _GEN_207 = mux(eq(UInt<7>("h4f"), _ReadWritePort_T), DataReg_79, _GEN_206) @[FirEngine.scala 33:{29,29}]
    node _GEN_208 = mux(eq(UInt<7>("h50"), _ReadWritePort_T), DataReg_80, _GEN_207) @[FirEngine.scala 33:{29,29}]
    node _GEN_209 = mux(eq(UInt<7>("h51"), _ReadWritePort_T), DataReg_81, _GEN_208) @[FirEngine.scala 33:{29,29}]
    node _GEN_210 = mux(eq(UInt<7>("h52"), _ReadWritePort_T), DataReg_82, _GEN_209) @[FirEngine.scala 33:{29,29}]
    node _GEN_211 = mux(eq(UInt<7>("h53"), _ReadWritePort_T), DataReg_83, _GEN_210) @[FirEngine.scala 33:{29,29}]
    node _GEN_212 = mux(eq(UInt<7>("h54"), _ReadWritePort_T), DataReg_84, _GEN_211) @[FirEngine.scala 33:{29,29}]
    node _GEN_213 = mux(eq(UInt<7>("h55"), _ReadWritePort_T), DataReg_85, _GEN_212) @[FirEngine.scala 33:{29,29}]
    node _GEN_214 = mux(eq(UInt<7>("h56"), _ReadWritePort_T), DataReg_86, _GEN_213) @[FirEngine.scala 33:{29,29}]
    node _GEN_215 = mux(eq(UInt<7>("h57"), _ReadWritePort_T), DataReg_87, _GEN_214) @[FirEngine.scala 33:{29,29}]
    node _GEN_216 = mux(eq(UInt<7>("h58"), _ReadWritePort_T), DataReg_88, _GEN_215) @[FirEngine.scala 33:{29,29}]
    node _GEN_217 = mux(eq(UInt<7>("h59"), _ReadWritePort_T), DataReg_89, _GEN_216) @[FirEngine.scala 33:{29,29}]
    node _GEN_218 = mux(eq(UInt<7>("h5a"), _ReadWritePort_T), DataReg_90, _GEN_217) @[FirEngine.scala 33:{29,29}]
    node _GEN_219 = mux(eq(UInt<7>("h5b"), _ReadWritePort_T), DataReg_91, _GEN_218) @[FirEngine.scala 33:{29,29}]
    node _GEN_220 = mux(eq(UInt<7>("h5c"), _ReadWritePort_T), DataReg_92, _GEN_219) @[FirEngine.scala 33:{29,29}]
    node _GEN_221 = mux(eq(UInt<7>("h5d"), _ReadWritePort_T), DataReg_93, _GEN_220) @[FirEngine.scala 33:{29,29}]
    node _GEN_222 = mux(eq(UInt<7>("h5e"), _ReadWritePort_T), DataReg_94, _GEN_221) @[FirEngine.scala 33:{29,29}]
    node _GEN_223 = mux(eq(UInt<7>("h5f"), _ReadWritePort_T), DataReg_95, _GEN_222) @[FirEngine.scala 33:{29,29}]
    node _GEN_224 = mux(eq(UInt<7>("h60"), _ReadWritePort_T), DataReg_96, _GEN_223) @[FirEngine.scala 33:{29,29}]
    node _GEN_225 = mux(eq(UInt<7>("h61"), _ReadWritePort_T), DataReg_97, _GEN_224) @[FirEngine.scala 33:{29,29}]
    node _GEN_226 = mux(eq(UInt<7>("h62"), _ReadWritePort_T), DataReg_98, _GEN_225) @[FirEngine.scala 33:{29,29}]
    node _GEN_227 = mux(eq(UInt<7>("h63"), _ReadWritePort_T), DataReg_99, _GEN_226) @[FirEngine.scala 33:{29,29}]
    node _GEN_228 = mux(eq(UInt<7>("h64"), _ReadWritePort_T), DataReg_100, _GEN_227) @[FirEngine.scala 33:{29,29}]
    node _GEN_229 = mux(eq(UInt<7>("h65"), _ReadWritePort_T), DataReg_101, _GEN_228) @[FirEngine.scala 33:{29,29}]
    node _GEN_230 = mux(eq(UInt<7>("h66"), _ReadWritePort_T), DataReg_102, _GEN_229) @[FirEngine.scala 33:{29,29}]
    node _GEN_231 = mux(eq(UInt<7>("h67"), _ReadWritePort_T), DataReg_103, _GEN_230) @[FirEngine.scala 33:{29,29}]
    node _GEN_232 = mux(eq(UInt<7>("h68"), _ReadWritePort_T), DataReg_104, _GEN_231) @[FirEngine.scala 33:{29,29}]
    node _GEN_233 = mux(eq(UInt<7>("h69"), _ReadWritePort_T), DataReg_105, _GEN_232) @[FirEngine.scala 33:{29,29}]
    node _GEN_234 = mux(eq(UInt<7>("h6a"), _ReadWritePort_T), DataReg_106, _GEN_233) @[FirEngine.scala 33:{29,29}]
    node _GEN_235 = mux(eq(UInt<7>("h6b"), _ReadWritePort_T), DataReg_107, _GEN_234) @[FirEngine.scala 33:{29,29}]
    node _GEN_236 = mux(eq(UInt<7>("h6c"), _ReadWritePort_T), DataReg_108, _GEN_235) @[FirEngine.scala 33:{29,29}]
    node _GEN_237 = mux(eq(UInt<7>("h6d"), _ReadWritePort_T), DataReg_109, _GEN_236) @[FirEngine.scala 33:{29,29}]
    node _GEN_238 = mux(eq(UInt<7>("h6e"), _ReadWritePort_T), DataReg_110, _GEN_237) @[FirEngine.scala 33:{29,29}]
    node _GEN_239 = mux(eq(UInt<7>("h6f"), _ReadWritePort_T), DataReg_111, _GEN_238) @[FirEngine.scala 33:{29,29}]
    node _GEN_240 = mux(eq(UInt<7>("h70"), _ReadWritePort_T), DataReg_112, _GEN_239) @[FirEngine.scala 33:{29,29}]
    node _GEN_241 = mux(eq(UInt<7>("h71"), _ReadWritePort_T), DataReg_113, _GEN_240) @[FirEngine.scala 33:{29,29}]
    node _GEN_242 = mux(eq(UInt<7>("h72"), _ReadWritePort_T), DataReg_114, _GEN_241) @[FirEngine.scala 33:{29,29}]
    node _GEN_243 = mux(eq(UInt<7>("h73"), _ReadWritePort_T), DataReg_115, _GEN_242) @[FirEngine.scala 33:{29,29}]
    node _GEN_244 = mux(eq(UInt<7>("h74"), _ReadWritePort_T), DataReg_116, _GEN_243) @[FirEngine.scala 33:{29,29}]
    node _GEN_245 = mux(eq(UInt<7>("h75"), _ReadWritePort_T), DataReg_117, _GEN_244) @[FirEngine.scala 33:{29,29}]
    node _GEN_246 = mux(eq(UInt<7>("h76"), _ReadWritePort_T), DataReg_118, _GEN_245) @[FirEngine.scala 33:{29,29}]
    node _GEN_247 = mux(eq(UInt<7>("h77"), _ReadWritePort_T), DataReg_119, _GEN_246) @[FirEngine.scala 33:{29,29}]
    node _GEN_248 = mux(eq(UInt<7>("h78"), _ReadWritePort_T), DataReg_120, _GEN_247) @[FirEngine.scala 33:{29,29}]
    node _GEN_249 = mux(eq(UInt<7>("h79"), _ReadWritePort_T), DataReg_121, _GEN_248) @[FirEngine.scala 33:{29,29}]
    node _GEN_250 = mux(eq(UInt<7>("h7a"), _ReadWritePort_T), DataReg_122, _GEN_249) @[FirEngine.scala 33:{29,29}]
    node _GEN_251 = mux(eq(UInt<7>("h7b"), _ReadWritePort_T), DataReg_123, _GEN_250) @[FirEngine.scala 33:{29,29}]
    node _GEN_252 = mux(eq(UInt<7>("h7c"), _ReadWritePort_T), DataReg_124, _GEN_251) @[FirEngine.scala 33:{29,29}]
    node _GEN_253 = mux(eq(UInt<7>("h7d"), _ReadWritePort_T), DataReg_125, _GEN_252) @[FirEngine.scala 33:{29,29}]
    node _GEN_254 = mux(eq(UInt<7>("h7e"), _ReadWritePort_T), DataReg_126, _GEN_253) @[FirEngine.scala 33:{29,29}]
    node _GEN_255 = mux(eq(UInt<7>("h7f"), _ReadWritePort_T), DataReg_127, _GEN_254) @[FirEngine.scala 33:{29,29}]
    node _GEN_256 = mux(io_Registers_WriteEn, _GEN_0, DataReg_0) @[FirEngine.scala 26:20 30:31]
    node _GEN_257 = mux(io_Registers_WriteEn, _GEN_1, DataReg_1) @[FirEngine.scala 26:20 30:31]
    node _GEN_258 = mux(io_Registers_WriteEn, _GEN_2, DataReg_2) @[FirEngine.scala 26:20 30:31]
    node _GEN_259 = mux(io_Registers_WriteEn, _GEN_3, DataReg_3) @[FirEngine.scala 26:20 30:31]
    node _GEN_260 = mux(io_Registers_WriteEn, _GEN_4, DataReg_4) @[FirEngine.scala 26:20 30:31]
    node _GEN_261 = mux(io_Registers_WriteEn, _GEN_5, DataReg_5) @[FirEngine.scala 26:20 30:31]
    node _GEN_262 = mux(io_Registers_WriteEn, _GEN_6, DataReg_6) @[FirEngine.scala 26:20 30:31]
    node _GEN_263 = mux(io_Registers_WriteEn, _GEN_7, DataReg_7) @[FirEngine.scala 26:20 30:31]
    node _GEN_264 = mux(io_Registers_WriteEn, _GEN_8, DataReg_8) @[FirEngine.scala 26:20 30:31]
    node _GEN_265 = mux(io_Registers_WriteEn, _GEN_9, DataReg_9) @[FirEngine.scala 26:20 30:31]
    node _GEN_266 = mux(io_Registers_WriteEn, _GEN_10, DataReg_10) @[FirEngine.scala 26:20 30:31]
    node _GEN_267 = mux(io_Registers_WriteEn, _GEN_11, DataReg_11) @[FirEngine.scala 26:20 30:31]
    node _GEN_268 = mux(io_Registers_WriteEn, _GEN_12, DataReg_12) @[FirEngine.scala 26:20 30:31]
    node _GEN_269 = mux(io_Registers_WriteEn, _GEN_13, DataReg_13) @[FirEngine.scala 26:20 30:31]
    node _GEN_270 = mux(io_Registers_WriteEn, _GEN_14, DataReg_14) @[FirEngine.scala 26:20 30:31]
    node _GEN_271 = mux(io_Registers_WriteEn, _GEN_15, DataReg_15) @[FirEngine.scala 26:20 30:31]
    node _GEN_272 = mux(io_Registers_WriteEn, _GEN_16, DataReg_16) @[FirEngine.scala 26:20 30:31]
    node _GEN_273 = mux(io_Registers_WriteEn, _GEN_17, DataReg_17) @[FirEngine.scala 26:20 30:31]
    node _GEN_274 = mux(io_Registers_WriteEn, _GEN_18, DataReg_18) @[FirEngine.scala 26:20 30:31]
    node _GEN_275 = mux(io_Registers_WriteEn, _GEN_19, DataReg_19) @[FirEngine.scala 26:20 30:31]
    node _GEN_276 = mux(io_Registers_WriteEn, _GEN_20, DataReg_20) @[FirEngine.scala 26:20 30:31]
    node _GEN_277 = mux(io_Registers_WriteEn, _GEN_21, DataReg_21) @[FirEngine.scala 26:20 30:31]
    node _GEN_278 = mux(io_Registers_WriteEn, _GEN_22, DataReg_22) @[FirEngine.scala 26:20 30:31]
    node _GEN_279 = mux(io_Registers_WriteEn, _GEN_23, DataReg_23) @[FirEngine.scala 26:20 30:31]
    node _GEN_280 = mux(io_Registers_WriteEn, _GEN_24, DataReg_24) @[FirEngine.scala 26:20 30:31]
    node _GEN_281 = mux(io_Registers_WriteEn, _GEN_25, DataReg_25) @[FirEngine.scala 26:20 30:31]
    node _GEN_282 = mux(io_Registers_WriteEn, _GEN_26, DataReg_26) @[FirEngine.scala 26:20 30:31]
    node _GEN_283 = mux(io_Registers_WriteEn, _GEN_27, DataReg_27) @[FirEngine.scala 26:20 30:31]
    node _GEN_284 = mux(io_Registers_WriteEn, _GEN_28, DataReg_28) @[FirEngine.scala 26:20 30:31]
    node _GEN_285 = mux(io_Registers_WriteEn, _GEN_29, DataReg_29) @[FirEngine.scala 26:20 30:31]
    node _GEN_286 = mux(io_Registers_WriteEn, _GEN_30, DataReg_30) @[FirEngine.scala 26:20 30:31]
    node _GEN_287 = mux(io_Registers_WriteEn, _GEN_31, DataReg_31) @[FirEngine.scala 26:20 30:31]
    node _GEN_288 = mux(io_Registers_WriteEn, _GEN_32, DataReg_32) @[FirEngine.scala 26:20 30:31]
    node _GEN_289 = mux(io_Registers_WriteEn, _GEN_33, DataReg_33) @[FirEngine.scala 26:20 30:31]
    node _GEN_290 = mux(io_Registers_WriteEn, _GEN_34, DataReg_34) @[FirEngine.scala 26:20 30:31]
    node _GEN_291 = mux(io_Registers_WriteEn, _GEN_35, DataReg_35) @[FirEngine.scala 26:20 30:31]
    node _GEN_292 = mux(io_Registers_WriteEn, _GEN_36, DataReg_36) @[FirEngine.scala 26:20 30:31]
    node _GEN_293 = mux(io_Registers_WriteEn, _GEN_37, DataReg_37) @[FirEngine.scala 26:20 30:31]
    node _GEN_294 = mux(io_Registers_WriteEn, _GEN_38, DataReg_38) @[FirEngine.scala 26:20 30:31]
    node _GEN_295 = mux(io_Registers_WriteEn, _GEN_39, DataReg_39) @[FirEngine.scala 26:20 30:31]
    node _GEN_296 = mux(io_Registers_WriteEn, _GEN_40, DataReg_40) @[FirEngine.scala 26:20 30:31]
    node _GEN_297 = mux(io_Registers_WriteEn, _GEN_41, DataReg_41) @[FirEngine.scala 26:20 30:31]
    node _GEN_298 = mux(io_Registers_WriteEn, _GEN_42, DataReg_42) @[FirEngine.scala 26:20 30:31]
    node _GEN_299 = mux(io_Registers_WriteEn, _GEN_43, DataReg_43) @[FirEngine.scala 26:20 30:31]
    node _GEN_300 = mux(io_Registers_WriteEn, _GEN_44, DataReg_44) @[FirEngine.scala 26:20 30:31]
    node _GEN_301 = mux(io_Registers_WriteEn, _GEN_45, DataReg_45) @[FirEngine.scala 26:20 30:31]
    node _GEN_302 = mux(io_Registers_WriteEn, _GEN_46, DataReg_46) @[FirEngine.scala 26:20 30:31]
    node _GEN_303 = mux(io_Registers_WriteEn, _GEN_47, DataReg_47) @[FirEngine.scala 26:20 30:31]
    node _GEN_304 = mux(io_Registers_WriteEn, _GEN_48, DataReg_48) @[FirEngine.scala 26:20 30:31]
    node _GEN_305 = mux(io_Registers_WriteEn, _GEN_49, DataReg_49) @[FirEngine.scala 26:20 30:31]
    node _GEN_306 = mux(io_Registers_WriteEn, _GEN_50, DataReg_50) @[FirEngine.scala 26:20 30:31]
    node _GEN_307 = mux(io_Registers_WriteEn, _GEN_51, DataReg_51) @[FirEngine.scala 26:20 30:31]
    node _GEN_308 = mux(io_Registers_WriteEn, _GEN_52, DataReg_52) @[FirEngine.scala 26:20 30:31]
    node _GEN_309 = mux(io_Registers_WriteEn, _GEN_53, DataReg_53) @[FirEngine.scala 26:20 30:31]
    node _GEN_310 = mux(io_Registers_WriteEn, _GEN_54, DataReg_54) @[FirEngine.scala 26:20 30:31]
    node _GEN_311 = mux(io_Registers_WriteEn, _GEN_55, DataReg_55) @[FirEngine.scala 26:20 30:31]
    node _GEN_312 = mux(io_Registers_WriteEn, _GEN_56, DataReg_56) @[FirEngine.scala 26:20 30:31]
    node _GEN_313 = mux(io_Registers_WriteEn, _GEN_57, DataReg_57) @[FirEngine.scala 26:20 30:31]
    node _GEN_314 = mux(io_Registers_WriteEn, _GEN_58, DataReg_58) @[FirEngine.scala 26:20 30:31]
    node _GEN_315 = mux(io_Registers_WriteEn, _GEN_59, DataReg_59) @[FirEngine.scala 26:20 30:31]
    node _GEN_316 = mux(io_Registers_WriteEn, _GEN_60, DataReg_60) @[FirEngine.scala 26:20 30:31]
    node _GEN_317 = mux(io_Registers_WriteEn, _GEN_61, DataReg_61) @[FirEngine.scala 26:20 30:31]
    node _GEN_318 = mux(io_Registers_WriteEn, _GEN_62, DataReg_62) @[FirEngine.scala 26:20 30:31]
    node _GEN_319 = mux(io_Registers_WriteEn, _GEN_63, DataReg_63) @[FirEngine.scala 26:20 30:31]
    node _GEN_320 = mux(io_Registers_WriteEn, _GEN_64, DataReg_64) @[FirEngine.scala 26:20 30:31]
    node _GEN_321 = mux(io_Registers_WriteEn, _GEN_65, DataReg_65) @[FirEngine.scala 26:20 30:31]
    node _GEN_322 = mux(io_Registers_WriteEn, _GEN_66, DataReg_66) @[FirEngine.scala 26:20 30:31]
    node _GEN_323 = mux(io_Registers_WriteEn, _GEN_67, DataReg_67) @[FirEngine.scala 26:20 30:31]
    node _GEN_324 = mux(io_Registers_WriteEn, _GEN_68, DataReg_68) @[FirEngine.scala 26:20 30:31]
    node _GEN_325 = mux(io_Registers_WriteEn, _GEN_69, DataReg_69) @[FirEngine.scala 26:20 30:31]
    node _GEN_326 = mux(io_Registers_WriteEn, _GEN_70, DataReg_70) @[FirEngine.scala 26:20 30:31]
    node _GEN_327 = mux(io_Registers_WriteEn, _GEN_71, DataReg_71) @[FirEngine.scala 26:20 30:31]
    node _GEN_328 = mux(io_Registers_WriteEn, _GEN_72, DataReg_72) @[FirEngine.scala 26:20 30:31]
    node _GEN_329 = mux(io_Registers_WriteEn, _GEN_73, DataReg_73) @[FirEngine.scala 26:20 30:31]
    node _GEN_330 = mux(io_Registers_WriteEn, _GEN_74, DataReg_74) @[FirEngine.scala 26:20 30:31]
    node _GEN_331 = mux(io_Registers_WriteEn, _GEN_75, DataReg_75) @[FirEngine.scala 26:20 30:31]
    node _GEN_332 = mux(io_Registers_WriteEn, _GEN_76, DataReg_76) @[FirEngine.scala 26:20 30:31]
    node _GEN_333 = mux(io_Registers_WriteEn, _GEN_77, DataReg_77) @[FirEngine.scala 26:20 30:31]
    node _GEN_334 = mux(io_Registers_WriteEn, _GEN_78, DataReg_78) @[FirEngine.scala 26:20 30:31]
    node _GEN_335 = mux(io_Registers_WriteEn, _GEN_79, DataReg_79) @[FirEngine.scala 26:20 30:31]
    node _GEN_336 = mux(io_Registers_WriteEn, _GEN_80, DataReg_80) @[FirEngine.scala 26:20 30:31]
    node _GEN_337 = mux(io_Registers_WriteEn, _GEN_81, DataReg_81) @[FirEngine.scala 26:20 30:31]
    node _GEN_338 = mux(io_Registers_WriteEn, _GEN_82, DataReg_82) @[FirEngine.scala 26:20 30:31]
    node _GEN_339 = mux(io_Registers_WriteEn, _GEN_83, DataReg_83) @[FirEngine.scala 26:20 30:31]
    node _GEN_340 = mux(io_Registers_WriteEn, _GEN_84, DataReg_84) @[FirEngine.scala 26:20 30:31]
    node _GEN_341 = mux(io_Registers_WriteEn, _GEN_85, DataReg_85) @[FirEngine.scala 26:20 30:31]
    node _GEN_342 = mux(io_Registers_WriteEn, _GEN_86, DataReg_86) @[FirEngine.scala 26:20 30:31]
    node _GEN_343 = mux(io_Registers_WriteEn, _GEN_87, DataReg_87) @[FirEngine.scala 26:20 30:31]
    node _GEN_344 = mux(io_Registers_WriteEn, _GEN_88, DataReg_88) @[FirEngine.scala 26:20 30:31]
    node _GEN_345 = mux(io_Registers_WriteEn, _GEN_89, DataReg_89) @[FirEngine.scala 26:20 30:31]
    node _GEN_346 = mux(io_Registers_WriteEn, _GEN_90, DataReg_90) @[FirEngine.scala 26:20 30:31]
    node _GEN_347 = mux(io_Registers_WriteEn, _GEN_91, DataReg_91) @[FirEngine.scala 26:20 30:31]
    node _GEN_348 = mux(io_Registers_WriteEn, _GEN_92, DataReg_92) @[FirEngine.scala 26:20 30:31]
    node _GEN_349 = mux(io_Registers_WriteEn, _GEN_93, DataReg_93) @[FirEngine.scala 26:20 30:31]
    node _GEN_350 = mux(io_Registers_WriteEn, _GEN_94, DataReg_94) @[FirEngine.scala 26:20 30:31]
    node _GEN_351 = mux(io_Registers_WriteEn, _GEN_95, DataReg_95) @[FirEngine.scala 26:20 30:31]
    node _GEN_352 = mux(io_Registers_WriteEn, _GEN_96, DataReg_96) @[FirEngine.scala 26:20 30:31]
    node _GEN_353 = mux(io_Registers_WriteEn, _GEN_97, DataReg_97) @[FirEngine.scala 26:20 30:31]
    node _GEN_354 = mux(io_Registers_WriteEn, _GEN_98, DataReg_98) @[FirEngine.scala 26:20 30:31]
    node _GEN_355 = mux(io_Registers_WriteEn, _GEN_99, DataReg_99) @[FirEngine.scala 26:20 30:31]
    node _GEN_356 = mux(io_Registers_WriteEn, _GEN_100, DataReg_100) @[FirEngine.scala 26:20 30:31]
    node _GEN_357 = mux(io_Registers_WriteEn, _GEN_101, DataReg_101) @[FirEngine.scala 26:20 30:31]
    node _GEN_358 = mux(io_Registers_WriteEn, _GEN_102, DataReg_102) @[FirEngine.scala 26:20 30:31]
    node _GEN_359 = mux(io_Registers_WriteEn, _GEN_103, DataReg_103) @[FirEngine.scala 26:20 30:31]
    node _GEN_360 = mux(io_Registers_WriteEn, _GEN_104, DataReg_104) @[FirEngine.scala 26:20 30:31]
    node _GEN_361 = mux(io_Registers_WriteEn, _GEN_105, DataReg_105) @[FirEngine.scala 26:20 30:31]
    node _GEN_362 = mux(io_Registers_WriteEn, _GEN_106, DataReg_106) @[FirEngine.scala 26:20 30:31]
    node _GEN_363 = mux(io_Registers_WriteEn, _GEN_107, DataReg_107) @[FirEngine.scala 26:20 30:31]
    node _GEN_364 = mux(io_Registers_WriteEn, _GEN_108, DataReg_108) @[FirEngine.scala 26:20 30:31]
    node _GEN_365 = mux(io_Registers_WriteEn, _GEN_109, DataReg_109) @[FirEngine.scala 26:20 30:31]
    node _GEN_366 = mux(io_Registers_WriteEn, _GEN_110, DataReg_110) @[FirEngine.scala 26:20 30:31]
    node _GEN_367 = mux(io_Registers_WriteEn, _GEN_111, DataReg_111) @[FirEngine.scala 26:20 30:31]
    node _GEN_368 = mux(io_Registers_WriteEn, _GEN_112, DataReg_112) @[FirEngine.scala 26:20 30:31]
    node _GEN_369 = mux(io_Registers_WriteEn, _GEN_113, DataReg_113) @[FirEngine.scala 26:20 30:31]
    node _GEN_370 = mux(io_Registers_WriteEn, _GEN_114, DataReg_114) @[FirEngine.scala 26:20 30:31]
    node _GEN_371 = mux(io_Registers_WriteEn, _GEN_115, DataReg_115) @[FirEngine.scala 26:20 30:31]
    node _GEN_372 = mux(io_Registers_WriteEn, _GEN_116, DataReg_116) @[FirEngine.scala 26:20 30:31]
    node _GEN_373 = mux(io_Registers_WriteEn, _GEN_117, DataReg_117) @[FirEngine.scala 26:20 30:31]
    node _GEN_374 = mux(io_Registers_WriteEn, _GEN_118, DataReg_118) @[FirEngine.scala 26:20 30:31]
    node _GEN_375 = mux(io_Registers_WriteEn, _GEN_119, DataReg_119) @[FirEngine.scala 26:20 30:31]
    node _GEN_376 = mux(io_Registers_WriteEn, _GEN_120, DataReg_120) @[FirEngine.scala 26:20 30:31]
    node _GEN_377 = mux(io_Registers_WriteEn, _GEN_121, DataReg_121) @[FirEngine.scala 26:20 30:31]
    node _GEN_378 = mux(io_Registers_WriteEn, _GEN_122, DataReg_122) @[FirEngine.scala 26:20 30:31]
    node _GEN_379 = mux(io_Registers_WriteEn, _GEN_123, DataReg_123) @[FirEngine.scala 26:20 30:31]
    node _GEN_380 = mux(io_Registers_WriteEn, _GEN_124, DataReg_124) @[FirEngine.scala 26:20 30:31]
    node _GEN_381 = mux(io_Registers_WriteEn, _GEN_125, DataReg_125) @[FirEngine.scala 26:20 30:31]
    node _GEN_382 = mux(io_Registers_WriteEn, _GEN_126, DataReg_126) @[FirEngine.scala 26:20 30:31]
    node _GEN_383 = mux(io_Registers_WriteEn, _GEN_127, DataReg_127) @[FirEngine.scala 26:20 30:31]
    node _DataReg_ReadWritePort_T_0 = _GEN_255 @[FirEngine.scala 33:29]
    node _GEN_384 = mux(io_Registers_WriteEn, UInt<1>("h0"), _DataReg_ReadWritePort_T_0) @[FirEngine.scala 21:25 30:31 33:29]
    node _GEN_385 = mux(io_Registers_Enable, _GEN_256, DataReg_0) @[FirEngine.scala 26:20 28:28]
    node _GEN_386 = mux(io_Registers_Enable, _GEN_257, DataReg_1) @[FirEngine.scala 26:20 28:28]
    node _GEN_387 = mux(io_Registers_Enable, _GEN_258, DataReg_2) @[FirEngine.scala 26:20 28:28]
    node _GEN_388 = mux(io_Registers_Enable, _GEN_259, DataReg_3) @[FirEngine.scala 26:20 28:28]
    node _GEN_389 = mux(io_Registers_Enable, _GEN_260, DataReg_4) @[FirEngine.scala 26:20 28:28]
    node _GEN_390 = mux(io_Registers_Enable, _GEN_261, DataReg_5) @[FirEngine.scala 26:20 28:28]
    node _GEN_391 = mux(io_Registers_Enable, _GEN_262, DataReg_6) @[FirEngine.scala 26:20 28:28]
    node _GEN_392 = mux(io_Registers_Enable, _GEN_263, DataReg_7) @[FirEngine.scala 26:20 28:28]
    node _GEN_393 = mux(io_Registers_Enable, _GEN_264, DataReg_8) @[FirEngine.scala 26:20 28:28]
    node _GEN_394 = mux(io_Registers_Enable, _GEN_265, DataReg_9) @[FirEngine.scala 26:20 28:28]
    node _GEN_395 = mux(io_Registers_Enable, _GEN_266, DataReg_10) @[FirEngine.scala 26:20 28:28]
    node _GEN_396 = mux(io_Registers_Enable, _GEN_267, DataReg_11) @[FirEngine.scala 26:20 28:28]
    node _GEN_397 = mux(io_Registers_Enable, _GEN_268, DataReg_12) @[FirEngine.scala 26:20 28:28]
    node _GEN_398 = mux(io_Registers_Enable, _GEN_269, DataReg_13) @[FirEngine.scala 26:20 28:28]
    node _GEN_399 = mux(io_Registers_Enable, _GEN_270, DataReg_14) @[FirEngine.scala 26:20 28:28]
    node _GEN_400 = mux(io_Registers_Enable, _GEN_271, DataReg_15) @[FirEngine.scala 26:20 28:28]
    node _GEN_401 = mux(io_Registers_Enable, _GEN_272, DataReg_16) @[FirEngine.scala 26:20 28:28]
    node _GEN_402 = mux(io_Registers_Enable, _GEN_273, DataReg_17) @[FirEngine.scala 26:20 28:28]
    node _GEN_403 = mux(io_Registers_Enable, _GEN_274, DataReg_18) @[FirEngine.scala 26:20 28:28]
    node _GEN_404 = mux(io_Registers_Enable, _GEN_275, DataReg_19) @[FirEngine.scala 26:20 28:28]
    node _GEN_405 = mux(io_Registers_Enable, _GEN_276, DataReg_20) @[FirEngine.scala 26:20 28:28]
    node _GEN_406 = mux(io_Registers_Enable, _GEN_277, DataReg_21) @[FirEngine.scala 26:20 28:28]
    node _GEN_407 = mux(io_Registers_Enable, _GEN_278, DataReg_22) @[FirEngine.scala 26:20 28:28]
    node _GEN_408 = mux(io_Registers_Enable, _GEN_279, DataReg_23) @[FirEngine.scala 26:20 28:28]
    node _GEN_409 = mux(io_Registers_Enable, _GEN_280, DataReg_24) @[FirEngine.scala 26:20 28:28]
    node _GEN_410 = mux(io_Registers_Enable, _GEN_281, DataReg_25) @[FirEngine.scala 26:20 28:28]
    node _GEN_411 = mux(io_Registers_Enable, _GEN_282, DataReg_26) @[FirEngine.scala 26:20 28:28]
    node _GEN_412 = mux(io_Registers_Enable, _GEN_283, DataReg_27) @[FirEngine.scala 26:20 28:28]
    node _GEN_413 = mux(io_Registers_Enable, _GEN_284, DataReg_28) @[FirEngine.scala 26:20 28:28]
    node _GEN_414 = mux(io_Registers_Enable, _GEN_285, DataReg_29) @[FirEngine.scala 26:20 28:28]
    node _GEN_415 = mux(io_Registers_Enable, _GEN_286, DataReg_30) @[FirEngine.scala 26:20 28:28]
    node _GEN_416 = mux(io_Registers_Enable, _GEN_287, DataReg_31) @[FirEngine.scala 26:20 28:28]
    node _GEN_417 = mux(io_Registers_Enable, _GEN_288, DataReg_32) @[FirEngine.scala 26:20 28:28]
    node _GEN_418 = mux(io_Registers_Enable, _GEN_289, DataReg_33) @[FirEngine.scala 26:20 28:28]
    node _GEN_419 = mux(io_Registers_Enable, _GEN_290, DataReg_34) @[FirEngine.scala 26:20 28:28]
    node _GEN_420 = mux(io_Registers_Enable, _GEN_291, DataReg_35) @[FirEngine.scala 26:20 28:28]
    node _GEN_421 = mux(io_Registers_Enable, _GEN_292, DataReg_36) @[FirEngine.scala 26:20 28:28]
    node _GEN_422 = mux(io_Registers_Enable, _GEN_293, DataReg_37) @[FirEngine.scala 26:20 28:28]
    node _GEN_423 = mux(io_Registers_Enable, _GEN_294, DataReg_38) @[FirEngine.scala 26:20 28:28]
    node _GEN_424 = mux(io_Registers_Enable, _GEN_295, DataReg_39) @[FirEngine.scala 26:20 28:28]
    node _GEN_425 = mux(io_Registers_Enable, _GEN_296, DataReg_40) @[FirEngine.scala 26:20 28:28]
    node _GEN_426 = mux(io_Registers_Enable, _GEN_297, DataReg_41) @[FirEngine.scala 26:20 28:28]
    node _GEN_427 = mux(io_Registers_Enable, _GEN_298, DataReg_42) @[FirEngine.scala 26:20 28:28]
    node _GEN_428 = mux(io_Registers_Enable, _GEN_299, DataReg_43) @[FirEngine.scala 26:20 28:28]
    node _GEN_429 = mux(io_Registers_Enable, _GEN_300, DataReg_44) @[FirEngine.scala 26:20 28:28]
    node _GEN_430 = mux(io_Registers_Enable, _GEN_301, DataReg_45) @[FirEngine.scala 26:20 28:28]
    node _GEN_431 = mux(io_Registers_Enable, _GEN_302, DataReg_46) @[FirEngine.scala 26:20 28:28]
    node _GEN_432 = mux(io_Registers_Enable, _GEN_303, DataReg_47) @[FirEngine.scala 26:20 28:28]
    node _GEN_433 = mux(io_Registers_Enable, _GEN_304, DataReg_48) @[FirEngine.scala 26:20 28:28]
    node _GEN_434 = mux(io_Registers_Enable, _GEN_305, DataReg_49) @[FirEngine.scala 26:20 28:28]
    node _GEN_435 = mux(io_Registers_Enable, _GEN_306, DataReg_50) @[FirEngine.scala 26:20 28:28]
    node _GEN_436 = mux(io_Registers_Enable, _GEN_307, DataReg_51) @[FirEngine.scala 26:20 28:28]
    node _GEN_437 = mux(io_Registers_Enable, _GEN_308, DataReg_52) @[FirEngine.scala 26:20 28:28]
    node _GEN_438 = mux(io_Registers_Enable, _GEN_309, DataReg_53) @[FirEngine.scala 26:20 28:28]
    node _GEN_439 = mux(io_Registers_Enable, _GEN_310, DataReg_54) @[FirEngine.scala 26:20 28:28]
    node _GEN_440 = mux(io_Registers_Enable, _GEN_311, DataReg_55) @[FirEngine.scala 26:20 28:28]
    node _GEN_441 = mux(io_Registers_Enable, _GEN_312, DataReg_56) @[FirEngine.scala 26:20 28:28]
    node _GEN_442 = mux(io_Registers_Enable, _GEN_313, DataReg_57) @[FirEngine.scala 26:20 28:28]
    node _GEN_443 = mux(io_Registers_Enable, _GEN_314, DataReg_58) @[FirEngine.scala 26:20 28:28]
    node _GEN_444 = mux(io_Registers_Enable, _GEN_315, DataReg_59) @[FirEngine.scala 26:20 28:28]
    node _GEN_445 = mux(io_Registers_Enable, _GEN_316, DataReg_60) @[FirEngine.scala 26:20 28:28]
    node _GEN_446 = mux(io_Registers_Enable, _GEN_317, DataReg_61) @[FirEngine.scala 26:20 28:28]
    node _GEN_447 = mux(io_Registers_Enable, _GEN_318, DataReg_62) @[FirEngine.scala 26:20 28:28]
    node _GEN_448 = mux(io_Registers_Enable, _GEN_319, DataReg_63) @[FirEngine.scala 26:20 28:28]
    node _GEN_449 = mux(io_Registers_Enable, _GEN_320, DataReg_64) @[FirEngine.scala 26:20 28:28]
    node _GEN_450 = mux(io_Registers_Enable, _GEN_321, DataReg_65) @[FirEngine.scala 26:20 28:28]
    node _GEN_451 = mux(io_Registers_Enable, _GEN_322, DataReg_66) @[FirEngine.scala 26:20 28:28]
    node _GEN_452 = mux(io_Registers_Enable, _GEN_323, DataReg_67) @[FirEngine.scala 26:20 28:28]
    node _GEN_453 = mux(io_Registers_Enable, _GEN_324, DataReg_68) @[FirEngine.scala 26:20 28:28]
    node _GEN_454 = mux(io_Registers_Enable, _GEN_325, DataReg_69) @[FirEngine.scala 26:20 28:28]
    node _GEN_455 = mux(io_Registers_Enable, _GEN_326, DataReg_70) @[FirEngine.scala 26:20 28:28]
    node _GEN_456 = mux(io_Registers_Enable, _GEN_327, DataReg_71) @[FirEngine.scala 26:20 28:28]
    node _GEN_457 = mux(io_Registers_Enable, _GEN_328, DataReg_72) @[FirEngine.scala 26:20 28:28]
    node _GEN_458 = mux(io_Registers_Enable, _GEN_329, DataReg_73) @[FirEngine.scala 26:20 28:28]
    node _GEN_459 = mux(io_Registers_Enable, _GEN_330, DataReg_74) @[FirEngine.scala 26:20 28:28]
    node _GEN_460 = mux(io_Registers_Enable, _GEN_331, DataReg_75) @[FirEngine.scala 26:20 28:28]
    node _GEN_461 = mux(io_Registers_Enable, _GEN_332, DataReg_76) @[FirEngine.scala 26:20 28:28]
    node _GEN_462 = mux(io_Registers_Enable, _GEN_333, DataReg_77) @[FirEngine.scala 26:20 28:28]
    node _GEN_463 = mux(io_Registers_Enable, _GEN_334, DataReg_78) @[FirEngine.scala 26:20 28:28]
    node _GEN_464 = mux(io_Registers_Enable, _GEN_335, DataReg_79) @[FirEngine.scala 26:20 28:28]
    node _GEN_465 = mux(io_Registers_Enable, _GEN_336, DataReg_80) @[FirEngine.scala 26:20 28:28]
    node _GEN_466 = mux(io_Registers_Enable, _GEN_337, DataReg_81) @[FirEngine.scala 26:20 28:28]
    node _GEN_467 = mux(io_Registers_Enable, _GEN_338, DataReg_82) @[FirEngine.scala 26:20 28:28]
    node _GEN_468 = mux(io_Registers_Enable, _GEN_339, DataReg_83) @[FirEngine.scala 26:20 28:28]
    node _GEN_469 = mux(io_Registers_Enable, _GEN_340, DataReg_84) @[FirEngine.scala 26:20 28:28]
    node _GEN_470 = mux(io_Registers_Enable, _GEN_341, DataReg_85) @[FirEngine.scala 26:20 28:28]
    node _GEN_471 = mux(io_Registers_Enable, _GEN_342, DataReg_86) @[FirEngine.scala 26:20 28:28]
    node _GEN_472 = mux(io_Registers_Enable, _GEN_343, DataReg_87) @[FirEngine.scala 26:20 28:28]
    node _GEN_473 = mux(io_Registers_Enable, _GEN_344, DataReg_88) @[FirEngine.scala 26:20 28:28]
    node _GEN_474 = mux(io_Registers_Enable, _GEN_345, DataReg_89) @[FirEngine.scala 26:20 28:28]
    node _GEN_475 = mux(io_Registers_Enable, _GEN_346, DataReg_90) @[FirEngine.scala 26:20 28:28]
    node _GEN_476 = mux(io_Registers_Enable, _GEN_347, DataReg_91) @[FirEngine.scala 26:20 28:28]
    node _GEN_477 = mux(io_Registers_Enable, _GEN_348, DataReg_92) @[FirEngine.scala 26:20 28:28]
    node _GEN_478 = mux(io_Registers_Enable, _GEN_349, DataReg_93) @[FirEngine.scala 26:20 28:28]
    node _GEN_479 = mux(io_Registers_Enable, _GEN_350, DataReg_94) @[FirEngine.scala 26:20 28:28]
    node _GEN_480 = mux(io_Registers_Enable, _GEN_351, DataReg_95) @[FirEngine.scala 26:20 28:28]
    node _GEN_481 = mux(io_Registers_Enable, _GEN_352, DataReg_96) @[FirEngine.scala 26:20 28:28]
    node _GEN_482 = mux(io_Registers_Enable, _GEN_353, DataReg_97) @[FirEngine.scala 26:20 28:28]
    node _GEN_483 = mux(io_Registers_Enable, _GEN_354, DataReg_98) @[FirEngine.scala 26:20 28:28]
    node _GEN_484 = mux(io_Registers_Enable, _GEN_355, DataReg_99) @[FirEngine.scala 26:20 28:28]
    node _GEN_485 = mux(io_Registers_Enable, _GEN_356, DataReg_100) @[FirEngine.scala 26:20 28:28]
    node _GEN_486 = mux(io_Registers_Enable, _GEN_357, DataReg_101) @[FirEngine.scala 26:20 28:28]
    node _GEN_487 = mux(io_Registers_Enable, _GEN_358, DataReg_102) @[FirEngine.scala 26:20 28:28]
    node _GEN_488 = mux(io_Registers_Enable, _GEN_359, DataReg_103) @[FirEngine.scala 26:20 28:28]
    node _GEN_489 = mux(io_Registers_Enable, _GEN_360, DataReg_104) @[FirEngine.scala 26:20 28:28]
    node _GEN_490 = mux(io_Registers_Enable, _GEN_361, DataReg_105) @[FirEngine.scala 26:20 28:28]
    node _GEN_491 = mux(io_Registers_Enable, _GEN_362, DataReg_106) @[FirEngine.scala 26:20 28:28]
    node _GEN_492 = mux(io_Registers_Enable, _GEN_363, DataReg_107) @[FirEngine.scala 26:20 28:28]
    node _GEN_493 = mux(io_Registers_Enable, _GEN_364, DataReg_108) @[FirEngine.scala 26:20 28:28]
    node _GEN_494 = mux(io_Registers_Enable, _GEN_365, DataReg_109) @[FirEngine.scala 26:20 28:28]
    node _GEN_495 = mux(io_Registers_Enable, _GEN_366, DataReg_110) @[FirEngine.scala 26:20 28:28]
    node _GEN_496 = mux(io_Registers_Enable, _GEN_367, DataReg_111) @[FirEngine.scala 26:20 28:28]
    node _GEN_497 = mux(io_Registers_Enable, _GEN_368, DataReg_112) @[FirEngine.scala 26:20 28:28]
    node _GEN_498 = mux(io_Registers_Enable, _GEN_369, DataReg_113) @[FirEngine.scala 26:20 28:28]
    node _GEN_499 = mux(io_Registers_Enable, _GEN_370, DataReg_114) @[FirEngine.scala 26:20 28:28]
    node _GEN_500 = mux(io_Registers_Enable, _GEN_371, DataReg_115) @[FirEngine.scala 26:20 28:28]
    node _GEN_501 = mux(io_Registers_Enable, _GEN_372, DataReg_116) @[FirEngine.scala 26:20 28:28]
    node _GEN_502 = mux(io_Registers_Enable, _GEN_373, DataReg_117) @[FirEngine.scala 26:20 28:28]
    node _GEN_503 = mux(io_Registers_Enable, _GEN_374, DataReg_118) @[FirEngine.scala 26:20 28:28]
    node _GEN_504 = mux(io_Registers_Enable, _GEN_375, DataReg_119) @[FirEngine.scala 26:20 28:28]
    node _GEN_505 = mux(io_Registers_Enable, _GEN_376, DataReg_120) @[FirEngine.scala 26:20 28:28]
    node _GEN_506 = mux(io_Registers_Enable, _GEN_377, DataReg_121) @[FirEngine.scala 26:20 28:28]
    node _GEN_507 = mux(io_Registers_Enable, _GEN_378, DataReg_122) @[FirEngine.scala 26:20 28:28]
    node _GEN_508 = mux(io_Registers_Enable, _GEN_379, DataReg_123) @[FirEngine.scala 26:20 28:28]
    node _GEN_509 = mux(io_Registers_Enable, _GEN_380, DataReg_124) @[FirEngine.scala 26:20 28:28]
    node _GEN_510 = mux(io_Registers_Enable, _GEN_381, DataReg_125) @[FirEngine.scala 26:20 28:28]
    node _GEN_511 = mux(io_Registers_Enable, _GEN_382, DataReg_126) @[FirEngine.scala 26:20 28:28]
    node _GEN_512 = mux(io_Registers_Enable, _GEN_383, DataReg_127) @[FirEngine.scala 26:20 28:28]
    node _GEN_513 = mux(io_Registers_Enable, _GEN_384, UInt<1>("h0")) @[FirEngine.scala 21:25 28:28]
    io_WaveOut <= UInt<18>("h0") @[FirEngine.scala 14:14]
    io_Registers_ReadData <= _GEN_513
    io_Registers_Completed <= UInt<1>("h0") @[FirEngine.scala 22:26]
    io_MemPort_Address <= UInt<18>("h0") @[FirEngine.scala 19:22]
    io_MemPort_WriteData <= UInt<18>("h0") @[FirEngine.scala 18:24]
    io_MemPort_Enable <= UInt<1>("h0") @[FirEngine.scala 16:21]
    io_MemPort_WriteEn <= UInt<1>("h0") @[FirEngine.scala 17:22]
    DataReg_0 <= _GEN_385
    DataReg_1 <= _GEN_386
    DataReg_2 <= _GEN_387
    DataReg_3 <= _GEN_388
    DataReg_4 <= _GEN_389
    DataReg_5 <= _GEN_390
    DataReg_6 <= _GEN_391
    DataReg_7 <= _GEN_392
    DataReg_8 <= _GEN_393
    DataReg_9 <= _GEN_394
    DataReg_10 <= _GEN_395
    DataReg_11 <= _GEN_396
    DataReg_12 <= _GEN_397
    DataReg_13 <= _GEN_398
    DataReg_14 <= _GEN_399
    DataReg_15 <= _GEN_400
    DataReg_16 <= _GEN_401
    DataReg_17 <= _GEN_402
    DataReg_18 <= _GEN_403
    DataReg_19 <= _GEN_404
    DataReg_20 <= _GEN_405
    DataReg_21 <= _GEN_406
    DataReg_22 <= _GEN_407
    DataReg_23 <= _GEN_408
    DataReg_24 <= _GEN_409
    DataReg_25 <= _GEN_410
    DataReg_26 <= _GEN_411
    DataReg_27 <= _GEN_412
    DataReg_28 <= _GEN_413
    DataReg_29 <= _GEN_414
    DataReg_30 <= _GEN_415
    DataReg_31 <= _GEN_416
    DataReg_32 <= _GEN_417
    DataReg_33 <= _GEN_418
    DataReg_34 <= _GEN_419
    DataReg_35 <= _GEN_420
    DataReg_36 <= _GEN_421
    DataReg_37 <= _GEN_422
    DataReg_38 <= _GEN_423
    DataReg_39 <= _GEN_424
    DataReg_40 <= _GEN_425
    DataReg_41 <= _GEN_426
    DataReg_42 <= _GEN_427
    DataReg_43 <= _GEN_428
    DataReg_44 <= _GEN_429
    DataReg_45 <= _GEN_430
    DataReg_46 <= _GEN_431
    DataReg_47 <= _GEN_432
    DataReg_48 <= _GEN_433
    DataReg_49 <= _GEN_434
    DataReg_50 <= _GEN_435
    DataReg_51 <= _GEN_436
    DataReg_52 <= _GEN_437
    DataReg_53 <= _GEN_438
    DataReg_54 <= _GEN_439
    DataReg_55 <= _GEN_440
    DataReg_56 <= _GEN_441
    DataReg_57 <= _GEN_442
    DataReg_58 <= _GEN_443
    DataReg_59 <= _GEN_444
    DataReg_60 <= _GEN_445
    DataReg_61 <= _GEN_446
    DataReg_62 <= _GEN_447
    DataReg_63 <= _GEN_448
    DataReg_64 <= _GEN_449
    DataReg_65 <= _GEN_450
    DataReg_66 <= _GEN_451
    DataReg_67 <= _GEN_452
    DataReg_68 <= _GEN_453
    DataReg_69 <= _GEN_454
    DataReg_70 <= _GEN_455
    DataReg_71 <= _GEN_456
    DataReg_72 <= _GEN_457
    DataReg_73 <= _GEN_458
    DataReg_74 <= _GEN_459
    DataReg_75 <= _GEN_460
    DataReg_76 <= _GEN_461
    DataReg_77 <= _GEN_462
    DataReg_78 <= _GEN_463
    DataReg_79 <= _GEN_464
    DataReg_80 <= _GEN_465
    DataReg_81 <= _GEN_466
    DataReg_82 <= _GEN_467
    DataReg_83 <= _GEN_468
    DataReg_84 <= _GEN_469
    DataReg_85 <= _GEN_470
    DataReg_86 <= _GEN_471
    DataReg_87 <= _GEN_472
    DataReg_88 <= _GEN_473
    DataReg_89 <= _GEN_474
    DataReg_90 <= _GEN_475
    DataReg_91 <= _GEN_476
    DataReg_92 <= _GEN_477
    DataReg_93 <= _GEN_478
    DataReg_94 <= _GEN_479
    DataReg_95 <= _GEN_480
    DataReg_96 <= _GEN_481
    DataReg_97 <= _GEN_482
    DataReg_98 <= _GEN_483
    DataReg_99 <= _GEN_484
    DataReg_100 <= _GEN_485
    DataReg_101 <= _GEN_486
    DataReg_102 <= _GEN_487
    DataReg_103 <= _GEN_488
    DataReg_104 <= _GEN_489
    DataReg_105 <= _GEN_490
    DataReg_106 <= _GEN_491
    DataReg_107 <= _GEN_492
    DataReg_108 <= _GEN_493
    DataReg_109 <= _GEN_494
    DataReg_110 <= _GEN_495
    DataReg_111 <= _GEN_496
    DataReg_112 <= _GEN_497
    DataReg_113 <= _GEN_498
    DataReg_114 <= _GEN_499
    DataReg_115 <= _GEN_500
    DataReg_116 <= _GEN_501
    DataReg_117 <= _GEN_502
    DataReg_118 <= _GEN_503
    DataReg_119 <= _GEN_504
    DataReg_120 <= _GEN_505
    DataReg_121 <= _GEN_506
    DataReg_122 <= _GEN_507
    DataReg_123 <= _GEN_508
    DataReg_124 <= _GEN_509
    DataReg_125 <= _GEN_510
    DataReg_126 <= _GEN_511
    DataReg_127 <= _GEN_512

  module SubDSP :
    input clock : Clock
    input reset : UInt<1>
    input io_Sub_IO_In : UInt<18>
    output io_Sub_IO_Out : UInt<18>
    output SPI_SPIMemPort_Address : UInt<18>
    output SPI_SPIMemPort_WriteData : UInt<18>
    output SPI_SPIMemPort_Enable : UInt<1>
    output SPI_SPIMemPort_WriteEn : UInt<1>
    input SPI_SPIMemPort_ReadData : UInt<18>
    input SPI_SPIMemPort_Completed : UInt<1>

    inst Core of Core @[SubDSP.scala 33:20]
    inst DataMemory of DataMemory @[SubDSP.scala 34:26]
    inst FirEngine of FirEngine @[SubDSP.scala 35:25]
    node _io_Sub_IO_Out_T = add(Core.io_WaveOut, FirEngine.io_WaveOut) @[SubDSP.scala 39:36]
    node _io_Sub_IO_Out_T_1 = tail(_io_Sub_IO_Out_T, 1) @[SubDSP.scala 39:36]
    node dedupBlock = asSInt(UInt<31>("h32f7327e"))
    io_Sub_IO_Out <= _io_Sub_IO_Out_T_1 @[SubDSP.scala 39:17]
    SPI_SPIMemPort_Address <= DataMemory.io_SPIMemPort_Address @[SubDSP.scala 52:18]
    SPI_SPIMemPort_WriteData <= DataMemory.io_SPIMemPort_WriteData @[SubDSP.scala 52:18]
    SPI_SPIMemPort_Enable <= DataMemory.io_SPIMemPort_Enable @[SubDSP.scala 52:18]
    SPI_SPIMemPort_WriteEn <= DataMemory.io_SPIMemPort_WriteEn @[SubDSP.scala 52:18]
    Core.clock <= clock
    Core.reset <= reset
    Core.io_WaveIn <= io_Sub_IO_In @[SubDSP.scala 40:18]
    Core.io_MemPort_ReadData <= DataMemory.io_MemPort_0_ReadData @[SubDSP.scala 45:19]
    Core.io_MemPort_Completed <= DataMemory.io_MemPort_0_Completed @[SubDSP.scala 45:19]
    DataMemory.clock <= clock
    DataMemory.reset <= reset
    DataMemory.io_MemPort_0_Address <= Core.io_MemPort_Address @[SubDSP.scala 45:19]
    DataMemory.io_MemPort_0_WriteData <= Core.io_MemPort_WriteData @[SubDSP.scala 45:19]
    DataMemory.io_MemPort_0_Enable <= Core.io_MemPort_Enable @[SubDSP.scala 45:19]
    DataMemory.io_MemPort_0_WriteEn <= Core.io_MemPort_WriteEn @[SubDSP.scala 45:19]
    DataMemory.io_MemPort_1_Address <= FirEngine.io_MemPort_Address @[SubDSP.scala 49:24]
    DataMemory.io_MemPort_1_WriteData <= FirEngine.io_MemPort_WriteData @[SubDSP.scala 49:24]
    DataMemory.io_MemPort_1_Enable <= FirEngine.io_MemPort_Enable @[SubDSP.scala 49:24]
    DataMemory.io_MemPort_1_WriteEn <= FirEngine.io_MemPort_WriteEn @[SubDSP.scala 49:24]
    DataMemory.io_Registers_ReadData <= FirEngine.io_Registers_ReadData @[SubDSP.scala 47:26]
    DataMemory.io_Registers_Completed <= FirEngine.io_Registers_Completed @[SubDSP.scala 47:26]
    DataMemory.io_SPIMemPort_ReadData <= SPI_SPIMemPort_ReadData @[SubDSP.scala 52:18]
    DataMemory.io_SPIMemPort_Completed <= SPI_SPIMemPort_Completed @[SubDSP.scala 52:18]
    FirEngine.clock <= clock
    FirEngine.reset <= reset
    FirEngine.io_WaveIn <= UInt<18>("h0") @[SubDSP.scala 50:23]
    FirEngine.io_Registers_Address <= DataMemory.io_Registers_Address @[SubDSP.scala 47:26]
    FirEngine.io_Registers_WriteData <= DataMemory.io_Registers_WriteData @[SubDSP.scala 47:26]
    FirEngine.io_Registers_Enable <= DataMemory.io_Registers_Enable @[SubDSP.scala 47:26]
    FirEngine.io_Registers_WriteEn <= DataMemory.io_Registers_WriteEn @[SubDSP.scala 47:26]
    FirEngine.io_MemPort_ReadData <= DataMemory.io_MemPort_1_ReadData @[SubDSP.scala 49:24]
    FirEngine.io_MemPort_Completed <= DataMemory.io_MemPort_1_Completed @[SubDSP.scala 49:24]

  module NodeConnector :
    input clock : Clock
    input reset : UInt<1>
    input io_In_0 : UInt<18>
    output io_Out : UInt<18>

    node Carry_0 = io_In_0 @[NodeConnector.scala 14:19 15:12]
    io_Out <= Carry_0 @[NodeConnector.scala 21:10]

  module DSP :
    input clock : Clock
    input reset : UInt<1>
    input io_In : SInt<16>
    output io_Out : SInt<16>
    output SPI_SCLK : UInt<1>
    output SPI_CE : UInt<1>
    output SPI_MOSI_MISO : Analog<4>

    inst SPIArbiter of SPIArbiter @[DSP.scala 26:26]
    inst LCDBusDriver of LCDBusDriver @[DSP.scala 27:28]
    inst SubDSP of SubDSP @[DSP.scala 56:24]
    inst OutputConnector of NodeConnector @[DSP.scala 76:31]
    node LCDBusDriver_io_driveData_lo = cat(SPIArbiter.SPI_SI_1, SPIArbiter.SPI_SI_0) @[DSP.scala 31:50]
    node LCDBusDriver_io_driveData_hi = cat(SPIArbiter.SPI_SI_3, SPIArbiter.SPI_SI_2) @[DSP.scala 31:50]
    node _LCDBusDriver_io_driveData_T = cat(LCDBusDriver_io_driveData_hi, LCDBusDriver_io_driveData_lo) @[DSP.scala 31:50]
    node _T = bits(LCDBusDriver.busData, 0, 0) @[DSP.scala 32:48]
    node _T_1 = bits(LCDBusDriver.busData, 1, 1) @[DSP.scala 32:48]
    node _T_2 = bits(LCDBusDriver.busData, 2, 2) @[DSP.scala 32:48]
    node _T_3 = bits(LCDBusDriver.busData, 3, 3) @[DSP.scala 32:48]
    node _CAP_IOs_0_In_T = asUInt(io_In) @[DSP.scala 102:36]
    node _io_Out_T = bits(OutputConnector.io_Out, 15, 0) @[DSP.scala 120:35]
    node _io_Out_T_1 = asSInt(_io_Out_T) @[DSP.scala 120:42]
    node CAP_IOs_0_In = pad(_CAP_IOs_0_In_T, 18) @[DSP.scala 41:21 102:27]
    node CAP_IOs_0_Out = SubDSP.io_Sub_IO_Out @[DSP.scala 41:21 62:19]
    io_Out <= _io_Out_T_1 @[DSP.scala 120:10]
    SPI_SCLK <= SPIArbiter.SPI_SCLK @[DSP.scala 33:12]
    SPI_CE <= SPIArbiter.SPI_CE @[DSP.scala 34:10]
    SPIArbiter.clock <= clock
    SPIArbiter.reset <= reset
    SPIArbiter.io_MemPort_0_Address <= SubDSP.SPI_SPIMemPort_Address @[DSP.scala 60:27]
    SPIArbiter.io_MemPort_0_WriteData <= SubDSP.SPI_SPIMemPort_WriteData @[DSP.scala 60:27]
    SPIArbiter.io_MemPort_0_Enable <= SubDSP.SPI_SPIMemPort_Enable @[DSP.scala 60:27]
    SPIArbiter.io_MemPort_0_WriteEn <= SubDSP.SPI_SPIMemPort_WriteEn @[DSP.scala 60:27]
    SPIArbiter.SPI_SO_0 <= _T @[DSP.scala 32:21]
    SPIArbiter.SPI_SO_1 <= _T_1 @[DSP.scala 32:21]
    SPIArbiter.SPI_SO_2 <= _T_2 @[DSP.scala 32:21]
    SPIArbiter.SPI_SO_3 <= _T_3 @[DSP.scala 32:21]
    LCDBusDriver.driveData <= _LCDBusDriver_io_driveData_T @[DSP.scala 31:29]
    LCDBusDriver.drive <= SPIArbiter.SPI_Drive @[DSP.scala 30:25]
    SubDSP.clock <= clock
    SubDSP.reset <= reset
    SubDSP.io_Sub_IO_In <= CAP_IOs_0_In @[DSP.scala 62:19]
    SubDSP.SPI_SPIMemPort_ReadData <= SPIArbiter.io_MemPort_0_ReadData @[DSP.scala 60:27]
    SubDSP.SPI_SPIMemPort_Completed <= SPIArbiter.io_MemPort_0_Completed @[DSP.scala 60:27]
    OutputConnector.clock <= clock
    OutputConnector.reset <= reset
    OutputConnector.io_In_0 <= CAP_IOs_0_Out @[DSP.scala 112:40]
    attach (SPI_MOSI_MISO, LCDBusDriver.bus)
