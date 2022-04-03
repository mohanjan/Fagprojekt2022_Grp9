EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 4
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Wire Wire Line
	4000 2450 3850 2450
Text GLabel 4000 2450 2    50   Input ~ 0
DAC_R2R_out
Wire Wire Line
	1300 3400 1850 3400
Wire Wire Line
	1800 3450 1800 5850
Wire Wire Line
	1350 3450 1800 3450
Wire Wire Line
	1350 3300 1350 3450
Wire Wire Line
	1300 3300 1350 3300
Wire Wire Line
	1950 3200 1950 4500
Wire Wire Line
	1950 3200 1300 3200
Wire Wire Line
	1900 3250 1900 4950
Wire Wire Line
	1350 3250 1900 3250
Wire Wire Line
	1350 3100 1350 3250
Wire Wire Line
	1300 3100 1350 3100
Wire Wire Line
	2050 3000 2050 3600
Wire Wire Line
	1300 3000 2050 3000
Wire Wire Line
	2000 3050 2000 4050
Wire Wire Line
	1350 3050 2000 3050
Wire Wire Line
	1350 2900 1350 3050
Wire Wire Line
	1300 2900 1350 2900
Wire Wire Line
	2100 2850 2100 3150
Wire Wire Line
	1450 2850 2100 2850
Wire Wire Line
	1450 2700 1450 2850
Wire Wire Line
	1300 2700 1450 2700
Wire Wire Line
	1950 2700 2150 2700
Wire Wire Line
	1950 2800 1950 2700
Wire Wire Line
	1300 2800 1950 2800
$Comp
L Connector:Conn_01x12_Male J?
U 1 1 6243F7CD
P 1100 3300
AR Path="/6243F7CD" Ref="J?"  Part="1" 
AR Path="/6242AFE6/6243F7CD" Ref="J1"  Part="1" 
F 0 "J1" H 1208 3889 50  0000 C CNN
F 1 "Conn_01x12_Male" H 1208 3890 50  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x06_P2.54mm_Horizontal" H 1100 3300 50  0001 C CNN
F 3 "~" H 1100 3300 50  0001 C CNN
	1    1100 3300
	1    0    0    1   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6243F7D3
P 1350 3550
AR Path="/6243F7D3" Ref="#PWR?"  Part="1" 
AR Path="/6242AFE6/6243F7D3" Ref="#PWR01"  Part="1" 
F 0 "#PWR01" H 1350 3300 50  0001 C CNN
F 1 "GND" H 1355 3377 50  0000 C CNN
F 2 "" H 1350 3550 50  0001 C CNN
F 3 "" H 1350 3550 50  0001 C CNN
	1    1350 3550
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1300 3500 1300 3550
Wire Wire Line
	1300 3550 1350 3550
Connection ~ 1300 3550
Wire Wire Line
	1300 3550 1300 3600
Wire Wire Line
	1850 5400 1850 3400
Wire Wire Line
	2500 2350 2500 2400
Connection ~ 2500 2350
Connection ~ 2750 2350
Wire Wire Line
	2750 2350 2500 2350
Wire Wire Line
	2500 2300 2500 2350
Wire Wire Line
	3500 2450 3500 3350
Wire Wire Line
	3500 3350 2850 3350
Connection ~ 2500 5850
Connection ~ 2500 5400
Connection ~ 2500 4950
Connection ~ 2500 4500
Connection ~ 2500 4050
Connection ~ 2500 3600
Connection ~ 2500 3150
Connection ~ 2500 2700
$Comp
L Device:R R?
U 1 1 6243F7F8
P 2500 2550
AR Path="/6243F7F8" Ref="R?"  Part="1" 
AR Path="/6242AFE6/6243F7F8" Ref="R10"  Part="1" 
F 0 "R10" H 2570 2596 50  0000 L CNN
F 1 "1k" H 2570 2505 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 2430 2550 50  0001 C CNN
F 3 "~" H 2500 2550 50  0001 C CNN
	1    2500 2550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6243F7FE
P 2500 2000
AR Path="/6243F7FE" Ref="#PWR?"  Part="1" 
AR Path="/6242AFE6/6243F7FE" Ref="#PWR03"  Part="1" 
F 0 "#PWR03" H 2500 1750 50  0001 C CNN
F 1 "GND" H 2505 1827 50  0000 C CNN
F 2 "" H 2500 2000 50  0001 C CNN
F 3 "" H 2500 2000 50  0001 C CNN
	1    2500 2000
	-1   0    0    1   
$EndComp
$Comp
L Device:R R?
U 1 1 6243F804
P 2500 2150
AR Path="/6243F804" Ref="R?"  Part="1" 
AR Path="/6242AFE6/6243F804" Ref="R9"  Part="1" 
F 0 "R9" H 2570 2196 50  0000 L CNN
F 1 "2k" H 2570 2105 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 2430 2150 50  0001 C CNN
F 3 "~" H 2500 2150 50  0001 C CNN
	1    2500 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	2850 2550 2850 3350
Wire Wire Line
	3500 1400 3500 2450
Wire Wire Line
	3400 1400 3500 1400
Wire Wire Line
	2750 1400 2750 2350
Wire Wire Line
	3000 1400 2750 1400
Wire Wire Line
	2750 2350 2850 2350
Wire Wire Line
	3500 2450 3550 2450
Connection ~ 3500 2450
Wire Wire Line
	3300 2800 3250 2800
$Comp
L power:GND #PWR?
U 1 1 6243F814
P 3300 2800
AR Path="/6243F814" Ref="#PWR?"  Part="1" 
AR Path="/6242AFE6/6243F814" Ref="#PWR05"  Part="1" 
F 0 "#PWR05" H 3300 2550 50  0001 C CNN
F 1 "GND" V 3305 2672 50  0000 R CNN
F 2 "" H 3300 2800 50  0001 C CNN
F 3 "" H 3300 2800 50  0001 C CNN
	1    3300 2800
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3050 2800 3050 2750
Connection ~ 3050 2800
Wire Wire Line
	3050 2850 3050 2800
Wire Wire Line
	3450 2450 3500 2450
$Comp
L Device:C_Small C?
U 1 1 6243F824
P 3150 2800
AR Path="/6243F824" Ref="C?"  Part="1" 
AR Path="/6242AFE6/6243F824" Ref="C1"  Part="1" 
F 0 "C1" V 2921 2800 50  0000 C CNN
F 1 "100" V 3012 2800 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3150 2800 50  0001 C CNN
F 3 "~" H 3150 2800 50  0001 C CNN
	1    3150 2800
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R?
U 1 1 6243F82A
P 3700 2450
AR Path="/6243F82A" Ref="R?"  Part="1" 
AR Path="/6242AFE6/6243F82A" Ref="R19"  Part="1" 
F 0 "R19" H 3770 2496 50  0000 L CNN
F 1 "1k" H 3770 2405 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 3630 2450 50  0001 C CNN
F 3 "~" H 3700 2450 50  0001 C CNN
	1    3700 2450
	0    -1   -1   0   
$EndComp
$Comp
L Jumper:Jumper_2_Open JP?
U 1 1 6243F830
P 3200 1400
AR Path="/6243F830" Ref="JP?"  Part="1" 
AR Path="/6242AFE6/6243F830" Ref="JP1"  Part="1" 
F 0 "JP1" H 3200 1635 50  0000 C CNN
F 1 "Jumper_2_Open" H 3200 1544 50  0000 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_Pad1.0x1.5mm" H 3200 1400 50  0001 C CNN
F 3 "~" H 3200 1400 50  0001 C CNN
	1    3200 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 5850 2150 5850
Wire Wire Line
	2150 5400 1850 5400
Wire Wire Line
	1900 4950 2150 4950
Wire Wire Line
	1950 4500 2150 4500
Wire Wire Line
	2000 4050 2150 4050
Wire Wire Line
	2050 3600 2150 3600
Wire Wire Line
	2100 3150 2150 3150
$Comp
L power:GND #PWR?
U 1 1 6243F84F
P 2500 6300
AR Path="/6243F84F" Ref="#PWR?"  Part="1" 
AR Path="/6242AFE6/6243F84F" Ref="#PWR04"  Part="1" 
F 0 "#PWR04" H 2500 6050 50  0001 C CNN
F 1 "GND" H 2505 6127 50  0000 C CNN
F 2 "" H 2500 6300 50  0001 C CNN
F 3 "" H 2500 6300 50  0001 C CNN
	1    2500 6300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 6200 2500 6300
Wire Wire Line
	2500 5850 2500 5900
Wire Wire Line
	2450 5850 2500 5850
$Comp
L Device:R R?
U 1 1 6243F858
P 2300 5850
AR Path="/6243F858" Ref="R?"  Part="1" 
AR Path="/6242AFE6/6243F858" Ref="R8"  Part="1" 
F 0 "R8" V 2507 5850 50  0000 C CNN
F 1 "2k" V 2416 5850 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 2230 5850 50  0001 C CNN
F 3 "~" H 2300 5850 50  0001 C CNN
	1    2300 5850
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R?
U 1 1 6243F85E
P 2500 6050
AR Path="/6243F85E" Ref="R?"  Part="1" 
AR Path="/6242AFE6/6243F85E" Ref="R18"  Part="1" 
F 0 "R18" H 2570 6096 50  0000 L CNN
F 1 "2k" H 2570 6005 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 2430 6050 50  0001 C CNN
F 3 "~" H 2500 6050 50  0001 C CNN
	1    2500 6050
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 5750 2500 5850
Wire Wire Line
	2500 5400 2500 5450
Wire Wire Line
	2450 5400 2500 5400
$Comp
L Device:R R?
U 1 1 6243F867
P 2300 5400
AR Path="/6243F867" Ref="R?"  Part="1" 
AR Path="/6242AFE6/6243F867" Ref="R7"  Part="1" 
F 0 "R7" V 2507 5400 50  0000 C CNN
F 1 "2k" V 2416 5400 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 2230 5400 50  0001 C CNN
F 3 "~" H 2300 5400 50  0001 C CNN
	1    2300 5400
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R?
U 1 1 6243F86D
P 2500 5600
AR Path="/6243F86D" Ref="R?"  Part="1" 
AR Path="/6242AFE6/6243F86D" Ref="R17"  Part="1" 
F 0 "R17" H 2570 5646 50  0000 L CNN
F 1 "1k" H 2570 5555 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 2430 5600 50  0001 C CNN
F 3 "~" H 2500 5600 50  0001 C CNN
	1    2500 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 5300 2500 5400
Wire Wire Line
	2500 4950 2500 5000
Wire Wire Line
	2450 4950 2500 4950
$Comp
L Device:R R?
U 1 1 6243F876
P 2300 4950
AR Path="/6243F876" Ref="R?"  Part="1" 
AR Path="/6242AFE6/6243F876" Ref="R6"  Part="1" 
F 0 "R6" V 2507 4950 50  0000 C CNN
F 1 "2k" V 2416 4950 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 2230 4950 50  0001 C CNN
F 3 "~" H 2300 4950 50  0001 C CNN
	1    2300 4950
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R?
U 1 1 6243F87C
P 2500 5150
AR Path="/6243F87C" Ref="R?"  Part="1" 
AR Path="/6242AFE6/6243F87C" Ref="R16"  Part="1" 
F 0 "R16" H 2570 5196 50  0000 L CNN
F 1 "1k" H 2570 5105 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 2430 5150 50  0001 C CNN
F 3 "~" H 2500 5150 50  0001 C CNN
	1    2500 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 4850 2500 4950
Wire Wire Line
	2500 4500 2500 4550
Wire Wire Line
	2450 4500 2500 4500
$Comp
L Device:R R?
U 1 1 6243F885
P 2300 4500
AR Path="/6243F885" Ref="R?"  Part="1" 
AR Path="/6242AFE6/6243F885" Ref="R5"  Part="1" 
F 0 "R5" V 2507 4500 50  0000 C CNN
F 1 "2k" V 2416 4500 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 2230 4500 50  0001 C CNN
F 3 "~" H 2300 4500 50  0001 C CNN
	1    2300 4500
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R?
U 1 1 6243F88B
P 2500 4700
AR Path="/6243F88B" Ref="R?"  Part="1" 
AR Path="/6242AFE6/6243F88B" Ref="R15"  Part="1" 
F 0 "R15" H 2570 4746 50  0000 L CNN
F 1 "1k" H 2570 4655 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 2430 4700 50  0001 C CNN
F 3 "~" H 2500 4700 50  0001 C CNN
	1    2500 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 4400 2500 4500
Wire Wire Line
	2500 4050 2500 4100
Wire Wire Line
	2450 4050 2500 4050
$Comp
L Device:R R?
U 1 1 6243F894
P 2300 4050
AR Path="/6243F894" Ref="R?"  Part="1" 
AR Path="/6242AFE6/6243F894" Ref="R4"  Part="1" 
F 0 "R4" V 2507 4050 50  0000 C CNN
F 1 "2k" V 2416 4050 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 2230 4050 50  0001 C CNN
F 3 "~" H 2300 4050 50  0001 C CNN
	1    2300 4050
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R?
U 1 1 6243F89A
P 2500 4250
AR Path="/6243F89A" Ref="R?"  Part="1" 
AR Path="/6242AFE6/6243F89A" Ref="R14"  Part="1" 
F 0 "R14" H 2570 4296 50  0000 L CNN
F 1 "1k" H 2570 4205 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 2430 4250 50  0001 C CNN
F 3 "~" H 2500 4250 50  0001 C CNN
	1    2500 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 3950 2500 4050
Wire Wire Line
	2500 3600 2500 3650
Wire Wire Line
	2450 3600 2500 3600
$Comp
L Device:R R?
U 1 1 6243F8A3
P 2300 3600
AR Path="/6243F8A3" Ref="R?"  Part="1" 
AR Path="/6242AFE6/6243F8A3" Ref="R3"  Part="1" 
F 0 "R3" V 2507 3600 50  0000 C CNN
F 1 "2k" V 2416 3600 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 2230 3600 50  0001 C CNN
F 3 "~" H 2300 3600 50  0001 C CNN
	1    2300 3600
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R?
U 1 1 6243F8A9
P 2500 3800
AR Path="/6243F8A9" Ref="R?"  Part="1" 
AR Path="/6242AFE6/6243F8A9" Ref="R13"  Part="1" 
F 0 "R13" H 2570 3846 50  0000 L CNN
F 1 "1k" H 2570 3755 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 2430 3800 50  0001 C CNN
F 3 "~" H 2500 3800 50  0001 C CNN
	1    2500 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 3500 2500 3600
Wire Wire Line
	2500 3150 2500 3200
Wire Wire Line
	2450 3150 2500 3150
$Comp
L Device:R R?
U 1 1 6243F8B2
P 2300 3150
AR Path="/6243F8B2" Ref="R?"  Part="1" 
AR Path="/6242AFE6/6243F8B2" Ref="R2"  Part="1" 
F 0 "R2" V 2507 3150 50  0000 C CNN
F 1 "2k" V 2416 3150 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 2230 3150 50  0001 C CNN
F 3 "~" H 2300 3150 50  0001 C CNN
	1    2300 3150
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R?
U 1 1 6243F8B8
P 2500 3350
AR Path="/6243F8B8" Ref="R?"  Part="1" 
AR Path="/6242AFE6/6243F8B8" Ref="R12"  Part="1" 
F 0 "R12" H 2570 3396 50  0000 L CNN
F 1 "1k" H 2570 3305 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 2430 3350 50  0001 C CNN
F 3 "~" H 2500 3350 50  0001 C CNN
	1    2500 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 3050 2500 3150
Wire Wire Line
	2500 2700 2500 2750
Wire Wire Line
	2450 2700 2500 2700
$Comp
L Device:R R?
U 1 1 6243F8C1
P 2300 2700
AR Path="/6243F8C1" Ref="R?"  Part="1" 
AR Path="/6242AFE6/6243F8C1" Ref="R1"  Part="1" 
F 0 "R1" V 2507 2700 50  0000 C CNN
F 1 "2k" V 2416 2700 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 2230 2700 50  0001 C CNN
F 3 "~" H 2300 2700 50  0001 C CNN
	1    2300 2700
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R?
U 1 1 6243F8C7
P 2500 2900
AR Path="/6243F8C7" Ref="R?"  Part="1" 
AR Path="/6242AFE6/6243F8C7" Ref="R11"  Part="1" 
F 0 "R11" H 2570 2946 50  0000 L CNN
F 1 "1k" H 2570 2855 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 2430 2900 50  0001 C CNN
F 3 "~" H 2500 2900 50  0001 C CNN
	1    2500 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	3300 1850 3250 1850
$Comp
L power:GND #PWR?
U 1 1 624B4305
P 3300 1850
AR Path="/624B4305" Ref="#PWR?"  Part="1" 
AR Path="/6242AFE6/624B4305" Ref="#PWR026"  Part="1" 
F 0 "#PWR026" H 3300 1600 50  0001 C CNN
F 1 "GND" V 3305 1722 50  0000 R CNN
F 2 "" H 3300 1850 50  0001 C CNN
F 3 "" H 3300 1850 50  0001 C CNN
	1    3300 1850
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3050 1850 3050 1800
Connection ~ 3050 1850
$Comp
L Device:C_Small C?
U 1 1 624B430E
P 3150 1850
AR Path="/624B430E" Ref="C?"  Part="1" 
AR Path="/6242AFE6/624B430E" Ref="C15"  Part="1" 
F 0 "C15" V 2921 1850 50  0000 C CNN
F 1 "100" V 3012 1850 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3150 1850 50  0001 C CNN
F 3 "~" H 3150 1850 50  0001 C CNN
	1    3150 1850
	0    1    1    0   
$EndComp
$Comp
L Amplifier_Operational:TL072 U?
U 2 1 624F45B4
P 3150 2450
AR Path="/62428AF7/624F45B4" Ref="U?"  Part="2" 
AR Path="/6242AFE6/624F45B4" Ref="U2"  Part="2" 
F 0 "U2" H 3150 2817 50  0000 C CNN
F 1 "TL072" H 3150 2726 50  0000 C CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 3150 2450 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tl071.pdf" H 3150 2450 50  0001 C CNN
	2    3150 2450
	1    0    0    -1  
$EndComp
$Comp
L Amplifier_Operational:TL072 U?
U 3 1 624FA022
P 3150 2450
AR Path="/62428AF7/624FA022" Ref="U?"  Part="3" 
AR Path="/6242AFE6/624FA022" Ref="U2"  Part="3" 
F 0 "U2" H 3108 2496 50  0001 L CNN
F 1 "TL072" H 3108 2405 50  0001 L CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 3150 2450 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tl071.pdf" H 3150 2450 50  0001 C CNN
	3    3150 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	3050 1850 3050 2150
$Comp
L power:+12V #PWR015
U 1 1 62501996
P 3050 1800
F 0 "#PWR015" H 3050 1650 50  0001 C CNN
F 1 "+12V" H 3065 1973 50  0000 C CNN
F 2 "" H 3050 1800 50  0001 C CNN
F 3 "" H 3050 1800 50  0001 C CNN
	1    3050 1800
	1    0    0    -1  
$EndComp
$Comp
L power:-12V #PWR016
U 1 1 62502338
P 3050 2850
F 0 "#PWR016" H 3050 2950 50  0001 C CNN
F 1 "-12V" H 3065 3023 50  0000 C CNN
F 2 "" H 3050 2850 50  0001 C CNN
F 3 "" H 3050 2850 50  0001 C CNN
	1    3050 2850
	-1   0    0    1   
$EndComp
Wire Wire Line
	1300 3750 1300 3800
Wire Wire Line
	1300 3700 1300 3750
Connection ~ 1300 3750
Wire Wire Line
	1350 3750 1300 3750
$Comp
L power:VCC #PWR?
U 1 1 6243F7DE
P 1350 3750
AR Path="/6243F7DE" Ref="#PWR?"  Part="1" 
AR Path="/6242AFE6/6243F7DE" Ref="#PWR02"  Part="1" 
F 0 "#PWR02" H 1350 3600 50  0001 C CNN
F 1 "VCC" V 1367 3878 50  0000 L CNN
F 2 "" H 1350 3750 50  0001 C CNN
F 3 "" H 1350 3750 50  0001 C CNN
	1    1350 3750
	0    1    1    0   
$EndComp
$EndSCHEMATC
