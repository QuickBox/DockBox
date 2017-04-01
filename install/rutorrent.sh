#!/bin/bash
#
# Licensed under GNU General Public License v3.0 GPL-3 (in short)
#
#   You may copy, distribute and modify the software as long as you track
#   changes/dates in source files. Any modifications to our software
#   including (via compiler) GPL-licensed code must also be made available
#   under the GPL along with build & install instructions.
#
#################################################################################

# Get port info
IRSSI_PORT=$((RANDOM%64025+1024))
PORT=$(shuf -i 2000-61000 -n 1)
WEBPORT=$(shuf -i 8115-8145 -n 1)
PORTEND=$(($PORT + 10))
while [[ "$(netstat -ln | grep ':'"$PORT"'' | grep -c 'LISTEN')" -eq "1" ]]; do PORT="$(shuf -i 2000-61000 -n 1)"; done
RPORT=$(shuf -i 2000-61000 -n 1)
while [[ "$(netstat -ln | grep ':'"$RPORT"'' | grep -c 'LISTEN')" -eq "1" ]]; do RPORT="$(shuf -i 2000-61000 -n 1)"; done
ip=$(ip route get 8.8.8.8 | awk 'NR==1 {print $NF}')
echo $PORT-$PORTEND
echo "rport "$RPORT
docker run -d \
	--restart always \
	--name=$USER-rutorrent \
	-v $DOCKER_CONFIG/rutorrent:/config \
	-v $DOCKER_DOWNLOADS:/downloads \
	-e PGID=$(id -g) \
	-e PUID=$(id -u) \
	-e TZ=$(cat /etc/timezone) \
	-p $PORT-$PORTEND:45566-45576 \
	-p $RPORT:51500 \
	-l traefik.frontend.rule="PathPrefixStrip: /$USER/rutorrent" \
	-l traefik.port=443 \
	-l traefik.protocol=https \
xeroxmalf/rutorrent-autodl-irssi

sqlite3 $DOCKER_CONFIG/organizr/www/users.db "insert into tabs (name,url,defaultz,active,user,guest,icon,iconurl,window) values ('Rutorrent','https://$DOCKER_HOSTNAME/$USER/rutorrent/','false','true','true','false','fa-diamond','images/rutorrent.png','false');"
docker restart $USER-organizr

sleep 30s
echo "You may now try to reach the server"

