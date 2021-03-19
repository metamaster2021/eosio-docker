EOSIMG="mgpchain/eosio:v2.0.10"
MGP=/opt/mgp

docker run --name mgp-wallet --network=mgpnetwork --rm -itd -p 5555:8888 \
   -v $MGP/bin:/opt/mgp/bin \
   -v $MGP/wallet:/root/eosio-wallet \
   -w /root/eosio-wallet \
   $EOSIMG bash -c "/opt/mgp/bin/wallet.sh"