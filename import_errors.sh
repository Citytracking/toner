#!/bin/sh

# NORTH AMERICA

# Open DBFs in OpenOffice and find/replace �? and reference the ascii column for the replacement value manually (most likely A or a, sometimes I, sometimes o). Three records in zoom 8.

#shp2pgsql -dID -s 900913 -W utf8 mapnik/shp/labels/north-america-labels-z8 north_america_labels_z8 | psql -d toner -U osm # utf8: Invalid or incomplete multibyte or wide characterERROR:  missing data for column "geonameid"
#shp2pgsql -dID -s 900913 -W utf8 mapnik/shp/labels/north-america-labels-z9 north_america_labels_z9 | psql -d toner -U osm # tf8: Invalid or incomplete multibyte or wide characterERROR:  missing data for column "geonameid"
#shp2pgsql -dID -s 900913 -W utf8 mapnik/shp/labels/north-america-labels-z10 north_america_labels_z10 | psql -d toner -U osm # utf8: Invalid or incomplete multibyte or wide character ERROR:  missing data for column "geonameid", CONTEXT:  COPY north_america_labels_z10, line 295: "07	8	"

#shp2pgsql -dID -s 900913 -W utf8 mapnik/shp/labels/north-america-points-z8.shp north_america_points_z8 | psql -d toner -U osm # ERROR:  missing data for column "asciiname", CONTEXT:  COPY north_america_points_z8, line 270: "8	"
#shp2pgsql -dID -s 900913 -W utf8 mapnik/shp/labels/north-america-points-z9.shp north_america_points_z9 | psql -d toner -U osm # ERROR:  missing data for column "asciiname", CONTEXT:  COPY north_america_points_z9, line 276: "8	"
#shp2pgsql -dID -s 900913 -W utf8 mapnik/shp/labels/north-america-points-z10.shp north_america_points_z10 | psql -d toner -U osm # ERROR:  missing data for column "asciiname", CONTEXT:  COPY north_america_points_z10, line 295: "8	"

exit