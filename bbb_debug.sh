#!/bin/sh
echo "******  Start Debug Output  ******\n"

/bin/uname -a
/usr/bin/uptime
/bin/netstat -ie
/bin/netstat -rn
/bin/netstat -apn

cpufreq-info
/bin/cat /sys/class/hwmon/hwmon0/device/temp1_input | sed 's/...$//'

/bin/cat /sys/kernel/debug/pinctrl/44e10800.pinmux/pingroups
/bin/cat /sys/kernel/debug/pinctrl/44e10800.pinmux/pins
/bin/cat /sys/kernel/debug/pinctrl/pinctrl-maps
/bin/cat /sys/kernel/debug/pinctrl/pinctrl-handles
