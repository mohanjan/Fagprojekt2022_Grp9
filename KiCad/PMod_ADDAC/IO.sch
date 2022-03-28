EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 5 5
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
AR Path="/62428AF7/6244C6ED" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 10650 1800 50  0001 C CNN
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
AR Path="/62428AF7/6244C6F3" Ref="J?"  Part="1" 
F 0 "J?" H 10670 1829 50  0000 R CNN
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
P 9600 2150
AR Path="/6244C700" Ref="R?"  Part="1" 
AR Path="/62428AF7/6244C700" Ref="R?"  Part="1" 
F 0 "R?" V 9807 2150 50  0000 C CNN
F 1 "1k" V 9716 2150 50  0000 C CNN
F 2 "" V 9530 2150 50  0001 C CNN
F 3 "~" H 9600 2150 50  0001 C CNN
	1    9600 2150
	0    1    1    0   
$EndComp
Wire Wire Line
	9900 2150 9750 2150
Wire Wire Line
	9900 1850 9900 2150
Wire Wire Line
	9450 2150 9300 2150
Wire Wire Line
	9300 1950 9300 2150
$Comp
L Device:R R?
U 1 1 6244C70A
P 9300 2450
AR Path="/6244C70A" Ref="R?"  Part="1" 
AR Path="/62428AF7/6244C70A" Ref="R?"  Part="1" 
F 0 "R?" H 9230 2404 50  0000 R CNN
F 1 "1k" H 9230 2495 50  0000 R CNN
F 2 "" V 9230 2450 50  0001 C CNN
F 3 "~" H 9300 2450 50  0001 C CNN
	1    9300 2450
	-1   0    0    1   
$EndComp
Wire Wire Line
	9300 2300 9300 2150
Connection ~ 9300 2150
$Comp
L power:GND #PWR?
U 1 1 6244C712
P 9300 2650
AR Path="/6244C712" Ref="#PWR?"  Part="1" 
AR Path="/62428AF7/6244C712" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 9300 2400 50  0001 C CNN
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
AR Path="/62428AF7/6244C719" Ref="C?"  Part="1" 
F 0 "C?" H 9058 1854 50  0000 R CNN
F 1 "10n" H 9058 1945 50  0000 R CNN
F 2 "" H 9150 1900 50  0001 C CNN
F 3 "~" H 9150 1900 50  0001 C CNN
	1    9150 1900
	1    0    0    1   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6244C71F
P 9150 2000
AR Path="/6244C71F" Ref="#PWR?"  Part="1" 
AR Path="/62428AF7/6244C71F" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 9150 1750 50  0001 C CNN
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
AR Path="/62428AF7/6244C727" Ref="R?"  Part="1" 
F 0 "R?" V 8693 1750 50  0000 C CNN
F 1 "820" V 8784 1750 50  0000 C CNN
F 2 "" V 8830 1750 50  0001 C CNN
F 3 "~" H 8900 1750 50  0001 C CNN
	1    8900 1750
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 6244C72D
P 8500 1750
AR Path="/6244C72D" Ref="R?"  Part="1" 
AR Path="/62428AF7/6244C72D" Ref="R?"  Part="1" 
F 0 "R?" V 8293 1750 50  0000 C CNN
F 1 "820" V 8384 1750 50  0000 C CNN
F 2 "" V 8430 1750 50  0001 C CNN
F 3 "~" H 8500 1750 50  0001 C CNN
	1    8500 1750
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C?
U 1 1 6244C733
P 9500 1150
AR Path="/6244C733" Ref="C?"  Part="1" 
AR Path="/62428AF7/6244C733" Ref="C?"  Part="1" 
F 0 "C?" H 9408 1104 50  0000 R CNN
F 1 "10n" H 9408 1195 50  0000 R CNN
F 2 "" H 9500 1150 50  0001 C CNN
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
Text GLabel 8200 1750 0    50   Input ~ 0
DAC_D_out
Wire Wire Line
	8200 1750 8350 1750
Wire Wire Line
	10350 1850 10650 1850
$Comp
L Device:R R?
U 1 1 6244C746
P 10200 1850
AR Path="/6244C746" Ref="R?"  Part="1" 
AR Path="/62428AF7/6244C746" Ref="R?"  Part="1" 
F 0 "R?" V 9993 1850 50  0000 C CNN
F 1 "1k" V 10084 1850 50  0000 C CNN
F 2 "" V 10130 1850 50  0001 C CNN
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
AR Path="/62428AF7/62457F17" Ref="R?"  Part="1" 
F 0 "R?" H 1320 1296 50  0000 L CNN
F 1 "100k" H 1320 1205 50  0000 L CNN
F 2 "" V 1180 1250 50  0001 C CNN
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
AR Path="/62428AF7/62457F2F" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 1000 1200 50  0001 C CNN
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
AR Path="/62428AF7/62457F35" Ref="J?"  Part="1" 
F 0 "J?" H 620 1229 50  0000 R CNN
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
AR Path="/62428AF7/624643FA" Ref="R?"  Part="1" 
F 0 "R?" V 1193 5150 50  0000 C CNN
F 1 "1k" V 1284 5150 50  0000 C CNN
F 2 "" V 1330 5150 50  0001 C CNN
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
AR Path="/62428AF7/62464400" Ref="R?"  Part="1" 
F 0 "R?" V 1193 5600 50  0000 C CNN
F 1 "1k" V 1284 5600 50  0000 C CNN
F 2 "" V 1330 5600 50  0001 C CNN
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
AR Path="/62428AF7/62464407" Ref="C?"  Part="1" 
F 0 "C?" V 2021 5150 50  0000 C CNN
F 1 "C_Small" V 2112 5150 50  0000 C CNN
F 2 "" H 2250 5150 50  0001 C CNN
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
AR Path="/62428AF7/62464413" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2800 5700 50  0001 C CNN
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
$Comp
L pspice:OPAMP U?
U 1 1 6246441B
P 2250 5700
AR Path="/6246441B" Ref="U?"  Part="1" 
AR Path="/6242C1FD/6246441B" Ref="U?"  Part="1" 
AR Path="/62428AF7/6246441B" Ref="U?"  Part="1" 
F 0 "U?" H 2250 5219 50  0000 C CNN
F 1 "OPAMP" H 2250 5310 50  0000 C CNN
F 2 "" H 2250 5700 50  0001 C CNN
F 3 "~" H 2250 5700 50  0001 C CNN
	1    2250 5700
	1    0    0    1   
$EndComp
Connection ~ 1950 5600
$Comp
L pspice:OPAMP U?
U 1 1 62464422
P 3200 5800
AR Path="/62464422" Ref="U?"  Part="1" 
AR Path="/6242C1FD/62464422" Ref="U?"  Part="1" 
AR Path="/62428AF7/62464422" Ref="U?"  Part="1" 
F 0 "U?" H 3350 5650 50  0000 L CNN
F 1 "OPAMP" H 3250 5550 50  0000 L CNN
F 2 "" H 3200 5800 50  0001 C CNN
F 3 "~" H 3200 5800 50  0001 C CNN
	1    3200 5800
	1    0    0    -1  
$EndComp
Wire Wire Line
	2900 5700 2550 5700
Connection ~ 2550 5700
Text GLabel 3900 5800 2    50   Input ~ 0
ADC_A_in
Wire Wire Line
	3900 5800 3500 5800
Text GLabel 3600 4400 2    50   Input ~ 0
ADC_D_out
$Comp
L power:GND #PWR?
U 1 1 6246442D
P 1850 5900
AR Path="/6246442D" Ref="#PWR?"  Part="1" 
AR Path="/6242C1FD/6246442D" Ref="#PWR?"  Part="1" 
AR Path="/62428AF7/6246442D" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 1850 5650 50  0001 C CNN
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
$Comp
L pspice:OPAMP U?
U 1 1 62464435
P 2300 4500
AR Path="/62464435" Ref="U?"  Part="1" 
AR Path="/6242C1FD/62464435" Ref="U?"  Part="1" 
AR Path="/62428AF7/62464435" Ref="U?"  Part="1" 
F 0 "U?" H 2450 4350 50  0000 L CNN
F 1 "OPAMP" H 2350 4250 50  0000 L CNN
F 2 "" H 2300 4500 50  0001 C CNN
F 3 "~" H 2300 4500 50  0001 C CNN
	1    2300 4500
	-1   0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 6246443B
P 3250 4850
AR Path="/6246443B" Ref="R?"  Part="1" 
AR Path="/6242C1FD/6246443B" Ref="R?"  Part="1" 
AR Path="/62428AF7/6246443B" Ref="R?"  Part="1" 
F 0 "R?" V 3043 4850 50  0000 C CNN
F 1 "R" V 3134 4850 50  0000 C CNN
F 2 "" V 3180 4850 50  0001 C CNN
F 3 "~" H 3250 4850 50  0001 C CNN
	1    3250 4850
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 62464441
P 2850 4850
AR Path="/62464441" Ref="R?"  Part="1" 
AR Path="/6242C1FD/62464441" Ref="R?"  Part="1" 
AR Path="/62428AF7/62464441" Ref="R?"  Part="1" 
F 0 "R?" V 2643 4850 50  0000 C CNN
F 1 "R" V 2734 4850 50  0000 C CNN
F 2 "" V 2780 4850 50  0001 C CNN
F 3 "~" H 2850 4850 50  0001 C CNN
	1    2850 4850
	0    1    1    0   
$EndComp
Wire Wire Line
	3000 4850 3050 4850
Wire Wire Line
	3050 4850 3050 4600
Wire Wire Line
	3050 4600 2600 4600
Connection ~ 3050 4850
Wire Wire Line
	3050 4850 3100 4850
$Comp
L power:GND #PWR?
U 1 1 6246444C
P 2700 4900
AR Path="/6246444C" Ref="#PWR?"  Part="1" 
AR Path="/6242C1FD/6246444C" Ref="#PWR?"  Part="1" 
AR Path="/62428AF7/6246444C" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2700 4650 50  0001 C CNN
F 1 "GND" H 2705 4727 50  0000 C CNN
F 2 "" H 2700 4900 50  0001 C CNN
F 3 "" H 2700 4900 50  0001 C CNN
	1    2700 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 4900 2700 4850
Wire Wire Line
	3450 4850 3400 4850
Wire Wire Line
	2000 4500 1250 4500
Wire Wire Line
	1250 4500 1250 5150
Text GLabel 1150 5600 0    50   Input ~ 0
ADC_signal_in
Wire Wire Line
	1150 5600 1250 5600
Text Notes 2900 4300 0    50   ~ 0
- sends out voltage. High input impedance?
$Comp
L power:+5V #PWR?
U 1 1 62464459
P 3450 4850
AR Path="/62464459" Ref="#PWR?"  Part="1" 
AR Path="/6242C1FD/62464459" Ref="#PWR?"  Part="1" 
AR Path="/62428AF7/62464459" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3450 4700 50  0001 C CNN
F 1 "+5V" H 3465 5023 50  0000 C CNN
F 2 "" H 3450 4850 50  0001 C CNN
F 3 "" H 3450 4850 50  0001 C CNN
	1    3450 4850
	1    0    0    -1  
$EndComp
Text Notes 1600 6750 0    50   ~ 0
-high slew rate comparators (LMP7300MAX/NOPB)\n+-12 eller ?\ninput and outputs must be at 200 ohms, with at max 3.3V (?)\n
Wire Wire Line
	2600 4400 3600 4400
$Comp
L Device:C_Small C?
U 1 1 6247D308
P 3300 1500
AR Path="/6247D308" Ref="C?"  Part="1" 
AR Path="/62428AF7/6247D308" Ref="C?"  Part="1" 
F 0 "C?" H 3208 1454 50  0000 R CNN
F 1 "10n" H 3208 1545 50  0000 R CNN
F 2 "" H 3300 1500 50  0001 C CNN
F 3 "~" H 3300 1500 50  0001 C CNN
	1    3300 1500
	1    0    0    1   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6247D30E
P 3300 1600
AR Path="/6247D30E" Ref="#PWR?"  Part="1" 
AR Path="/62428AF7/6247D30E" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3300 1350 50  0001 C CNN
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
AR Path="/62428AF7/6247D316" Ref="R?"  Part="1" 
F 0 "R?" V 2843 1350 50  0000 C CNN
F 1 "820" V 2934 1350 50  0000 C CNN
F 2 "" V 2980 1350 50  0001 C CNN
F 3 "~" H 3050 1350 50  0001 C CNN
	1    3050 1350
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 6247D31C
P 2650 1350
AR Path="/6247D31C" Ref="R?"  Part="1" 
AR Path="/62428AF7/6247D31C" Ref="R?"  Part="1" 
F 0 "R?" V 2443 1350 50  0000 C CNN
F 1 "820" V 2534 1350 50  0000 C CNN
F 2 "" V 2580 1350 50  0001 C CNN
F 3 "~" H 2650 1350 50  0001 C CNN
	1    2650 1350
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C?
U 1 1 6247D322
P 3650 750
AR Path="/6247D322" Ref="C?"  Part="1" 
AR Path="/62428AF7/6247D322" Ref="C?"  Part="1" 
F 0 "C?" H 3558 704 50  0000 R CNN
F 1 "10n" H 3558 795 50  0000 R CNN
F 2 "" H 3650 750 50  0001 C CNN
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
L Device:C_Small C?
U 1 1 62496187
P 1600 1250
F 0 "C?" V 1371 1250 50  0000 C CNN
F 1 "100n" V 1462 1250 50  0000 C CNN
F 2 "" H 1600 1250 50  0001 C CNN
F 3 "~" H 1600 1250 50  0001 C CNN
	1    1600 1250
	0    1    1    0   
$EndComp
Wire Wire Line
	1500 1250 1400 1250
$Comp
L pspice:OPAMP U?
U 1 1 624A0B49
P 2000 1350
F 0 "U?" H 2344 1350 50  0001 L CNN
F 1 "OPAMP" H 2344 1305 50  0001 L CNN
F 2 "" H 2000 1350 50  0001 C CNN
F 3 "~" H 2000 1350 50  0001 C CNN
	1    2000 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	2300 1350 2300 1750
Wire Wire Line
	2300 1750 1700 1750
Wire Wire Line
	1700 1750 1700 1450
Wire Wire Line
	2300 1350 2500 1350
Connection ~ 2300 1350
$Comp
L pspice:OPAMP U?
U 1 1 624A8152
P 3750 1450
F 0 "U?" H 4094 1450 50  0001 L CNN
F 1 "OPAMP" H 4094 1405 50  0001 L CNN
F 2 "" H 3750 1450 50  0001 C CNN
F 3 "~" H 3750 1450 50  0001 C CNN
	1    3750 1450
	1    0    0    -1  
$EndComp
Text GLabel 4200 1450 2    50   Input ~ 0
ADC_signal_in
Wire Wire Line
	4050 1850 3450 1850
Wire Wire Line
	4050 1450 4050 1850
Wire Wire Line
	3450 1550 3450 1850
$EndSCHEMATC
