# native module for requesting chip info

def version():
    try:
        from chipinfo import get_chip_info
        (model, cores, revision, pkg_ver, chipname)=get_chip_info()
        if chipname=='ESP32-PICO-V3-02':
            return 2
        elif chipname=='ESP32-D0WD':
            return 1
        else:
            return 0
    except:
        return 0

RX_PIN = 18
TX_PIN = 19
      
if version()==2:
    # LMS Uart pins for LMS-ESP32 version 2
    RX_PIN = 8
    TX_PIN = 7
    