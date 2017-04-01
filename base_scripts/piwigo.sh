docker create \
--name=piwigo \
-v /etc/localtime:/etc/localtime:ro \
-v <path to data>:/config \
-e PGID=<gid> -e PUID=<uid>  \
-e TZ=<timezone> 
-p 80:80 \
linuxserver/piwigo