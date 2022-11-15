##########################################################################################
#
# Magisk Module Installer Script
#
##########################################################################################
##########################################################################################
#
# Instructions:
#
# 1. Place your files into system folder (delete the placeholder file)
# 2. Fill in your module's info into module.prop
# 3. Configure and implement callbacks in this file
# 4. If you need boot scripts, add them into common/post-fs-data.sh or common/service.sh
# 5. Add your additional or modified system properties into common/system.prop
#
##########################################################################################

##########################################################################################
# Config Flags
##########################################################################################

# Set to true if you do *NOT* want Magisk to mount
# any files for you. Most modules would NOT want
# to set this flag to true
SKIPMOUNT=false

# Set to true if you need to load system.prop
PROPFILE=false

# Set to true if you need post-fs-data script
POSTFSDATA=true

# Set to true if you need late_start service script
LATESTARTSERVICE=false

##########################################################################################
# Replace list
##########################################################################################

# List all directories you want to directly replace in the system
# Check the documentations for more info why you would need this

# Construct your list in the following format
# This is an example
REPLACE_EXAMPLE="
/system/app/Youtube
/system/priv-app/SystemUI
/system/priv-app/Settings
/system/framework
"

# Construct your own list here
REPLACE="
"

VERSION=$(grep_prop version "${TMPDIR}/module.prop")
ui_print ""
ui_print "                DAMN                "
ui_print " Disable All Modules Now ${VERSION} "
ui_print ""


if $BOOTMODE; then
	ui_print "- Installing from Magisk app"
else
	ui_print "*********************************************************"
	ui_print "! Install from recovery is NOT supported"
	ui_print "! Recovery sucks"
	ui_print "! Please install from Magisk app"
	abort "*********************************************************"
fi

extract "$ZIPFILE" 'customize.sh'		"$MODPATH"
extract "$ZIPFILE" 'module.prop'        "$MODPATH"
extract "$ZIPFILE" 'post-fs-data.sh'    "$MODPATH"
extract "$ZIPFILE" 'README.md'       	"$MODPATH"
extract "$ZIPFILE" 'CHANGELOG'       	"$MODPATH"
extract "$ZIPFILE" 'uninstall.sh'       "$MODPATH"

set_perm_recursive "$MODPATH" 0 0 0755 0644


