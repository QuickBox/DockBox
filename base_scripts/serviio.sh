docker create --name=serviio \
-v /etc/localtime:/etc/localtime:ro \
-v <path to data>:/config \
-v <path to media>:/media \
-v <path for transcoding>:/transcode \
-e PGID=<gid> -e PUID=<uid> \
--net=host lsiocommunity/serviio