docker stop jim-sickrage
docker rm jim-sickrage
docker run -d \
        --restart always \
	--name=$USER-sickrage \
	-v $DOCKER_CONFIG/sickrage:/config \
	-v $DOCKER_DOWNLOADS:/downloads \
	-v $DOCKER_STORAGE:/tv \
	-e PGID=$(id -g) \
	-e PUID=$(id -u) \
	-e TZ=$(cat /etc/timezone) \
	-l "traefik.frontend.rule=PathPrefix: /$USER/sickrage" \
linuxserver/sickrage
sleep 5s
sed -i "s/web_root.*/web_root = \"$USER\/sickrage\"/g" $DOCKER_CONFIG/sickrage/config.ini
docker restart $USER-sickrage
