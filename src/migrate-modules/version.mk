PACKAGE     = migrate
CATEGORY    = applications

NAME        = sdsc-$(PACKAGE)-modules
RELEASE     = 6
PKGROOT     = /opt/modulefiles/$(CATEGORY)/$(PACKAGE)

VERSION_SRC = $(REDHAT.ROOT)/src/$(PACKAGE)/version.mk
VERSION_INC = version.inc
include $(VERSION_INC)

EXTRA_MODULE_VERSIONS = 3.6.8

RPM.EXTRAS  = AutoReq:No\nAutoProv:No
RPM.PREFIX  = $(PKGROOT)
