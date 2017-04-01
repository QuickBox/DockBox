docker create \
--name=maraschino \
-v <path to data>:/config \
-e PGID=<gid> -e PUID=<uid> \
-e TZ=<timezone> \
-p 7000:7000 \
linuxserver/maraschino