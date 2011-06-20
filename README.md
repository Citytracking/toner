toner
--

"toner" is the name of the Stamen B+W tiles used for the Dotspotting project.

How to use toner
--

(TBW)

Dependencies (required)
--

* A PostGIS database (http://postgis.refractions.net/)

* PostGIS database tables for OpenStreetMap in EPSG:900913 (http://wiki.openstreetmap.org/wiki/PostGIS/)

* PostGIS database tables for Natural Earth in EPSG:900913 (http://www.naturalearthdata.com/)

* Python 2.6 or higher (http://www.python.org/)

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

NaturalEarth
--


Other Stuff
--

* https://github.com/straup/naturalearth-tools

* https://github.com/straup/postgis-tools
