docker create \
    --name nzbget \
    -p 6789:6789 \
    -e PUID=<UID> -e PGID=<GID> \
    -e TZ=<timezone> \
    -v </path/to/appdata>:/config \
    -v <path/to/downloads>:/downloads \
    linuxserver/nzbget