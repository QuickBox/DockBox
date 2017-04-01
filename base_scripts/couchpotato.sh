docker stop jim-couchpotato
docker rm jim-couchpotato
docker run -d \
    --restart always \
    --name=$USER-couchpotato\
    -v $DOCKER_CONFIG/couchpotato:/config \
    -v $DOCKER_DOWNLOADS:/downloads \
    -v $DOCKER_STORAGE:/movies \
    -e PGID=$(id -g) \
    -e PUID=$(id -u) \
    -e TZ=$(cat /etc/timezone) \
    -l traefik.frontend.rule="PathPrefix: /$USER/couchpotato" \
linuxserver/couchpotato
sleep 5s
sed -i "s/url_base.*/url_base = $USER\/couchpotato/g" $DOCKER_CONFIG/couchpotato/config.ini
docker restart $USER-couchpotato
