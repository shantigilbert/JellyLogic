# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2019-present Shanti Gilbert (https://github.com/shantigilbert)

PKG_NAME="embylogic"
PKG_VERSION=""
PKG_REV="1"
PKG_ARCH="any"
PKG_SITE=""
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain jellyfin docker xmlstarlet"
PKG_SHORTDESC="Embylogic Meta Package"
PKG_LONGDESC="Embylogic Meta Package"
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
   }
   
post_install() {
# link default.target to embylogic
   ln -sf embylogic.target $INSTALL/usr/lib/systemd/system/default.target
   enable_service embylogic-autostart.service
  }
