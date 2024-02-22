# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2019-present Shanti Gilbert (https://github.com/shantigilbert)

PKG_NAME="jellylogic"
PKG_VERSION=""
PKG_REV="1"
PKG_ARCH="any"
PKG_SITE=""
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain jellyfin docker xmlstarlet adguard rustdesk-server"
PKG_SHORTDESC="Jellylogic Meta Package"
PKG_LONGDESC="Jellylogic Meta Package"
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"
PKG_TOOLCHAIN="manual"

#make_target() {
#if [ "$PROJECT" == "Amlogic-ng" ]; then
#	cp -r $PKG_DIR/display* $PKG_BUILD/
#	cd $PKG_BUILD/display
#	$CC -O2 display.c -o display
#fi
#}

makeinstall_target() {
   
  mkdir -p $INSTALL/usr/config/
    cp -rf $PKG_DIR/config/* $INSTALL/usr/config/
    ln -sf /storage/.config/jellylogic ${INSTALL}/jellylogic
   }
   
post_install() {
# link default.target to jellylogic
   ln -sf jellylogic.target $INSTALL/usr/lib/systemd/system/default.target
   enable_service jellylogic-autostart.service
  }
