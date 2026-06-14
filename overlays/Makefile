dtss += unipi_uboot-overlay.dts
dtss += unipi_rtc-overlay.dts
dtss += unipi_id-overlay.dts
dtss += unipi_rpi3-overlay.dts
dtss += ds2482-overlay.dts

dtss += unipi_unipi11-overlay.dts
dtss += unipi_unipi10-overlay.dts
dtss += unipi_unipi1l-overlay.dts
dtss += em0018_slot1-overlay.dts
dtss += em0018_slot2-overlay.dts
dtss += em0018_slot3-overlay.dts
dtss += em0018_slot4-overlay.dts
dtss += em0018_slot5-overlay.dts
dtss += em0018_slot6-overlay.dts
dtss += em0018_slot7-overlay.dts


dtbo-y = $(dtss:-overlay.dts=.dtbo)

targets  += $(dtbo-y)

always-y += $(dtbo-y)

%.dtbo: %-overlay.dts
	dtc -@ -O dtb -o $@ $<

overlays: $(targets)

.PHONY: overlays