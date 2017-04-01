docker stop jim-medusa
docker rm jim-medusa
docker run -d \
        --restart always \
	--name=$USER-medusa \
	-v $DOCKER_CONFIG/medusa:/config \
	-v $DOCKER_DOWNLOADS:/downloads \
	-v $DOCKER_STORAGE:/tv \
	-e PGID=$(id -g) \
	-e PUID=$(id -u) \
	-e TZ=$(cat /etc/timezone) \
	-l traefik.frontend.rule="PathPrefix: /$USER/medusa" \
        -p 8081:8081 \
linuxserver/medusa
sleep 30s
sed -i "s/web_root.*/web_root = \"$USER\/medusa\"/g" $DOCKER_CONFIG/medusa/config.ini
sleep 10s
docker restart $USER-medusa

