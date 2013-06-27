Toner is really just a big Mapnik file and there are a varierty of tools for
generating and serving map tiles available. We like to serve tiles using
TileStache (http://tilestache.org/).

Here's an example of how to run a bare-bones TileStache server (on port 8080)
from the command-line:

	tilestache-server.py -c tilestache.cfg

Technically, "-c tilestache.cfg" is not necessary if you use the default filename "tilestache.cfg" and the config 
file is present in the directory where you run the command. Note that this will bind to 127.0.0.1, and will only 
be accessible from the local machine. If you have root access, use sudo to bind to 0.0.0.0 and port 80:

  sudo tilestache-server.py -i 0.0.0.0 -p 80

Here's an example of how to run TileStache (on port 4110 or port 81) under gunicorn:

    gunicorn -b 192.168.1.5:4110 "TileStache:WSGITileServer('tilestache.cfg')"
    
Or more complicated:

	/usr/local/bin/gunicorn -n tilespotting -w 4 -u www-data -k egg:gunicorn#gevent_wsgi -b localhost:81 -D "TileStache:WSGITileServer('tilestache.cfg')"

There's also an example init.d script in the gunicorn directory that will make
sure gunicorn + tilestache are started automatically when you (re)boot your
server.
