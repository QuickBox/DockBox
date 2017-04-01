docker create \
  --name=davos \
  -v <path to data>:/config \
  -v <path to downloads folder>:/download
  -e PGID=<gid> -e PUID=<uid>  \
  -p 8080:8080 \
  linuxserver/davos