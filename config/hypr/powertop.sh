#bin/bash
echo '1500' > '/proc/sys/vm/dirty_writeback_centisecs'
echo '1' > '/sys/module/snd_hda_intel/parameters/power_save'
echo '0' > '/proc/sys/kernel/nmi_watchdog'
echo 'auto' > '/sys/bus/i2c/devices/i2c-6/device/power/control'
echo 'auto' > '/sys/bus/i2c/devices/i2c-20/device/power/control'
echo 'auto' > '/sys/bus/pci/devices/0000:07:00.0/power/control'
echo 'auto' > '/sys/bus/pci/devices/0000:00:08.0/power/control'
echo 'auto' > '/sys/bus/pci/devices/0000:00:18.2/power/control'
echo 'auto' > '/sys/bus/pci/devices/0000:00:18.5/power/control'
echo 'auto' > '/sys/bus/pci/devices/0000:08:00.2/power/control'
echo 'auto' > '/sys/bus/pci/devices/0000:00:18.1/power/control'
echo 'auto' > '/sys/bus/pci/devices/0000:00:01.0/power/control'
echo 'auto' > '/sys/bus/pci/devices/0000:08:00.7/power/control'
echo 'auto' > '/sys/bus/pci/devices/0000:00:18.7/power/control'
echo 'auto' > '/sys/bus/pci/devices/0000:00:04.0/power/control'
echo 'auto' > '/sys/bus/pci/devices/0000:00:02.0/power/control'
echo 'auto' > '/sys/bus/pci/devices/0000:00:18.0/power/control'
echo 'auto' > '/sys/bus/pci/devices/0000:00:00.2/power/control'
echo 'auto' > '/sys/bus/pci/devices/0000:00:03.0/power/control'
echo 'auto' > '/sys/bus/pci/devices/0000:00:18.6/power/control'
echo 'auto' > '/sys/bus/pci/devices/0000:06:00.0/power/control'
echo 'auto' > '/sys/bus/pci/devices/0000:00:00.0/power/control'
echo 'auto' > '/sys/bus/pci/devices/0000:00:18.4/power/control'
echo 'auto' > '/sys/bus/pci/devices/0000:00:18.3/power/control'
