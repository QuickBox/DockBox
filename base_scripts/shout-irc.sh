docker create \
  --name=shout \
  -v <path to data>:/config \
  -e PGID=<gid> -e PUID=<uid>  \
  -e TZ=<timezone> \
  -p 9000:9000 \
  lsiocommunity/shout-irc