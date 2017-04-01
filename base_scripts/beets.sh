docker create \
	--name=$USER-beets \
	-v $DOCKER_CONFIG/beets:/config \
	-e PGID=$(id -g) \
	-e PUID=$(id -u) \
	-e TZ=$(cat /etc/timezone) \
	-l "traefik.frontend.rule=PathPrefixStrip: /$USER/beets" \
linuxserver/beets