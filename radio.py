#!/usr/bin/env python3
import RPi.GPIO as GPIO
import time
import os

GPIO.setmode(GPIO.BCM)
GPIO.setup(18, GPIO.IN, pull_up_down=GPIO.PUD_UP)

while True:
    input_state = GPIO.input(18)
    if input_state == False:
        time.sleep(0.1)
        input_state2 = GPIO.input(18)
        if input_state2 == False:
            os.system("/var/radio/pricti")
            time.sleep(1)
