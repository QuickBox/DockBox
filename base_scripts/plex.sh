docker run -d \
	--restart always \
	--name=$USER-plex \
	--net=host \
	-e VERSION=latest \
	-e PGID=$(id -g) \
	-e PUID=$(id -u) \
	-e TZ=$(cat /etc/timezone) \
	-v $DOCKER_CONFIG/plex:/config \
	-v $DOCKER_STORAGE:/data/tvshows \
	-v $DOCKER_STORAGE:/data/movies \
	-v $DOCKER_TRANSCODE:/transcode \
linuxserver/plex
