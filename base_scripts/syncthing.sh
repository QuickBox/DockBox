docker create \
  --name=syncthing \
  -v *host path to config*:/config \
  -v *host path to data*:/mnt/any/dir/you/want \
  -e PGID=<gid> -e PUID=<uid>  \
  -p 8384:8384 -p 22000:22000 -p 21027:21027/udp \
  linuxserver/syncthing