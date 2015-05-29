ifndef ROLLCOMPILER
  ROLLCOMPILER = gnu
endif
COMPILERNAME := $(firstword $(subst /, ,$(ROLLCOMPILER)))

NAME           = sdsc-migrate-3.6.8
VERSION        = 3.6.8
RELEASE        = 3
PKGROOT        = /opt/migrate/$(VERSION)

SRC_SUBDIR     = migrate

SOURCE_NAME    = migrate
SOURCE_SUFFIX  = tar.gz
SOURCE_VERSION = $(VERSION)
SOURCE_PKG     = $(SOURCE_NAME)-$(SOURCE_VERSION).src.$(SOURCE_SUFFIX)
SOURCE_DIR     = $(SOURCE_NAME)-$(SOURCE_VERSION)

TAR_GZ_PKGS       = $(SOURCE_PKG)

RPM.EXTRAS     = AutoReq:No
