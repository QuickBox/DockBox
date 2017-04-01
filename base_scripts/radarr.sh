docker stop jim-radarr
docker rm jim-radarr
docker run -d \
    --restart always \
	--name=$USER-radarr \
	-v $DOCKER_CONFIG/radarr:/config \
	-v $DOCKER_DOWNLOADS:/downloads \
	-v $DOCKER_STORAGE:/movies \
	-e PGID=$(id -g) \
	-e PUID=$(id -u) \
	-e TZ=$(cat /etc/timezone) \
	-l "traefik.frontend.rule=PathPrefix:/$USER/radarr" \
linuxserver/radarr
sleep 5s
sed -i "s/<UrlBase>.*/<UrlBase>$USER\/radarr<\/UrlBase>/g"  $DOCKER_CONFIG/radarr/config.xml
docker restart $USER-radarr
