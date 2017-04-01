docker create \
    --name nextcloud \
    -p 443:443 \
    -e PUID=<UID> -e PGID=<GID> \
    -v </path/to/appdata>:/config \
    -v <path/to/data>:/data \
    linuxserver/nextcloud