#!/bin/bash
#
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
	--name=$USER-sickrage \
	-v $DOCKER_CONFIG/sickrage:/config \
	-v $DOCKER_DOWNLOADS:/downloads \
	-v $DOCKER_STORAGE:/tv \
	-e PGID=$(id -g) \
	-e PUID=$(id -u) \
	-e TZ=$(cat /etc/timezone) \
	-l "traefik.frontend.rule=PathPrefix: /$USER/sickrage" \
linuxserver/sickrage

#set base
sleep 30s
sed -i "s/web_root.*/web_root = \"$USER\/sickrage\"/g" $DOCKER_CONFIG/sickrage/config.ini
sleep 10s
docker restart $USER-sickrage
sqlite3 $DOCKER_CONFIG/organizr/www/users.db "insert into tabs (name,url,defaultz,active,user,guest,icon,iconurl,window) values ('Sickrage','https://$DOCKER_HOSTNAME/$USER/sickrage/','false','true','true','false','fa-diamond','images/sickrage.png','false');"
docker restart $USER-organizr
