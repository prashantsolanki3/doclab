#!/bin/bash

echo "Requires host-names to be set in /etc/h"
helpFunction()
{
   echo ""
   echo "Usage: $0 -d /dev/sdb -v buster -b /data/brick01 -g gv01 -a amd64"
   echo -e "\t-d d e.g. /dev/sdb"
   echo -e "\t-v Debian Version: buster"
   echo -e "\t-b Brick Path: /data/brick01"
   echo -e "\t-g Gluster Volume Name: gv01"
   echo -e "\t-a aitecture: amd64"
   # echo -e "\t-h List of hostnames: pve01|pve02|pve03"
   exit 1 # Exit script after printing help
}

while getopts "d:v:b:g:a:" opt
do
   case "$opt" in
      d ) d="$OPTARG" ;;
      v ) v="$OPTARG" ;;
      b ) b="$OPTARG" ;;
      g ) g="$OPTARG" ;;
      a ) a="$OPTARG" ;;
      ? ) helpFunction ;; # Print helpFunction in case parameter is non-existent
   esac
done

# Print helpFunction in case parameters are empty
if [ -z "$d" ] || [ -z "$v" ] || [ -z "$b" ] || [ -z "$g" ] || [ -z "$a" ]
then
   echo "Some or all of the parameters are empty";
   helpFunction
fi

# Begin script in case all parameters are correct
echo "$d $v $b $g $a"

# d=/dev/sdb
# v=buster

wget -O - https://download.gluster.org/pub/gluster/glusterfs/7/rsa.pub | apt-key add -
echo deb [a=$a] https://download.gluster.org/pub/gluster/glusterfs/7/LATEST/Debian/$v/$a/apt $v main > /etc/apt/sources.list.d/gluster.list 
apt-get update -y
apt full-upgrade -y
apt install -y glusterfs-server
systemctl enable glusterd
systemctl start glusterd

mkfs.xfs -f -i size=512 $d
mkdir -p $b
echo "$d $b xfs defaults 1 2" >> /etc/fstab
mount -a && mount
mkdir -p $b/$g

# # required probing depends on node
# # IN="bla@some.com;john@home.com"
# arrh=(${h//;/ })
# for ((n=0;n<${#arrh[@]};n++))
# do
#     # gluster peer probe ${arrh[n]}
#     echo "${arrh[$n]}:$b/$g"
# done

# gluster volume create $g replica ${#arrh[@]} $replicaString
# gluster volume start $g