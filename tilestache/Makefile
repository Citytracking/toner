# Tip: Note the escaped $$2 (the first $ escapes the $2)
# Looks for the processes (ps) that use port number 4110, removes the process that
# is doing that looking, and pipes matching process numbers to make the kill.
stop:
	kill -9 `ps -aef | grep ':4110' | grep -v grep | awk '{print $$2}'`

start: 
	gunicorn -b 192.168.1.5:4110 --workers 1 "TileStache:WSGITileServer('../tilestache/tilestache.cfg')"

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