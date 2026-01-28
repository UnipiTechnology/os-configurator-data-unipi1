#!/bin/sh

#DT="bb030f id0074_slot12 ic006a_slot22 ic0073_slot32"

[ -z "$DT" ] && exit
[ -f /etc/bootcmd.d/Makefile ] || exit 0

if [ -n "$USE_DS2482" ]; then
    DT="${DT} ds2482"
fi

if [ -n "$HAS_RTC" ]; then
    DT="${DT} unipi_rtc"
fi

if ! grep -q "raspberrypi,5-model-b" /sys/firmware/devicetree/base/compatible; then
    DT="${DT} unipi_rpi3"
fi


# create bootcmd.d artefact
echo "setenv overlay ${DT}" >/etc/bootcmd.d/src/14-overlays.conf
