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
        --name=plex \
        --net=host \
        -e VERSION=latest \
        -e PGID=$(id -g) \
        -e PUID=$(id -u) \
        -e TZ=$(cat /etc/timezone) \
        -v $DOCKER_CONFIG/plex:/config \
        -v $DOCKER_STORAGE:/data/tvshows \
        -v $DOCKER_STORAGE:/data/movies \
        -v $DOCKER_TRANSCODE:/transcode \
        -l traefik.host="plex.wildhair.nl" \
        -l traefik.port=443 \
        -l traefik.protocol=https \
  	-p 32469:32469 \
  	-p 32469:32469/udp \
  	-p 5353:5353/udp \
  	-p 1900:1900/udp \
linuxserver/plex
