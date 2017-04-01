docker create \
    --name=mylar \
    -v <path to data>:/config \
    -v <downloads-folder>:/downloads \
    -v <comics-folder>:/comics \
    -e PGID=<gid> -e PUID=<uid> \
    -e TZ=<timezone> \
    -p 8090:8090 \
    linuxserver/mylar