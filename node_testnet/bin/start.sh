MGP=/opt/mgp/node_testnet
CONDIR=$MGP/conf
DATDIR=$MGP/data
LOGDIR=$MGP/logs

#sh $BINDIR/stop.sh $node || true
echo -e "Starting nodeos for $node ...\n";

ulimit -c unlimited
ulimit -n 65535
ulimit -s 64000

TIMESTAMP=$(/bin/date +%s)
NEW_LOG="mgp-$TIMESTAMP.log"

nodeos $param -e --data-dir $DATDIR --config-dir $CONDIR >> $LOGDIR/$NEW_LOG 2>&1 &
#nodeos --snapshot $SNAP --data-dir $DATDIR --config-dir $CONDIR
#nodeos --hard-replay-blockchain -e --data-dir $DATDIR --config-dir $CONDIR >> $LOGDIR/$NEW_LOG 2>&1 &
#nodeos  $param --delete-all-blocks --genesis-json $CONDIR/genesis.json -e --data-dir $DATDIR --config-dir $CONDIR >> $LOGDIR/$NEW_LOG 2>&1 &

echo $! > $MGP/bin/nodeos.pid
unlink $LOGDIR/mgp.log

ln -s $LOGDIR/$NEW_LOG $LOGDIR/mgp.log
tail -f /dev/null