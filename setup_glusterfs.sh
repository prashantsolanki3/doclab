#!/bin/bash

echo "Requires host-names to be set in /etc/hosts"
helpFunction()
{
   echo ""
   echo "Usage: $0 -d /dev/sdb -dv buster -br /data/brick01 -gv gv01 -arch "
   echo -e "\t-device Device e.g. /dev/sdb"
   echo -e "\t-debian_version Debian Version: buster"
   echo -e "\t-brick_path Brick Path: /data/brick01"
   echo -e "\t-gluster_volume Gluster Volume Name: gv01"
   echo -e "\t-arch Architecture: amd64"
   echo -e "\t-hosts List of hostnames: pve01|pve02|pve03"
   exit 1 # Exit script after printing help
}

while getopts "device:debian_version:brick_path:gluster_volume:arch:hosts:" opt
do
   case "$opt" in
      device ) device="$OPTARG" ;;
      debian_version ) debian_version="$OPTARG" ;;
      brick_path ) brick_path="$OPTARG" ;;
      gluster_volume ) gluster_volume="$OPTARG" ;;
      arch ) arch="$OPTARG" ;;
      hosts ) hosts="$OPTARG" ;;
      ? ) helpFunction ;; # Print helpFunction in case parameter is non-existent
   esac
done

# Print helpFunction in case parameters are empty
if [ -z "$device" ] || [ -z "$debian_version" ] || [ -z "$brick_path" ] || [ -z "$gluster_volume" ] || [ -z "$arch" ] || [ -z "$hosts" ]
then
   echo "Some or all of the parameters are empty";
   helpFunction
fi

# Begin script in case all parameters are correct
echo "$device $debian_version $brick_path $gluster_volume $arch $hosts"

# device=/dev/sdb
# debian_version=buster

# wget -O - https://download.gluster.org/pub/gluster/glusterfs/7/rsa.pub | apt-key add -
# echo deb [arch=$arch] https://download.gluster.org/pub/gluster/glusterfs/7/LATEST/Debian/$debian_version/$arch/apt $debian_version main > /etc/apt/sources.list.d/gluster.list 
# apt-get update -y
# apt full-upgrade -y
# apt install -y glusterfs-server
# systemctl enable glusterd
# systemctl start glusterd

# mkfs.xfs -i size=512 $device
# mkdir -p $brick_path
# echo "$device $brick_path xfs defaults 1 2" >> /etc/fstab
# mount -a && mount
# mkdir -p $brick_path/$gluster_volume

# # required probing depends on node
# # IN="bla@some.com;john@home.com"
replicaString = ""
arrHosts=(${hosts//|/ })
for ((n=0;n<${#distro[@]};n++))
do
    # gluster peer probe ${arrHosts[n]}
    replicaString = "${arrHosts[n]}:$brick_path/$gluster_volume "
done

echo "$arrHosts $replicaString"

# gluster volume create $gluster_volume replica ${arrHosts[n]} $replicaString
# gluster volume start $gluster_volume