docker create \
--name=photoshow \
-v <path to data>:/config \
-v <path to pictures>:/Pictures:ro \
-v <path to store thumbs>:/Thumbs \
-e PGID=<gid> -e PUID=<uid> \
-e TZ=<timezone> \
-p 80:80 \
linuxserver/photoshow