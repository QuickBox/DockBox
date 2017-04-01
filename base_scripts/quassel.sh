docker create \
    --name=quassel-core \
    -v /etc/localtime:/etc/localtime:ro \
    -v <path to data>:/config \
    -e PGID=<gid> -e PUID=<uid> \
    -p 4242:4242 \
    linuxserver/quassel-core