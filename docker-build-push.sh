#!/bin/sh

tag=`date +'%d%m%Y%H%M%S'`
push=0
imageName=image_name
dockerFile=Dockerfile
context=.

# Add Comments

while getopts i:f:p:c: flag
do
    case "${flag}" in
        i) imageName=${OPTARG};;
        f) dockerFile=${OPTARG};;
        p) push=${OPTARG};;
        c) context=${OPTARG};;
    esac
done

docker build -t $imageName:$tag -f $dockerFile $context

docker tag $imageName:$tag $imageName:latest

if [ "$push" -eq 1 ]
then
docker image push -a $imageName
fi

echo "Done"