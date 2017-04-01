docker run -d \
	--restart always \
	--name=$USER-rutorrent \
	-v $DOCKER_CONFIG/rutorrent:/config \
	-v $DOCKER_DOWNLOADS:/downloads \
	-e PGID=$(id -g) \
	-e PUID=$(id -u) \
	-e TZ=$(cat /etc/timezone) \
	-p 45566-45576:45566-45576 \
	-p 51500:51500 \
	-l traefik.frontend.rule="PathPrefixStrip: /$USER/rutorrent" \
	-l traefik.port=443 \
	-l traefik.protocol=https \
xeroxmalf/rutorrent-autodl-irssi
