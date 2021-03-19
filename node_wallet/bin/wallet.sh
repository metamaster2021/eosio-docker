DATDIR="/root/eosio-wallet"
LOGDIR=$DATDIR/logs
mkdir -p $LOGDIR

TIMESTAMP=$(/bin/date +%s)
NEW_LOG="mgp-$TIMESTAMP.log"

#apt update && apt install -y libusb-1.0-0
#/opt/mgp/stop_wallet.sh
keosd --config-dir $DATDIR -d $DATDIR --unix-socket-path $DATDIR/keosd.sock >> $LOGDIR/$NEW_LOG 2>&1 &

echo $! > $DATDIR/wallet.pid
unlink $LOGDIR/mgp.log
ln -s $LOGDIR/$NEW_LOG $LOGDIR/mgp.log
tail -f /dev/null