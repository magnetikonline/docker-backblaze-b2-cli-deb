#!/bin/bash -e

containerID=$(docker run --detach magnetikonline/b2cli)
docker cp $containerID:/root/build/Backblaze-B2_Command_Line_Tool/backblaze_0.1-1_amd64.deb .
sleep 1
docker rm $containerID
