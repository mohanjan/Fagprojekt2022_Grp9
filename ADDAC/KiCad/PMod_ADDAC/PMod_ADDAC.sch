EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 4
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 8000 2900 0    50   ~ 0
hvis forbindes med eurorack, så brug noise limiting thingies\n\npower supply\n- use 5V voltage regulator\n- ferrite beads & decoupling caps!
$Sheet
S 4000 2000 500  150 
U 6242AFE6
F0 "R2R" 50
F1 "R2R.sch" 50
$EndSheet
$Sheet
S 7050 2000 500  150 
U 6244F096
F0 "power" 50
F1 "power.sch" 50
$EndSheet
Text Notes 1950 1800 0    50   ~ 0
TO DO:\n- Pull up/down resistors\n- input/output impedance to board\n- according to manual, the driver to the pins should be able to sink at least 5mA\n-NE5532 as opamp/comparator?
$Sheet
S 2000 2000 500  150 
U 62428AF7
F0 "IO" 50
F1 "IO.sch" 50
$EndSheet
$EndSCHEMATC
