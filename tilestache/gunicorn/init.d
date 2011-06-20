#!/bin/sh

# SEE ALSO: http://gunicorn.org/

# THINGS YOU SHOULD CHANGE

ADDRESS="WHERE GUNICORN LIVES ON THE NETWORK"
GUNICORN="WHERE GUNICORN LIVES ON YOUR SERVER"
DIRNAME="WHERE YOUR TILESTACHE CONFIG LIVES"
CONFIG="THE NAME OF YOUR TILESTACHE CONFIG"

# THINGS YOU SHOULDN'T NEED TO WORRY ABOUT

PIDFILE="/var/run/dotspotting-tilestache.pid"
LOGFILE="/var/log/dotspotting-tilestache.log"
COMMAND="$GUNICORN --daemon --user www-data --workers 4 --worker-class egg:gunicorn#gevent_wsgi --bind $ADDRESS --log-file $LOGFILE"

start_server () {
  if [ -f $PIDFILE ]; then
    #pid exists, check if running
    if [ "$(ps -p `cat $PIDFILE` | wc -l)" -gt 1 ]; then
       echo "Server already running on ${ADDRESS}"
       return
    fi
  fi
  echo "starting ${ADDRESS}"
  cd $DIRNAME && $COMMAND --pid $PIDFILE "TileStache:WSGITileServer('dotspotting.json')"
}

stop_server () {
  if [ -f $PIDFILE ] && [ "$(ps -p `cat $PIDFILE` | wc -l)" -gt 1 ]; then
    echo "stopping server ${ADDRESS}"
    kill -9 `cat $PIDFILE`
    rm $PIDFILE
  else 
    if [ -f $PIDFILE ]; then
      echo "server ${ADDRESS} not running"
    else
      echo "No pid file found for server ${ADDRESS}"
    fi
  fi
}

restart_server () {
  if [ -f $PIDFILE ] && [ "$(ps -p `cat $PIDFILE` | wc -l)" -gt 1 ]; then
    echo "gracefully restarting server ${ADDRESS}"
    kill -HUP `cat $PIDFILE`
  else 
    if [ -f $PIDFILE ]; then
      echo "server ${ADDRESS} not running"
    else
      echo "No pid file found for server ${ADDRESS}"
    fi
  fi
}

case "$1" in
'start')
  start_server
  ;;
'stop')
  stop_server
  ;;
'restart')
  restart_server
  ;;
*)
  echo "Usage: $0 { start | stop | restart }"
  ;;
esac

exit 0
