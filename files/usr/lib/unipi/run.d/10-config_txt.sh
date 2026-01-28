#!/bin/sh

[ -f /etc/bootcmd.d/Makefile ] && exit 0

if [ -r /boot/firmware/config.txt ]; then
    CONFIG_TXT=$(readlink -f /boot/firmware/config.txt)
else
    CONFIG_TXT=$(readlink -f /boot/config.txt)
fi



# check or insert include into config.txt
INCLUDE="include config_unipi.inc"
if ! grep -q -e "^[[:blank:]]*${INCLUDE}" "${CONFIG_TXT}"; then
    sed "1 i${INCLUDE}" -i "${CONFIG_TXT}"
fi
