tilestache-start: \
	gunicorn -b 192.168.1.5:4132 "TileStache:WSGITileServer('tilestache.cfg')"
	

tilestache-cache-clear: \
	clean
	
clear-cache: \
	tilestache-cache-clear 

clean-cache: \
	tilestache-cache-clear 

clean-tilestache: \
	tilestache-cache-clear 


clean:
	rm -r tiles/*