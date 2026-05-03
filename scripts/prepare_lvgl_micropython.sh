export LMS_ESP32V2=$PWD/..
export LVGL_MICROPYTHON=../../lvgl_micropython
echo "Remove $LVGL_MICROPYTHON"
git clone https://github.com/lvgl-micropython/lvgl_micropython.git $LVGL_MICROPYTHON

cd ../submodules
rm -rf btbricks
rm -rf mpy-robot-tools
rm -rf np_animation
rm -rf PUPRemote
rm -rf PyHuskyLens
rm -rf rcservo
rm -rf SerialTalk
rm -rf uRemote

#git clone https://github.com/v923z/micropython-ulab.git
#git clone --recursive https://github.com/antonvh/mpy-robot-tools.git
git clone https://github.com/antonvh/SerialTalk.git
git clone https://github.com/antonvh/PUPRemote.git
git clone https://github.com/antonvh/PyHuskyLens.git
git clone https://github.com/AntonsMindstorms/rcservo.git
git clone https://github.com/AntonsMindstorms/np_animation.git
git clone https://github.com/AntonsMindstorms/btbricks.git
git clone https://github.com/AntonsMindstorms/uRemote.git

#cp -a ../boards/LMS_ESP32 $MICROPYTHON/ports/esp32/boards
export LMS_ESP32_MODULES=$LVGL_MICROPYTHON/lms_frozen
mkdir -p $LMS_ESP32_MODULES
cp ../micropython_modules/*.py $LMS_ESP32_MODULES
cp ../submodules/PUPRemote/src/lpf2.py $LMS_ESP32_MODULES
cp ../submodules/PUPRemote/src/pupremote.py $LMS_ESP32_MODULES
cp ../submodules/uRemote/library/uremote.py $LMS_ESP32_MODULES
cp ../submodules/rcservo/servo.py $LMS_ESP32_MODULES
cp ../submodules/np_animation/np_animation/np_animation.py $LMS_ESP32_MODULES
cp ../submodules/btbricks/btbricks/bt.py $LMS_ESP32_MODULES
cp ../submodules/btbricks/btbricks/ctrl_plus.py $LMS_ESP32_MODULES
cp ../submodules/PyHuskyLens/Library/pyhuskylens.py $LMS_ESP32_MODULES
cp ../submodules/SerialTalk/uartremote.py $LMS_ESP32_MODULES
mkdir -p $LMS_ESP32_MODULES/serialtalk
cp ../submodules/SerialTalk/serialtalk/usockets.py $LMS_ESP32_MODULES/serialtalk
cp ../submodules/SerialTalk/serialtalk/esp32.py $LMS_ESP32_MODULES/serialtalk
cp ../submodules/SerialTalk/serialtalk/serialtalk.py $LMS_ESP32_MODULES/serialtalk
cp ../submodules/SerialTalk/serialtalk/__init__.py $LMS_ESP32_MODULES/serialtalk
cp ../submodules/SerialTalk/serialtalk/auto.py $LMS_ESP32_MODULES/serialtalk

# inisetup for boot.py
mkdir -p $LVGL_MICROPYTHON/micropy_updates/esp32/modules
cp ../micropython_modules/inisetup/inisetup.py $LVGL_MICROPYTHON/micropy_updates/esp32/modules

# manifest for forzen modules
cp ../micropython_modules/manifest/manifest.py $LVGL_MICROPYTHON

cd $LVGL_MICROPYTHON
#python3 make.py esp32 BOARD=ESP32_GENERIC \
#DISPLAY=ili9341 DISPLAY=st7789 INDEV=xpt2046 INDEV=cst816s \
#USER_C_MODULE=$LMS_ESP32V2/micropython_modules/mymods/micropython.cmake FROZEN_MANIFEST=manifest.py
