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
	--name=$USER-beets \
	-v $DOCKER_CONFIG/beets:/config \
	-e PGID=$(id -g) \
	-e PUID=$(id -u) \
	-e TZ=$(cat /etc/timezone) \
	-l "traefik.frontend.rule=PathPrefixStrip: /$USER/beets" \
linuxserver/beets

sqlite3 $DOCKER_CONFIG/organizr/www/users.db "insert into tabs (name,url,defaultz,active,user,guest,icon,iconurl,window) values ('Beets','https://$DOCKER_HOSTNAME/$USER/beets/','false','true','true','false','fa-diamond','images/beets.png','false');"
docker restart $USER-organizr

