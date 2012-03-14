start: 
	gunicorn -b 192.168.1.5:4110 "TileStache:WSGITileServer('../tilestache/tilestache.cfg')"

clean:
	rm -r tiles/*
	
../mapnik/style-toner-standard.xml: ../mapnik/style-toner-standard.mml ../mapnik/stylesheet.mss naturalearth-lowzooms.mss ../mapnik/labels.mss
	cascadenik-compile.py ../mapnik/style-toner-standard.mml $@
	chmod a+r $@

../mapnik/toner-no-labels.xml: ../mapnik/toner-no-labels.mml ../mapnik/stylesheet.mss ../mapnik/naturalearth-lowzooms.mss
	cascadenik-compile.py ../mapnik/toner-no-labels.mml $@
	chmod a+r $@

../mapnik/toner-hybrid-with-labels.xml: ../mapnik/toner-hybrid-with-labels.mml ../mapnik/stylesheet.mss ../mapnik/naturalearth-lowzooms.mss
	cascadenik-compile.py ../mapnik/toner-hybrid-with-labels.mml $@
	chmod a+r $@

../mapnik/toner-hybrid-only-labels.xml: ../mapnik/toner-hybrid-only-labels.mml ../mapnik/stylesheet.mss ../mapnik/naturalearth-lowzooms.mss
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