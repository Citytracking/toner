Toner
--

"Toner" is the name of the map tiles, and Mapnik stylesheets, used for the Dotspotting project.

How to use Toner
--

The first thing you'll need to do is create a 'style.mml' file that contains all
of your database configurations. There is an example file in the 'mapnik' folder
called 'style.mml.example' that you can start with. Just fill in the places
where it says "CHANGE TO YOUR..." with the relevant values and rename the file
as 'style.xml'.

(The Git repository has been configured to ignore any files ending in '.mml' so
that sensitive data like database passwords isn't accidentally checked in and
shared with people you don't want to see that kind of thing.)

Once you've done that you can type (from inside the 'mapnik' directory):

	make style.xml

Which is really just a shortcut for typing this:

	cascadenik-compile.py style.mml > style.xml

This will take your 'style.mml' and all the '.mss' files and smush them all
together to create a new file called 'style.xml'. This new file is what Mapnik
uses to render maps.

For example, once you've created your new 'style.xml' file you could use the
'nik2img' program that is included with Mapnik to render a map of the USA like
this:

	nik2img.py -b -126 24 -66 49 -s 900913 -d 1024 768 \
		--fonts=fonts/Arial.ttf,fonts/Arial\ Bold.ttf,fonts/Arial\ Italic.ttf \
		style.xml usa.png

A sample 'usa.png' rendering is included in the 'examples' directory.

Dependencies (required)
--

* A PostGIS database (http://postgis.refractions.net/)

* PostGIS database tables for OpenStreetMap in EPSG:900913 (http://wiki.openstreetmap.org/wiki/PostGIS/)

* PostGIS database tables for Natural Earth in EPSG:900913 (http://www.naturalearthdata.com/)

* Python 2.6 or higher (http://www.python.org/)

* The GDAL libraries and utlities (http://www.gdal.org/)

* Mapnik and the Mapnik Python bindings (http://mapnik.org/)

* The ModestMaps Python libraries (http://pypi.python.org/pypi/ModestMaps/)

* The Cascadenik Python libraries (http://pypi.python.org/pypi/cascadenik/)

Dependencies (optional)
--

* The TileStache Python libraries (http://pypi.python.org/pypi/TileStache/)

* The gunicorn WSGI web server framework (http://www.gunicorn.org/)

Database Tables
--

The Toner stylesheets need access to a pair of PostGIS databases:

* A database containing PlanetOSM data, as created by the osm2pgsql script,
  using the spherical mercator projection (EPSG:900913). See below for details.

* A database containing NaturalEarth data, as created by the shp2pgsql script,
  using the spherical mercator projection (EPSG:900913). See below for details.

OpenStreetMap (OSM)
--

OSM publishes freely available downloads of their entire dataset at
http://planet.openstreetmap.org. Instructions for installing and setting up OSM
are outside the scope of this document but the OSM site has thorough
documentation available at: http://wiki.openstreetmap.org/wiki/PostGIS

If you don't want to install the entire OSM planet database but want to render
tiles for a smaller area you can also use the MirrorOSM tile provider in
TileStache to retrieve and store OSM data in PostGIS. Details are available over
here:

http://tilestache.org/doc/TileStache.Goodies.Providers.MirrorOSM.html

Natural Earth
--

NaturalEarth is a public domain map dataset of various cultural and vector
datasets. It is available for download at: http://www.naturalearthdata.com/

Toner uses many of the datasets in NaturalEarth so the easiest thing is just to
install all of them. The various datasets are available as separate downloads
but here's a simple shell script that will download them all, one at a time:

https://github.com/straup/naturalearth-tools/blob/master/fetchall-vector.sh

NaturalEarth is distributed using the WGS84 map projection so you will need to
reproject all the various shapefiles (in to the spherical mercator projection)
before importing them in to your database.

Here's another simple shell script that wraps up the entire process of
converting the NaturalEarth shapefiles and then importing them in to a PostGIS
database. It assumes that you have installed all the dependencies listed above:

https://github.com/straup/naturalearth-tools/blob/master/shp2pgmerc.sh

Other Stuff
--

* https://github.com/straup/postgis-tools

These are mostly just a bunch of vanilla shell scripts that handle the
multi-step process of setting up a PostGIS database.
