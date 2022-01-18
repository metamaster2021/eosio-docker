#!/bin/bash
EOSIMG="mgpchain/eosio:v2.0.10"

curDir=$(cd $(dirname $0); pwd)
srcDir="$curDir/node_wallet"
MGP=/opt/mgp/node_wallet

## try to create network
(docker network ls | grep -q mgpnetwork) || docker network create mgpnetwork

docker run --name mgp-wallet --network=mgpnetwork -itd -p 8890:8890 \
   -v $srcDir/bin:$MGP/bin \
   -v $srcDir/conf:$MGP/conf \
   -v $srcDir/logs:$MGP/logs \
   -v $srcDir/data:/root/eosio-wallet \
   -w /root/eosio-wallet \
   $EOSIMG $MGP/bin/wallet.sh