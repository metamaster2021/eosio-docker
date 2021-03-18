#!/bin/bash
param=$1

MGP=/opt/mgp
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

#nodeos --snapshot $SNAP --data-dir $DATDIR --config-dir $CONDIR
#nodeos --replay-blockchain --data-dir $DATDIR --config-dir $CONDIR >> $LOGDIR/$NEW_LOG 2>&1 &
#nodeos --hard-replay-blockchain -e --data-dir $DATDIR --config-dir $CONDIR >> $LOGDIR/$NEW_LOG 2>&1 &

nodeos $param -e --data-dir $DATDIR --config-dir $CONDIR >> $LOGDIR/$NEW_LOG 2>&1 &

#nodeos  $param --delete-all-blocks --genesis-json $CONDIR/genesis.json --hard-replay-blockchain -e --data-dir $DATDIR --config-dir $CONDIR >> $LOGDIR/$NEW_LOG 2>&1 &
#nodeos -e --data-dir $DATDIR --config-dir $CONDIR --hard-replay-blockchain --truncate-at-block 29816418 --genesis-json $CONDIR/genesis.json  >> $LOGDIR/$NEW_LOG 2>&1 &

echo $! > $MGP/nodeos.pid
unlink $LOGDIR/mgp.log
ln -s $MGP/logs/$NEW_LOG $LOGDIR/mgp.log
tail -f /dev/null