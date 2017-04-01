docker create \
	--name=$USER-headphones \
	-v $DOCKER_CONFIG/headphones:/config \
	-v $DOCKER_DOWNLOADS:/downloads \
	-v $DOCKER_STORAGE:/music \
	-e PGID=$(id -g) \
	-e PUID=$(id -u) \
	-e TZ=$(cat /etc/timezone) \
	-l "traefik.frontend.rule=PathPrefixStrip: /$USER/headphones" \
linuxserver/headphones