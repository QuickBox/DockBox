docker run -d \
--restart always \
--name portainer \
-v $DOCKER_CONFIG/portainer:/data \
-v /var/run/docker.sock:/var/run/docker.sock \
-l "traefik.frontend.rule=PathPrefixStrip: /portainer" \
portainer/portainer
