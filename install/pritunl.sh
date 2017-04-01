#!/bin/bash
# Licensed under GNU General Public License v3.0 GPL-3 (in short)
#
#   You may copy, distribute and modify the software as long as you track
#   changes/dates in source files. Any modifications to our software
#   including (via compiler) GPL-licensed code must also be made available
#   under the GPL along with build & install instructions.
#
#################################################################################

docker run \
    --name=pritunl \
    --detach \
    --privileged \
    --restart=always \
    -p 1194:1194/udp \
    -p 1194:1194/tcp \
    -p 9700:443/tcp \
    -e PRITUNL_UPDATE="true" \
    -v $DOCKER_CONFIG/pritunl/mongodb:/var/lib/mongodb \
    -v $DOCKER_CONFIG/pritunl/pritunl:/var/lib/pritunl \
    -v $DOCKER_CONFIG/pritunl/config:/etc/pritunl \
rxwatcher/docker-pritunl

#sqlite3 $DOCKER_CONFIG/organizr/www/users.db "insert into tabs (name,url,defaultz,active,user,guest,icon,iconurl,window) values ('Pritunl','https://$DOCKER_HOSTNAME/pritunl/','false','true','true','false','fa-diamond','','false');"
#docker restart $USER-organizr
