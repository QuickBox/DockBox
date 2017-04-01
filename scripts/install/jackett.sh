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
    --name=$USER-jackett \
	-v $DOCKER_CONFIG/jackett:/config \
	-v $DOCKER_DOWNLOADS:/downloads \
	-e PGID=$(id -g) \
	-e PUID=$(id -u) \
	-e TZ=$(cat /etc/timezone) \
	-l traefik.frontend.rule="PathPrefixStrip: /$USER/jackett" \
linuxserver/jackett
sleep 10s
docker stop $USER-jackett
sed -i "s/\"BasePathOverride.*/\"BasePathOverride\": \"\/$USER\/jackett\"/g" $DOCKER_CONFIG/jackett/Jackett/ServerConfig.json
docker start $USER-jackett
sqlite3 $DOCKER_CONFIG/organizr/www/users.db "insert into tabs (name,url,defaultz,active,user,guest,icon,iconurl,window) values ('Jackett','https://$DOCKER_HOSTNAME/$USER/jackett/','false','true','true','false','fa-diamond','images/jackett.png','false');"
docker restart $USER-organizr
