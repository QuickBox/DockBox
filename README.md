# DockBox
Docker Based Quickbox

It's basically:
1) [Install docker](https://store.docker.com/editions/community/docker-ce-server-ubuntu?tab=description) 
2) Add your non-root user to the docker group:
   

       sudo groupadd docker
       sudo gpasswd -a my_user docker
       sudo service docker restart

3) setup env variables
  Add to .profile 
>     #docker stuff
>     export DOCKER_CONFIG=$HOME/config
>     export DOCKER_STORAGE=$HOME/cloud/common
>     export DOCKER_DOWNLOADS=$HOME/downloads
>     export DOCKER_HOSTNAME=FQDN_here
>     export DOCKER_TRANSCODE=/tmp

4) Copy Taefik and Traefik to ~/config/traefik
5) chmod +x traefik
6) execute Traefik as root: sudo ./traefik

now install Organizr per the scripts (needs to be installed first)
Install other apps per the scripts

go to https://host/user/  and this will be the main panel for the user
other apps are called from organizr or https://server/user/app/ (needs last slash)
