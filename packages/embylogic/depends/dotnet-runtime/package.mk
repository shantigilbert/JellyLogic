# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

case "$ARCH" in
  "aarch64")
    PKG_NC_ARCH="arm64"
    PKG_SHA256="48d58ac6ff958ec7155befe76f83e276aceff50c4a7d1f578444a9a40720e412"
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/f5e04830-50fc-435c-8bb5-fcd4629da944/8aa7cce5c3fcb6a7db180b923d3574ef/dotnet-runtime-2.2.6-linux-arm64.tar.gz"
    ;;
  "arm")
    PKG_NC_ARCH="arm"
    PKG_SHA256="217bafd4d8ff50d1f84d37f4456326d1690f670b8dc747b17e8a9d294adae841"
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/8ccacf09-e5eb-481b-a407-2398b08ac6ac/1cef921566cb9d1ca8c742c9c26a521c/aspnetcore-runtime-3.1.2-linux-arm.tar.gz"
    ;;
  "x86_64")
    PKG_NC_ARCH="x64"
    PKG_SHA256="e30d4568c62d747b030e3c74f3d528ecb8d5c90e844e506bc0e3fcbce52b8cb1"
    PKG_URL="https://download.visualstudio.microsoft.com/download/pr/9f21e352-9d2c-4e3b-af45-915da89158db/0e8a7ea83cc08d4bcf417a927a36ed6f/dotnet-runtime-2.2.6-linux-x64.tar.gz"
    ;;
esac

PKG_NAME="dotnet-runtime"
PKG_VERSION="3.1.2"
PKG_REV="107"
PKG_ARCH="any"
PKG_LICENSE="MIT"
PKG_SITE="https://dotnet.github.io/"
PKG_DEPENDS_TARGET="toolchain curl curl3 krb5 lttng-ust"
PKG_SECTION="tools"
PKG_SHORTDESC=".NET Core Runtime"
PKG_LONGDESC=".NET Core Runtime ($PKG_VERSION) runs applications built with .NET Core, a cross-platform .NET implementation."
PKG_TOOLCHAIN="manual"
PKG_IS_ADDON="no"

make_target() {
  mkdir -p $INSTALL/usr/bin
  cp -r $PKG_DIR/bin/* $INSTALL/usr/bin
  cp -r $PKG_BUILD/* $INSTALL/usr/bin
 
}
