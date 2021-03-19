MGPDIR="/opt/mgp/node_wallet/"
DATDIR="/root/eosio-wallet"
CONFDIR=$MGPDIR/conf
LOGDIR=$MGPDIR/logs

mkdir -p $CONFDIR $LOGDIR

TIMESTAMP=$(/bin/date +%s)
NEW_LOG="mgp-$TIMESTAMP.log"

#apt update && apt install -y libusb-1.0-0
#/opt/mgp/stop_wallet.sh
keosd --config-dir $CONFDIR -d $DATDIR --unix-socket-path $DATDIR/keosd.sock >> $LOGDIR/$NEW_LOG 2>&1 &

echo $! > $DATDIR/wallet.pid
unlink $LOGDIR/mgp.log
ln -s $LOGDIR/$NEW_LOG $LOGDIR/mgp.log
tail -f /dev/null