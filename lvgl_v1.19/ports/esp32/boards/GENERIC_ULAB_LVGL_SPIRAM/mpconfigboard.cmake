set(SDKCONFIG_DEFAULTS
    boards/sdkconfig.base
    boards/sdkconfig.ble
    boards/sdkconfig.spiram
    boards/sdkconfig.240mhz
)

set(LV_CFLAGS -DLV_COLOR_DEPTH=16 -DLV_COLOR_16_SWAP=1)

set(USER_C_MODULES /project/lv_micropython/examples/usercmodule/micropython.cmake)

if(NOT MICROPY_FROZEN_MANIFEST)
    set(MICROPY_FROZEN_MANIFEST ${MICROPY_PORT_DIR}/boards/manifest.py)
endif()
