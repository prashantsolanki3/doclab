#!/bin/bash
services=("plex" "qbittorrent" "radarr" "sonarr" "bazarr" "lidarr" "jackett" "overseerr" "authelia")

for s in ${services[@]}; do
  mkdir -p /config/$s
done