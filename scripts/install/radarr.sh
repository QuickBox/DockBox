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
	--name=$USER-radarr \
	-v $DOCKER_CONFIG/radarr:/config \
	-v $DOCKER_DOWNLOADS:/downloads \
	-v $DOCKER_STORAGE:/movies \
	-e PGID=$(id -g) \
	-e PUID=$(id -u) \
	-e TZ=$(cat /etc/timezone) \
	-l "traefik.frontend.rule=PathPrefix:/$USER/radarr" \
linuxserver/radarr

#set base
sleep 5s
docker stop $USER-radarr
sleep 5s
docker start $USER-radarr
sleep 5s
docker stop $USER-radarr
sed -i "s/<UrlBase>.*/<UrlBase>$USER\/radarr<\/UrlBase>/g"  $DOCKER_CONFIG/radarr/config.xml
docker start $USER-radarr
docker stop $USER-organizr
sqlite3 $DOCKER_CONFIG/organizr/www/users.db "insert into tabs (name,url,defaultz,active,user,guest,icon,iconurl,window) values ('Radarr','https://$DOCKER_HOSTNAME/$USER/radarr/','false','true','true','false','fa-diamond','images/radarr.png','false');"
docker start $USER-organizr
