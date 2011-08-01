Toner
--

"Toner" is the name of the map tiles, and Mapnik stylesheets, used for the
Dotspotting project. Toner was designed by [Geraldine Sarmiento](http://stamen.com/studio/geraldine).

Examples
--

https://github.com/Citytracking/toner/tree/master/examples

How to use Toner
--

At the end of the day Toner generates a stylesheet that can be used by a program
called Mapnik to draw maps. Those maps might be a single large image for print
or a lot of small images for map tiles but as far as Mapnik is concerned there
is an image of a set size that covers a specific geographic area and a bunch of
rules (styles) for how to draw the stuff inside those boxes.

Toner relies on a tool called Cascadenik so that map styles can be defined using
a CSS-like syntax that is a little more friendly than the XML-based markup
language that Mapnik uses by default. With Cascadenik you define two kinds of
files: Things ending in '.mss' are where the actual look and feel for a map;
Things ending in '.mml' are where you define administrative bits like database
passwords and queries for things to show on the map.

The first thing you'll need to do is create a 'style.mml' file that contains all
of your database configurations. There is an example file in the 'mapnik' folder
called 'style.mml.example' that you can start with. Just fill in the places
where it says "CHANGE TO YOUR..." with the relevant values and rename the file
as 'style.mml'.

(This Git repository has been configured to ignore any files ending in '.mml' so
that sensitive data like database passwords aren't accidentally checked in and
shared with people you don't want to see that kind of thing.)

Once you've created your 'style.mml' file you can type (from inside the 'mapnik'
directory):

	make style.xml

Which is really just a shortcut for typing this:

	cascadenik-compile.py style.mml > style.xml

This will take your 'style.mml' and all the '.mss' files (the things that define
the look and feel of the Toner maps) and smush them together to create a new
file called 'style.xml'. This new file is what Mapnik uses to render maps.

For example, once you've created your new 'style.xml' file you could use the
'nik2img' program that is included with Mapnik to render a map of the USA like
this:

	nik2img.py -b -126 24 -66 49 -s 900913 -d 1024 768 \
		--fonts=fonts/Arial.ttf,fonts/Arial\ Bold.ttf,fonts/Arial\ Italic.ttf \
		style.xml usa.png

A sample 'usa.png' rendering is included in the 'examples' directory.

If you wanted to use the TileStache server libraries to draw map tiles using
Mapnik, you would create a new layer (in your TileStache config file) like this:

	"toner": {
		"provider": {
			"name": "mapnik",
			"mapfile": "/path/to/mapnik/style.xml",
			"fonts": "/path/to/mapnik/fonts"
		},
		"projection": "spherical mercator",
		"metatile": { "rows": 4, "columns": 4 }
	}

Take a look in the 'tilestache' directory for more details about using the
Toner stylesheets with TileStache.

Dependencies
--

The short version is: There are a lot.

The long version is: The gritty details of installing some of the tools that
Toner uses are outside the scope of this document. We've tried to give you the
shape of what you need to do and linked to the available documentation elsewhere.

Software Dependencies (required)
--

* A PostGIS database (http://postgis.refractions.net/)

* The osm2pgsql application for importing OpenStreetMap in to PostGIS (http://wiki.openstreetmap.org/wiki/Osm2pgsql)

* Python 2.6 or higher (http://www.python.org/)

* The GDAL libraries and utlities (http://www.gdal.org/)

* Mapnik and the Mapnik Python bindings (http://mapnik.org/)

* The ModestMaps Python libraries (http://pypi.python.org/pypi/ModestMaps/)

* The Cascadenik Python libraries (http://pypi.python.org/pypi/cascadenik/)

Software Dependencies (optional)
--

* The TileStache Python libraries (http://pypi.python.org/pypi/TileStache/)

* The gunicorn WSGI web server framework (http://www.gunicorn.org/)

* The pyproj Python libraries, required for using using the 'mapnik-render.py' script (http://pypi.python.org/pypi/pyproj)

* The Python Imaging Libraries, required for using the 'mapnik-render.py' script (http://pypi.python.org/pypi/PIL/)

Data Dependencies (required)
--

* PostGIS database tables for OpenStreetMap in EPSG:900913 (http://wiki.openstreetmap.org/wiki/PostGIS/)

* PostGIS database tables for the OpenStreetMap coastline in EPSG 90091 (http://tile.openstreetmap.org/processed_p.tar.bz2)

* PostGIS database tables for Natural Earth in EPSG:900913 (http://www.naturalearthdata.com/)

Database Tables
--

The Toner stylesheets need access to a pair of PostGIS databases:

* A database containing PlanetOSM data (as created by the osm2pgsql script) and
  coastline using the spherical mercator projection (EPSG:900913). See below for
  details.

* A database containing NaturalEarth data, as created by the shp2pgsql script
  (this is installed with PostGIS), using the spherical mercator projection
  (EPSG:900913). See below for details.

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

http://www.tilestache.org/doc/TileStache.Goodies.Providers.MirrorOSM.html

You will also need to add a copy of the OSM coastline to your planet_osm
database. The OSM coastline is distributed as a shapefile that you will need to
import using the 'shp2pgsql' program:

http://tile.openstreetmap.org/processed_p.tar.bz2

OSM-related
--

Toner uses a table containing OSM-derived data called
'planet_osm_motorways'. There's a handy PGSQL script called 'motorways.pgsql' in
the 'osm' table that you can run (once you've set up your planet_osm tables) to
create the new table.

Natural Earth
--

NaturalEarth is a public domain map dataset of various cultural and vector
datasets. It is available for download at: http://www.naturalearthdata.com/

Toner uses many, but not all of the datasets in NaturalEarth so the easiest
thing is just to grab the shapefiles we use as a single compressed file over
here:

http://citytracking.s3.amazonaws.com/toner/toner-naturalearth-1.1-epsg900913.zip

This file contains the 13 NaturalEarth datasets Toner uses as shapefiles
projected using EPGS:900913 (sometimes known as "spherical mercator" which
really just means "good for making map tiles"). They also correct a known issue
with the NaturalEarth shapefiles where polygons crossing the 180° meridian start
to behave badly.

You will still need to use the 'shp2pgsql' program to import them in to your
PostGIS database.

If you want to install of all NaturalEarth from scratch there are a few things
you should be aware of first.

The various datasets are available as separate downloads but here's a simple
shell script that will download them all, one at a time:

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

* https://github.com/straup/postgis-tools – These are mostly just a bunch of
vanilla shell scripts that handle the multi-step process of setting up a PostGIS
database.
