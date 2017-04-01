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
	--name smokeping \
	-e PGID=$(id -g) \
	-e PUID=$(id -u) \
	-e TZ=$(cat /etc/timezone) \
	-v $DOCKER_CONFIG/smokeping/data:/data \
    -v $DOCKER_CONFIG/smokeping/config:/config \
    -l "traefik.frontend.rule=PathPrefix: /smokeping/" \
linuxserver/smokeping

sqlite3 $DOCKER_CONFIG/organizr/www/users.db "insert into tabs (name,url,defaultz,active,user,guest,icon,iconurl,window) values ('Smokeping','https://$DOCKER_HOSTNAME/smokeping/smokeping.cgi','false','true','true','false','fa-diamond','','false');"
docker restart $USER-organizr

# URL http://server/smokeping/smokeping.cgi


