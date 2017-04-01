docker create \
--name=openvpn-as \
-v <path to data>:/config \
-e PGID=<gid> -e PUID=<uid> \
-e TZ=<timezone> \
-e INTERFACE=<interface> \
--net=host --privileged \
linuxserver/openvpn-as