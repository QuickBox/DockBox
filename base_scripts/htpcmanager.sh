docker create --name=$USER-htpcmanager \
	-v DOCKER_CONFIG:/config \
	-e PGID=$(id -g) \
	-e PUID=$(id -u) \
	-e TZ=$(cat /etc/timezone) \
	-l "traefik.frontend.rule=PathPrefixStrip: /$USER/htpcmanager" \
linuxserver/htpcmanager