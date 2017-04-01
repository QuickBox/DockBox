docker create \
	--name=$USER-freshrss \
	-v $$DOCKER_CONFIG/freshrss:/config \
	-e PGID=$(id -g) \
	-e PUID=$(id -u) \
	-e TZ=$(cat /etc/timezone) \
	-l "traefik.frontend.rule=PathPrefixStrip: /$USER/freshrss" \
linuxserver/freshrss