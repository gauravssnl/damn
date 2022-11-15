# Disable All Modules Now
### newbit @ xda-developers
Disables all installed modules

### Description
If you are in a Boot Loop,
- create /cache/damn file in TWRP via touch /cache/damn or
- with adb shell "touch /data/local/tmp/damn"

If one of these file exists, DAMN will disable all modules installed in /data/adb/module, except itself.
The Module can be enabled, but will only run if a "damn" file exists. After each boot, the Module
will delete the file /cache/damn and /data/local/tmp/damn