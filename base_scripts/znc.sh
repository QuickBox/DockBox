docker create \
  --name=znc \
  -v <path to data>:/config \
  -e PGID=<gid> -e PUID=<uid>  \
  -e TZ=<timezone> \
  -p 6501:6501 \
  linuxserver/znc