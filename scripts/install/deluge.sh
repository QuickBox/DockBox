
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

docker run -d \
  --restart always \
	--name $USER-deluge \
	--net=host \
	-v $HOME/config/deluge:/config \
	-e PGID=$(id -g) \
	-e PUID=$(id -u) \
	-e TZ=$(cat /etc/timezone) \
	-v $DOCKER_DOWNLOADS:/downloads \
	-l traefik.frontend.rule="PathPrefixStrip: /$USER/deluge" \
	-l traefik.port=8112 \
	-l traefik.protocol=http \
linuxserver/deluge


#sed -i "s/<UrlBase>.*/<UrlBase>$USER\/sonarr<\/UrlBase>/g"  $DOCKER_CONFIG/sonarr/config.xml

docker stop $USER-organizr
sqlite3 $DOCKER_CONFIG/organizr/www/users.db "insert into tabs (name,url,defaultz,active,user,guest,icon,iconurl,window) values ('Deluge','https://$DOCKER_HOSTNAME/$USER/deluge/','false','true','true','false','fa-diamond','images/deluge.png','false');"
docker start $USER-organizr
