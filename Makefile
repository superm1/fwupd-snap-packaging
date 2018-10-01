include /usr/share/dpkg/default.mk

PACKAGE := \
	fwupd.snap \
	$(NULL)

ASSERT := \
	fwupd.assert \
	$(NULL)

all: $(PACKAGE) $(ASSERT)

$(PACKAGE):
	./download-fwupd-snap

install: $(PACKAGE) $(ASSERT)
	install -d $(DESTDIR)/usr/lib/fwupd-snap
	install -m0644 $(PACKAGE) $(ASSERT) \
		$(DESTDIR)/usr/lib/fwupd-snap/

clean:
	rm -f $(PACKAGE) $(ASSERT)
