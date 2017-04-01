docker create \
	--name=$USER-libresonic \
	-v $DOCKER_CONFIG/libresonic:/config \
	-v $DOCKER_STORAGE:/music \
	-v $DOCKER_STORAGE:/playlists \
	-v $DOCKER_STORAGE:/podcasts \
	-v $DOCKER_STORAGE:/media \
	-e CONTEXT_PATH=libresonic \
	-e PGID=$(id -g) \
	-e PUID=$(id -u) \
	-e TZ=$(cat /etc/timezone) \
	-l "traefik.frontend.rule=PathPrefixStrip: /$USER/libresonic" \
linuxserver/libresonic