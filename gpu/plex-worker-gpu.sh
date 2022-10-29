#!/bin/bash

set -o allexport
source ./.env
set +o allexport

docker service create --replicas 2 \
  --name plex-worker \
  --hostname "plex-worker" \
  --generic-resource "NVIDIA-GPU=0" \
  -e PUID=$PUID \
  -e PGID=$PGID \
  -e VERSION=$PLEX_VERSION \
  -e TZ=$TZ \
  -e DOCKER_MODS=ghcr.io/pabloromeo/clusterplex_worker_dockermod:latest \
  -e ORCHESTRATOR_URL=http://plex-orchestrator:3500 \
  -e EAE_SUPPORT=1 \
  --mount type=bind,src=$VOL_CONFIG/plex/codecs,dst=/codecs \
  --mount type=bind,src=$VOL_MEDIA,dst=/media \
  --network intranet \
  --constraint node.hostname==docker-manager-1 \
    ghcr.io/linuxserver/plex:latest

#   -e LISTENING_PORT=3501 \
#   -e STAT_CPU_INTERVAL=2000 \