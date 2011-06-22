Toner
--

"Toner" is the name of the map tiles, and Mapnik stylesheets, used for the Dotspotting project.

How to use Toner
--

(TBW)

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

--


Other Stuff
--

* https://github.com/straup/naturalearth-tools

* https://github.com/straup/postgis-tools
