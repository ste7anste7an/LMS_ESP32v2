# LMS_ESP32v2 builder
This repo contains scripts to build micropython firmware for LMS-ESP32 modules. 

## Compile for lvgl_micropython

- Go into the script directory
- execute `./prepare_lvgl_micropython.sh`
- `cd ../../lvgl_micropython`
- `python3 make.py esp32 BOARD=ESP32_GENERIC DISPLAY=ili9341 DISPLAY=st7789 INDEV=xpt2046 INDEV=cst816s USER_C_MODULE=/home/stefan/esp32/LMS_ESP32v2/micropython_modules/mymods/micropython.cmake FROZEN_MANIFEST=manifest.py`



## chipinfo
This is a native C module that is used to detect the chip version of the ESP32 module. For LMS_ESP32v1 this is 'wrover', for LMS_ESP32v2 this is 'ESP32-PICO-V3-02 (revision 3)'.


## Frozen modules
A number of forzen modules are incorporated in the firmware. The source code for these modules stem from our LMS specific repositories:

```
https://github.com/antonvh/SerialTalk.git
https://github.com/antonvh/PUPRemote.git
https://github.com/antonvh/PyHuskyLens.git
https://github.com/AntonsMindstorms/rcservo.git
https://github.com/AntonsMindstorms/np_animation.git
https://github.com/AntonsMindstorms/btbricks.git
https://github.com/AntonsMindstorms/uRemote.git
```

From these repo's the following modules are frozen:

```
├── bt.py
├── ctrl_plus.py
├── lms_esp32.py
├── lpf2.py
├── np_animation.py
├── pupremote.py
├── pyhuskylens.py
├── serialtalk
│   ├── auto.py
│   ├── esp32.py
│   ├── __init__.py
│   ├── serialtalk.py
│   └── usockets.py
├── servo.py
├── test_dut.py
├── tester.py
├── uartremote.py
└── uremote.py
```


