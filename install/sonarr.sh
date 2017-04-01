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
    --name=$USER-sonarr \
    -e PGID=$(id -g) \
    -e PUID=$(id -u) \
    -e TZ=$(cat /etc/timezone) \
    -v /dev/rtc:/dev/rtc:ro \
    -v $HOME/config/sonarr:/config \
    -v $HOME/cloud/common/:/tv \
    -v $HOME/downloads:/downloads \
    -l "traefik.frontend.rule=PathPrefix:/$USER/sonarr" \
linuxserver/sonarr

#set base
sleep 5s
docker stop $USER-sonarr
sleep 5s
docker start $USER-sonarr
sleep 5s
docker stop $USER-sonarr
sed -i "s/<UrlBase>.*/<UrlBase>$USER\/sonarr<\/UrlBase>/g"  $DOCKER_CONFIG/sonarr/config.xml
docker start $USER-sonarr
docker stop $USER-organizr
sqlite3 $DOCKER_CONFIG/organizr/www/users.db "insert into tabs (name,url,defaultz,active,user,guest,icon,iconurl,window) values ('Sonarr','https://$DOCKER_HOSTNAME/$USER/sonarr/','false','true','true','false','fa-diamond','images/sonarr.png','false');"
docker start $USER-organizr

