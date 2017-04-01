
docker run -d \
        --restart always \
	--name=$USER-plexpy \
	-v $DOCKER_CONFIG/plexpy:/config \
	-v $DOCKER_CONFIG"/plex/Library/Application Support/Plex Media Server/Logs":/logs:ro \
	-e PGID=$(id -g) \
	-e PUID=$(id -u) \
	-e TZ=$(cat /etc/timezone) \
  	-l "traefik.frontend.rule=PathPrefix: /$USER/plexpy" \
linuxserver/plexpy
sleep 5s
sed -i "s/http_root.*/http_root = \"$USER\/plexpy\"/g" $DOCKER_CONFIG/plexpy/config.ini
docker restart $USER-plexpy
