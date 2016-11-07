#! /bin/sh

CMD=$1
BINDIR=$(dirname $0)
PID_FILE="wsgi-fcgi.pid"

case "c$CMD" in
cstart)
	spawn-fcgi -P $PID_FILE -a 127.0.0.1 -p 11111 -f $BINDIR/wsgi-fcgi.py
	;;
cstop)
	kill $(cat $PID_FILE)
	rm $PID_FILE
	;;
*)
	echo "Wrong usage: $0 [start|stop]"
	;;
esac

