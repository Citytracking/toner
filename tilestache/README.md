Toner is really just a big Mapnik file and there are a varierty of tools for
generating and serving map tiles available. We like to serve tiles using
TileStache (http://tilestache.org/). 

Here's an example of how to run a bare-bones TileStache server (on port 8080)
from the command-line:

	tilestache-server.py -c tilestache.cfg

Here's an example of how to run TileStache (on port 81) under gunicorn:

	/usr/local/bin/gunicorn -n tilespotting -w 4 -u www-data -k egg:gunicorn#gevent_wsgi -b localhost:81 -D "TileStache:WSGITileServer('tilestache.cfg')"

There's also an example init.d script in the gunicorn directory that will make
sure gunicorn + tilestache are started automatically when you (re)boot your
server.
