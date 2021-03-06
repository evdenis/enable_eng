# Enable Eng

This Magisk Module enables engineering build props.
It allows to activate debugging parts of a firmware.
Please, disable Magisk Hide for this module.
If you don't know what you are doing, don't use this module.
This module can easily softbrick your device.

## How to install:

Stable release:
1. Dowload latest enable_eng.zip from releases page
   https://github.com/evdenis/enable_eng/releases
2. Disable MagiskHide: MagiskManager -> Settings -> Magisk Hide
3. MagiskManager -> Modules + Downloads/enable_eng.zip -> Reboot

Master branch:
1. git clone https://github.com/evdenis/enable_eng
2. cd enable_eng
3. git archive --output enable_eng.zip HEAD
4. adb push enable_eng.zip /sdcard/
5. Disable MagiskHide: MagiskManager -> Settings -> Magisk Hide
6. MagiskManager -> Modules + enable_eng.zip -> Reboot

## Troubleshooting

### What to do if your device doesn't boot

How to unbrick:
1. Reboot to TWRP recovery
2. adb shell rm -fr /data/adb/modules/enable_eng
3. adb reboot recovery

### ADB doesn't work

This means that adbd in your firmware is build without
ALLOW_ADBD_ROOT. You can fix adb autostart either by
installing ["ADB Root"](https://github.com/evdenis/adb_root)
magisk module or by disabling this module.

## Support

- [Telegram](https://t.me/joinchat/GsJfBBaxozXvVkSJhm0IOQ)
- [XDA Thread](https://forum.xda-developers.com/apps/magisk/module-debugging-modules-adb-root-t4050041)
