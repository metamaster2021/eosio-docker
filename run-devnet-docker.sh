#!/bin/bash
param=$1

#update release_verion as necessary
EOSIMG="mgpchain/eosio:v2.0.10"
#modify this to meet your needs
node=mgp-devnet 
curDir=$(cd $(dirname $0); pwd)
srcDir="$curDir/node_devnet"
MGP=/opt/mgp/node_devnet

(docker network ls | grep -q mgpnetwork) || docker network create mgpnetwork

docker run --name $node --network=mgpnetwork -itd -p 19806:9806 -p 18888:8888 \
  -v $srcDir/bin:$MGP/bin \
  -v $srcDir/conf:$MGP/conf \
  -v $srcDir/data:$MGP/data \
  -v $srcDir/logs:$MGP/logs \
  -w $MGP \
  $EOSIMG $MGP/bin/start.sh $param