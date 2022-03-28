"""CircuitPython Analog Out example"""
import time
import board
import math
from analogio import AnalogOut
from digitalio import DigitalInOut, Direction

analog_out = AnalogOut(board.A0)
led = DigitalInOut(board.D13)
led.direction = Direction.OUTPUT
f = 1 #freq of sine wave

while True:
    # Count up from 0 to 65535, with 64 increment
    # which ends up corresponding to the DAC's 10-bit range
    led.value = True
    time.sleep(1)
    led.value = not led.value
    time.sleep(1)
    led.value = not led.value
    time.sleep(1)
    led.value = not led.value
    time.sleep(1)
    while True:
        
        ## DC out. Range from 0 V (0) to 1 V (19347)
        # each 1000 is 50 mV
        #analog_out.value = 19347

        ##sine wave ranging from 0 to 1
        for i in range(0, 314, 1):
            analog_out.value = int(19850*(0.5+(0.5*math.sin(f*i/100))))
            led.value = not led.value

        ## very slow triangle wave
        #for i in range(0, 19347, 512):
        #    analog_out.value = i
        #    led.value = not led.value
        #    time.sleep(1)
        