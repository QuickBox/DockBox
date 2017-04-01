docker run -d \
  --name=resilio-sync \
  -v <path to config>:/config \
  -v <path to data>:/sync \
  -e PGID=<gid> -e PUID=<uid>  \
  -p 8888:8888 \
  -p 55555:55555 \
  linuxserver/resilio-sync