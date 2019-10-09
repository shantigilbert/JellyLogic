# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2019-present Shanti Gilbert (https://github.com/shantigilbert)

PKG_NAME="emby4"
PKG_VERSION="4.3.0.8"
PKG_SHA256="fe0768bc240a2f5287190b5e806229c10fb84f9a219cfd6f393caea032562ac4"
PKG_REV="105"
PKG_ARCH="any"
PKG_LICENSE="prop."
PKG_SITE="http://emby.media"
PKG_URL="https://github.com/MediaBrowser/Emby.Releases/releases/download/$PKG_VERSION/embyserver-netcore_$PKG_VERSION.zip"
PKG_SOURCE_DIR="system"
PKG_DEPENDS_TARGET="toolchain imagemagick dotnet-runtime ffmpegx"
PKG_SECTION="service"
PKG_SHORTDESC="Emby Server: a personal media server"
PKG_LONGDESC="Emby Server ($PKG_VERSION) brings your home videos, music, and photos together, automatically converting and streaming your media on-the-fly to any device"
PKG_TOOLCHAIN="manual"
PKG_IS_ADDON="no"

make_target() {
  mkdir -p $INSTALL/usr/config/emby
  cp -r $PKG_BUILD/* $INSTALL/usr/config/emby
  mkdir -p $INSTALL/usr/bin
  cp -r $PKG_DIR/bin/* -d $INSTALL/usr/bin
  ln -sf /storage/.config/emby $INSTALL/emby
}


post_install() {
   enable_service emby4.service
  }
