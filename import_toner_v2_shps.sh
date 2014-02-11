#!/bin/sh

#
# README
#
# This script imports labels for admin levels, cities, and continents. 
# It also imports airports.
# These labels are imported into PostGIS to make rendering performant.
# The labels were generated using Dymo at some point in the distant past.
# Any other labels are not loaded into PostGIS and instead are read from shapefiles 
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

SHP2PGSQL=`which shp2pgsql`
PSQL=`which psql`

DB="toner"


################
# ADMIN-1 LABELS
#

for zoom in z4 z5 z6 z7; do
  $SHP2PGSQL -dID -s 4326 -W Windows-1252 mapnik/shp/labels_admin/admin-1-labels-$zoom admin_1_labels_$zoom | $PSQL -d $DB -U osm
done

# exit

################
# ADMIN-0 LABELS
#

$SHP2PGSQL -dID -s 900913 -W Windows-1252 mapnik/shp/admin_0_countries_110m-points admin_0_countries_110m_points | $PSQL -d $DB -U osm
for zoom in z4 z5 z6; do
  $SHP2PGSQL -dID -s 4326 -W Windows-1252 mapnik/shp/labels_admin/admin-0-labels-$zoom admin_0_labels_$zoom | $PSQL -d $DB -U osm
done

# exit

################
# CITY LABELS
#

for zoom in z4 z5 z6 z7 z8 z9 z10; do
  for layer in points labels registrations; do
    for region in africa asia europe; do

      # Dymo labels for Europe at zoom 10 were never finished
      if [ $region = 'europe' -a $zoom = 'z10' ]; then
        continue
      fi;

      $SHP2PGSQL -dID -s 4326 -W utf8 mapnik/shp/labels/$region-$layer-$zoom.shp ${region}_${layer}_$zoom | $PSQL -d $DB -U osm

    done

    # Annoying change from underscores to dashes
    $SHP2PGSQL -dID -s 4326 -W utf8 mapnik/shp/labels/australia-new-zealand-$layer-$zoom.shp australia_new_zealand_${layer}_$zoom | $PSQL -d $DB -U osm
    $SHP2PGSQL -dID -s 4326 -W utf8 mapnik/shp/labels/north-america-$layer-$zoom.shp north_america_${layer}_$zoom | $PSQL -d $DB -U osm
    $SHP2PGSQL -dID -s 4326 -W utf8 mapnik/shp/labels/south-america-$layer-$zoom.shp south_america_${layer}_$zoom | $PSQL -d $DB -U osm

  done
done

##########
# Import continent labels. Why is this here?
# 

$SHP2PGSQL -dID -s 4326 -W Windows-1252 mapnik/shp/continents.shp continents | $PSQL -d $DB -U osm

# exit

##########
# AIRPORTS
#

$SHP2PGSQL -dID -s 900913 -W Windows-1252 mapnik/shp/airports-simple-0d29-less-merc airports_simple_0d29_less_merc | $PSQL -d $DB -U osm

exit
