include("$(PORT_DIR)/boards/manifest.py")

# Utils
freeze('modules')
package('modules/serialtalk')
