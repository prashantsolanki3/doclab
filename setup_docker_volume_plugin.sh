read_var() {
    VAR=$(grep $1 $2 | xargs)
    IFS="=" read -ra VAR <<< "$VAR"
    echo ${VAR[1]}
}

DOCKER_VOLUME_PLUGIN_ALIAS=$(read_var DOCKER_VOLUME_PLUGIN_ALIAS .env)
GLUSTERFS_STORE_1_HOSTNAME=$(read_var GLUSTERFS_STORE_1_HOSTNAME .env)
GLUSTERFS_STORE_2_HOSTNAME=$(read_var GLUSTERFS_STORE_2_HOSTNAME .env)


docker plugin install --alias $DOCKER_VOLUME_PLUGIN_ALIAS \
  trajano/glusterfs-volume-plugin \
  --grant-all-permissions --disable
docker plugin set $DOCKER_VOLUME_PLUGIN_ALIAS SERVERS=$GLUSTERFS_STORE_1_HOSTNAME,$GLUSTERFS_STORE_2_HOSTNAME
docker plugin enable $DOCKER_VOLUME_PLUGIN_ALIAS