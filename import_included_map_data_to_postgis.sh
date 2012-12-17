#!/bin/sh

#
# README
#
# There are two parts: (1) city and admin labels and (2) airports and roads.
# Both are imported into PostGIS to make rendering performant.
#

OGR2OGR=`which ogr2ogr`
SHP2PGSQL=`which shp2pgsql`
PSQL=`which psql`

ROOT=$1
MERC="${ROOT}/900913"
GOOG="+proj=merc +a=6378137 +b=6378137 +lat_ts=0.0 +lon_0=0.0 +x_0=0.0 +y_0=0.0 +k=1.0 +units=m +nadgrids=@null +wktext +no_defs +over"

#
# CITY LABELS
#
# need to be imported to PostGIS for performance gains
#

shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/africa-labels-z10.shp africa_labels_z10 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/africa-labels-z4.shp africa_labels_z4 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/africa-labels-z5.shp africa_labels_z5 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/africa-labels-z6.shp africa_labels_z6 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/africa-labels-z7.shp africa_labels_z7 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/africa-labels-z8.shp africa_labels_z8 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/africa-labels-z9.shp africa_labels_z9 | psql -d toner -U osm

#exit

shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/africa-points-z10.shp africa_points_z10 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/africa-points-z4.shp africa_points_z4 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/africa-points-z5.shp africa_points_z5 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/africa-points-z6.shp africa_points_z6 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/africa-points-z7.shp africa_points_z7 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/africa-points-z8.shp africa_points_z8 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/africa-points-z9.shp africa_points_z9 | psql -d toner -U osm

#exit

shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/africa-registrations-z10.shp africa_registrations_z10 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/africa-registrations-z4.shp africa_registrations_z4 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/africa-registrations-z5.shp africa_registrations_z5 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/africa-registrations-z6.shp africa_registrations_z6 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/africa-registrations-z7.shp africa_registrations_z7 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/africa-registrations-z8.shp africa_registrations_z8 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/africa-registrations-z9.shp africa_registrations_z9 | psql -d toner -U osm

#exit

shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/asia-labels-z10.shp asia_labels_z10 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/asia-labels-z4.shp asia_labels_z4 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/asia-labels-z5.shp asia_labels_z5 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/asia-labels-z6.shp asia_labels_z6 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/asia-labels-z7.shp asia_labels_z7 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/asia-labels-z8.shp asia_labels_z8 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/asia-labels-z9.shp asia_labels_z9 | psql -d toner -U osm

#exit

shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/asia-points-z10.shp asia_points_z10 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/asia-points-z4.shp asia_points_z4 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/asia-points-z5.shp asia_points_z5 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/asia-points-z6.shp asia_points_z6 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/asia-points-z7.shp asia_points_z7 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/asia-points-z8.shp asia_points_z8 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/asia-points-z9.shp asia_points_z9 | psql -d toner -U osm

#exit

shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/asia-registrations-z10.shp asia_registrations_z10 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/asia-registrations-z4.shp asia_registrations_z4 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/asia-registrations-z5.shp asia_registrations_z5 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/asia-registrations-z6.shp asia_registrations_z6 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/asia-registrations-z7.shp asia_registrations_z7 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/asia-registrations-z8.shp asia_registrations_z8 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/asia-registrations-z9.shp asia_registrations_z9 | psql -d toner -U osm

#exit

shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/australia-new-zealand-labels-z10.shp australia_new_zealand_labels_z10 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/australia-new-zealand-labels-z4.shp australia_new_zealand_labels_z4 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/australia-new-zealand-labels-z5.shp australia_new_zealand_labels_z5 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/australia-new-zealand-labels-z6.shp australia_new_zealand_labels_z6 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/australia-new-zealand-labels-z7.shp australia_new_zealand_labels_z7 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/australia-new-zealand-labels-z8.shp australia_new_zealand_labels_z8 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/australia-new-zealand-labels-z9.shp australia_new_zealand_labels_z9 | psql -d toner -U osm

#exit

shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/australia-new-zealand-points-z10.shp australia_new_zealand_points_z10 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/australia-new-zealand-points-z4.shp australia_new_zealand_points_z4 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/australia-new-zealand-points-z5.shp australia_new_zealand_points_z5 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/australia-new-zealand-points-z6.shp australia_new_zealand_points_z6 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/australia-new-zealand-points-z7.shp australia_new_zealand_points_z7 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/australia-new-zealand-points-z8.shp australia_new_zealand_points_z8 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/australia-new-zealand-points-z9.shp australia_new_zealand_points_z9 | psql -d toner -U osm

#exit

shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/australia-new-zealand-registrations-z10.shp australia_new_zealand_registrations_z10 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/australia-new-zealand-registrations-z4.shp australia_new_zealand_registrations_z4 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/australia-new-zealand-registrations-z5.shp australia_new_zealand_registrations_z5 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/australia-new-zealand-registrations-z6.shp australia_new_zealand_registrations_z6 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/australia-new-zealand-registrations-z7.shp australia_new_zealand_registrations_z7 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/australia-new-zealand-registrations-z8.shp australia_new_zealand_registrations_z8 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/australia-new-zealand-registrations-z9.shp australia_new_zealand_registrations_z9 | psql -d toner -U osm

#exit

shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/europe-labels-z4.shp europe_labels_z4 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/europe-labels-z5.shp europe_labels_z5 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/europe-labels-z6.shp europe_labels_z6 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/europe-labels-z7.shp europe_labels_z7 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/europe-labels-z8.shp europe_labels_z8 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/europe-labels-z9.shp europe_labels_z9 | psql -d toner -U osm

#exit

shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/europe-points-z4.shp europe_points_z4 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/europe-points-z5.shp europe_points_z5 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/europe-points-z6.shp europe_points_z6 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/europe-points-z7.shp europe_points_z7 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/europe-points-z8.shp europe_points_z8 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/europe-points-z9.shp europe_points_z9 | psql -d toner -U osm

#exit

shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/europe-registrations-z4.shp europe_registrations_z4 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/europe-registrations-z5.shp europe_registrations_z5 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/europe-registrations-z6.shp europe_registrations_z6 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/europe-registrations-z7.shp europe_registrations_z7 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/europe-registrations-z8.shp europe_registrations_z8 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/europe-registrations-z9.shp europe_registrations_z9 | psql -d toner -U osm

#exit

shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/north-america-labels-z10.shp north_america_labels_z10 | psql -d toner -U osm # utf8: Invalid or incomplete multibyte or wide character ERROR:  missing data for column "geonameid", CONTEXT:  COPY north_america_labels_z10, line 295: "07	8	"
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/north-america-labels-z4.shp north_america_labels_z4 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/north-america-labels-z5.shp north_america_labels_z5 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/north-america-labels-z6.shp north_america_labels_z6 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/north-america-labels-z7.shp north_america_labels_z7 | psql -d toner -U osm # oops?
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/north-america-labels-z8.shp north_america_labels_z8 | psql -d toner -U osm # utf8: Invalid or incomplete multibyte or wide character ERROR:  missing data for column "geonameid", CONTEXT:  COPY north_america_labels_z8, line 270: "07	8	"
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/north-america-labels-z9.shp north_america_labels_z9 | psql -d toner -U osm # utf8: Invalid or incomplete multibyte or wide character ERROR:  missing data for column "geonameid". CONTEXT:  COPY north_america_labels_z9, line 276: "07	8	"

#exit

shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/north-america-points-z10.shp north_america_points_z10 | psql -d toner -U osm # ERROR:  missing data for column "asciiname", CONTEXT:  COPY north_america_points_z10, line 295: "8	"
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/north-america-points-z4.shp north_america_points_z4 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/north-america-points-z5.shp north_america_points_z5 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/north-america-points-z6.shp north_america_points_z6 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/north-america-points-z7.shp north_america_points_z7 | psql -d toner -U osm # oops?
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/north-america-points-z8.shp north_america_points_z8 | psql -d toner -U osm # ERROR:  missing data for column "asciiname", CONTEXT:  COPY north_america_points_z8, line 270: "8	"
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/north-america-points-z9.shp north_america_points_z9 | psql -d toner -U osm # ERROR:  missing data for column "asciiname", CONTEXT:  COPY north_america_points_z9, line 276: "8	"

#exit

shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/north-america-registrations-z10.shp north_america_registrations_z10 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/north-america-registrations-z4.shp north_america_registrations_z4 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/north-america-registrations-z5.shp north_america_registrations_z5 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/north-america-registrations-z6.shp north_america_registrations_z6 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/north-america-registrations-z7.shp north_america_registrations_z7 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/north-america-registrations-z8.shp north_america_registrations_z8 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/north-america-registrations-z9.shp north_america_registrations_z9 | psql -d toner -U osm

#exit

shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/south-america-labels-z10.shp south_america_labels_z10 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/south-america-labels-z4.shp south_america_labels_z4 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/south-america-labels-z5.shp south_america_labels_z5 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/south-america-labels-z6.shp south_america_labels_z6 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/south-america-labels-z7.shp south_america_labels_z7 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/south-america-labels-z8.shp south_america_labels_z8 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/south-america-labels-z9.shp south_america_labels_z9 | psql -d toner -U osm

#exit

shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/south-america-points-z10.shp south_america_points_z10 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/south-america-points-z4.shp south_america_points_z4 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/south-america-points-z5.shp south_america_points_z5 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/south-america-points-z6.shp south_america_points_z6 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/south-america-points-z7.shp south_america_points_z7 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/south-america-points-z8.shp south_america_points_z8 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/south-america-points-z9.shp south_america_points_z9 | psql -d toner -U osm

#exit

shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/south-america-registrations-z10.shp south_america_registrations_z10 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/south-america-registrations-z4.shp south_america_registrations_z4 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/south-america-registrations-z5.shp south_america_registrations_z5 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/south-america-registrations-z6.shp south_america_registrations_z6 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/south-america-registrations-z7.shp south_america_registrations_z7 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/south-america-registrations-z8.shp south_america_registrations_z8 | psql -d toner -U osm
shp2pgsql -dID -s 4326 -W utf8 mapnik/shp/labels/south-america-registrations-z9.shp south_america_registrations_z9 | psql -d toner -U osm

exit

#
# MISSING NATURAL EARTH THEMES
# 

shp2pgsql -dID -W Windows-1252 mapnik/shp/continents.shp continents

exit