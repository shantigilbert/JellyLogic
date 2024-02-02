# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2024-present Shanti Gilbert (https://github.com/shantigilbert)

PKG_NAME="rustdesk-server"
PKG_VERSION="1.1.10-3"
PKG_SHA256="b895bbcfbcb235bb407f53c704a1db18c7e174b1116b7f4189ce97cfa64af8f5"
PKG_LICENSE="AGPLv3"
PKG_SITE="https://github.com/rustdesk/rustdesk-server"
PKG_URL="${PKG_SITE}/releases/download/${PKG_VERSION}/${PKG_NAME}-linux-arm64v8.zip"
PKG_DEPENDS_TARGET="toolchain"
PKG_SHORTDESC="RustDesk Server Program"
PKG_TOOLCHAIN="manual"

pre_unpack() {
	unzip ${SOURCES}/${PKG_NAME}/${PKG_NAME}-${PKG_VERSION}.zip -d ${PKG_BUILD}
}

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/bin
  cp ${PKG_BUILD}/arm64v8/* ${INSTALL}/usr/bin
 }
