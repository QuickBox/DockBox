docker create \
--name=mariadb \
-p 3306:3306 \
-e PUID=<UID> \
-e PGID=<GID> \
-e MYSQL_ROOT_PASSWORD=<DATABASE PASSWORD> \
-e TZ=<timezone> \
-v </path/to/appdata>:/config \
linuxserver/mariadb