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
  --name=$USER-organizr \
  -v $DOCKER_CONFIG/organizr:/config \
  -e PGID=$(id -g) \
  -e PUID=$(id -u) \
  -e TZ=$(cat /etc/timezone) \
 -l traefik.port=80 \
 -l traefik.protocol=http \
 -l traefik.frontend.rule="PathPrefixStrip: /$USER" \
lsiocommunity/organizr

# copy db
sleep 5s
cp users.db $DOCKER_CONFIG/organizr/www/users.db
docker restart $USER-organizr
