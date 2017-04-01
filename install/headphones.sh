#!/bin/bash
# Licensed under GNU General Public License v3.0 GPL-3 (in short)
#
#   You may copy, distribute and modify the software as long as you track
#   changes/dates in source files. Any modifications to our software
#   including (via compiler) GPL-licensed code must also be made available
#   under the GPL along with build & install instructions.
#
#################################################################################
docker run -d \
  --restart always \
	--name=$USER-headphones \
	-v $DOCKER_CONFIG/headphones:/config \
	-v $DOCKER_DOWNLOADS:/downloads \
	-v $DOCKER_STORAGE:/music \
	-e PGID=$(id -g) \
	-e PUID=$(id -u) \
	-e TZ=$(cat /etc/timezone) \
	-l "traefik.frontend.rule=PathPrefix: /$USER/headphones" \
linuxserver/headphones

#set base
sleep 5s
docker stop $USER-headphones
sed -i "s/http_root.*/http_root = \/$USER\/headphones/g" $DOCKER_CONFIG/headphones/config.ini
docker restart $USER-headphones
sqlite3 $DOCKER_CONFIG/organizr/www/users.db "insert into tabs (name,url,defaultz,active,user,guest,icon,iconurl,window) values ('Headphones','https://$DOCKER_HOSTNAME/$USER/headphones/home','false','true','true','false','fa-diamond','images/headphones.png','false');"
docker restart $USER-organizr
