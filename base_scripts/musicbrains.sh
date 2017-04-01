docker create --name=$USER-musicbrainz \
	-v $DOCKER_CONFIG/musicbrainz:/config \
-	v $DOCKER_STORAGE:/data \
	-e BRAINZCODE=<code from musicbrainz> \
	-e PGID=$(id -g) \
	-e PUID=$(id -u) \
	-e TZ=$(cat /etc/timezone) \
	-l "traefik.frontend.rule=PathPrefixStrip: /$USER/musicbrainz" \
linuxserver/musicbrainz