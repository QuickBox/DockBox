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
	--name portainer \
	-v $DOCKER_CONFIG/portainer:/data \
	-v /var/run/docker.sock:/var/run/docker.sock \
	-l "traefik.frontend.rule=PathPrefixStrip: /portainer" \
portainer/portainer --no-auth

sqlite3 $DOCKER_CONFIG/organizr/www/users.db "insert into tabs (name,url,defaultz,active,user,guest,icon,iconurl,window) values ('Portainer','https://$DOCKER_HOSTNAME/portainer/','false','true','true','false','fa-diamond','','false');"
docker restart $USER-organizr

