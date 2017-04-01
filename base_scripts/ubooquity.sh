docker create \
  --name=ubooquity \
  -v <path to data>:/config \
  -v <path to books>:/books \
  -v <path to comics>:/comics \
  -v <path to raw files>:/files \
  -e MAXMEM=<maxmem> \
  -e PGID=<gid> -e PUID=<uid>  \
  -p 2202:2202 \
  linuxserver/ubooquity