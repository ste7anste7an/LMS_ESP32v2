export MICROPYTHON=/home/stefan/projects/esp32/test/micropython
cp -a ../boards/LMS_ESP32 $MICROPYTHON/ports/esp32/boards
export LMS_ESP32_MODULES=$MICROPYTHON/ports/esp32/boards/LMS_ESP32/modules
mkdir -p $LMS_ESP32_MODULES
cp ../micropython_modules/*.py $LMS_ESP32_MODULES
cp ../submodules/PUPRemote/src/lpf2.py $LMS_ESP32_MODULES
cp ../submodules/PUPRemote/src/pupremote.py $LMS_ESP32_MODULES
cp ../submodules/mpy-robot-tools/mpy_robot_tools/uartremote.py $LMS_ESP32_MODULES
cp ../submodules/mpy-robot-tools/mpy_robot_tools/servo.py $LMS_ESP32_MODULES
cp ../submodules/mpy-robot-tools/mpy_robot_tools/np_animation.py $LMS_ESP32_MODULES
cp ../submodules/mpy-robot-tools/mpy_robot_tools/bt.py $LMS_ESP32_MODULES
cp ../submodules/mpy-robot-tools/mpy_robot_tools/ctrl_plus.py $LMS_ESP32_MODULES
cp ../submodules/mpy-robot-tools/mpy_robot_tools/ctrl_plus.py $LMS_ESP32_MODULES
mkdir -p $LMS_ESP32_MODULES/serialtalk
cp ../submodules/SerialTalk/serialtalk/usockets.py $LMS_ESP32_MODULES/serialtalk
cp ../submodules/SerialTalk/serialtalk/esp32.py $LMS_ESP32_MODULES/serialtalk
cp ../submodules/SerialTalk/serialtalk/serialtalk.py $LMS_ESP32_MODULES/serialtalk
cp ../submodules/SerialTalk/serialtalk/__init__.py $LMS_ESP32_MODULES/serialtalk
cp ../submodules/SerialTalk/serialtalk/auto.py $LMS_ESP32_MODULES/serialtalk

