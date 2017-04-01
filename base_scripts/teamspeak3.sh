docker create --name=gsm-ts3 \
--net=host \
-v /etc/localtime:/etc/localtime:ro \
-v <path to data>:/config \
-e PGID=<gid> -e PUID=<uid> \
linuxserver/gsm-ts3