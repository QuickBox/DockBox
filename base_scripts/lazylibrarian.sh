docker create \
	--name=$USER-lazylibrarian \
	-v $DOCKER_CONFIG/lazylibrarian:/config \
	-v $DOCKER_DOWNLOADS:/downloads \
	-v $DOCKER_STORAGE:/books \
	-e PGID=$(id -g) \
	-e PUID=$(id -u) \
	-e TZ=$(cat /etc/timezone) \
	-l "traefik.frontend.rule=PathPrefixStrip: /$USER/lazylibrarian" \
linuxserver/lazylibrarian