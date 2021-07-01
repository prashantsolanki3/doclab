if [ ! -f .env ]
then
  export $(cat .env | xargs)
fi

docker plugin install --alias $DOCKER_VOLUME_PLUGIN_ALIAS \
  trajano/glusterfs-volume-plugin \
  --grant-all-permissions --disable
docker plugin set $DOCKER_VOLUME_PLUGIN_ALIAS SERVERS=$GLUSTERFS_STORE_1_HOSTNAME,$GLUSTERFS_STORE_2_HOSTNAME
docker plugin enable $DOCKER_VOLUME_PLUGIN_ALIAS