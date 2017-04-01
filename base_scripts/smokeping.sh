# docker stop smokeping
# docker rm smokeping
docker run -d \
    	--restart always \
	--name smokeping \
	-e PGID=$(id -g) \
	-e PUID=$(id -u) \
	-e TZ=$(cat /etc/timezone) \
	-v $DOCKER_CONFIG/smokeping/data:/data \
    	-v $DOCKER_CONFIG/smokeping/config:/config \
    	-l "traefik.frontend.rule=PathPrefix: /smokeping/" \
linuxserver/smokeping
