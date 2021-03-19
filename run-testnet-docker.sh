param=$1
node=mgp-testnet #modify this to meet your needs

EOSIMG="mgpchain/eosio:v2.0.10"
MGP=/opt/mgp/node_testnet
BIN_D=$MGP/bin
HOME_D=$MGP
CONF_D=$HOME_D/conf
DATA_D=$HOME_D/data
LOGS_D=$HOME_D/logs
mkdir -p $LOGS_D $DATA_D $CONF_D $BIN_D

docker run --name $node --network=mgpnetwork -itd --rm -p 9806:9806 -p 8888:8888 \
  -v $HOME_D:/opt/mgp -w /opt/mgp \
  -v $BIN_D:/opt/mgp/bin \
  -v $DATA_D:/opt/mgp/data \
  -v $CONF_D:/opt/mgp/conf \
  -v $LOGS_D:/opt/mgp/logs \
  $EOSIMG /opt/mgp/bin/start.sh $node $param
