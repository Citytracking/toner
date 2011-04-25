This is a sample init.d file for running a TileStache based tile server using Gunicorn.

To install, copy the toner-tilestache.sh.example file to /etc/init.d/toner-tilestache.sh
and adjust the ADDRESS, DIRNAME, and GUNICORN variables as needed.

Then issue the following command:

	update-rc.d toner-tilestache.sh defaults

To start the server issue the following command:

	/etc/init.d/toner-tilestache.sh start


