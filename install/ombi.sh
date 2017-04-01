#!/bin/bash
# Licensed under GNU General Public License v3.0 GPL-3 (in short)
#
#   You may copy, distribute and modify the software as long as you track
#   changes/dates in source files. Any modifications to our software
#   including (via compiler) GPL-licensed code must also be made available
#   under the GPL along with build & install instructions.
#
#################################################################################

docker run -d -i \
	--restart=always \
	--name requests \
	-v $DOCKER_CONFIG/ombi:/config \
	-e EAP=0 \
	-e PUID=$(id -u) \
	-e PGID=$(id -g) \
	-l traefik.host="requests" \
rxwatcher/docker-ombi

sqlite3 $DOCKER_CONFIG/organizr/www/users.db "insert into tabs (name,url,defaultz,active,user,guest,icon,iconurl,window) values ('Ombi','https://requests.wildhair.nl','false','true','true','false','fa-diamond','images/couchpotato.png','false');"
docker restart $USER-organizr
