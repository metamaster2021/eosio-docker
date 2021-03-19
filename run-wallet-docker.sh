EOSIMG="mgpchain/eosio:v2.0.10"
MGP=/opt/mgp/node_wallet

docker run --name mgp-wallet --network=mgpnetwork --rm -itd -p 5555:8890 \
   -v $MGP:$MGP \
   -v $MGP/data:/root/eosio-wallet \
   -w /root/eosio-wallet \
   $EOSIMG bash -c "$MGP/bin/wallet.sh"