docker create --name=sickbeard \
	-v $DOCKER_CONFIG/sickbeard:/config \
	-v $DOCKER_DOWNLOADS:/downloads \
	-v $DOCKER_STORAGE:/tv \
	-e PGID=$(id -g) \
	-e PUID=$(id -u) \
	-e TZ=$(cat /etc/timezone) \
	-l "traefik.frontend.rule=PathPrefixStrip: /$USER/sickbeard" \
linuxserver/sickbeard