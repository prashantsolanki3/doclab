#!/bin/bash
# Usage 
# Make executable
# chmod +x ./cloudflare_tunnel.sh
# Execute
# ./cloudflare_tunnel.sh <DOCKER_NETWORK_NAME> <TOKEN>
docker run -d --network $1 coudflare/cloudflared:latest tunnel --no-autoupdate run --token $2