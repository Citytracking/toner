#!/bin/sh

#
# README
#
# There are two parts: (1) City labels and (2) Roads.
# Both are imported into PostGIS to make rendering performant.
#
# USAGE
# ./import_toner_v2_shps.sh
#
# shp2pgsql HINTS
# http://postgis.refractions.net/docs/ch04.html
# -d drops the database table before creating a new one.
# -I creates a GiST index on the geometry column.
# -D uses the PostgreSQL "dump" format for the output data. 
# -s creates and populates the geometry tables with the specified SRID.
# -W Specify encoding of the input data (dbf file). When used, all attributes of the dbf are converted from the specified encoding to UTF8.
# -k Keeps identifiers' case (column, schema and attributes). Sometimes usual for NaturalEarth.
#
# psql HINTS
# http://www.postgresql.org/docs/8.1/static/app-psql.html
# -d Specifies the name of the database to connect to. This is equivalent to specifying dbname as the first non-option argument on the command line.
# -U Connect to the database as the user username instead of the default.

# shell script HINTS
# https://supportweb.cs.bham.ac.uk/documentation/tutorials/docsystem/build/tutorials/unixscripting/unixscripting.html

################
# ADMIN-1 LABELS
# already web mercator projection
#

shp2pgsql -dID -s 4326 -W Windows-1252 mapnik/shp/labels_admin/admin-1-labels-z4 admin_1_labels_z4 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W Windows-1252 mapnik/shp/labels_admin/admin-1-labels-z5 admin_1_labels_z5 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W Windows-1252 mapnik/shp/labels_admin/admin-1-labels-z6 admin_1_labels_z6 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W Windows-1252 mapnik/shp/labels_admin/admin-1-labels-z7 admin_1_labels_z7 | psql -d toner -U osm

# exit

################
# ADMIN-0 LABELS
# already web mercator projection
#

shp2pgsql -dID -s 900913 -W Windows-1252 mapnik/shp/admin_0_countries_110m-points admin_0_countries_110m_points | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W Windows-1252 mapnik/shp/labels_admin/admin-0-labels-z4 admin_0_labels_z4 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W Windows-1252 mapnik/shp/labels_admin/admin-0-labels-z5 admin_0_labels_z5 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W Windows-1252 mapnik/shp/labels_admin/admin-0-labels-z6 admin_0_labels_z6 | psql -d toner -U osm

# exit

################
# CITY LABELS
# already web mercator projection
#

shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/africa-labels-z4 africa_labels_z4 | psql -d toner -U osm | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/asia-labels-z4 asia_labels_z4 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/australia-new-zealand-labels-z4 australia_new_zealand_labels_z4 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/europe-labels-z4 europe_labels_z4 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/north-america-labels-z4 north_america_labels_z4 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/south-america-labels-z4 south_america_labels_z4 | psql -d toner -U osm

# exit

shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/africa-labels-z5 africa_labels_z5 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/asia-labels-z5 asia_labels_z5 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/australia-new-zealand-labels-z5 australia_new_zealand_labels_z5 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/europe-labels-z5 europe_labels_z5 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/north-america-labels-z5 north_america_labels_z5 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/south-america-labels-z5 south_america_labels_z5 | psql -d toner -U osm

# exit

shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/africa-labels-z6 africa_labels_z6 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/asia-labels-z6 asia_labels_z6 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/australia-new-zealand-labels-z6 australia_new_zealand_labels_z6 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/europe-labels-z6 europe_labels_z6 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/north-america-labels-z6 north_america_labels_z6 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/south-america-labels-z6 south_america_labels_z6 | psql -d toner -U osm

# exit

shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/africa-labels-z7 africa_labels_z7 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/asia-labels-z7 asia_labels_z7 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/australia-new-zealand-labels-z7 australia_new_zealand_labels_z7 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/europe-labels-z7 europe_labels_z7 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/north-america-labels-z7 north_america_labels_z7 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/north-america-points-z7 north_america_points_z7 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/south-america-labels-z7 south_america_labels_z7 | psql -d toner -U osm

# exit

shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/north-america-labels-z8 north_america_labels_z8 | psql -d toner -U osm # utf8: Invalid or incomplete multibyte or wide characterERROR:  missing data for column "geonameid"
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/north-america-points-z8 north_america_points_z8 | psql -d toner -U osm

# exit

shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/north-america-labels-z9 north_america_labels_z9 | psql -d toner -U osm # tf8: Invalid or incomplete multibyte or wide characterERROR:  missing data for column "geonameid"
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/north-america-points-z9 north_america_points_z9 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/europe-labels-z9 europe_labels_z9 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/europe-points-z9 europe_points_z9 | psql -d toner -U osm

# exit

shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/north-america-labels-z10 north_america_labels_z10 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/north-america-points-z10 north_america_points_z10 | psql -d toner -U osm

# exit

##########
# AIRPORTS
# already web mercator projection
#

shp2pgsql -dID -s 900913 -W Windows-1252 mapnik/shp/airports-simple-0d29-less-merc airports_simple_0d29_less_merc | psql -d toner -U osm

# exit

##########
# ROADS
#
# Note: The UPPERCASE column names in the SHP's DBF are converted to lowercase in PostGIS conversion
# already web mercator projection
# NOTE: the SRS of the layer will need to be updated
# SEE: roads_geo_to_web_merc.sh in mapnik/shp/ for the projection script.

shp2pgsql -dID -s 900913 -W Windows-1252 mapnik/shp/roads/900913/900913_z6_europe.shp roads_z6_europe | psql -d toner -U osm
shp2pgsql -dID -s 900913 -W Windows-1252 mapnik/shp/roads/900913/900913_z6_global_extra.shp roads_z6_global_extra | psql -d toner -U osm
shp2pgsql -dID -s 900913 -W Windows-1252 mapnik/shp/roads/900913/900913_z6_global.shp roads_z6_global | psql -d toner -U osm
shp2pgsql -dID -s 900913 -W Windows-1252 mapnik/shp/roads/900913/900913_z6_north_america.shp roads_z6_north_america | psql -d toner -U osm
shp2pgsql -dID -s 900913 -W Windows-1252 mapnik/shp/roads/900913/900913_z7_europe_extra.shp roads_z7_europe_extra | psql -d toner -U osm
shp2pgsql -dID -s 900913 -W Windows-1252 mapnik/shp/roads/900913/900913_z7_europe.shp roads_z7_europe | psql -d toner -U osm
shp2pgsql -dID -s 900913 -W Windows-1252 mapnik/shp/roads/900913/900913_z7_global_extra.shp roads_z7_global_extra | psql -d toner -U osm
shp2pgsql -dID -s 900913 -W Windows-1252 mapnik/shp/roads/900913/900913_z7_global.shp roads_z7_global | psql -d toner -U osm
shp2pgsql -dID -s 900913 -W Windows-1252 mapnik/shp/roads/900913/900913_z7_north_america_extra.shp roads_z7_north_america_extra | psql -d toner -U osm
shp2pgsql -dID -s 900913 -W Windows-1252 mapnik/shp/roads/900913/900913_z7_north_america.shp roads_z7_north_america | psql -d toner -U osm
shp2pgsql -dID -s 900913 -W Windows-1252 mapnik/shp/roads/900913/900913_z8_europe_extra.shp roads_z8_europe_extra | psql -d toner -U osm
shp2pgsql -dID -s 900913 -W Windows-1252 mapnik/shp/roads/900913/900913_z8_europe.shp roads_z8_europe | psql -d toner -U osm
shp2pgsql -dID -s 900913 -W Windows-1252 mapnik/shp/roads/900913/900913_z8_global_extra.shp roads_z8_global_extra | psql -d toner -U osm
shp2pgsql -dID -s 900913 -W Windows-1252 mapnik/shp/roads/900913/900913_z8_global.shp roads_z8_global | psql -d toner -U osm
shp2pgsql -dID -s 900913 -W Windows-1252 mapnik/shp/roads/900913/900913_z8_north_america_extra.shp roads_z8_north_america_extra | psql -d toner -U osm
shp2pgsql -dID -s 900913 -W Windows-1252 mapnik/shp/roads/900913/900913_z8_north_america.shp roads_z8_north_america | psql -d toner -U osm

exit