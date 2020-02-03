# Schedule task

nohup /bin/sh > /dev/null 2>&1 <<EOF &

wait_boot_complete()
{
	until [ "x\$(getprop sys.boot_completed)" == "x1" ]
	do
		sleep 1
	done
}

resetprop_exists()
{
	prop="\$1"
	val="\$2"

	cval=\$(getprop "\$prop")
	if [ \( -n "\$cval" \) -a \( "\$cval" != "\$val" \) ]
	then
		resetprop "\$prop" "\$val"
	fi
}

getprop_change_eng()
{
	getprop "\$1" | sed -e 's/userdebug/eng/g' -e 's/user/eng/g' -e 's/release-keys/test-keys/g'
}

resetprop_exists_replace()
{
	resetprop_exists "\$1" "\$(getprop_change_eng "\$1")"
}


wait_boot_complete

resetprop ro.secure 0
resetprop ro.adb.secure 0
resetprop ro.debuggable 1
resetprop ro.kernel.android.checkjni 1

resetprop_exists ro.build.type eng
resetprop_exists ro.odm.build.type eng
resetprop_exists ro.system.build.type eng
resetprop_exists ro.vendor.build.type eng
resetprop_exists ro.product.build.type eng

resetprop_exists_replace ro.build.flavor
resetprop_exists_replace ro.build.description
resetprop_exists_replace ro.build.version.base_os
resetprop_exists_replace ro.build.fingerprint
resetprop_exists_replace ro.bootimage.build.fingerprint
resetprop_exists_replace ro.odm.build.fingerprint
resetprop_exists_replace ro.system.build.fingerprint
resetprop_exists_replace ro.vendor.build.fingerprint
resetprop_exists_replace ro.product.build.fingerprint

resetprop_exists_replace ro.build.tags
resetprop_exists_replace ro.odm.build.tags
resetprop_exists_replace ro.system.build.tags
resetprop_exists_replace ro.vendor.build.tags
resetprop_exists_replace ro.product.build.tags

resetprop_exists persist.service.debuggable 1
resetprop_exists persist.service.adb.enable 1
resetprop_exists debug.enable true

EOF

