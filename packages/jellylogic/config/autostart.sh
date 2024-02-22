#!/bin/sh

# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2019-present Shanti Gilbert (https://github.com/shantigilbert)

mkdir -p /storage/.cache/services/
touch /storage/.cache/services/sshd.conf
systemctl start sshd

# Set ip to 192.168.1.222 mostly for AdGuardHome
connmanctl config "$(connmanctl services | awk '/^\*/ {print $3}')" --ipv4 manual 192.168.1.222 255.255.255.0 192.168.1.254

#echo "jelly" > /storage/.cache/hostname
#cat /storage/.cache/hostname > /proc/sys/kernel/hostname 

systemctl restart adguard
systemctl start jellyfin

