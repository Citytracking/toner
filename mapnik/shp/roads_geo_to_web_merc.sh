#!/bin/sh

# USAGE: 
#
# From toner/mapnik/shp/ run:
# ./roads_geo_to_web_merc.sh roads
#
# takes a directory as an argument, creates a folder called 900913 (which is web Mercator) inside that, and
# converts all the SHPs in that root folder and places the results in the subfolder.
# If using a different source projection, modify SRC_PRJ.
# If targeting a different destination projection, modify TARGET_PRJ.

OGR2OGR=`which ogr2ogr`

ROOT=$1
DESTINATION="${ROOT}/900913"
SRC_PRJ="+proj=longlat +ellps=WGS84 +towgs84=0,0,0,0,0,0,0 +no_defs"
TARGET_PRJ="+proj=merc +a=6378137 +b=6378137 +lat_ts=0.0 +lon_0=0.0 +x_0=0.0 +y_0=0.0 +k=1.0 +units=m +nadgrids=@null +wktext +no_defs +over"

mkdir -p ${DESTINATION}
rm -f ${DESTINATION}/*

for SHP in `ls -a ${ROOT}/*.shp`
do
    DIR=`dirname ${SHP}`
    BASE=`basename ${SHP}`

    ${OGR2OGR} -f "ESRI Shapefile" -s_srs "${SRC_PRJ}" -t_srs "${TARGET_PRJ}" -overwrite ${DESTINATION}/900913_${BASE} ${DIR}/${BASE}

done