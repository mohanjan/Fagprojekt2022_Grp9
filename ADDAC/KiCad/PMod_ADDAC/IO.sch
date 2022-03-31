EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 4
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
	10650 1950 10650 2050
$Comp
L power:GND #PWR?
U 1 1 6244C6ED
P 10650 2050
AR Path="/6244C6ED" Ref="#PWR?"  Part="1" 
AR Path="/62428AF7/6244C6ED" Ref="#PWR025"  Part="1" 
F 0 "#PWR025" H 10650 1800 50  0001 C CNN
F 1 "GND" H 10655 1877 50  0000 C CNN
F 2 "" H 10650 2050 50  0001 C CNN
F 3 "" H 10650 2050 50  0001 C CNN
	1    10650 2050
	1    0    0    -1  
$EndComp
$Comp
L Connector:AudioJack2_SwitchT J?
U 1 1 6244C6F3
P 10850 1850
AR Path="/6244C6F3" Ref="J?"  Part="1" 
AR Path="/62428AF7/6244C6F3" Ref="J5"  Part="1" 
F 0 "J5" H 10670 1829 50  0000 R CNN
F 1 "AudioJack2_SwitchT" H 10670 1874 50  0001 R CNN
F 2 "Audio_conn:Jack_3.5mm_QingPu_WQP-PJ398SM_Vertical_CircularHoles" H 10850 1850 50  0001 C CNN
F 3 "~" H 10850 1850 50  0001 C CNN
	1    10850 1850
	-1   0    0    1   
$EndComp
NoConn ~ 10650 1750
$Comp
L Device:R R?
U 1 1 6244C700
P 9600 2250
AR Path="/6244C700" Ref="R?"  Part="1" 
AR Path="/62428AF7/6244C700" Ref="R31"  Part="1" 
F 0 "R31" V 9807 2250 50  0000 C CNN
F 1 "1k" V 9716 2250 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 9530 2250 50  0001 C CNN
F 3 "~" H 9600 2250 50  0001 C CNN
	1    9600 2250
	0    1    1    0   
$EndComp
Wire Wire Line
	9900 2250 9750 2250
Wire Wire Line
	9450 2250 9300 2250
$Comp
L Device:R R?
U 1 1 6244C70A
P 9300 2450
AR Path="/6244C70A" Ref="R?"  Part="1" 
AR Path="/62428AF7/6244C70A" Ref="R30"  Part="1" 
F 0 "R30" H 9230 2404 50  0000 R CNN
F 1 "1k" H 9230 2495 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 9230 2450 50  0001 C CNN
F 3 "~" H 9300 2450 50  0001 C CNN
	1    9300 2450
	-1   0    0    1   
$EndComp
Wire Wire Line
	9300 2300 9300 2250
$Comp
L power:GND #PWR?
U 1 1 6244C712
P 9300 2650
AR Path="/6244C712" Ref="#PWR?"  Part="1" 
AR Path="/62428AF7/6244C712" Ref="#PWR024"  Part="1" 
F 0 "#PWR024" H 9300 2400 50  0001 C CNN
F 1 "GND" H 9305 2477 50  0000 C CNN
F 2 "" H 9300 2650 50  0001 C CNN
F 3 "" H 9300 2650 50  0001 C CNN
	1    9300 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	9300 2650 9300 2600
$Comp
L Device:C_Small C?
U 1 1 6244C719
P 9150 1900
AR Path="/6244C719" Ref="C?"  Part="1" 
AR Path="/62428AF7/6244C719" Ref="C13"  Part="1" 
F 0 "C13" H 9058 1854 50  0000 R CNN
F 1 "10n" H 9058 1945 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9150 1900 50  0001 C CNN
F 3 "~" H 9150 1900 50  0001 C CNN
	1    9150 1900
	1    0    0    1   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6244C71F
P 9150 2000
AR Path="/6244C71F" Ref="#PWR?"  Part="1" 
AR Path="/62428AF7/6244C71F" Ref="#PWR023"  Part="1" 
F 0 "#PWR023" H 9150 1750 50  0001 C CNN
F 1 "GND" H 9155 1827 50  0000 C CNN
F 2 "" H 9150 2000 50  0001 C CNN
F 3 "" H 9150 2000 50  0001 C CNN
	1    9150 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	9300 1750 9150 1750
Wire Wire Line
	9150 1750 9150 1800
$Comp
L Device:R R?
U 1 1 6244C727
P 8900 1750
AR Path="/6244C727" Ref="R?"  Part="1" 
AR Path="/62428AF7/6244C727" Ref="R29"  Part="1" 
F 0 "R29" V 8693 1750 50  0000 C CNN
F 1 "820" V 8784 1750 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 8830 1750 50  0001 C CNN
F 3 "~" H 8900 1750 50  0001 C CNN
	1    8900 1750
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 6244C72D
P 8500 1750
AR Path="/6244C72D" Ref="R?"  Part="1" 
AR Path="/62428AF7/6244C72D" Ref="R28"  Part="1" 
F 0 "R28" V 8293 1750 50  0000 C CNN
F 1 "820" V 8384 1750 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 8430 1750 50  0001 C CNN
F 3 "~" H 8500 1750 50  0001 C CNN
	1    8500 1750
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C?
U 1 1 6244C733
P 9500 1150
AR Path="/6244C733" Ref="C?"  Part="1" 
AR Path="/62428AF7/6244C733" Ref="C14"  Part="1" 
F 0 "C14" H 9408 1104 50  0000 R CNN
F 1 "10n" H 9408 1195 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9500 1150 50  0001 C CNN
F 3 "~" H 9500 1150 50  0001 C CNN
	1    9500 1150
	0    -1   1    0   
$EndComp
Wire Wire Line
	9600 1150 9900 1150
Wire Wire Line
	9900 1150 9900 1850
Connection ~ 9900 1850
Wire Wire Line
	9400 1150 8700 1150
Wire Wire Line
	8700 1150 8700 1750
Wire Wire Line
	8700 1750 8750 1750
Wire Wire Line
	8650 1750 8700 1750
Connection ~ 8700 1750
Wire Wire Line
	9050 1750 9150 1750
Connection ~ 9150 1750
Text GLabel 6600 1650 0    50   Input ~ 0
DAC_D_out
Wire Wire Line
	10350 1850 10650 1850
$Comp
L Device:R R?
U 1 1 6244C746
P 10200 1850
AR Path="/6244C746" Ref="R?"  Part="1" 
AR Path="/62428AF7/6244C746" Ref="R32"  Part="1" 
F 0 "R32" V 9993 1850 50  0000 C CNN
F 1 "1k" V 10084 1850 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 10130 1850 50  0001 C CNN
F 3 "~" H 10200 1850 50  0001 C CNN
	1    10200 1850
	0    1    1    0   
$EndComp
Wire Wire Line
	10050 1850 9900 1850
$Comp
L Device:R R?
U 1 1 62457F17
P 1250 1250
AR Path="/62457F17" Ref="R?"  Part="1" 
AR Path="/62428AF7/62457F17" Ref="R20"  Part="1" 
F 0 "R20" H 1320 1296 50  0000 L CNN
F 1 "100k" H 1320 1205 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 1180 1250 50  0001 C CNN
F 3 "~" H 1250 1250 50  0001 C CNN
	1    1250 1250
	0    1    1    0   
$EndComp
Wire Wire Line
	1000 1350 1000 1450
$Comp
L power:GND #PWR?
U 1 1 62457F2F
P 1000 1450
AR Path="/62457F2F" Ref="#PWR?"  Part="1" 
AR Path="/62428AF7/62457F2F" Ref="#PWR013"  Part="1" 
F 0 "#PWR013" H 1000 1200 50  0001 C CNN
F 1 "GND" H 1005 1277 50  0000 C CNN
F 2 "" H 1000 1450 50  0001 C CNN
F 3 "" H 1000 1450 50  0001 C CNN
	1    1000 1450
	-1   0    0    -1  
$EndComp
$Comp
L Connector:AudioJack2_SwitchT J?
U 1 1 62457F35
P 800 1250
AR Path="/62457F35" Ref="J?"  Part="1" 
AR Path="/62428AF7/62457F35" Ref="J4"  Part="1" 
F 0 "J4" H 620 1229 50  0000 R CNN
F 1 "AudioJack2_SwitchT" H 620 1274 50  0001 R CNN
F 2 "Audio_conn:Jack_3.5mm_QingPu_WQP-PJ398SM_Vertical_CircularHoles" H 800 1250 50  0001 C CNN
F 3 "~" H 800 1250 50  0001 C CNN
	1    800  1250
	1    0    0    1   
$EndComp
NoConn ~ 1000 1150
$Comp
L Device:R R?
U 1 1 624643FA
P 1400 5150
AR Path="/624643FA" Ref="R?"  Part="1" 
AR Path="/6242C1FD/624643FA" Ref="R?"  Part="1" 
AR Path="/62428AF7/624643FA" Ref="R21"  Part="1" 
F 0 "R21" V 1193 5150 50  0000 C CNN
F 1 "1k" V 1284 5150 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 1330 5150 50  0001 C CNN
F 3 "~" H 1400 5150 50  0001 C CNN
	1    1400 5150
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 62464400
P 1400 5600
AR Path="/62464400" Ref="R?"  Part="1" 
AR Path="/6242C1FD/62464400" Ref="R?"  Part="1" 
AR Path="/62428AF7/62464400" Ref="R22"  Part="1" 
F 0 "R22" V 1193 5600 50  0000 C CNN
F 1 "1k" V 1284 5600 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 1330 5600 50  0001 C CNN
F 3 "~" H 1400 5600 50  0001 C CNN
	1    1400 5600
	0    1    1    0   
$EndComp
Wire Wire Line
	1950 5600 1550 5600
$Comp
L Device:C_Small C?
U 1 1 62464407
P 2250 5150
AR Path="/62464407" Ref="C?"  Part="1" 
AR Path="/6242C1FD/62464407" Ref="C?"  Part="1" 
AR Path="/62428AF7/62464407" Ref="C9"  Part="1" 
F 0 "C9" V 2021 5150 50  0000 C CNN
F 1 "variable" V 2112 5150 50  0001 C CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 2250 5150 50  0001 C CNN
F 3 "~" H 2250 5150 50  0001 C CNN
	1    2250 5150
	0    1    1    0   
$EndComp
Wire Wire Line
	2150 5150 1950 5150
Wire Wire Line
	1950 5150 1950 5600
Wire Wire Line
	2350 5150 2550 5150
Wire Wire Line
	2550 5150 2550 5700
Wire Wire Line
	1550 5150 1950 5150
Connection ~ 1950 5150
$Comp
L power:GND #PWR?
U 1 1 62464413
P 2800 5950
AR Path="/62464413" Ref="#PWR?"  Part="1" 
AR Path="/6242C1FD/62464413" Ref="#PWR?"  Part="1" 
AR Path="/62428AF7/62464413" Ref="#PWR018"  Part="1" 
F 0 "#PWR018" H 2800 5700 50  0001 C CNN
F 1 "GND" H 2805 5777 50  0000 C CNN
F 2 "" H 2800 5950 50  0001 C CNN
F 3 "" H 2800 5950 50  0001 C CNN
	1    2800 5950
	1    0    0    -1  
$EndComp
Wire Wire Line
	2800 5950 2800 5900
Wire Wire Line
	2800 5900 2900 5900
Wire Wire Line
	2900 5700 2550 5700
Text GLabel 4300 5800 2    50   Input ~ 0
ADC_A_in
Text GLabel 3600 4400 2    50   Input ~ 0
ADC_D_out
$Comp
L power:GND #PWR?
U 1 1 6246442D
P 1850 5900
AR Path="/6246442D" Ref="#PWR?"  Part="1" 
AR Path="/6242C1FD/6246442D" Ref="#PWR?"  Part="1" 
AR Path="/62428AF7/6246442D" Ref="#PWR014"  Part="1" 
F 0 "#PWR014" H 1850 5650 50  0001 C CNN
F 1 "GND" H 1855 5727 50  0000 C CNN
F 2 "" H 1850 5900 50  0001 C CNN
F 3 "" H 1850 5900 50  0001 C CNN
	1    1850 5900
	1    0    0    -1  
$EndComp
Wire Wire Line
	1850 5900 1850 5800
Wire Wire Line
	1850 5800 1950 5800
Wire Wire Line
	3050 4600 2600 4600
$Comp
L power:GND #PWR?
U 1 1 6246444C
P 2700 4900
AR Path="/6246444C" Ref="#PWR?"  Part="1" 
AR Path="/6242C1FD/6246444C" Ref="#PWR?"  Part="1" 
AR Path="/62428AF7/6246444C" Ref="#PWR017"  Part="1" 
F 0 "#PWR017" H 2700 4650 50  0001 C CNN
F 1 "GND" H 2705 4727 50  0000 C CNN
F 2 "" H 2700 4900 50  0001 C CNN
F 3 "" H 2700 4900 50  0001 C CNN
	1    2700 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 4900 2700 4850
Wire Wire Line
	2000 4500 1250 4500
Wire Wire Line
	1250 4500 1250 5150
Text GLabel 1150 5600 0    50   Input ~ 0
ADC_signal_in
Wire Wire Line
	1150 5600 1250 5600
Text Notes 2850 4150 0    50   ~ 0
- sends out voltage. High input impedance?
$Comp
L power:+5V #PWR?
U 1 1 62464459
P 3450 4850
AR Path="/62464459" Ref="#PWR?"  Part="1" 
AR Path="/6242C1FD/62464459" Ref="#PWR?"  Part="1" 
AR Path="/62428AF7/62464459" Ref="#PWR021"  Part="1" 
F 0 "#PWR021" H 3450 4700 50  0001 C CNN
F 1 "+5V" H 3465 5023 50  0000 C CNN
F 2 "" H 3450 4850 50  0001 C CNN
F 3 "" H 3450 4850 50  0001 C CNN
	1    3450 4850
	1    0    0    -1  
$EndComp
Text Notes 2050 6750 0    50   ~ 0
-high slew rate comparators (LMP7300MAX/NOPB)\n+-12 eller ?\ninput and outputs must be at 200 ohms, with at max 3.3V (?)\n
$Comp
L Device:C_Small C?
U 1 1 6247D308
P 3300 1500
AR Path="/6247D308" Ref="C?"  Part="1" 
AR Path="/62428AF7/6247D308" Ref="C10"  Part="1" 
F 0 "C10" H 3208 1454 50  0000 R CNN
F 1 "10n" H 3208 1545 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3300 1500 50  0001 C CNN
F 3 "~" H 3300 1500 50  0001 C CNN
	1    3300 1500
	1    0    0    1   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6247D30E
P 3300 1600
AR Path="/6247D30E" Ref="#PWR?"  Part="1" 
AR Path="/62428AF7/6247D30E" Ref="#PWR020"  Part="1" 
F 0 "#PWR020" H 3300 1350 50  0001 C CNN
F 1 "GND" H 3305 1427 50  0000 C CNN
F 2 "" H 3300 1600 50  0001 C CNN
F 3 "" H 3300 1600 50  0001 C CNN
	1    3300 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 1350 3300 1350
Wire Wire Line
	3300 1350 3300 1400
$Comp
L Device:R R?
U 1 1 6247D316
P 3050 1350
AR Path="/6247D316" Ref="R?"  Part="1" 
AR Path="/62428AF7/6247D316" Ref="R24"  Part="1" 
F 0 "R24" V 2843 1350 50  0000 C CNN
F 1 "820" V 2934 1350 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 2980 1350 50  0001 C CNN
F 3 "~" H 3050 1350 50  0001 C CNN
	1    3050 1350
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 6247D31C
P 2650 1350
AR Path="/6247D31C" Ref="R?"  Part="1" 
AR Path="/62428AF7/6247D31C" Ref="R23"  Part="1" 
F 0 "R23" V 2443 1350 50  0000 C CNN
F 1 "820" V 2534 1350 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 2580 1350 50  0001 C CNN
F 3 "~" H 2650 1350 50  0001 C CNN
	1    2650 1350
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C?
U 1 1 6247D322
P 3650 750
AR Path="/6247D322" Ref="C?"  Part="1" 
AR Path="/62428AF7/6247D322" Ref="C11"  Part="1" 
F 0 "C11" H 3558 704 50  0000 R CNN
F 1 "10n" H 3558 795 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3650 750 50  0001 C CNN
F 3 "~" H 3650 750 50  0001 C CNN
	1    3650 750 
	0    -1   1    0   
$EndComp
Wire Wire Line
	3750 750  4050 750 
Wire Wire Line
	4050 750  4050 1450
Connection ~ 4050 1450
Wire Wire Line
	3550 750  2850 750 
Wire Wire Line
	2850 750  2850 1350
Wire Wire Line
	2850 1350 2900 1350
Wire Wire Line
	2800 1350 2850 1350
Connection ~ 2850 1350
Wire Wire Line
	3200 1350 3300 1350
Connection ~ 3300 1350
Wire Wire Line
	4200 1450 4050 1450
Wire Wire Line
	1100 1250 1000 1250
$Comp
L Device:C_Small C8
U 1 1 62496187
P 1600 1250
F 0 "C8" V 1371 1250 50  0000 C CNN
F 1 "100n" V 1462 1250 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1600 1250 50  0001 C CNN
F 3 "~" H 1600 1250 50  0001 C CNN
	1    1600 1250
	0    1    1    0   
$EndComp
Wire Wire Line
	1500 1250 1400 1250
Wire Wire Line
	2300 1350 2500 1350
Text GLabel 4200 1450 2    50   Input ~ 0
ADC_signal_in
Wire Wire Line
	4050 1850 3450 1850
Wire Wire Line
	4050 1450 4050 1850
Wire Wire Line
	3450 1550 3450 1850
$Comp
L Device:R_POT_TRIM RV1
U 1 1 6242F0FD
P 2300 2250
F 0 "RV1" H 2230 2204 50  0000 R CNN
F 1 "10k" H 2230 2295 50  0000 R CNN
F 2 "Potentiometer_THT:Potentiometer_Bourns_3339P_Vertical" H 2300 2250 50  0001 C CNN
F 3 "~" H 2300 2250 50  0001 C CNN
	1    2300 2250
	-1   0    0    1   
$EndComp
Wire Wire Line
	1700 2250 2100 2250
Wire Wire Line
	2100 2250 2100 2400
Wire Wire Line
	2100 2400 2300 2400
Connection ~ 2100 2250
Wire Wire Line
	2100 2250 2150 2250
Text Notes 7200 3350 0    50   ~ 0
multiple caps for different frequencies? summing amplifier to collect the different frequencies???
$Comp
L Device:R R26
U 1 1 62460D2D
P 3900 5800
F 0 "R26" V 3693 5800 50  0000 C CNN
F 1 "200" V 3784 5800 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 3830 5800 50  0001 C CNN
F 3 "~" H 3900 5800 50  0001 C CNN
	1    3900 5800
	0    1    1    0   
$EndComp
$Comp
L Device:R R25
U 1 1 62461805
P 3100 4400
F 0 "R25" V 2893 4400 50  0000 C CNN
F 1 "200" V 2984 4400 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 3030 4400 50  0001 C CNN
F 3 "~" H 3100 4400 50  0001 C CNN
	1    3100 4400
	0    1    1    0   
$EndComp
Wire Wire Line
	3600 4400 3250 4400
Wire Wire Line
	2950 4400 2600 4400
$Comp
L Device:R_POT_TRIM RV2
U 1 1 62468757
P 3050 4850
F 0 "RV2" V 2935 4850 50  0000 C CNN
F 1 "10k" V 2844 4850 50  0000 C CNN
F 2 "Potentiometer_THT:Potentiometer_Bourns_3339P_Vertical" H 3050 4850 50  0001 C CNN
F 3 "~" H 3050 4850 50  0001 C CNN
	1    3050 4850
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3200 4850 3450 4850
Wire Wire Line
	2900 4850 2700 4850
Wire Wire Line
	3050 4700 3050 4600
Text Notes 2700 5250 0    50   ~ 0
Vout=-Vin/(j*omega*R*C)
Wire Wire Line
	3750 5800 3500 5800
Wire Wire Line
	4300 5800 4050 5800
$Comp
L power:+12V #PWR019
U 1 1 62473AE6
P 3100 5500
F 0 "#PWR019" H 3100 5350 50  0001 C CNN
F 1 "+12V" H 3115 5673 50  0000 C CNN
F 2 "" H 3100 5500 50  0001 C CNN
F 3 "" H 3100 5500 50  0001 C CNN
	1    3100 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	7250 1650 7200 1650
$Comp
L Device:C_Small C?
U 1 1 6247A5C7
P 7550 800
AR Path="/6247A5C7" Ref="C?"  Part="1" 
AR Path="/6242C1FD/6247A5C7" Ref="C?"  Part="1" 
AR Path="/62428AF7/6247A5C7" Ref="C12"  Part="1" 
F 0 "C12" V 7321 800 50  0000 C CNN
F 1 "variable" V 7412 800 50  0001 C CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 7550 800 50  0001 C CNN
F 3 "~" H 7550 800 50  0001 C CNN
	1    7550 800 
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6247A5DC
P 7150 1950
AR Path="/6247A5DC" Ref="#PWR?"  Part="1" 
AR Path="/6242C1FD/6247A5DC" Ref="#PWR?"  Part="1" 
AR Path="/62428AF7/6247A5DC" Ref="#PWR022"  Part="1" 
F 0 "#PWR022" H 7150 1700 50  0001 C CNN
F 1 "GND" H 7155 1777 50  0000 C CNN
F 2 "" H 7150 1950 50  0001 C CNN
F 3 "" H 7150 1950 50  0001 C CNN
	1    7150 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	7150 1950 7150 1850
Wire Wire Line
	7150 1850 7250 1850
Wire Wire Line
	7850 1750 8000 1750
Wire Wire Line
	7450 800  7200 800 
$Comp
L Device:R R27
U 1 1 62483A1F
P 6900 1650
F 0 "R27" V 6693 1650 50  0000 C CNN
F 1 "1k" V 6784 1650 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 6830 1650 50  0001 C CNN
F 3 "~" H 6900 1650 50  0001 C CNN
	1    6900 1650
	0    1    1    0   
$EndComp
Wire Wire Line
	7050 1650 7200 1650
Connection ~ 7200 1650
Wire Wire Line
	6750 1650 6600 1650
Connection ~ 9300 2250
Wire Wire Line
	9300 1950 9300 2250
Wire Wire Line
	9900 1850 9900 2250
$Comp
L Device:C_Small C17
U 1 1 624BEFC6
P 2050 900
F 0 "C17" V 1821 900 50  0000 C CNN
F 1 "10n" V 1912 900 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2050 900 50  0001 C CNN
F 3 "~" H 2050 900 50  0001 C CNN
	1    2050 900 
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C16
U 1 1 624C0C2A
P 2000 1800
F 0 "C16" V 1771 1800 50  0000 C CNN
F 1 "10n" V 1862 1800 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2000 1800 50  0001 C CNN
F 3 "~" H 2000 1800 50  0001 C CNN
	1    2000 1800
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR030
U 1 1 624C260D
P 2200 900
F 0 "#PWR030" H 2200 650 50  0001 C CNN
F 1 "GND" V 2205 772 50  0001 R CNN
F 2 "" H 2200 900 50  0001 C CNN
F 3 "" H 2200 900 50  0001 C CNN
	1    2200 900 
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2200 900  2150 900 
$Comp
L power:GND #PWR029
U 1 1 624C5318
P 2150 1800
F 0 "#PWR029" H 2150 1550 50  0001 C CNN
F 1 "GND" V 2155 1672 50  0001 R CNN
F 2 "" H 2150 1800 50  0001 C CNN
F 3 "" H 2150 1800 50  0001 C CNN
	1    2150 1800
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2150 1800 2100 1800
Wire Wire Line
	1900 1650 1900 1800
$Comp
L power:-12V #PWR028
U 1 1 624CB68C
P 1900 1950
F 0 "#PWR028" H 1900 2050 50  0001 C CNN
F 1 "-12V" H 1915 2123 50  0000 C CNN
F 2 "" H 1900 1950 50  0001 C CNN
F 3 "" H 1900 1950 50  0001 C CNN
	1    1900 1950
	-1   0    0    1   
$EndComp
Wire Wire Line
	1900 1950 1900 1800
Connection ~ 1900 1800
Wire Wire Line
	1700 1450 1700 2250
Wire Wire Line
	2300 1350 2300 2100
$Comp
L power:+12V #PWR027
U 1 1 624D6893
P 1900 750
F 0 "#PWR027" H 1900 600 50  0001 C CNN
F 1 "+12V" H 1915 923 50  0000 C CNN
F 2 "" H 1900 750 50  0001 C CNN
F 3 "" H 1900 750 50  0001 C CNN
	1    1900 750 
	1    0    0    -1  
$EndComp
Wire Wire Line
	1900 750  1900 900 
Wire Wire Line
	1950 900  1900 900 
Connection ~ 1900 900 
Wire Wire Line
	1900 900  1900 1050
$Comp
L Amplifier_Operational:TL072 U2
U 1 1 624E00E8
P 2250 5700
F 0 "U2" H 2250 6067 50  0000 C CNN
F 1 "TL072" H 2250 5976 50  0000 C CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 2250 5700 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tl071.pdf" H 2250 5700 50  0001 C CNN
	1    2250 5700
	1    0    0    -1  
$EndComp
Connection ~ 2550 5700
Connection ~ 1950 5600
Connection ~ 2300 1350
$Comp
L Amplifier_Operational:TL072 U1
U 2 1 62507E3A
P 3750 1450
F 0 "U1" H 3750 1817 50  0000 C CNN
F 1 "TL072" H 3750 1726 50  0000 C CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 3750 1450 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tl071.pdf" H 3750 1450 50  0001 C CNN
	2    3750 1450
	1    0    0    -1  
$EndComp
$Comp
L Amplifier_Operational:TL072 U1
U 3 1 62508FA0
P 2000 1350
F 0 "U1" H 1958 1396 50  0001 L CNN
F 1 "TL072" H 1958 1350 50  0001 L CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 2000 1350 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tl071.pdf" H 2000 1350 50  0001 C CNN
	3    2000 1350
	1    0    0    -1  
$EndComp
$Comp
L Amplifier_Operational:TL072 U1
U 1 1 62505F29
P 2000 1350
F 0 "U1" H 2100 1650 50  0000 C CNN
F 1 "TL072" H 2100 1550 50  0000 C CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 2000 1350 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tl071.pdf" H 2000 1350 50  0001 C CNN
	1    2000 1350
	1    0    0    -1  
$EndComp
$Comp
L Amplifier_Operational:TL072 U3
U 2 1 62515BF9
P 9600 1850
F 0 "U3" H 9600 2217 50  0000 C CNN
F 1 "TL072" H 9600 2126 50  0000 C CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 9600 1850 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tl071.pdf" H 9600 1850 50  0001 C CNN
	2    9600 1850
	1    0    0    -1  
$EndComp
$Comp
L Amplifier_Operational:TL072 U3
U 1 1 6251A970
P 7550 1750
F 0 "U3" H 7650 2050 50  0000 C CNN
F 1 "TL072" H 7650 1950 50  0000 C CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 7550 1750 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tl071.pdf" H 7550 1750 50  0001 C CNN
	1    7550 1750
	1    0    0    -1  
$EndComp
$Comp
L Amplifier_Operational:TL072 U3
U 3 1 6251EE6C
P 7550 1750
F 0 "U3" H 7508 1796 50  0001 L CNN
F 1 "TL072" H 7508 1750 50  0001 L CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 7550 1750 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tl071.pdf" H 7550 1750 50  0001 C CNN
	3    7550 1750
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C19
U 1 1 62521003
P 7600 1300
F 0 "C19" V 7371 1300 50  0000 C CNN
F 1 "10n" V 7462 1300 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7600 1300 50  0001 C CNN
F 3 "~" H 7600 1300 50  0001 C CNN
	1    7600 1300
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR034
U 1 1 62521009
P 7750 1300
F 0 "#PWR034" H 7750 1050 50  0001 C CNN
F 1 "GND" V 7755 1172 50  0001 R CNN
F 2 "" H 7750 1300 50  0001 C CNN
F 3 "" H 7750 1300 50  0001 C CNN
	1    7750 1300
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7750 1300 7700 1300
$Comp
L power:+12V #PWR031
U 1 1 62521010
P 7450 1150
F 0 "#PWR031" H 7450 1000 50  0001 C CNN
F 1 "+12V" H 7465 1323 50  0000 C CNN
F 2 "" H 7450 1150 50  0001 C CNN
F 3 "" H 7450 1150 50  0001 C CNN
	1    7450 1150
	1    0    0    -1  
$EndComp
Wire Wire Line
	7450 1150 7450 1300
Wire Wire Line
	7500 1300 7450 1300
Connection ~ 7450 1300
Wire Wire Line
	7450 1300 7450 1450
$Comp
L Device:C_Small C18
U 1 1 625239BB
P 7550 2200
F 0 "C18" V 7321 2200 50  0000 C CNN
F 1 "10n" V 7412 2200 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7550 2200 50  0001 C CNN
F 3 "~" H 7550 2200 50  0001 C CNN
	1    7550 2200
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR033
U 1 1 625239C1
P 7700 2200
F 0 "#PWR033" H 7700 1950 50  0001 C CNN
F 1 "GND" V 7705 2072 50  0001 R CNN
F 2 "" H 7700 2200 50  0001 C CNN
F 3 "" H 7700 2200 50  0001 C CNN
	1    7700 2200
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7700 2200 7650 2200
Wire Wire Line
	7450 2050 7450 2200
$Comp
L power:-12V #PWR032
U 1 1 625239C9
P 7450 2350
F 0 "#PWR032" H 7450 2450 50  0001 C CNN
F 1 "-12V" H 7465 2523 50  0000 C CNN
F 2 "" H 7450 2350 50  0001 C CNN
F 3 "" H 7450 2350 50  0001 C CNN
	1    7450 2350
	-1   0    0    1   
$EndComp
Wire Wire Line
	7450 2350 7450 2200
Connection ~ 7450 2200
Wire Wire Line
	7200 800  7200 1650
Wire Wire Line
	8000 800  8000 1750
Wire Wire Line
	7650 800  8000 800 
Connection ~ 8000 1750
Wire Wire Line
	8000 1750 8350 1750
$Comp
L Device:R R?
U 1 1 6249EC60
P 1700 2450
AR Path="/6249EC60" Ref="R?"  Part="1" 
AR Path="/62428AF7/6249EC60" Ref="R?"  Part="1" 
F 0 "R?" H 1770 2496 50  0000 L CNN
F 1 "10k" H 1770 2405 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 1630 2450 50  0001 C CNN
F 3 "~" H 1700 2450 50  0001 C CNN
	1    1700 2450
	-1   0    0    1   
$EndComp
Wire Wire Line
	1700 2250 1700 2300
Connection ~ 1700 2250
$Comp
L power:GND #PWR?
U 1 1 624A41B5
P 1700 2700
F 0 "#PWR?" H 1700 2450 50  0001 C CNN
F 1 "GND" V 1705 2572 50  0001 R CNN
F 2 "" H 1700 2700 50  0001 C CNN
F 3 "" H 1700 2700 50  0001 C CNN
	1    1700 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	1700 2700 1700 2600
$EndSCHEMATC
