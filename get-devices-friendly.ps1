
$setName = "ControlSet001"
$setName = "CurrentControlSet"

# ------------------------------------------------------------
$path="HKLM:\SYSTEM\"+$setName+"\Enum\SWD\WPDBUSENUM\"
ls -Path:$path

# ------------------------------------------------------------
$path="HKLM:\SOFTWARE\Microsoft\Windows Portable Devices\Devices\"
ls -Path:$path