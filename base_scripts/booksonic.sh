docker create \
  	--name=$USER-booksonic \
	-v $DOCKER_CONFIG/booksonic:/config \
	-v $DOCKER_STORAGE:/books \
	-v $DOCKER_STORAGE:/podcasts \
	-v $DOCKER_STORAGE:/media \
	-e PGID=$(id -g) \
	-e PUID=$(id -u) \
	-e TZ=$(cat /etc/timezone) \
	-e CONTEXT_PATH=booksonic \
	-l "traefik.frontend.rule=PathPrefixStrip: /$USER/booksonic" \
linuxserver/booksonic