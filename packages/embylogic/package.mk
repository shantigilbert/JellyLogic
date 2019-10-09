# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2019-present Shanti Gilbert (https://github.com/shantigilbert)

PKG_NAME="embylogic"
PKG_VERSION=""
PKG_REV="1"
PKG_ARCH="any"
PKG_SITE=""
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain emby4 docker"
PKG_SECTION="emuelec"
PKG_SHORTDESC="Embylogic Meta Package"
PKG_LONGDESC="Embylogic Meta Package"
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"
PKG_TOOLCHAIN="make"

make_target() {
echo "hello"
}
makeinstall_target() {
   
  mkdir -p $INSTALL/usr/config/
    cp -rf $PKG_DIR/config/* $INSTALL/usr/config/
  
  mkdir -p $INSTALL/usr/lib
  cp -L  $(get_build_dir imagemagick)/.install_pkg/usr/lib/libMagickWand-7.Q16HDRI.so $INSTALL/usr/lib/CORE_RL_Wand_.so
  cp -r $(get_build_dir gnutls)/.INSTALL_PKG/usr/lib/libgnutls.so* $INSTALL/usr/lib
   }
   


post_install() {
# link default.target to embylogic
   ln -sf embylogic.target $INSTALL/usr/lib/systemd/system/default.target
   enable_service embylogic-autostart.service
  }
