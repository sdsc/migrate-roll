NAME       = sdsc-migrate-roll-test
VERSION    = 1
RELEASE    = 4
PKGROOT    = /root/rolltests

RPM.EXTRAS = AutoReq:No
RPM.EXTRAS = AutoReq:No\nAutoProv:No
RPM.FILES  = $(PKGROOT)/migrate.t
