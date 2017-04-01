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
	-p 8081:8081 \
docker pull thraxis/docker-medusa
sleep 10s
sed -i "s/web_root.*/web_root = \"$USER\/medusa\"/g" $DOCKER_CONFIG/medusa/config.ini
docker restart $USER-medusa
