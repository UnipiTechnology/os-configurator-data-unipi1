#!/bin/sh

[ -f /etc/bootcmd.d/Makefile ] && exit 0

if [ -r /boot/firmware/config.txt ]; then
    CONFIG_TXT=$(readlink -f /boot/firmware/config.txt)
else
    CONFIG_TXT=$(readlink -f /boot/config.txt)
fi

CONFIG_INC=$(dirname "$CONFIG_TXT")/config_unipi.inc

#OVERLAYS="unipi-rtc unipi-neuron"

# create include config file
{
cat <<EOF
dtparam=i2c_arm=on
dtoverlay=unipi_id
EOF

if [ -n "$HAS_DS2482" ]; then
    echo "dtoverlay=ds2482"
fi

if [ -n "$HAS_RTC" ]; then
    echo "dtoverlay=unipi_rtc"
fi

for overlay in ${DT}; do
    echo "dtoverlay=$overlay"
done

if ! grep -q "raspberrypi,5-model-b" /sys/firmware/devicetree/base/compatible; then
    echo "dtoverlay=unipi_rpi3"
fi


} >"${CONFIG_INC}"
