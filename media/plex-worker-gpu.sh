#!/bin/bash

set -o allexport
source ./.env
set +o allexport

# docker service create --replicas 2 \
#   --name plex-worker \
#   --hostname "plex-worker" \
#   --generic-resource "NVIDIA-GPU=0" \
#   -e PUID=$PUID \
#   -e PGID=$PGID \
#   -e VERSION=$PLEX_VERSION \
#   -e TZ=$TZ \
#   -e DOCKER_MODS=ghcr.io/pabloromeo/clusterplex_worker_dockermod:latest \
#   -e ORCHESTRATOR_URL=http://plex-orchestrator:3500 \
#   -e EAE_SUPPORT=1 \
#   --mount type=bind,src=$VOL_CONFIG/plex/codecs,dst=/codecs \
#   --mount type=bind,src=$VOL_TRANSCODE,dst=/transcode \
#   --network intranet \
#   --constraint node.hostname==docker-manager-1 \
#     ghcr.io/linuxserver/plex:latest


docker service create --replicas 2 \
  --name plex \
  --hostname "plex" \
  --generic-resource "NVIDIA-GPU=0" \
  -e PUID=$PUID \
  -e PGID=$PGID \
  -e VERSION=$PLEX_VERSION \
  -e TZ=$TZ \
  -e EAE_SUPPORT=1 \
  --mount type=bind,src=$VOL_CONFIG/plex,dst=/config \
  --mount type=bind,src=$VOL_CONFIG/plex/codecs,dst=/codecs \
  --mount type=bind,src=$VOL_TRANSCODE,dst=/transcode \
  --mount type=bind,src=$VOL_MEDIA,dst=/media \
  -p 32499:32499 \
  -p 32469:32469 \
  -p 32400:32400 \
  -p 32401:32401 \
  -p 3005:3005 \
  -p 8324:8324 \
  -p 1900:1900/udp \
  -p 32410:32410/udp \
  -p 32412:32412/udp \
  -p 32413:32413/udp \
  -p 32414:32414/udp \
  --network intranet \
  --constraint node.hostname==docker-manager-1 \
  --label swag=enable \
  --label swag_port=32400 \
    ghcr.io/linuxserver/plex:latest
    
# 
# docker service create --replicas 2 \
#   --name plex-worker \
#   --hostname plex-worker \
#   --generic-resource NVIDIA-GPU=0 \
#   -e PUID=1000 \
#   -e PGID=1000 \
#   -e VERSION=docker \
#   -e TZ=Melbourne/Australia \
#   -e DOCKER_MODS=ghcr.io/pabloromeo/clusterplex_worker_dockermod:latest \
#   -e ORCHESTRATOR_URL=http://plex-orchestrator:3500 \
#   -e EAE_SUPPORT=1 \
#   --network intranet \
#   --constraint node.hostname==docker-manager-1 \
#     ghcr.io/linuxserver/plex:latest



#   -e LISTENING_PORT=3501 \
#   -e STAT_CPU_INTERVAL=2000 \