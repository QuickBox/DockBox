docker stop jim-ombi
docker rm jim-ombi
docker run -d -i \
	--restart=always \
	--name $USER-ombi \
	-v $DOCKER_CONFIG/ombi:/config \
	-e EAP=1 \
	-e PUID=$(id -u) \
	-e PGID=$(id -g) \
	-e RUN_OPTS="--base $USER/ombi" \
	-l "traefik.frontend.rule=PathPrefix: /$USER/ombi" \
rxwatcher/docker-ombi
