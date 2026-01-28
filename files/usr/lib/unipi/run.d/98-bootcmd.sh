#!/bin/sh

[ -f /etc/bootcmd.d/Makefile ] || exit 0

make -C /etc/bootcmd.d force
