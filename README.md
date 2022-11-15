# Disable All Modules Now
### newbit @ xda-developers
Disables all installed modules

### Description
If you are in a Boot Loop, create /cache/damn file in TWRP via touch /cache/damn or with adb.
If this file exists, DAMN will disable all modules installed in /data/adb/module, except it self.
The Module can be enabled, but will only run if the "damn" file exists. After each boot, the Module
will delete the file /cache/damn