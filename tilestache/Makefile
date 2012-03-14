start: 
	gunicorn -b 192.168.1.5:4110 "TileStache:WSGITileServer('../tilestache/tilestache.cfg')"

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