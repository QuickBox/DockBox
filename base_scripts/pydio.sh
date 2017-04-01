docker create \
--name=pydio \
-v /etc/localtime:/etc/localtime:ro \
-v <path to data>:/config \
-v <path to data>:/data \
-e PGID=<gid> -e PUID=<uid>  \
-e TZ=<timezone> \
-p 443:443 \
linuxserver/pydio