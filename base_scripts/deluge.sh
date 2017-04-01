docker create \
	--name $USER-deluge \
	--net=host \
	-v $HOME/config/deluge:/config \
	-e PGID=$(id -g) \
	-e PUID=$(id -u) \
	-e TZ=$(cat /etc/timezone) \
	-v $DOCKER_DOWNLOADS:/downloads \

linuxserver/deluge