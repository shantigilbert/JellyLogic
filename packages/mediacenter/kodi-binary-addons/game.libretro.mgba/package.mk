# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="game.libretro.mgba"
PKG_VERSION="0.10.0.35-Matrix"
PKG_SHA256="a95a2aa92f6e5f86bc9d764e1409cad4899e6edfa8d1061e0a67033e0cc79883"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/kodi-game/game.libretro.mgba"
PKG_URL="https://github.com/kodi-game/game.libretro.mgba/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain kodi-platform libretro-mgba"
PKG_SECTION=""
PKG_LONGDESC="game.libretro.mgba: mGBA emulator for Kodi"

PKG_IS_ADDON="yes"
PKG_ADDON_TYPE="kodi.gameclient"