#!/bin/sh

#
# README
#
# This script imports two sets of labels (1) city labels and (2) continent labels.
# Both are imported into PostGIS to make rendering performant.
# These labels were generated using Dymo at some point in the distant past.
# All other labels are not loaded into PostGIS and instead are read from shapefiles 
#

OGR2OGR=`which ogr2ogr`
SHP2PGSQL=`which shp2pgsql`
PSQL=`which psql`

DB="toner"

ROOT=$1
MERC="${ROOT}/900913"
GOOG="+proj=merc +a=6378137 +b=6378137 +lat_ts=0.0 +lon_0=0.0 +x_0=0.0 +y_0=0.0 +k=1.0 +units=m +nadgrids=@null +wktext +no_defs +over"

#
# CITY LABELS
#
# need to be imported to PostGIS for performance gains
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


#
# Import continent labels. Why is this here?
# 

$SHP2PGSQL -dID -s 4326 -W Windows-1252 mapnik/shp/continents.shp continents | $PSQL -d $DB -U osm

exit
