docker create --name=hydra \
	-v $DOCKER_CONFIG/hydra:/config \
	-v $DOCKER_DOWNLOADS:/downloads \
	-e PGID=$(id -g) \
	-e PUID=$(id -u) \
	-e TZ=$(cat /etc/timezone) \
	-l "traefik.frontend.rule=PathPrefixStrip: /$USER/hydra" \
linuxserver/hydra