# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2024-present Shanti Gilbert (https://github.com/shantigilbert)

PKG_NAME="adguard"
PKG_VERSION="0.107.43"
PKG_SHA256="c033985618c5eee3454702bb7f18dd697fc9eb13d7f688b3e468f204a8630e10"
PKG_LICENSE="GPLv3"
PKG_SITE="https://adguard.com/en/adguard-home/overview.html"
PKG_URL="https://github.com/AdguardTeam/AdGuardHome/releases/download/v${PKG_VERSION}/AdGuardHome_linux_arm64.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_SHORTDESC="Network-wide ads & trackers blocking DNS server "
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/bin
  cp ${PKG_BUILD}/AdGuardHome/AdGuardHome* ${INSTALL}/usr/bin
 }

post_install() {
   enable_service adguard.service
  }
