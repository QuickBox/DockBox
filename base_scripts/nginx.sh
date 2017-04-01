docker create \
--name=nginx \
-v <path to data>:/config \
-e PGID=<gid> -e PUID=<uid>  \
-p 80:80 -p 443:443 \
-e TZ=<timezone> \
linuxserver/nginx