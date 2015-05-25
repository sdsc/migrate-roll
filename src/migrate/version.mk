ifndef ROLLCOMPILER
  ROLLCOMPILER = gnu
endif
COMPILERNAME := $(firstword $(subst /, ,$(ROLLCOMPILER)))

NAME           = sdsc-migrate
VERSION        = 3.6.10
RELEASE        = 1
PKGROOT        = /opt/migrate

SRC_SUBDIR     = migrate

SOURCE_NAME    = migrate
SOURCE_SUFFIX  = tar.gz
SOURCE_VERSION = $(VERSION)
SOURCE_PKG     = $(SOURCE_NAME)-$(SOURCE_VERSION).src.$(SOURCE_SUFFIX)
SOURCE_DIR     = $(SOURCE_NAME)-$(SOURCE_VERSION)

TAR_GZ_PKGS       = $(SOURCE_PKG)

RPM.EXTRAS     = AutoReq:No
