import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
//import chiseltest.experimental.TestOptionBuilder._
//import chiseltest.internal.WriteVcdAnnotation._
import scala.xml._
import org.scalatest.FlatSpec
import Sounds._
import Assembler._

class test extends AnyFlatSpec with ChiselScalatestTester {


  val xml = XML.loadFile("config.xml")

  behavior of "DSP"


  it should "play" in {
    test(new DSP(100000000)).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
      dut.clock.setTimeout(0)
      println("Starting test")
   

      var Sine = Array( //5kHz sine
        32768,32853,32939,33025,33111,33196,33282,33368,33454,33539,
        33625,33711,33797,33882,33968,34054,34140,34225,34311,34397,
        34482,34568,34654,34739,34825,34911,34996,35082,35167,35253,
        35338,35424,35509,35595,35680,35766,35851,35937,36022,36107,
        36193,36278,36363,36448,36534,36619,36704,36789,36874,36959,
        37045,37130,37215,37300,37384,37469,37554,37639,37724,37809,
        37893,37978,38063,38147,38232,38317,38401,38486,38570,38655,
        38739,38823,38908,38992,39076,39160,39244,39328,39412,39496,
        39580,39664,39748,39832,39916,39999,40083,40166,40250,40333,
        40417,40500,40584,40667,40750,40833,40916,41000,41083,41165,
        41248,41331,41414,41497,41579,41662,41744,41827,41909,41992,
        42074,42156,42238,42320,42402,42484,42566,42648,42730,42812,
        42893,42975,43056,43138,43219,43300,43381,43463,43544,43625,
        43706,43786,43867,43948,44028,44109,44189,44270,44350,44430,
        44510,44590,44670,44750,44830,44910,44989,45069,45148,45228,
        45307,45386,45465,45544,45623,45702,45781,45860,45938,46017,
        46095,46174,46252,46330,46408,46486,46564,46642,46719,46797,
        46874,46952,47029,47106,47183,47260,47337,47414,47491,47567,
        47644,47720,47796,47872,47949,48025,48100,48176,48252,48327,
        48403,48478,48553,48628,48703,48778,48853,48928,49002,49077,
        49151,49225,49300,49374,49448,49521,49595,49669,49742,49815,
        49888,49962,50035,50107,50180,50253,50325,50398,50470,50542,
        50614,50686,50758,50829,50901,50972,51043,51115,51186,51256,
        51327,51398,51468,51539,51609,51679,51749,51819,51889,51958,
        52028,52097,52166,52235,52304,52373,52442,52510,52579,52647,
        52715,52783,52851,52919,52986,53054,53121,53188,53255,53322,
        53389,53455,53522,53588,53654,53720,53786,53852,53918,53983,
        54048,54113,54178,54243,54308,54373,54437,54501,54565,54629,
        54693,54757,54820,54884,54947,55010,55073,55136,55198,55261,
        55323,55385,55447,55509,55571,55632,55694,55755,55816,55877,
        55938,55998,56059,56119,56179,56239,56299,56358,56418,56477,
        56536,56595,56654,56713,56771,56829,56888,56946,57003,57061,
        57118,57176,57233,57290,57347,57403,57460,57516,57572,57628,
        57684,57740,57795,57850,57906,57961,58015,58070,58124,58179,
        58233,58287,58340,58394,58447,58500,58553,58606,58659,58711,
        58764,58816,58868,58920,58971,59023,59074,59125,59176,59226,
        59277,59327,59377,59427,59477,59527,59576,59625,59675,59723,
        59772,59821,59869,59917,59965,60013,60060,60108,60155,60202,
        60249,60295,60342,60388,60434,60480,60526,60571,60616,60661,
        60706,60751,60796,60840,60884,60928,60972,61015,61059,61102,
        61145,61188,61230,61273,61315,61357,61399,61440,61482,61523,
        61564,61605,61646,61686,61726,61766,61806,61846,61885,61925,
        61964,62002,62041,62079,62118,62156,62194,62231,62269,62306,
        62343,62380,62416,62453,62489,62525,62561,62597,62632,62667,
        62702,62737,62771,62806,62840,62874,62908,62941,62975,63008,
        63041,63073,63106,63138,63170,63202,63234,63265,63297,63328,
        63359,63389,63420,63450,63480,63510,63539,63569,63598,63627,
        63656,63684,63712,63740,63768,63796,63824,63851,63878,63905,
        63931,63958,63984,64010,64036,64061,64086,64112,64136,64161,
        64186,64210,64234,64258,64281,64305,64328,64351,64374,64396,
        64418,64441,64462,64484,64506,64527,64548,64569,64589,64609,
        64630,64650,64669,64689,64708,64727,64746,64764,64783,64801,
        64819,64837,64854,64871,64889,64905,64922,64938,64955,64971,
        64986,65002,65017,65032,65047,65062,65076,65090,65104,65118,
        65132,65145,65158,65171,65183,65196,65208,65220,65232,65243,
        65255,65266,65277,65287,65298,65308,65318,65328,65337,65346,
        65355,65364,65373,65381,65390,65398,65405,65413,65420,65427,
        65434,65441,65447,65453,65459,65465,65470,65476,65481,65485,
        65490,65494,65499,65503,65506,65510,65513,65516,65519,65521,
        65524,65526,65528,65529,65531,65532,65533,65534,65535,65535,
        65535,65535,65535,65534,65533,65532,65531,65529,65528,65526,
        65524,65521,65519,65516,65513,65510,65506,65503,65499,65494,
        65490,65485,65481,65476,65470,65465,65459,65453,65447,65441,
        65434,65427,65420,65413,65405,65398,65390,65381,65373,65364,
        65355,65346,65337,65328,65318,65308,65298,65287,65277,65266,
        65255,65243,65232,65220,65208,65196,65183,65171,65158,65145,
        65132,65118,65104,65090,65076,65062,65047,65032,65017,65002,
        64986,64971,64955,64938,64922,64905,64889,64871,64854,64837,
        64819,64801,64783,64764,64746,64727,64708,64689,64669,64650,
        64630,64609,64589,64569,64548,64527,64506,64484,64462,64441,
        64418,64396,64374,64351,64328,64305,64281,64258,64234,64210,
        64186,64161,64136,64112,64086,64061,64036,64010,63984,63958,
        63931,63905,63878,63851,63824,63796,63768,63740,63712,63684,
        63656,63627,63598,63569,63539,63510,63480,63450,63420,63389,
        63359,63328,63297,63265,63234,63202,63170,63138,63106,63073,
        63041,63008,62975,62941,62908,62874,62840,62806,62771,62737,
        62702,62667,62632,62597,62561,62525,62489,62453,62416,62380,
        62343,62306,62269,62231,62194,62156,62118,62079,62041,62002,
        61964,61925,61885,61846,61806,61766,61726,61686,61646,61605,
        61564,61523,61482,61440,61399,61357,61315,61273,61230,61188,
        61145,61102,61059,61015,60972,60928,60884,60840,60796,60751,
        60706,60661,60616,60571,60526,60480,60434,60388,60342,60295,
        60249,60202,60155,60108,60060,60013,59965,59917,59869,59821,
        59772,59723,59675,59625,59576,59527,59477,59427,59377,59327,
        59277,59226,59176,59125,59074,59023,58971,58920,58868,58816,
        58764,58711,58659,58606,58553,58500,58447,58394,58340,58287,
        58233,58179,58124,58070,58015,57961,57906,57850,57795,57740,
        57684,57628,57572,57516,57460,57403,57347,57290,57233,57176,
        57118,57061,57003,56946,56888,56829,56771,56713,56654,56595,
        56536,56477,56418,56358,56299,56239,56179,56119,56059,55998,
        55938,55877,55816,55755,55694,55632,55571,55509,55447,55385,
        55323,55261,55198,55136,55073,55010,54947,54884,54820,54757,
        54693,54629,54565,54501,54437,54373,54308,54243,54178,54113,
        54048,53983,53918,53852,53786,53720,53654,53588,53522,53455,
        53389,53322,53255,53188,53121,53054,52986,52919,52851,52783,
        52715,52647,52579,52510,52442,52373,52304,52235,52166,52097,
        52028,51958,51889,51819,51749,51679,51609,51539,51468,51398,
        51327,51256,51186,51115,51043,50972,50901,50829,50758,50686,
        50614,50542,50470,50398,50325,50253,50180,50107,50035,49962,
        49888,49815,49742,49669,49595,49521,49448,49374,49300,49225,
        49151,49077,49002,48928,48853,48778,48703,48628,48553,48478,
        48403,48327,48252,48176,48100,48025,47949,47872,47796,47720,
        47644,47567,47491,47414,47337,47260,47183,47106,47029,46952,
        46874,46797,46719,46642,46564,46486,46408,46330,46252,46174,
        46095,46017,45938,45860,45781,45702,45623,45544,45465,45386,
        45307,45228,45148,45069,44989,44910,44830,44750,44670,44590,
        44510,44430,44350,44270,44189,44109,44028,43948,43867,43786,
        43706,43625,43544,43463,43381,43300,43219,43138,43056,42975,
        42893,42812,42730,42648,42566,42484,42402,42320,42238,42156,
        42074,41992,41909,41827,41744,41662,41579,41497,41414,41331,
        41248,41165,41083,41000,40916,40833,40750,40667,40584,40500,
        40417,40333,40250,40166,40083,39999,39916,39832,39748,39664,
        39580,39496,39412,39328,39244,39160,39076,38992,38908,38823,
        38739,38655,38570,38486,38401,38317,38232,38147,38063,37978,
        37893,37809,37724,37639,37554,37469,37384,37300,37215,37130,
        37045,36959,36874,36789,36704,36619,36534,36448,36363,36278,
        36193,36107,36022,35937,35851,35766,35680,35595,35509,35424,
        35338,35253,35167,35082,34996,34911,34825,34739,34654,34568,
        34482,34397,34311,34225,34140,34054,33968,33882,33797,33711,
        33625,33539,33454,33368,33282,33196,33111,33025,32939,32853,
        32768,32682,32596,32510,32424,32339,32253,32167,32081,31996,
        31910,31824,31738,31653,31567,31481,31395,31310,31224,31138,
        31053,30967,30881,30796,30710,30624,30539,30453,30368,30282,
        30197,30111,30026,29940,29855,29769,29684,29598,29513,29428,
        29342,29257,29172,29087,29001,28916,28831,28746,28661,28576,
        28490,28405,28320,28235,28151,28066,27981,27896,27811,27726,
        27642,27557,27472,27388,27303,27218,27134,27049,26965,26880,
        26796,26712,26627,26543,26459,26375,26291,26207,26123,26039,
        25955,25871,25787,25703,25619,25536,25452,25369,25285,25202,
        25118,25035,24951,24868,24785,24702,24619,24535,24452,24370,
        24287,24204,24121,24038,23956,23873,23791,23708,23626,23543,
        23461,23379,23297,23215,23133,23051,22969,22887,22805,22723,
        22642,22560,22479,22397,22316,22235,22154,22072,21991,21910,
        21829,21749,21668,21587,21507,21426,21346,21265,21185,21105,
        21025,20945,20865,20785,20705,20625,20546,20466,20387,20307,
        20228,20149,20070,19991,19912,19833,19754,19675,19597,19518,
        19440,19361,19283,19205,19127,19049,18971,18893,18816,18738,
        18661,18583,18506,18429,18352,18275,18198,18121,18044,17968,
        17891,17815,17739,17663,17586,17510,17435,17359,17283,17208,
        17132,17057,16982,16907,16832,16757,16682,16607,16533,16458,
        16384,16310,16235,16161,16087,16014,15940,15866,15793,15720,
        15647,15573,15500,15428,15355,15282,15210,15137,15065,14993,
        14921,14849,14777,14706,14634,14563,14492,14420,14349,14279,
        14208,14137,14067,13996,13926,13856,13786,13716,13646,13577,
        13507,13438,13369,13300,13231,13162,13093,13025,12956,12888,
        12820,12752,12684,12616,12549,12481,12414,12347,12280,12213,
        12146,12080,12013,11947,11881,11815,11749,11683,11617,11552,
        11487,11422,11357,11292,11227,11162,11098,11034,10970,10906,
        10842,10778,10715,10651,10588,10525,10462,10399,10337,10274,
        10212,10150,10088,10026,9964,9903,9841,9780,9719,9658,
        9597,9537,9476,9416,9356,9296,9236,9177,9117,9058,
        8999,8940,8881,8822,8764,8706,8647,8589,8532,8474,
        8417,8359,8302,8245,8188,8132,8075,8019,7963,7907,
        7851,7795,7740,7685,7629,7574,7520,7465,7411,7356,
        7302,7248,7195,7141,7088,7035,6982,6929,6876,6824,
        6771,6719,6667,6615,6564,6512,6461,6410,6359,6309,
        6258,6208,6158,6108,6058,6008,5959,5910,5860,5812,
        5763,5714,5666,5618,5570,5522,5475,5427,5380,5333,
        5286,5240,5193,5147,5101,5055,5009,4964,4919,4874,
        4829,4784,4739,4695,4651,4607,4563,4520,4476,4433,
        4390,4347,4305,4262,4220,4178,4136,4095,4053,4012,
        3971,3930,3889,3849,3809,3769,3729,3689,3650,3610,
        3571,3533,3494,3456,3417,3379,3341,3304,3266,3229,
        3192,3155,3119,3082,3046,3010,2974,2938,2903,2868,
        2833,2798,2764,2729,2695,2661,2627,2594,2560,2527,
        2494,2462,2429,2397,2365,2333,2301,2270,2238,2207,
        2176,2146,2115,2085,2055,2025,1996,1966,1937,1908,
        1879,1851,1823,1795,1767,1739,1711,1684,1657,1630,
        1604,1577,1551,1525,1499,1474,1449,1423,1399,1374,
        1349,1325,1301,1277,1254,1230,1207,1184,1161,1139,
        1117,1094,1073,1051,1029,1008,987,966,946,926,
        905,885,866,846,827,808,789,771,752,734,
        716,698,681,664,646,630,613,597,580,564,
        549,533,518,503,488,473,459,445,431,417,
        403,390,377,364,352,339,327,315,303,292,
        280,269,258,248,237,227,217,207,198,189,
        180,171,162,154,145,137,130,122,115,108,
        101,94,88,82,76,70,65,59,54,50,
        45,41,36,32,29,25,22,19,16,14,
        11,9,7,6,4,3,2,1,0,0,
        0,0,0,1,2,3,4,6,7,9,
        11,14,16,19,22,25,29,32,36,41,
        45,50,54,59,65,70,76,82,88,94,
        101,108,115,122,130,137,145,154,162,171,
        180,189,198,207,217,227,237,248,258,269,
        280,292,303,315,327,339,352,364,377,390,
        403,417,431,445,459,473,488,503,518,533,
        549,564,580,597,613,630,646,664,681,698,
        716,734,752,771,789,808,827,846,866,885,
        905,926,946,966,987,1008,1029,1051,1073,1094,
        1117,1139,1161,1184,1207,1230,1254,1277,1301,1325,
        1349,1374,1399,1423,1449,1474,1499,1525,1551,1577,
        1604,1630,1657,1684,1711,1739,1767,1795,1823,1851,
        1879,1908,1937,1966,1996,2025,2055,2085,2115,2146,
        2176,2207,2238,2270,2301,2333,2365,2397,2429,2462,
        2494,2527,2560,2594,2627,2661,2695,2729,2764,2798,
        2833,2868,2903,2938,2974,3010,3046,3082,3119,3155,
        3192,3229,3266,3304,3341,3379,3417,3456,3494,3533,
        3571,3610,3650,3689,3729,3769,3809,3849,3889,3930,
        3971,4012,4053,4095,4136,4178,4220,4262,4305,4347,
        4390,4433,4476,4520,4563,4607,4651,4695,4739,4784,
        4829,4874,4919,4964,5009,5055,5101,5147,5193,5240,
        5286,5333,5380,5427,5475,5522,5570,5618,5666,5714,
        5763,5812,5860,5910,5959,6008,6058,6108,6158,6208,
        6258,6309,6359,6410,6461,6512,6564,6615,6667,6719,
        6771,6824,6876,6929,6982,7035,7088,7141,7195,7248,
        7302,7356,7411,7465,7520,7574,7629,7685,7740,7795,
        7851,7907,7963,8019,8075,8132,8188,8245,8302,8359,
        8417,8474,8532,8589,8647,8706,8764,8822,8881,8940,
        8999,9058,9117,9177,9236,9296,9356,9416,9476,9537,
        9597,9658,9719,9780,9841,9903,9964,10026,10088,10150,
        10212,10274,10337,10399,10462,10525,10588,10651,10715,10778,
        10842,10906,10970,11034,11098,11162,11227,11292,11357,11422,
        11487,11552,11617,11683,11749,11815,11881,11947,12013,12080,
        12146,12213,12280,12347,12414,12481,12549,12616,12684,12752,
        12820,12888,12956,13025,13093,13162,13231,13300,13369,13438,
        13507,13577,13646,13716,13786,13856,13926,13996,14067,14137,
        14208,14279,14349,14420,14492,14563,14634,14706,14777,14849,
        14921,14993,15065,15137,15210,15282,15355,15428,15500,15573,
        15647,15720,15793,15866,15940,16014,16087,16161,16235,16310,
        16384,16458,16533,16607,16682,16757,16832,16907,16982,17057,
        17132,17208,17283,17359,17435,17510,17586,17663,17739,17815,
        17891,17968,18044,18121,18198,18275,18352,18429,18506,18583,
        18661,18738,18816,18893,18971,19049,19127,19205,19283,19361,
        19440,19518,19597,19675,19754,19833,19912,19991,20070,20149,
        20228,20307,20387,20466,20546,20625,20705,20785,20865,20945,
        21025,21105,21185,21265,21346,21426,21507,21587,21668,21749,
        21829,21910,21991,22072,22154,22235,22316,22397,22479,22560,
        22642,22723,22805,22887,22969,23051,23133,23215,23297,23379,
        23461,23543,23626,23708,23791,23873,23956,24038,24121,24204,
        24287,24370,24452,24535,24619,24702,24785,24868,24951,25035,
        25118,25202,25285,25369,25452,25536,25619,25703,25787,25871,
        25955,26039,26123,26207,26291,26375,26459,26543,26627,26712,
        26796,26880,26965,27049,27134,27218,27303,27388,27472,27557,
        27642,27726,27811,27896,27981,28066,28151,28235,28320,28405,
        28490,28576,28661,28746,28831,28916,29001,29087,29172,29257,
        29342,29428,29513,29598,29684,29769,29855,29940,30026,30111,
        30197,30282,30368,30453,30539,30624,30710,30796,30881,30967,
        31053,31138,31224,31310,31395,31481,31567,31653,31738,31824,
        31910,31996,32081,32167,32253,32339,32424,32510,32596,32682
      )

      //PDM Modulation
      var error = 0
      var output = 0
      for (i <- 0 until 2) {
        for (j <- 0 until 2400) {
          error = error + Sine(j)
          if (error > 0) {
            output = 1
          } else {
            output = -1
          }
          error =  error - output*65535
          output = if (output<0) 0 else output
          dut.io.In.poke(output.B)
          dut.clock.step(127)
          //if(i==0){println(s"output is $output | error is $error | ")}
        }

        println(s"${i + 1} x periods")
      }
      // + dut.IOC.io.Out_ADC.peek().toString

      for (i <- 0 until 500) {
        dut.clock.step(1)
      }
    }
  }
}
