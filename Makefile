INSTALL = install

.PHONY: all

INSTALL = install
PWD = $(shell pwd)
OVERLAY_DEST_DIR = /boot/overlays
UDEV_DEST_DIR = /usr/share/unipi-os-configurator/udev
LIB_DEST_DIR = /usr/lib/unipi



all:
	MAKEFLAGS="$(MAKEFLAGS)" $(MAKE) -C $(PWD)/overlays overlays


install: install-overlays install-udev unipi_values.py
	$(INSTALL) -d $(DESTDIR)/$(LIB_DEST_DIR)
	$(INSTALL) -m 644 unipi_values.py $(DESTDIR)/$(LIB_DEST_DIR)
	cp -r files/* $(DESTDIR)

install-overlays: $(wildcard overlays/*.dtbo)
	mkdir -p $(DESTDIR)/$(OVERLAY_DEST_DIR)
	$(INSTALL) -m 644 $^ $(DESTDIR)/$(OVERLAY_DEST_DIR)

install-udev: $(wildcard udev/*.rules)
	mkdir -p $(DESTDIR)/$(UDEV_DEST_DIR)
	[ -z "$^" ] || $(INSTALL) -m 644 $^ $(DESTDIR)/$(UDEV_DEST_DIR)

clean:
	@find overlays \( -name .\*.cmd -o -name .\*.tmp -o -name \*.dtbo \
	      -o -name Module.symvers -o -name modules.order  \) \
	      -delete
