#!/bin/bash
# Licensed under GNU General Public License v3.0 GPL-3 (in short)
#
#   You may copy, distribute and modify the software as long as you track
#   changes/dates in source files. Any modifications to our software
#   including (via compiler) GPL-licensed code must also be made available
#   under the GPL along with build & install instructions.
#
#################################################################################

# NOTE - Base isnt being set. You need to login to the server at http://server:3570/ and set the base in the app

docker run -d -i \
	--restart=always \
	--name $USER-ombi \
	-v $DOCKER_CONFIG/ombi:/config \
	-p 3579:3579 \
	-e EAP=0 \
	-e PUID=$(id -u) \
	-e PGID=$(id -g) \
	-e RUN_OPTS=" -b $USER/ombi" \
	-l "traefik.frontend.rule=PathPrefix: /$USER/ombi" \
rxwatcher/docker-ombi
