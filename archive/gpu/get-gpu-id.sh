# Must run on the node with GPU access
echo "GPU_ID=$(nvidia-smi -a | grep UUID | awk '{print substr($4,0,12)}')" >> .env