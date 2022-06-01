---
title: Linux Device Tree hacking in running system
tags: linux device-tree dts dtb
---

Instead of rebuilding and flashing an OS image everytime one wants to test a change in the Linux device tree, better extract it from the running system, modify and then reboot!

Need to have `dtc` (Debian package device-tree-compiler):
```
# convert current dt into human-readable file
dtc -I fs /sys/firmware/devicetree/base >/custom.dts

# modify the dt
vi /custom.dts

# compile dts into dtb
dtc -I dts -O dtb -o /boot/dtb /custom.dts

# restart the system
reboot
```
