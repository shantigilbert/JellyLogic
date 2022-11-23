# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2017 Lukas Rusak (lrusak@libreelec.tv)
# Copyright (C) 2017-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="docker"
PKG_REV="138"
PKG_ARCH="any"
PKG_LICENSE="ASL"
PKG_SITE="http://www.docker.com/"
PKG_DEPENDS_TARGET="cli containerd moby runc tini"
PKG_SECTION="service/system"
PKG_SHORTDESC="Docker is an open-source engine that automates the deployment of any application as a lightweight, portable, self-sufficient container that will run virtually anywhere."
PKG_LONGDESC="Docker containers can encapsulate any payload, and will run consistently on and between virtually any server. The same container that a developer builds and tests on a laptop will run at scale, in production*, on VMs, bare-metal servers, OpenStack clusters, public instances, or combinations of the above."
PKG_TOOLCHAIN="manual"

make_target() {
  mkdir -p ${INSTALL}/bin

    # cli
    cp -P $(get_build_dir cli)/bin/docker ${INSTALL}/bin

    # moby
    cp -P $(get_build_dir moby)/bin/dockerd ${INSTALL}/bin
    cp -P $(get_build_dir moby)/bin/docker-proxy ${INSTALL}/bin/docker-proxy

    # containerd
    cp -P $(get_build_dir containerd)/bin/containerd ${INSTALL}/bin/containerd
    cp -P $(get_build_dir containerd)/bin/containerd-shim ${INSTALL}/bin/containerd-shim
    cp -P $(get_build_dir containerd)/bin/containerd-shim-runc-v2 ${INSTALL}/bin/containerd-shim-runc-v2

    # runc
    cp -P $(get_build_dir runc)/bin/runc ${INSTALL}/bin/runc

    # tini
    cp -P $(get_build_dir tini)/.${TARGET_NAME}/tini-static ${INSTALL}/bin/docker-init
}

post_install_target() {
  sed -e "s/@DISTRO_PKG_SETTINGS_ID@/${DISTRO_PKG_SETTINGS_ID}/g" -i "${INSTALL}/default.py"
}
