# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="dotnet-runtime"
PKG_REV="120"
PKG_ARCH="any"
PKG_LICENSE="MIT"
PKG_SITE="https://dotnet.microsoft.com/"
PKG_DEPENDS_TARGET="toolchain icu aspnet6-runtime"
PKG_SECTION="tools"
PKG_SHORTDESC="ASP.NET Core Runtime"
PKG_LONGDESC="ASP.NET Core Runtimes ($(get_pkg_version aspnet6-runtime)) enables you to run existing console/web/server applications."
PKG_TOOLCHAIN="manual"
PKG_IS_ADDON="no"

makeinstall_target() {
  mkdir -p $INSTALL/usr/bin
  cp -r $(get_build_dir aspnet6-runtime)/* $INSTALL/usr/bin
} 
