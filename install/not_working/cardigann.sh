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
docker stop jim-cardigann
docker rm jim-cardigann
docker run -d \
  --restart always \
	--name=$USER-cardigann \
	-v $DOCKER_CONFIG/cardigann:/config \
	-e PGID=$(id -g) \
	-e PUID=$(id -u) \
	-e TZ=$(cat /etc/timezone) \
	-l "traefik.frontend.rule=PathPrefixStrip: /$USER/cardigann" \
linuxserver/cardigann

#set base
sleep 5s
#sed -i "s/url_base.*/url_base = $USER\/couchpotato/g" $DOCKER_CONFIG/couchpotato/config.ini
# docker restart $USER-cardigann
sqlite3 $DOCKER_CONFIG/organizr/www/users.db "insert into tabs (name,url,defaultz,active,user,guest,icon,iconurl,window) values ('Cardigan','https://$DOCKER_HOSTNAME/$USER/cardigann/','false','true','true','false','fa-diamond','images/couchpotato.png','false');"
docker restart $USER-organizr
