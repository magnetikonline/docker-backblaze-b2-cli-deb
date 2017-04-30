#!/bin/bash -e

DIRNAME=$(dirname "$0")


containerID=$(docker run --detach magnetikonline/b2cli)
docker cp "$containerID:/root/build/B2_Command_Line_Tool-0.7.2/backblaze-cli_0.7.2-1_amd64.deb" "$DIRNAME"
sleep 1
docker rm $containerID
