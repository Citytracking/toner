Toner
=====

"Toner" is the name of the B+W (black and white) map tiles, and Mapnik stylesheets, used for the
Dotspotting project. Toner was designed by [Geraldine Sarmiento](http://stamen.com/studio/geraldine).

Examples
--

https://github.com/Citytracking/toner/tree/master/examples

Getting Started
--

Toner is made up of several parts. Toner primarily uses data from two sources: Natural 
Earth 2.0 and OpenStreetMap. It uses stylesheets that are interpreted by Cascadenik and 
fed to Mapnik, which generates map images or tiles. These map tiles can then be served 
by TileStache or similar software. Getting started with Toner involves three main stages:

1. Install Toner and all its dependencies (both data and software). The current document 
(the one you're reading right now) explains how to do this. Read this first.
 
2. After you have everything installed, you should go to the README file in the 'mapnik' 
directory to learn about Cascadenik and to start generating the "Toner" Mapnik stylesheets. 
Do this second. At this point you will be able to generate static map images.

3. Then, after you have built your Mapnik stylesheets and tested them, you should go to the 
README file in the 'tilestache' directory to start generating and serving map tiles. Do this 
third. This step is only required if you want to create map tiles.


Dependencies
--

The short version is: There are a lot.

The long version is: The gritty details of installing some of the tools that
Toner uses are outside the scope of this document. We've tried to give you the
shape of what you need to do and linked to the available documentation elsewhere. 
The instructions provided should work on ubuntu 12.04. You may need to make some 
modifications depending on your specific operating system and hardware.

Software Dependencies (required)
--

* A PostGIS database (http://postgis.refractions.net/) We use PostgreSQL 9.1 and PostGIS 2.0

		sudo apt-get install postgresql-9.1-postgis

* The osm2pgsql application for importing OpenStreetMap in to PostGIS (http://wiki.openstreetmap.org/wiki/Osm2pgsql). 

		sudo apt-get install osm2pgsql

* Python 2.6 or higher (http://www.python.org/)

		sudo apt-get install python

* The GDAL libraries and utlities (http://www.gdal.org/)

		sudo apt-get install gdal-bin
		
* Imposm version 2 (http://www.imposm.org)

		sudo apt-get install build-essential python-dev protobuf-compiler libprotobuf-dev libtokyocabinet-dev python-psycopg2 libgeos-c1
		sudo pip install imposm


* Mapnik and the Mapnik Python bindings (http://mapnik.org/).

		sudo apt-get install python-mapnik

* The ModestMaps Python libraries (http://pypi.python.org/pypi/ModestMaps/)

		sudo apt-get install python-modestmaps

* The Cascadenik Python libraries (http://pypi.python.org/pypi/cascadenik/)

		sudo pip install cssutils
		sudo pip install cascadenik



Software Dependencies (optional)
--

* The TileStache Python libraries (http://pypi.python.org/pypi/TileStache/)

		sudo pip install tilestache

* The gunicorn WSGI web server framework (http://www.gunicorn.org/)

		sudo pip install gunicorn

* The pyproj Python libraries, required for using using the 'mapnik-render.py' script (http://pypi.python.org/pypi/pyproj)

		sudo pip install pyproj

* The Python Imaging Libraries (PIL), required for using the 'mapnik-render.py' script (http://pypi.python.org/pypi/PIL/)

		sudo apt-get install python-imaging


Data Dependencies (required)
--

* A PostGIS database called 'planet_osm' containing OSM data (loaded by the osm2pgsql script) and
  coastline using the spherical mercator projection (EPSG:900913). See below for
  details.

* A second PostGIS database called 'toner' containing NaturalEarth data loaded by the shp2pgsql script
  (this is installed with PostGIS), using the spherical mercator projection
  (EPSG:900913). See below for details. This database also includes tables for City labels and 
  townspots in EPSG:900913 (included here). Use the included import script (see below).
  
A quick guide to setting up your databases (for PostgreSQL 9.x):

	createuser --no-superuser --no-createdb --no-createrole osm
	createdb --owner=osm toner 
	createdb --owner=osm planet_osm 
	psql -d toner -c "CREATE EXTENSION postgis;"
	psql -d planet_osm -c "CREATE EXTENSION postgis;"
	echo "ALTER TABLE spatial_ref_sys OWNER TO osm;" | psql -d toner
	echo "ALTER TABLE spatial_ref_sys OWNER TO osm;" | psql -d planet_osm
	echo "ALTER TABLE geometry_columns OWNER TO osm;" | psql -d toner
	echo "ALTER TABLE geometry_columns OWNER TO osm;" | psql -d planet_osm


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

Or, you can download an extract from the geofabrik.de servers. For example:

	wget http://download.geofabrik.de/asia/japan-latest.osm.pbf

Then load it into your database like so: (you may need to increase the cache size 
depending on your hardware)

	osm2pgsql -d planet_osm -U osm -r pbf japan-latest.osm.pbf -C 6000

You will also need to add a copy of the OSM coastline to your planet_osm
database. The OSM coastline is distributed as a shapefile that you will need to
import using the 'shp2pgsql' program:

Download the file:

	wget http://tile.openstreetmap.org/processed_p.tar.bz2
	
Unzip it:

	bzip2 -d processed_p.tar.bz2
	tar xvf processed_p.tar

Load it into your planet_osm database:

	shp2pgsql processed_p.shp coastline | psql -U osm planet_osm

OSM-related
--

Toner uses a table in the 'planet_osm' database containing OSM-derived data called
'planet_osm_motorways'. There's a handy PGSQL script called 'motorways.pgsql' in
the 'toner/osm/' directory that you can run (once you've set up your planet_osm 
tables) to create the new table. Run the script like so:

	psql -U osm planet_osm < motorways.pgsql
	
Toner also uses a few other OSM-derived tables which are extracted from the planet file 
(or extract) and imported to the database using Imposm. From the 'mapnik/imposm/' 
directory, run this command:

	imposm -m mapping.py -U osm -d toner --proj=EPSG:900913 -c 12 --read --write /mnt/tonerdata/japan-latest.osm.pbf 

Followed by this:

	imposm -m mapping.py -U osm -d toner --proj=EPSG:900913 -c 12 --deploy-production-tables /mnt/tonerdata/japan-latest.osm.pbf
	
This will create tables for green_areas, grey_areas, buildings, aeroways, waterways, 
and water_areas.

Natural Earth
--

NaturalEarth is a public domain map dataset of various cultural and vector
datasets. It is available for download at: http://www.naturalearthdata.com/. Toner uses 
Natural Earth 2.0 (released November 2012) and should be compatible with any future minor 
releases (2.x).

Toner uses many, but not all of the datasets in NaturalEarth, so you should use this script 
(located in the main toner directory) to download all the datasets that Toner requires:

	download_natural_earth_data.sh

This script downloads the 31 NaturalEarth datasets Toner uses as shapefiles, and 
reprojects them from EPSG:4326 (WGS84 lat/lon) into EPSG:900913 (sometimes known as 
"spherical mercator" which really just means "good for making map tiles"). The 
downloaded and reprojected files are stored in the 'toner/mapnik/shp/natural_earth/'
directory, in compressed (zip) format. You do not need to unzip these files or load
them into your database: mapnik can read them as-is.


Included data
--

We have included some data sources as part of the repository.

We've prepped city labels with [Dymo](https://github.com/migurski/dymo) at several
zoom levels so you don't have to (it takes weeks). The resulting shapefiles (SHP and
related extensions) should be imported into PostGIS for optimal performance and we 
include a script for that. The MML file assumes this step has been accomplished.

These labels and points are stored as shapefiles in the 'mapnik/shp/labels/' directory.

Import them using this script:

	import_toner_v2_shps.sh
	
This script also imports a few other assorted data sources included in the 'mapnik/shp' 
directory, such as continent labels and airports.

This import script creates separate tables containing city labels for each continent. To 
join these tables together into a single table for each zoom level, run this from the 
'mapnik' directory:

	psql -U osm -f city_labels.pgsql toner


Data overview
--
An overview of data sources, storage locations, download and import methods (in progress)


| Data              | Zoom  | Source    | Download method | Input method        | Storage loc |
| ----------------- | ----- | --------- | --------- | ------------------- | ----------- |
| Coastline (low z) | 1-7   | NatEarth  | dl script |                     | Zipped shp  |
| Coastline (high z)| 8-19  | OSM       | wget url  | shp2pgsql           | toner db    |
| Continent lbls    | 1-2   | ?         |           | import_toner_v2_shps.sh  | toner db    |
| Ocean labels      | 2     |           |           |                     |             |
| Admin 0 labels    | 3-    | dymo      |           | import_toner_v2_shps.sh   | toner db    |
| Admin 1 labels    | 4-7   | dymo      |           | import_toner_v2_shps.sh   | toner db    |
| City labels       | 4-    | dymo      |           | import_toner_v2_shps.sh   | toner db    |
| Admin 0 bounds    | 6-8   | NatEarth  | dl script | n/a                 | Zipped shp  |
| Roads (low z)     | 6-8   | NatEarth  | dl script | n/a                 | Zipped shp  |
| Roads (high z)    | 9-19  | OSM       | wget url  | osm2pgsql           | planet db   |
| Motorways         | 9     | OSM deriv | n/a       | motorways.pgsql     | planet db   |
| Airports          | ?     | ?         | repo incl | "import_toner" sh   | toner db    |
| Aeroways          | 12-19 | OSM deriv | n/a       | imposm mapping.py   | toner db    |
| Green lreas       | 10-19 | OSM deriv | n/a       | imposm mapping.py   | toner db    |
| Grey lreas        | none? | OSM deriv | n/a       | imposm mapping.py   | toner db    |
| Buildings         | 13-19 | OSM deriv | n/a       | imposm mapping.py   | toner db    |
| Waterways/areas   | 8-19  | OSM deriv | n/a       | imposm mapping.py   | toner db    |



