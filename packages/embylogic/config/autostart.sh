#!/bin/sh

# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2019-present Shanti Gilbert (https://github.com/shantigilbert)

mkdir -p /storage/.cache/services/
touch /storage/.cache/services/sshd.conf
systemctl start sshd

#if [[ ! -d "/storage/emby" ]]; then
#	mkdir -p /storage/emby
#fi 

systemctl start jellyfin

