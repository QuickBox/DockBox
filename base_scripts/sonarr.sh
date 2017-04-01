docker run -d \
    --restart always \
    --name=$USER-sonarr \
    -e PGID=$(id -g) \
    -e PUID=$(id -u) \
    -e TZ=$(cat /etc/timezone) \
    -v /dev/rtc:/dev/rtc:ro \
    -v $HOME/config/sonarr:/config \
    -v $HOME/cloud/common/:/tv \
    -v $HOME/downloads:/downloads \
    -l "traefik.frontend.rule=PathPrefix:/$USER/sonarr" \
linuxserver/sonarr
sleep 5s
sed -i "s/<UrlBase>.*/<UrlBase>$USER\/sonarr<\/UrlBase>/g"  $DOCKER_CONFIG/sonarr/config.xml
docker restart $USER-sonarr
