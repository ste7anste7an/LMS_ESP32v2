# tester

from machine import UART,Pin
from neopixel import NeoPixel
from time import sleep_ms
import lms_esp32
from uartremote import *

LMS_ESP32_RX_PIN = 18
LMS_ESP32_TX_PIN = 19

LMS_ESP32_V2_RX_PIN = 8
LMS_ESP32_V2_TX_PIN = 7

version=lms_esp32.version()
if version==2:
    pins = [5,22,20,0,32,26,14,13,4,21,19,2,33,27,12,15]
    pin_led=25
    tx_pin=LMS_ESP32_V2_TX_PIN
    rx_pin=LMS_ESP32_V2_RX_PIN
else:
    pins = [5,22,25,2,26,27,32,33,4,21,23,0,12,13,14,15]
    pin_led=25
    tx_pin=LMS_ESP32_TX_PIN
    rx_pin=LMS_ESP32_RX_PIN
    
ur=UartRemote()
total_errors=0

def print_pins(state):
    #state=[1 if p in states else 0 for p in pins]
    print("[*] -------------------------------------")
    print('[*] '+''.join(["GP%02d "%p for p in pins[:8]]))
    print('[*] '+''.join([" [%1s] "%s for s in state[:8]]))
    print('[*] '+''.join(["GP%02d "%p for p in pins[8:]]))
    print('[*] '+''.join([" [%1s] "%s for s in state[8:]]))
    
def all_pins_in():
    for p in pins:
        pin = Pin(p, Pin.IN, pull=Pin.PULL_UP)
        

def test_pin(pin_test,state):
    print("test_pin",pin_test,state)
    global total_errors
    lowhigh=['low','high']
    states=[]
    vals={}
    # if testing for 1, pin in pull down
    # if testing for 0, pin in pull up
    pull=Pin.PULL_DOWN if state==1 else Pin.PULL_UP
    for p in pins:
        pin = Pin(p, Pin.IN, pull=pull)
        val=pin.value()
        vals[p]=val
    #if pin_test in [4,5]:
    #print("vals",vals)
    pin_error=0
    pins_short=0
    
    for p in pins:
        if p==pin_test:
            pin_error=not vals[p]==state
            states.append('V' if pin_error==0 else 'X')
                
        else:
            if not (p==0 and state==1): # GPIO0 is always pull up
                pin_short=not (vals[p]==1-state)
                states.append('.' if pin_short==0 else 'S')
                pins_short+=pin_short
            else:
                states.append('1')
    if pin_error or pins_short>0:
        print('\n[!] Error when setting pin GP%02d %s'%(pin_test,lowhigh[state]))
    if pins_short>0:
        print("[!] One or more pins are short circuited (S=short, .=ok, X=not connected, V=ok, 1=always high)\n")
    if pin_error or pins_short>0:
        print()
        print_pins(states)
    total_errors+=pin_error+pins_short
    print("errors=",total_errors)
   

def print_start():
    print("\n\n*********************")
    print("* Ready for testing *")
    print("* Insert DUT in rig *")
    print("*********************")

def start():
    global total_errors
    print("[*] Starting test")
    total_errors=0
    all_pins_in()
    np[0]=(0,0,0)
    np.write()
    _=Pin(pin_led,Pin.IN)
     
def mac(id):
    print("[*] Testing ID ",id.decode('ascii'))

    
def stop():
    if total_errors==0:
       print("[*] Test passed succesfully")
    else:
       print("\n[!] Test failed with %d error(s)"%total_errors)

    if total_errors>0:
       for i in range(5):
          np[0]=(100,0,0)
          np.write()
          sleep_ms(200)
          np[0]=(0,0,0)
          np.write()
          sleep_ms(200)          
    else:
        np[0]=(0,100,0)
        np.write()
        sleep_ms(1000)
    print_start()
  
# initialization

np=NeoPixel(Pin(pin_led),1)
np[0]=(50,50,0)
np.write()
all_pins_in()
print_start()


ur.add_command(start)
ur.add_command(test_pin)
ur.add_command(mac)
ur.add_command(stop)


ur.loop()

