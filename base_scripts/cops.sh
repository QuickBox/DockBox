docker create \
	--name=$USER-cops \
	$HOME/config/:/config \
	-v $HOME/cloud/common:/books \
	-e PGID=$(id -g) \
	-e PUID=$(id -u) \
	-e TZ=$(cat /etc/timezone) \
	-l "traefik.frontend.rule=PathPrefixStrip: /$USER/cops" \
linuxserver/cops