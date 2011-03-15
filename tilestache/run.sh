#!/bin/sh
# See also: http://www.gunicorn.org/
/usr/local/bin/gunicorn -n tilespotting -w 4 -u www-data -k egg:gunicorn#gevent_wsgi -b localhost:81 -D "TileStache:WSGITileServer('dotspotting.json')"