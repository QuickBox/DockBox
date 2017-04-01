docker run -d \
    --restart always \
    --name traefik \
    -p 8080:8080 \
    -p 80:80 \
    -p 443:443 \
    -v $HOME/config/traefik/traefik.toml:/etc/traefik/traefik.toml  \
    -v $HOME/config/traefik/acme.json:/etc/traefik/acme.json \
    -v $HOME/config/traefik/htdigest:/etc/traefik/htdigest \
    -v /var/run/docker.sock:/var/run/docker.sock \
    traefik