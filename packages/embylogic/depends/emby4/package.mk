# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2019-present Shanti Gilbert (https://github.com/shantigilbert)

PKG_NAME="emby4"
PKG_VERSION="4.4.0.40"
PKG_SHA256="740e7328d517b1ffbb91d2c0f37884cdf67398af532848b005294d66fc540b9a"
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
