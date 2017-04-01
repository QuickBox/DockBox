docker create \
  --name=lychee \
  -v <path to data>:/config \
  -v <path to data>:/pictures \
  -e PGID=<gid> -e PUID=<uid>  \
  -p 80:80 \
  linuxserver/lychee