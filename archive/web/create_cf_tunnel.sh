#!/bin/bash
# TODO: Create docker service
# Usage 
# Make executable
# chmod +x ./cloudflare_tunnel.sh
# Execute
# ./create_cf_tunner.sh <DOCKER_NETWORK_NAME> <TOKEN>
docker run -d --network $1 coudflare/cloudflared:latest tunnel --no-autoupdate run --token $2