#!/system/bin/sh
MODDIR=${0%/*}
MODULESPATH=${MODDIR%/*}
DAMN="
/cache/damn
/data/local/tmp/damn
"

for f in $DAMN; do
	if [ -f "$f" ]; then
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
		rm -rf $f
	fi
done





