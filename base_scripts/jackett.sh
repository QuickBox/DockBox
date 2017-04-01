docker create --name=$USER-jackett \
	-v $DOCKER_CONFIG:/config \
	-v $DOCKER_DOWNLOADS:/downloads \
	-e PGID=$(id -g) \
	-e PUID=$(id -u) \
	-e TZ=$(cat /etc/timezone) \
	-l "traefik.frontend.rule=PathPrefixStrip: /$USER/jackett \
linuxserver/jackett
