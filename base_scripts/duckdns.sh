docker create \
  --name=duckdns \
  -e PGID=<gid> -e PUID=<uid>  \
  -e SUBDOMAINS=<subdomains> \
  -e TOKEN=<token> \
  -e TZ=<timezone> \
  linuxserver/duckdns