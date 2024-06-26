// Include MicroPython API.
#include "py/runtime.h"
#include "soc/soc.h"
#include "soc/rtc_cntl_reg.h"
#include "soc/efuse_reg.h"
#include "esp_chip_info.h"
#include <string.h>
// This is the function which will be called from Python as cexample.add_ints(a, b).

static mp_obj_t get_chip_info() {
	esp_chip_info_t chip_info;
	int chip_ver = REG_GET_FIELD(EFUSE_BLK0_RDATA3_REG, EFUSE_RD_CHIP_VER_PKG);
	int pkg_ver = chip_ver & 0x7;
	char chip_model[20];
	esp_chip_info(&chip_info);
        switch (pkg_ver) {
          case EFUSE_RD_CHIP_VER_PKG_ESP32D0WDQ6 :
            if (chip_info.revision == 3)
              strcpy(chip_model,"ESP32-D0WDQ6-V3");
            else
              strcpy(chip_model,"ESP32-D0WDQ6");
	    break;
          case EFUSE_RD_CHIP_VER_PKG_ESP32D0WDQ5 :
            if (chip_info.revision == 3)
               strcpy(chip_model,"ESP32-D0WD-V3");
            else
               strcpy(chip_model,"ESP32-D0WD");
            break;
          case EFUSE_RD_CHIP_VER_PKG_ESP32D2WDQ5 :
            strcpy(chip_model,"ESP32-D2WD");
	    break;
          case EFUSE_RD_CHIP_VER_PKG_ESP32PICOD2 :
            strcpy(chip_model,"ESP32-PICO-D2");
            break;
          case EFUSE_RD_CHIP_VER_PKG_ESP32PICOD4 :
            strcpy(chip_model,"ESP32-PICO-D4");
            break;
          case EFUSE_RD_CHIP_VER_PKG_ESP32PICOV302 :
            strcpy(chip_model,"ESP32-PICO-V3-02");
	    break;
          case EFUSE_RD_CHIP_VER_PKG_ESP32D0WDR2V3 :
            strcpy(chip_model,"ESP32-D0WDR2-V3");
            break;
          default:
            strcpy(chip_model,"Unknown");
	    break;
        }
        int len=strlen(chip_model);
	mp_obj_t tuple[5];
	tuple[0]=mp_obj_new_int(chip_info.model);
	tuple[1]=mp_obj_new_int(chip_info.cores);
	tuple[2]=mp_obj_new_int(chip_info.revision);
	tuple[3]=mp_obj_new_int(pkg_ver);
	tuple[4]=mp_obj_new_str(chip_model,len);
	return mp_obj_new_tuple(5, tuple);
}

// Define a Python reference to the function above. _0 means 0 arguments
static MP_DEFINE_CONST_FUN_OBJ_0(get_chip_info_obj, get_chip_info);

// Define all properties of the module.
// Table entries are key/value pairs of the attribute name (a string)
// and the MicroPython object reference.
// All identifiers and strings are written as MP_QSTR_xxx and will be
// optimized to word-sized integers by the build system (interned strings).
static const mp_rom_map_elem_t example_module_globals_table[] = {
    { MP_ROM_QSTR(MP_QSTR___name__), MP_ROM_QSTR(MP_QSTR_chipinfo) },
    { MP_ROM_QSTR(MP_QSTR_get_chip_info), MP_ROM_PTR(&get_chip_info_obj) },
};
static MP_DEFINE_CONST_DICT(example_module_globals, example_module_globals_table);

// Define module object.
const mp_obj_module_t example_user_cmodule = {
    .base = { &mp_type_module },
    .globals = (mp_obj_dict_t *)&example_module_globals,
};

// Register the module to make it available in Python.
MP_REGISTER_MODULE(MP_QSTR_chipinfo, example_user_cmodule);
