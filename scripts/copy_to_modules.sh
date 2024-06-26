export MICROPYTHON=/home/stefan/projects/esp32/micropython
cp -a ../boards/LMS_ESP32 %MICROPYTHON/ports/eps32/boards
export LMS_ESP32_MODULES=$MICROPYHTON/ports/esp32/boards/LMS_ESP32/modules

cp ../submodules/PUPRemote/src/lpf2.py $PORTS_ESP32_MODULES
cp ../submodules/PUPRemote/src/pupremote.py $PORTS_ESP32_MODULES
cp ../submodules/mpy-robot-tools/mpy_robot_tools/uartremote.py $PORTS_ESP32_MODULES
cp ../submodules/mpy-robot-tools/mpy_robot_tools/servo.py $PORTS_ESP32_MODULES
cp ../submodules/mpy-robot-tools/mpy_robot_tools/np_animation.py $PORTS_ESP32_MODULES
cp ../submodules/mpy-robot-tools/mpy_robot_tools/bt.py $PORTS_ESP32_MODULES
cp ../submodules/mpy-robot-tools/mpy_robot_tools/ctrl_plus.py $PORTS_ESP32_MODULES
cp ../submodules/mpy-robot-tools/mpy_robot_tools/ctrl_plus.py $PORTS_ESP32_MODULES
mkdir  $PORTS_ESP32_MODULES/serialtalk
cp ../submodules/SerialTalk/serialtalk/usockets.py $PORTS_ESP32_MODULES/serialtalk
cp ../submodules/SerialTalk/serialtalk/esp32.py $PORTS_ESP32_MODULES/serialtalk
cp ../submodules/SerialTalk/serialtalk/serialtalk.py $PORTS_ESP32_MODULES/serialtalk
cp ../submodules/SerialTalk/serialtalk/__init__.py $PORTS_ESP32_MODULES/serialtalk
cp ../submodules/SerialTalk/serialtalk/auto.py $PORTS_ESP32_MODULES/serialtalk

