# ps auxwww | grep gunicorn
# ps auxwww | grep :4110
# nate     11767  0.0  0.0   7624   948 pts/0    S+   15:21   0:00 grep --color=auto :4110
# kill -9 {process number}
# kill -9 11767

start: 
	gunicorn -b 192.168.1.5:4110 --workers 12 "TileStache:WSGITileServer('../tilestache/tilestache.cfg')"

clean:
	rm -r tiles/*
	
../mapnik/style-toner-standard.xml:
	cascadenik-compile.py ../mapnik/style-toner-standard.mml $@
	chmod a+r $@

../mapnik/toner-no-labels.xml:
	cascadenik-compile.py ../mapnik/toner-no-labels.mml $@
	chmod a+r $@

../mapnik/toner-hybrid-with-labels.xml:
	cascadenik-compile.py ../mapnik/toner-hybrid-with-labels.mml $@
	chmod a+r $@

../mapnik/toner-hybrid-only-labels.xml:
	cascadenik-compile.py ../mapnik/toner-hybrid-only-labels.mml $@
	chmod a+r $@

update: ../mapnik/style-toner-standard.xml \
		../mapnik/toner-no-labels.xml \
		../mapnik/toner-hybrid-with-labels.xml \
		../mapnik/toner-hybrid-only-labels.xml
	
	cp ../mapnik/style-toner-standard.xml ../tilestache/style-toner-standard.xml
	cp ../mapnik/toner-no-labels.xml ../tilestache/toner-no-labels.xml
	cp ../mapnik/toner-hybrid-with-labels.xml ../tilestache/toner-hybrid-with-labels.xml
	cp ../mapnik/toner-hybrid-only-labels.xml ../tilestache/toner-hybrid-only-labels.xml