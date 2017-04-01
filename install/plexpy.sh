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
	--name=$USER-plexpy \
	-v $DOCKER_CONFIG/plexpy:/config \
	-v $DOCKER_CONFIG"/plex/Library/Application Support/Plex Media Server/Logs":/logs:ro \
	-e PGID=$(id -g) \
	-e PUID=$(id -u) \
	-e TZ=$(cat /etc/timezone) \
  	-l "traefik.frontend.rule=PathPrefix: /$USER/plexpy" \
linuxserver/plexpy

#set base
sleep 10s
docker stop $USER-plexpy
sed -i "s/http_root.*/http_root = \"$USER\/plexpy\"/g" $DOCKER_CONFIG/plexpy/config.ini
docker start $USER-plexpy
docker stop $USER-organizr
sqlite3 $DOCKER_CONFIG/organizr/www/users.db "insert into tabs (name,url,defaultz,active,user,guest,icon,iconurl,window) values ('Plexpy','https://$DOCKER_HOSTNAME/$USER/plexpy/','false','true','true','false','fa-diamond','images/plexpy.png','true');"
docker start $USER-organizr
