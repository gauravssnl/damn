#!/system/bin/sh
MODDIR=${0%/*}
MODULESPATH=${MODDIR%/*}
ADBPATH=${MODULESPATH%/*}
DAMNPATH=$ADBPATH/DAMN

if [ -f "/cache/damn" ]; then
	cd $MODULESPATH
	for module in *; do
		if [ -d "$module" ]; then
			if [ "$module" != "DAMN" ]; then
  				cd $module
					touch disable
				cd -
			fi
		fi
	done
	rm -rf /cache/damn
fi
