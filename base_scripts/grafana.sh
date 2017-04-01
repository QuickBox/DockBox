docker stop jim-grafana
docker rm jim-grafana
docker run -d \
	--restart always \
        --name=$USER-grafana \
    	-v $DOCKER_CONFIG/grafana:/var/lib/grafana \
    	-e "GF_SECURITY_ADMIN_PASSWORD=Laura123!" \
	-l "traefik.frontend.rule=PathStrip: /$USER/grafana" \
grafana/grafana
