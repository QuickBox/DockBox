docker create \
	--name=$USER-cardigann \
	-v $DOCKER_CONFIG/cardigann:/config \
	-e PGID=$(id -g) \
	-e PUID=$(id -u) \
	-e TZ=$(cat /etc/timezone) \
	-l "traefik.frontend.rule=PathPrefixStrip: /$USER/cardigann" \
linuxserver/cardigann