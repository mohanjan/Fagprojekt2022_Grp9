EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 550  850  0    50   ~ 0
- R2R ladder\n- AC coupling\n- pmod compabilitet (12 pins, hvoraf 4 er power/gnd)\n- power opamp (maybe OPA358)
$Comp
L Device:R R9
U 1 1 6220D043
P 2050 3350
F 0 "R9" H 2120 3396 50  0000 L CNN
F 1 "1k" H 2120 3305 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 1980 3350 50  0001 C CNN
F 3 "~" H 2050 3350 50  0001 C CNN
	1    2050 3350
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 6220E409
P 1850 3150
F 0 "R1" V 2057 3150 50  0000 C CNN
F 1 "2k" V 1966 3150 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 1780 3150 50  0001 C CNN
F 3 "~" H 1850 3150 50  0001 C CNN
	1    1850 3150
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2000 3150 2050 3150
Wire Wire Line
	2050 3150 2050 3200
Wire Wire Line
	2050 3500 2050 3600
$Comp
L Device:R R10
U 1 1 6221AF38
P 2050 3800
F 0 "R10" H 2120 3846 50  0000 L CNN
F 1 "1k" H 2120 3755 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 1980 3800 50  0001 C CNN
F 3 "~" H 2050 3800 50  0001 C CNN
	1    2050 3800
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 6221AF3E
P 1850 3600
F 0 "R2" V 2057 3600 50  0000 C CNN
F 1 "2k" V 1966 3600 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 1780 3600 50  0001 C CNN
F 3 "~" H 1850 3600 50  0001 C CNN
	1    1850 3600
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2000 3600 2050 3600
Wire Wire Line
	2050 3600 2050 3650
Wire Wire Line
	2050 3950 2050 4050
$Comp
L Device:R R11
U 1 1 6221BE2F
P 2050 4250
F 0 "R11" H 2120 4296 50  0000 L CNN
F 1 "1k" H 2120 4205 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 1980 4250 50  0001 C CNN
F 3 "~" H 2050 4250 50  0001 C CNN
	1    2050 4250
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 6221BE35
P 1850 4050
F 0 "R3" V 2057 4050 50  0000 C CNN
F 1 "2k" V 1966 4050 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 1780 4050 50  0001 C CNN
F 3 "~" H 1850 4050 50  0001 C CNN
	1    1850 4050
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2000 4050 2050 4050
Wire Wire Line
	2050 4050 2050 4100
Wire Wire Line
	2050 4400 2050 4500
$Comp
L Device:R R12
U 1 1 6221BE3E
P 2050 4700
F 0 "R12" H 2120 4746 50  0000 L CNN
F 1 "1k" H 2120 4655 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 1980 4700 50  0001 C CNN
F 3 "~" H 2050 4700 50  0001 C CNN
	1    2050 4700
	1    0    0    -1  
$EndComp
$Comp
L Device:R R4
U 1 1 6221BE44
P 1850 4500
F 0 "R4" V 2057 4500 50  0000 C CNN
F 1 "2k" V 1966 4500 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 1780 4500 50  0001 C CNN
F 3 "~" H 1850 4500 50  0001 C CNN
	1    1850 4500
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2000 4500 2050 4500
Wire Wire Line
	2050 4500 2050 4550
Wire Wire Line
	2050 4850 2050 4950
$Comp
L Device:R R13
U 1 1 6221DA1C
P 2050 5150
F 0 "R13" H 2120 5196 50  0000 L CNN
F 1 "1k" H 2120 5105 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 1980 5150 50  0001 C CNN
F 3 "~" H 2050 5150 50  0001 C CNN
	1    2050 5150
	1    0    0    -1  
$EndComp
$Comp
L Device:R R5
U 1 1 6221DA22
P 1850 4950
F 0 "R5" V 2057 4950 50  0000 C CNN
F 1 "2k" V 1966 4950 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 1780 4950 50  0001 C CNN
F 3 "~" H 1850 4950 50  0001 C CNN
	1    1850 4950
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2000 4950 2050 4950
Wire Wire Line
	2050 4950 2050 5000
Wire Wire Line
	2050 5300 2050 5400
$Comp
L Device:R R14
U 1 1 6221DA2B
P 2050 5600
F 0 "R14" H 2120 5646 50  0000 L CNN
F 1 "1k" H 2120 5555 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 1980 5600 50  0001 C CNN
F 3 "~" H 2050 5600 50  0001 C CNN
	1    2050 5600
	1    0    0    -1  
$EndComp
$Comp
L Device:R R6
U 1 1 6221DA31
P 1850 5400
F 0 "R6" V 2057 5400 50  0000 C CNN
F 1 "2k" V 1966 5400 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 1780 5400 50  0001 C CNN
F 3 "~" H 1850 5400 50  0001 C CNN
	1    1850 5400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2000 5400 2050 5400
Wire Wire Line
	2050 5400 2050 5450
Wire Wire Line
	2050 5750 2050 5850
$Comp
L Device:R R15
U 1 1 6221DA3A
P 2050 6050
F 0 "R15" H 2120 6096 50  0000 L CNN
F 1 "1k" H 2120 6005 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 1980 6050 50  0001 C CNN
F 3 "~" H 2050 6050 50  0001 C CNN
	1    2050 6050
	1    0    0    -1  
$EndComp
$Comp
L Device:R R7
U 1 1 6221DA40
P 1850 5850
F 0 "R7" V 2057 5850 50  0000 C CNN
F 1 "2k" V 1966 5850 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 1780 5850 50  0001 C CNN
F 3 "~" H 1850 5850 50  0001 C CNN
	1    1850 5850
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2000 5850 2050 5850
Wire Wire Line
	2050 5850 2050 5900
Wire Wire Line
	2050 6200 2050 6300
$Comp
L Device:R R16
U 1 1 6221DA49
P 2050 6500
F 0 "R16" H 2120 6546 50  0000 L CNN
F 1 "2k" H 2120 6455 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 1980 6500 50  0001 C CNN
F 3 "~" H 2050 6500 50  0001 C CNN
	1    2050 6500
	1    0    0    -1  
$EndComp
$Comp
L Device:R R8
U 1 1 6221DA4F
P 1850 6300
F 0 "R8" V 2057 6300 50  0000 C CNN
F 1 "2k" V 1966 6300 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 1780 6300 50  0001 C CNN
F 3 "~" H 1850 6300 50  0001 C CNN
	1    1850 6300
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2000 6300 2050 6300
Wire Wire Line
	2050 6300 2050 6350
Wire Wire Line
	2050 6650 2050 6750
$Comp
L power:GND #PWR03
U 1 1 6221DCAC
P 2050 6750
F 0 "#PWR03" H 2050 6500 50  0001 C CNN
F 1 "GND" H 2055 6577 50  0000 C CNN
F 2 "" H 2050 6750 50  0001 C CNN
F 3 "" H 2050 6750 50  0001 C CNN
	1    2050 6750
	1    0    0    -1  
$EndComp
Wire Wire Line
	10700 1550 10700 1650
$Comp
L power:GND #PWR04
U 1 1 6221E9E8
P 10700 1650
F 0 "#PWR04" H 10700 1400 50  0001 C CNN
F 1 "GND" H 10705 1477 50  0000 C CNN
F 2 "" H 10700 1650 50  0001 C CNN
F 3 "" H 10700 1650 50  0001 C CNN
	1    10700 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	1650 3600 1700 3600
Wire Wire Line
	1600 4050 1700 4050
Wire Wire Line
	1550 4500 1700 4500
Wire Wire Line
	1500 4950 1700 4950
Wire Wire Line
	1450 5400 1700 5400
Wire Wire Line
	1700 5850 1400 5850
Wire Wire Line
	1350 6300 1700 6300
$Comp
L Connector:AudioJack2_SwitchT J2
U 1 1 62248686
P 10900 1450
F 0 "J2" H 10720 1429 50  0000 R CNN
F 1 "AudioJack2_SwitchT" H 10720 1474 50  0001 R CNN
F 2 "Audio_conn:Jack_3.5mm_QingPu_WQP-PJ398SM_Vertical_CircularHoles" H 10900 1450 50  0001 C CNN
F 3 "~" H 10900 1450 50  0001 C CNN
	1    10900 1450
	-1   0    0    1   
$EndComp
NoConn ~ 10700 1350
$Comp
L Device:Opamp_Dual_Generic U1
U 2 1 6225DC83
P 9650 1450
F 0 "U1" H 9650 1817 50  0000 C CNN
F 1 "TSX632" H 9650 1726 50  0000 C CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 9650 1450 50  0001 C CNN
F 3 "~" H 9650 1450 50  0001 C CNN
	2    9650 1450
	1    0    0    -1  
$EndComp
$Comp
L Device:Opamp_Dual_Generic U1
U 1 1 62258B00
P 2700 2900
F 0 "U1" H 2750 3150 50  0000 C CNN
F 1 "TSX632" H 2750 3250 50  0000 C CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 2700 2900 50  0001 C CNN
F 3 "~" H 2700 2900 50  0001 C CNN
	1    2700 2900
	1    0    0    -1  
$EndComp
$Comp
L Device:Opamp_Dual_Generic U1
U 3 1 6225E370
P 2700 2900
F 0 "U1" H 2512 2900 50  0001 R CNN
F 1 "TSX632" H 2512 2945 50  0001 R CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 2700 2900 50  0001 C CNN
F 3 "~" H 2700 2900 50  0001 C CNN
	3    2700 2900
	1    0    0    1   
$EndComp
$Comp
L power:VCC #PWR0101
U 1 1 62266990
P 2600 3300
F 0 "#PWR0101" H 2600 3150 50  0001 C CNN
F 1 "VCC" V 2617 3428 50  0000 L CNN
F 2 "" H 2600 3300 50  0001 C CNN
F 3 "" H 2600 3300 50  0001 C CNN
	1    2600 3300
	-1   0    0    1   
$EndComp
$Comp
L Jumper:Jumper_2_Open JP1
U 1 1 6226E067
P 2750 1850
F 0 "JP1" H 2750 2085 50  0000 C CNN
F 1 "Jumper_2_Open" H 2750 1994 50  0000 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_Pad1.0x1.5mm" H 2750 1850 50  0001 C CNN
F 3 "~" H 2750 1850 50  0001 C CNN
	1    2750 1850
	1    0    0    -1  
$EndComp
$Comp
L Device:R R18
U 1 1 62276EDA
P 3250 2900
F 0 "R18" H 3320 2946 50  0000 L CNN
F 1 "1k" H 3320 2855 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 3180 2900 50  0001 C CNN
F 3 "~" H 3250 2900 50  0001 C CNN
	1    3250 2900
	0    -1   -1   0   
$EndComp
$Comp
L Device:C_Small C2
U 1 1 6227F499
P 2700 3250
F 0 "C2" V 2471 3250 50  0000 C CNN
F 1 "100" V 2562 3250 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2700 3250 50  0001 C CNN
F 3 "~" H 2700 3250 50  0001 C CNN
	1    2700 3250
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3000 2900 3050 2900
$Comp
L power:GND #PWR0103
U 1 1 6229D9D0
P 2600 2300
F 0 "#PWR0103" H 2600 2050 50  0001 C CNN
F 1 "GND" H 2605 2127 50  0000 C CNN
F 2 "" H 2600 2300 50  0001 C CNN
F 3 "" H 2600 2300 50  0001 C CNN
	1    2600 2300
	-1   0    0    1   
$EndComp
Wire Wire Line
	2600 3300 2600 3250
Connection ~ 2600 3250
Wire Wire Line
	2600 3250 2600 3200
$Comp
L power:GND #PWR0104
U 1 1 622A60DB
P 2850 3250
F 0 "#PWR0104" H 2850 3000 50  0001 C CNN
F 1 "GND" V 2855 3122 50  0000 R CNN
F 2 "" H 2850 3250 50  0001 C CNN
F 3 "" H 2850 3250 50  0001 C CNN
	1    2850 3250
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2850 3250 2800 3250
Connection ~ 3050 2900
Wire Wire Line
	3050 2900 3100 2900
Wire Wire Line
	2300 2800 2400 2800
Wire Wire Line
	2550 1850 2300 1850
Wire Wire Line
	2300 1850 2300 2800
Wire Wire Line
	2950 1850 3050 1850
Wire Wire Line
	3050 1850 3050 2900
Wire Wire Line
	2400 3000 2400 3800
Wire Wire Line
	2600 2300 2600 2600
$Comp
L Device:R R17
U 1 1 622BE822
P 2050 2600
F 0 "R17" H 2120 2646 50  0000 L CNN
F 1 "2k" H 2120 2555 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 1980 2600 50  0001 C CNN
F 3 "~" H 2050 2600 50  0001 C CNN
	1    2050 2600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR05
U 1 1 622BED6A
P 2050 2450
F 0 "#PWR05" H 2050 2200 50  0001 C CNN
F 1 "GND" H 2055 2277 50  0000 C CNN
F 2 "" H 2050 2450 50  0001 C CNN
F 3 "" H 2050 2450 50  0001 C CNN
	1    2050 2450
	-1   0    0    1   
$EndComp
$Comp
L Device:R R19
U 1 1 622C4204
P 2050 3000
F 0 "R19" H 2120 3046 50  0000 L CNN
F 1 "1k" H 2120 2955 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 1980 3000 50  0001 C CNN
F 3 "~" H 2050 3000 50  0001 C CNN
	1    2050 3000
	1    0    0    -1  
$EndComp
Connection ~ 2050 3150
Connection ~ 2050 3600
Connection ~ 2050 4050
Connection ~ 2050 4500
Connection ~ 2050 4950
Connection ~ 2050 5400
Connection ~ 2050 5850
Connection ~ 2050 6300
Wire Wire Line
	3050 3800 2400 3800
Wire Wire Line
	3050 2900 3050 3800
Wire Wire Line
	2050 2750 2050 2800
Wire Wire Line
	2300 2800 2050 2800
Connection ~ 2300 2800
Connection ~ 2050 2800
Wire Wire Line
	2050 2800 2050 2850
Text Notes 2650 3750 0    50   ~ 0
3R?\n
Wire Wire Line
	1400 5850 1400 3850
Wire Wire Line
	850  4200 850  4250
Connection ~ 850  4200
Wire Wire Line
	900  4200 850  4200
$Comp
L power:VCC #PWR02
U 1 1 62238585
P 900 4200
F 0 "#PWR02" H 900 4050 50  0001 C CNN
F 1 "VCC" V 917 4328 50  0000 L CNN
F 2 "" H 900 4200 50  0001 C CNN
F 3 "" H 900 4200 50  0001 C CNN
	1    900  4200
	0    1    1    0   
$EndComp
Wire Wire Line
	850  4150 850  4200
Wire Wire Line
	850  4000 850  4050
Connection ~ 850  4000
Wire Wire Line
	850  4000 900  4000
Wire Wire Line
	850  3950 850  4000
$Comp
L power:GND #PWR01
U 1 1 622301B9
P 900 4000
F 0 "#PWR01" H 900 3750 50  0001 C CNN
F 1 "GND" H 905 3827 50  0000 C CNN
F 2 "" H 900 4000 50  0001 C CNN
F 3 "" H 900 4000 50  0001 C CNN
	1    900  4000
	0    -1   -1   0   
$EndComp
$Comp
L Connector:Conn_01x12_Male J1
U 1 1 622247A3
P 650 3750
F 0 "J1" H 758 4339 50  0000 C CNN
F 1 "Conn_01x12_Male" H 758 4340 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x06_P2.54mm_Horizontal" H 650 3750 50  0001 C CNN
F 3 "~" H 650 3750 50  0001 C CNN
	1    650  3750
	1    0    0    1   
$EndComp
Wire Wire Line
	850  3250 1500 3250
Wire Wire Line
	1500 3250 1500 3150
Wire Wire Line
	1500 3150 1700 3150
Wire Wire Line
	850  3150 1000 3150
Wire Wire Line
	1000 3150 1000 3300
Wire Wire Line
	1000 3300 1650 3300
Wire Wire Line
	1650 3300 1650 3600
Wire Wire Line
	850  3350 900  3350
Wire Wire Line
	900  3350 900  3500
Wire Wire Line
	900  3500 1550 3500
Wire Wire Line
	1550 3500 1550 4500
Wire Wire Line
	850  3450 1600 3450
Wire Wire Line
	1600 3450 1600 4050
Wire Wire Line
	850  3550 900  3550
Wire Wire Line
	900  3550 900  3700
Wire Wire Line
	900  3700 1450 3700
Wire Wire Line
	1450 3700 1450 5400
Wire Wire Line
	1500 3650 850  3650
Wire Wire Line
	1500 3650 1500 4950
Wire Wire Line
	850  3750 900  3750
Wire Wire Line
	900  3750 900  3900
Wire Wire Line
	900  3900 1350 3900
Wire Wire Line
	1350 3900 1350 6300
Wire Wire Line
	850  3850 1400 3850
$Comp
L Device:R R22
U 1 1 622F5DF6
P 6350 4000
F 0 "R22" V 6143 4000 50  0000 C CNN
F 1 "R" V 6234 4000 50  0000 C CNN
F 2 "" V 6280 4000 50  0001 C CNN
F 3 "~" H 6350 4000 50  0001 C CNN
	1    6350 4000
	0    1    1    0   
$EndComp
$Comp
L Device:R R23
U 1 1 622F713A
P 6350 4450
F 0 "R23" V 6143 4450 50  0000 C CNN
F 1 "R" V 6234 4450 50  0000 C CNN
F 2 "" V 6280 4450 50  0001 C CNN
F 3 "~" H 6350 4450 50  0001 C CNN
	1    6350 4450
	0    1    1    0   
$EndComp
$Comp
L Device:R R30
U 1 1 62312081
P 9650 1750
F 0 "R30" V 9857 1750 50  0000 C CNN
F 1 "1k" V 9766 1750 50  0000 C CNN
F 2 "" V 9580 1750 50  0001 C CNN
F 3 "~" H 9650 1750 50  0001 C CNN
	1    9650 1750
	0    1    1    0   
$EndComp
Wire Wire Line
	9950 1750 9800 1750
Wire Wire Line
	9950 1450 9950 1750
Wire Wire Line
	9500 1750 9350 1750
Wire Wire Line
	9350 1550 9350 1750
$Comp
L Device:R R29
U 1 1 6231FFCA
P 9350 2050
F 0 "R29" H 9280 2004 50  0000 R CNN
F 1 "1k" H 9280 2095 50  0000 R CNN
F 2 "" V 9280 2050 50  0001 C CNN
F 3 "~" H 9350 2050 50  0001 C CNN
	1    9350 2050
	-1   0    0    1   
$EndComp
Wire Wire Line
	9350 1900 9350 1750
Connection ~ 9350 1750
$Comp
L power:GND #PWR0102
U 1 1 62326D98
P 9350 2250
F 0 "#PWR0102" H 9350 2000 50  0001 C CNN
F 1 "GND" H 9355 2077 50  0000 C CNN
F 2 "" H 9350 2250 50  0001 C CNN
F 3 "" H 9350 2250 50  0001 C CNN
	1    9350 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	9350 2250 9350 2200
$Comp
L Device:C_Small C3
U 1 1 62339D7F
P 9200 1500
F 0 "C3" H 9108 1454 50  0000 R CNN
F 1 "10n" H 9108 1545 50  0000 R CNN
F 2 "" H 9200 1500 50  0001 C CNN
F 3 "~" H 9200 1500 50  0001 C CNN
	1    9200 1500
	1    0    0    1   
$EndComp
$Comp
L power:GND #PWR0105
U 1 1 6234C4AF
P 9200 1600
F 0 "#PWR0105" H 9200 1350 50  0001 C CNN
F 1 "GND" H 9205 1427 50  0000 C CNN
F 2 "" H 9200 1600 50  0001 C CNN
F 3 "" H 9200 1600 50  0001 C CNN
	1    9200 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	9350 1350 9200 1350
Wire Wire Line
	9200 1350 9200 1400
$Comp
L Device:R R28
U 1 1 6234FEEE
P 8950 1350
F 0 "R28" V 8743 1350 50  0000 C CNN
F 1 "820" V 8834 1350 50  0000 C CNN
F 2 "" V 8880 1350 50  0001 C CNN
F 3 "~" H 8950 1350 50  0001 C CNN
	1    8950 1350
	0    1    1    0   
$EndComp
$Comp
L Device:R R27
U 1 1 62350A22
P 8550 1350
F 0 "R27" V 8343 1350 50  0000 C CNN
F 1 "820" V 8434 1350 50  0000 C CNN
F 2 "" V 8480 1350 50  0001 C CNN
F 3 "~" H 8550 1350 50  0001 C CNN
	1    8550 1350
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C4
U 1 1 62353436
P 9550 750
F 0 "C4" H 9458 704 50  0000 R CNN
F 1 "10n" H 9458 795 50  0000 R CNN
F 2 "" H 9550 750 50  0001 C CNN
F 3 "~" H 9550 750 50  0001 C CNN
	1    9550 750 
	0    -1   1    0   
$EndComp
Wire Wire Line
	9650 750  9950 750 
Wire Wire Line
	9950 750  9950 1450
Connection ~ 9950 1450
Wire Wire Line
	9450 750  8750 750 
Wire Wire Line
	8750 750  8750 1350
Wire Wire Line
	8750 1350 8800 1350
Wire Wire Line
	8700 1350 8750 1350
Connection ~ 8750 1350
Wire Wire Line
	9100 1350 9200 1350
Connection ~ 9200 1350
Text GLabel 8250 1350 0    50   Input ~ 0
DAC_D_out
Wire Wire Line
	8250 1350 8400 1350
Wire Wire Line
	10400 1450 10700 1450
Wire Wire Line
	6900 4450 6500 4450
$Comp
L Device:C_Small C1
U 1 1 62391960
P 7200 4000
F 0 "C1" V 6971 4000 50  0000 C CNN
F 1 "C_Small" V 7062 4000 50  0000 C CNN
F 2 "" H 7200 4000 50  0001 C CNN
F 3 "~" H 7200 4000 50  0001 C CNN
	1    7200 4000
	0    1    1    0   
$EndComp
Wire Wire Line
	7100 4000 6900 4000
Wire Wire Line
	6900 4000 6900 4450
Wire Wire Line
	7300 4000 7500 4000
Wire Wire Line
	7500 4000 7500 4550
Wire Wire Line
	6500 4000 6900 4000
Connection ~ 6900 4000
$Comp
L power:GND #PWR0106
U 1 1 623AE9BF
P 7750 4800
F 0 "#PWR0106" H 7750 4550 50  0001 C CNN
F 1 "GND" H 7755 4627 50  0000 C CNN
F 2 "" H 7750 4800 50  0001 C CNN
F 3 "" H 7750 4800 50  0001 C CNN
	1    7750 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	7750 4800 7750 4750
Wire Wire Line
	7750 4750 7850 4750
$Comp
L pspice:OPAMP U2
U 1 1 623B2E0A
P 7200 4550
F 0 "U2" H 7200 4069 50  0000 C CNN
F 1 "OPAMP" H 7200 4160 50  0000 C CNN
F 2 "" H 7200 4550 50  0001 C CNN
F 3 "~" H 7200 4550 50  0001 C CNN
	1    7200 4550
	1    0    0    1   
$EndComp
Connection ~ 6900 4450
$Comp
L pspice:OPAMP U4
U 1 1 623B69A4
P 8150 4650
F 0 "U4" H 8300 4500 50  0000 L CNN
F 1 "OPAMP" H 8200 4400 50  0000 L CNN
F 2 "" H 8150 4650 50  0001 C CNN
F 3 "~" H 8150 4650 50  0001 C CNN
	1    8150 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	7850 4550 7500 4550
Connection ~ 7500 4550
Text GLabel 3550 2900 2    50   Input ~ 0
DAC_D_out
Wire Wire Line
	3550 2900 3400 2900
Text GLabel 8850 4650 2    50   Input ~ 0
ADC_A_in
Wire Wire Line
	8850 4650 8450 4650
Text Notes 550  1350 0    50   ~ 0
hvis forbindes med eurorack, så brug noise limiting thingies\n\npower supply\n- use 5V voltage regulator\n- ferrite beads & decoupling caps!
Text GLabel 8850 3250 2    50   Input ~ 0
ADC_D_out
$Comp
L power:GND #PWR0107
U 1 1 623CD288
P 6800 4750
F 0 "#PWR0107" H 6800 4500 50  0001 C CNN
F 1 "GND" H 6805 4577 50  0000 C CNN
F 2 "" H 6800 4750 50  0001 C CNN
F 3 "" H 6800 4750 50  0001 C CNN
	1    6800 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	6800 4750 6800 4650
Wire Wire Line
	6800 4650 6900 4650
$Comp
L pspice:OPAMP U3
U 1 1 623DE46D
P 7250 3350
F 0 "U3" H 7400 3200 50  0000 L CNN
F 1 "OPAMP" H 7300 3100 50  0000 L CNN
F 2 "" H 7250 3350 50  0001 C CNN
F 3 "~" H 7250 3350 50  0001 C CNN
	1    7250 3350
	-1   0    0    -1  
$EndComp
$Comp
L Device:R R24
U 1 1 623E8035
P 7800 3250
F 0 "R24" V 7593 3250 50  0000 C CNN
F 1 "R" V 7684 3250 50  0000 C CNN
F 2 "" V 7730 3250 50  0001 C CNN
F 3 "~" H 7800 3250 50  0001 C CNN
	1    7800 3250
	0    1    1    0   
$EndComp
$Comp
L Device:R R26
U 1 1 623E8AEC
P 8200 3700
F 0 "R26" V 7993 3700 50  0000 C CNN
F 1 "R" V 8084 3700 50  0000 C CNN
F 2 "" V 8130 3700 50  0001 C CNN
F 3 "~" H 8200 3700 50  0001 C CNN
	1    8200 3700
	0    1    1    0   
$EndComp
$Comp
L Device:R R25
U 1 1 623EBF14
P 7800 3700
F 0 "R25" V 7593 3700 50  0000 C CNN
F 1 "R" V 7684 3700 50  0000 C CNN
F 2 "" V 7730 3700 50  0001 C CNN
F 3 "~" H 7800 3700 50  0001 C CNN
	1    7800 3700
	0    1    1    0   
$EndComp
Wire Wire Line
	7650 3250 7550 3250
Wire Wire Line
	7950 3700 8000 3700
Wire Wire Line
	7950 3250 8850 3250
Wire Wire Line
	8000 3700 8000 3450
Wire Wire Line
	8000 3450 7550 3450
Connection ~ 8000 3700
Wire Wire Line
	8000 3700 8050 3700
$Comp
L power:GND #PWR0108
U 1 1 6240D7D4
P 7650 3750
F 0 "#PWR0108" H 7650 3500 50  0001 C CNN
F 1 "GND" H 7655 3577 50  0000 C CNN
F 2 "" H 7650 3750 50  0001 C CNN
F 3 "" H 7650 3750 50  0001 C CNN
	1    7650 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	7650 3750 7650 3700
Wire Wire Line
	8400 3700 8350 3700
Wire Wire Line
	6950 3350 6200 3350
Wire Wire Line
	6200 3350 6200 4000
Text GLabel 6100 4450 0    50   Input ~ 0
ADC_signal_in
Wire Wire Line
	6100 4450 6200 4450
Text GLabel 6150 6100 2    50   Input ~ 0
ADC_signal_in
$Comp
L Device:R R20
U 1 1 623411A6
P 5750 6100
F 0 "R20" H 5820 6146 50  0000 L CNN
F 1 "100k" H 5820 6055 50  0000 L CNN
F 2 "" V 5680 6100 50  0001 C CNN
F 3 "~" H 5750 6100 50  0001 C CNN
	1    5750 6100
	0    1    1    0   
$EndComp
$Comp
L Device:R R21
U 1 1 62345948
P 6000 6450
F 0 "R21" V 6207 6450 50  0000 C CNN
F 1 "10k" V 6116 6450 50  0000 C CNN
F 2 "" V 5930 6450 50  0001 C CNN
F 3 "~" H 6000 6450 50  0001 C CNN
	1    6000 6450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5900 6100 6000 6100
Wire Wire Line
	6000 6100 6000 6300
$Comp
L power:GND #PWR0110
U 1 1 62356DA6
P 6000 6750
F 0 "#PWR0110" H 6000 6500 50  0001 C CNN
F 1 "GND" H 6005 6577 50  0000 C CNN
F 2 "" H 6000 6750 50  0001 C CNN
F 3 "" H 6000 6750 50  0001 C CNN
	1    6000 6750
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 6750 6000 6600
Wire Wire Line
	6150 6100 6000 6100
Connection ~ 6000 6100
Text Notes 8150 3150 0    50   ~ 0
- sends out voltage. High input impedance?
Wire Wire Line
	5300 6200 5300 6300
$Comp
L power:GND #PWR0111
U 1 1 62373033
P 5300 6300
F 0 "#PWR0111" H 5300 6050 50  0001 C CNN
F 1 "GND" H 5305 6127 50  0000 C CNN
F 2 "" H 5300 6300 50  0001 C CNN
F 3 "" H 5300 6300 50  0001 C CNN
	1    5300 6300
	-1   0    0    -1  
$EndComp
$Comp
L Connector:AudioJack2_SwitchT J3
U 1 1 62373039
P 5100 6100
F 0 "J3" H 4920 6079 50  0000 R CNN
F 1 "AudioJack2_SwitchT" H 4920 6124 50  0001 R CNN
F 2 "Audio_conn:Jack_3.5mm_QingPu_WQP-PJ398SM_Vertical_CircularHoles" H 5100 6100 50  0001 C CNN
F 3 "~" H 5100 6100 50  0001 C CNN
	1    5100 6100
	1    0    0    1   
$EndComp
NoConn ~ 5300 6000
Wire Wire Line
	5600 6100 5300 6100
Wire Wire Line
	10550 4950 10550 5050
$Comp
L Connector:Conn_01x16_Male J4
U 1 1 6238DB04
P 10750 5650
F 0 "J4" H 10722 5624 50  0000 R CNN
F 1 "Conn_01x16_Male" H 10722 5533 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x08_P2.54mm_Vertical" H 10750 5650 50  0001 C CNN
F 3 "~" H 10750 5650 50  0001 C CNN
	1    10750 5650
	-1   0    0    -1  
$EndComp
Text Notes 10950 5300 0    50   ~ 0
-12\nGnd\n+12\n+5\nCV\nGate
Wire Wire Line
	10550 5150 10550 5250
Connection ~ 10550 5250
Wire Wire Line
	10550 5250 10550 5350
Connection ~ 10550 5350
Wire Wire Line
	10550 5350 10550 5400
Connection ~ 10550 5450
Wire Wire Line
	10550 5450 10550 5550
Connection ~ 10550 5550
Wire Wire Line
	10550 5550 10550 5650
Wire Wire Line
	10550 5750 10550 5850
Wire Wire Line
	10550 5950 10550 6050
Wire Wire Line
	10550 6150 10550 6250
Wire Wire Line
	10550 6350 10550 6450
$Comp
L Device:C_Small C8
U 1 1 623AEDD6
P 9950 5050
F 0 "C8" H 10042 5096 50  0000 L CNN
F 1 "10n" H 10042 5005 50  0000 L CNN
F 2 "" H 9950 5050 50  0001 C CNN
F 3 "~" H 9950 5050 50  0001 C CNN
	1    9950 5050
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C9
U 1 1 623AFD26
P 9950 5750
F 0 "C9" H 10042 5796 50  0000 L CNN
F 1 "10n" H 10042 5705 50  0000 L CNN
F 2 "" H 9950 5750 50  0001 C CNN
F 3 "~" H 9950 5750 50  0001 C CNN
	1    9950 5750
	1    0    0    -1  
$EndComp
$Comp
L Device:CP_Small C6
U 1 1 623B55F5
P 9650 5750
F 0 "C6" H 9562 5704 50  0000 R CNN
F 1 "47u" H 9562 5795 50  0000 R CNN
F 2 "" H 9650 5750 50  0001 C CNN
F 3 "~" H 9650 5750 50  0001 C CNN
	1    9650 5750
	-1   0    0    1   
$EndComp
$Comp
L Device:CP_Small C5
U 1 1 623B6451
P 9650 5050
F 0 "C5" H 9562 5004 50  0000 R CNN
F 1 "47u" H 9562 5095 50  0000 R CNN
F 2 "" H 9650 5050 50  0001 C CNN
F 3 "~" H 9650 5050 50  0001 C CNN
	1    9650 5050
	-1   0    0    1   
$EndComp
$Comp
L Device:Ferrite_Bead_Small FB1
U 1 1 623C6195
P 10300 4950
F 0 "FB1" V 10155 4950 50  0000 C CNN
F 1 "Ferrite_Bead_Small" V 10154 4950 50  0001 C CNN
F 2 "" V 10230 4950 50  0001 C CNN
F 3 "~" H 10300 4950 50  0001 C CNN
	1    10300 4950
	0    1    1    0   
$EndComp
Wire Wire Line
	10550 4950 10400 4950
Connection ~ 10550 4950
Wire Wire Line
	10200 4950 9950 4950
Connection ~ 9950 4950
Wire Wire Line
	9950 4950 9800 4950
$Comp
L Device:Ferrite_Bead_Small FB2
U 1 1 623DA7A0
P 10350 5850
F 0 "FB2" V 10205 5850 50  0000 C CNN
F 1 "Ferrite_Bead_Small" V 10204 5850 50  0001 C CNN
F 2 "" V 10280 5850 50  0001 C CNN
F 3 "~" H 10350 5850 50  0001 C CNN
	1    10350 5850
	0    1    1    0   
$EndComp
Wire Wire Line
	10550 5850 10450 5850
Connection ~ 10550 5850
Wire Wire Line
	10250 5850 9950 5850
Connection ~ 9950 5850
Wire Wire Line
	9650 5150 9950 5150
Connection ~ 10550 5150
Connection ~ 9950 5150
Wire Wire Line
	9950 5150 10550 5150
Wire Wire Line
	10550 5650 9950 5650
Connection ~ 10550 5650
Connection ~ 9950 5650
Wire Wire Line
	9950 5650 9650 5650
$Comp
L power:GND #PWR0112
U 1 1 624045FC
P 10550 5400
F 0 "#PWR0112" H 10550 5150 50  0001 C CNN
F 1 "GND" V 10555 5272 50  0000 R CNN
F 2 "" H 10550 5400 50  0001 C CNN
F 3 "" H 10550 5400 50  0001 C CNN
	1    10550 5400
	0    1    1    0   
$EndComp
Connection ~ 10550 5400
Wire Wire Line
	10550 5400 10550 5450
$Comp
L power:+12V #PWR0113
U 1 1 62404F44
P 9650 5850
F 0 "#PWR0113" H 9650 5700 50  0001 C CNN
F 1 "+12V" H 9665 6023 50  0000 C CNN
F 2 "" H 9650 5850 50  0001 C CNN
F 3 "" H 9650 5850 50  0001 C CNN
	1    9650 5850
	0    -1   -1   0   
$EndComp
$Comp
L power:-12V #PWR0114
U 1 1 62405FD2
P 9800 4950
F 0 "#PWR0114" H 9800 5050 50  0001 C CNN
F 1 "-12V" H 9815 5123 50  0000 C CNN
F 2 "" H 9800 4950 50  0001 C CNN
F 3 "" H 9800 4950 50  0001 C CNN
	1    9800 4950
	1    0    0    -1  
$EndComp
Connection ~ 9800 4950
Wire Wire Line
	9800 4950 9650 4950
$Comp
L Device:C_Small C10
U 1 1 6240A4A2
P 9950 6150
F 0 "C10" H 10042 6196 50  0000 L CNN
F 1 "10n" H 10042 6105 50  0000 L CNN
F 2 "" H 9950 6150 50  0001 C CNN
F 3 "~" H 9950 6150 50  0001 C CNN
	1    9950 6150
	1    0    0    1   
$EndComp
$Comp
L Device:CP_Small C7
U 1 1 6240A4A8
P 9650 6150
F 0 "C7" H 9562 6104 50  0000 R CNN
F 1 "47u" H 9562 6195 50  0000 R CNN
F 2 "" H 9650 6150 50  0001 C CNN
F 3 "~" H 9650 6150 50  0001 C CNN
	1    9650 6150
	-1   0    0    -1  
$EndComp
$Comp
L Device:Ferrite_Bead_Small FB3
U 1 1 6240A4AE
P 10350 6050
F 0 "FB3" V 10205 6050 50  0000 C CNN
F 1 "Ferrite_Bead_Small" V 10204 6050 50  0001 C CNN
F 2 "" V 10280 6050 50  0001 C CNN
F 3 "~" H 10350 6050 50  0001 C CNN
	1    10350 6050
	0    1    -1   0   
$EndComp
Wire Wire Line
	10250 6050 9950 6050
Connection ~ 9950 6050
Wire Wire Line
	9650 6050 9950 6050
Wire Wire Line
	10450 6050 10550 6050
Connection ~ 10550 6050
Wire Wire Line
	9650 6250 9800 6250
$Comp
L power:GND #PWR0115
U 1 1 624259AB
P 9800 6250
F 0 "#PWR0115" H 9800 6000 50  0001 C CNN
F 1 "GND" H 9805 6077 50  0000 C CNN
F 2 "" H 9800 6250 50  0001 C CNN
F 3 "" H 9800 6250 50  0001 C CNN
	1    9800 6250
	1    0    0    -1  
$EndComp
Connection ~ 9800 6250
Wire Wire Line
	9800 6250 9950 6250
Connection ~ 9650 5850
Wire Wire Line
	9650 5850 9950 5850
$Comp
L power:+5V #PWR0116
U 1 1 6242C6F5
P 9650 6050
F 0 "#PWR0116" H 9650 5900 50  0001 C CNN
F 1 "+5V" V 9665 6178 50  0000 L CNN
F 2 "" H 9650 6050 50  0001 C CNN
F 3 "" H 9650 6050 50  0001 C CNN
	1    9650 6050
	0    -1   -1   0   
$EndComp
Connection ~ 9650 6050
$Comp
L power:+5V #PWR?
U 1 1 6242F362
P 8400 3700
F 0 "#PWR?" H 8400 3550 50  0001 C CNN
F 1 "+5V" H 8415 3873 50  0000 C CNN
F 2 "" H 8400 3700 50  0001 C CNN
F 3 "" H 8400 3700 50  0001 C CNN
	1    8400 3700
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 6243E354
P 10250 1450
F 0 "R?" V 10043 1450 50  0000 C CNN
F 1 "1k" V 10134 1450 50  0000 C CNN
F 2 "" V 10180 1450 50  0001 C CNN
F 3 "~" H 10250 1450 50  0001 C CNN
	1    10250 1450
	0    1    1    0   
$EndComp
Wire Wire Line
	10100 1450 9950 1450
Text Notes 6700 5300 0    50   ~ 0
-high slew rate comparators\n+-12 eller ?
$EndSCHEMATC
