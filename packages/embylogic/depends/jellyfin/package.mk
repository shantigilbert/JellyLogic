# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2019-present Shanti Gilbert (https://github.com/shantigilbert)

PKG_NAME="jellyfin"
PKG_VERSION="10.8.7"
PKG_SHA256="2f87f5cbe24d690f73618535c92a770f958a1415410343399aebf9e91e9c26c9"
PKG_REV="107"
PKG_ARCH="any"
PKG_LICENSE="GPLv2"
PKG_SITE="http://jellyfin.org"
PKG_URL="https://repo.jellyfin.org/releases/server/portable/versions/stable/combined/${PKG_VERSION}/jellyfin_${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain imagemagick dotnet-runtime ffmpegx"
PKG_SECTION="service"
PKG_SHORTDESC="The Free Software Media System"
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/config/jellyfin
  mkdir -p ${INSTALL}/usr/bin
    
  cp -r ${PKG_BUILD}/* ${INSTALL}/usr/config/jellyfin
  touch ${INSTALL}/usr/config/jellyfin/extract.ok
  cp -r ${PKG_DIR}/bin/* -d ${INSTALL}/usr/bin
  ln -sf /storage/.config/jellyfin ${INSTALL}/jellyfin

  sed -e "s/@JELLYFIN_VERSION@/${PKG_VERSION}/g" -i "${INSTALL}/usr/bin/jellyfin-downloader"
  sed -e "s/@JELLYFIN_VERSION@/${PKG_VERSION}/g" -i "${INSTALL}/usr/bin/jellyfin-start"
 }

post_install() {
   enable_service jellyfin.service
  }
