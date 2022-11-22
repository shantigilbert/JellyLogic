#!/bin/sh

# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2019-present Shanti Gilbert (https://github.com/shantigilbert)

mkdir -p /storage/.cache/services/
touch /storage/.cache/services/sshd.conf
systemctl start sshd

#if [[ ! -d "/storage/emby" ]]; then
#	mkdir -p /storage/emby
#fi 

#systemctl start emby4

# docker rmi jellyfin/jellyfin
# docker rm jellyfin

#Wait for the USB media to be available, change the USBLABEL variable to your corresponding label
try=0
USBLABEL="MyMedia"

while [ ${try} -le 5 ]
do
    if [ -e "/media/${USBLABEL}" ]; then
        try=6
    else
        try=$(( ${try} + 1 ))
        sleep 2
    fi
done


#systemctl start jellyfin
INSTALLED=$(docker images | awk -F"jellyfin/" '{sub(/ .*/,"",$2);print $2}'| sed '/^$/d')
# echo $INSTALLED
if [[ "$INSTALLED" == "jellyfin" ]]; then
    docker start jellyfin
#    echo "start"
else
#echo "install"
    docker pull jellyfin/jellyfin

docker run -d \
--name jellyfin \
-v /storage/jellyfin/:/config \
-v /storage/jellyfin/cache:/cache \
-v /media:/media \
--net=host \
-e ServerIP=$(ip route get 9.9.9.9 | awk '{ print $NF; exit }') \
--restart=unless-stopped \
jellyfin/jellyfin

docker start jellyfin
fi
