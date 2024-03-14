# -------------------------------------------------------------
# How to Locate roots in the registry
$help = @"
"REGISTRY::HKEY_CLASSES_ROOT" = "HKEY_CLASSES_ROOT" = "HKCR:"
"REGISTRY::HKEY_CURRENT_CONFIG" = "HKEY_CURRENT_CONFIG" = "HKCC:"
"REGISTRY::HKEY_USERS" = "HKEY_USERS" = "HKU:"
"REGISTRY::HKEY_CURRENT_USER" = "HKEY_CURRENT_USER" = "HKCU:"
"REGISTRY::HKEY_LOCAL_MACHINE" = "HKEY_LOCAL_MACHINE" = "HKLM:"
"@

# -------------------------------------------------------------
# Setup
$setName = "ControlSet001"
$setName = "CurrentControlSet"

$errorAction="SilentlyContinue"

# -------------------------------------------------------------
# Header
echo "
----------------------------------------------------------------------------
Guessing the registry keys of your USB storage devices

The CurrentControlSet can also be ControlSet001, ControlSet002 ...

"

# -------------------------------------------------------------
# List children
echo "
----------------------------------------------------------------------------
USBSTOR session
"
$path = "HKLM:\SYSTEM\"+$setName+"\Enum\USBSTOR\"
ls -Path:$path

# -------------------------------------------------------------
# Search recursively
echo "
----------------------------------------------------------------------------
USB session
"
$path = "HKLM:\SYSTEM\"+$setName+"\Enum\USB\"
ls -Path:$path -Recurse -ErrorAction:$errorAction |Where-Object {$_.GetValue('Service') -eq 'USBSTOR'}

# -------------------------------------------------------------
# Search recursively
echo "
----------------------------------------------------------------------------
My best guess
"
$path = "HKLM:\SYSTEM\"+$setName+"\Control\DeviceClasses\"
ls -Path:$path -Recurse -ErrorAction:$errorAction | Where-Object {$_.getValue('DeviceInstance') -like 'USBSTOR*'}