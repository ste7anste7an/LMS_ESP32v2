# DUT

from machine import UART,Pin,unique_id
from time import ticks_ms,ticks_diff
from binascii import hexlify
from time import sleep_ms
import lms_esp32
from uartremote import *

ur=UartRemote(timeout=1000)

version=lms_esp32.version()
if version==2:
    pins = [5,22,20,0,32,26,14,13,4,21,19,2,33,27,12,15]
    pin_led=25
else:
    pins = [5,22,25,2,26,27,32,33,4,21,23,0,12,13,14,15]
    pin_led=25


def write_gpio(pin,val):
    p = Pin(pin, Pin.OUT)
    p.value(val)
    
def test_pin(pin,state=1):
    # set Pin(pin) high, other float
    for p in pins:
        pp = Pin(p, Pin.IN, pull=None)
    write_gpio(pin,state)
    print("testpin",pin,state)
    _=ur.call('test_pin','2b',pin,state)

def write_id():
    id=hexlify(unique_id())
    ur.call('mac','12s',id)
    
def test_program():
    print("start test program")
    write_id()
    for p in pins:
        test_pin(p,state=1)
        sleep_ms(10)
    for p in pins:
        test_pin(p,state=0)
        sleep_ms(10)
    # set pin_led as IN 
    Pin(pin_led, Pin.IN)
    ur=UartRemote(timeout=3000)
    ur.call('stop')
    
def start_test():
  #sleep_ms(200) # wait
  ur=UartRemote(timeout=1000)
  err,_=ur.call('start')
  if err!='err':
      test_program()
  else:
      print('ready to start coding')
 

