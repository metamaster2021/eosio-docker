#!/bin/bash
node=$1
[[ -z "$node" ]] && node="mgp-testnet"

docker exec $node  pkill --signal SIGINT nodeos
docker stop $node