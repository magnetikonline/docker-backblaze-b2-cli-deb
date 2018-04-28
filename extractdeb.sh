#!/bin/bash -e

DIRNAME=$(dirname "$0")


containerID=$(docker run --detach magnetikonline/b2cli)
docker cp "$containerID:/root/build/B2_Command_Line_Tool-1.1.0/backblaze-cli_1.1.0-1_amd64.deb" "$DIRNAME"
sleep 1
docker rm "$containerID"
