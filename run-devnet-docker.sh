param=$1
node=mgp-devnet #modify this to meet your needs

EOSIMG="mgpchain/eosio:v2.0.10" #update release_verion as necessary
MGP=/opt/mgp/node_devnet

HOME=$MGP
BIN_D=$MGP/bin
CONF_D=$HOME/conf
DATA_D=$HOME/data
LOGS_D=$HOME/logs

mkdir -p $LOGS_D $DATA_D $CONF_D $BIN_D

docker run --name $node --network=mgpnetwork -itd --rm -p 9877:9877 -p 8890:8890 \
  -v $HOME:$HOME -w $HOME \
  -v $BIN_D:$BIN_D \
  -v $DATA_D:$DATA_D \
  -v $CONF_D:$CONF_D \
  -v $LOGS_D:$LOGS_D \
  $EOSIMG $BIN_D/start.sh $param