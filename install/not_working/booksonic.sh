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
   --name=$USER-booksonic \
	-v $DOCKER_CONFIG/booksonic:/config \
	-v $DOCKER_STORAGE:/books \
	-v $DOCKER_STORAGE:/podcasts \
	-v $DOCKER_STORAGE:/media \
	-e PGID=$(id -g) \
	-e PUID=$(id -u) \
	-e TZ=$(cat /etc/timezone) \
	-e CONTEXT_PATH=/$USER/booksonic \
	-l "traefik.frontend.rule=PathPrefix: /$USER/booksonic" \
linuxserver/booksonic

sqlite3 $DOCKER_CONFIG/organizr/www/users.db "insert into tabs (name,url,defaultz,active,user,guest,icon,iconurl,window) values ('Booksonic','https://$DOCKER_HOSTNAME/$USER/booksonic/','false','true','true','false','fa-diamond','','false');"
docker restart $USER-organizr
