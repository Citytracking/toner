# make -j4 renders/*-10.*
# make -j4 renders/*-10-hybrid.*

INPUT_POINT_FILE_COUNTRIES=Admin-0-all.txt
INPUT_POINT_FILE_STATES=Admin-1-all.txt
OUTPUT_FILE_PREFIX_COUNTRIES=admin-0
OUTPUT_FILE_PREFIX_STATES=admin-1

FONT_TTF="../fonts/Arial-Regular.ttf"
FONT_TTF2="../fonts/Arial-Bold.ttf"

# COUNTRY (ADMIN-0) SETTINGS
FONTS_Z3_COUNTRIES= --font 0 $(FONT_TTF) 13
FONTS_Z4_COUNTRIES= --font 0 $(FONT_TTF) 14
FONTS_Z5_COUNTRIES= --font 0 $(FONT_TTF2) 16
FONTS_Z6_COUNTRIES= --font 0 $(FONT_TTF2) 18

# STATES (ADMIN-1) SETTINGS
FONTS_Z4_STATES= --font 0 $(FONT_TTF) 12
FONTS_Z5_STATES= --font 0 $(FONT_TTF) 16
FONTS_Z6_STATES= --font 0 $(FONT_TTF) 18
FONTS_Z7_STATES= --font 0 $(FONT_TTF) 20


all: ../shp/labels_admin/

# COUNTRIES
$(OUTPUT_FILE_PREFIX_COUNTRIES)-labels-z3.txt: $(INPUT_POINT_FILE_COUNTRIES)
	python dymo/dymo-prepare-places.py -z 3 $(FONTS_Z3_COUNTRIES) $(INPUT_POINT_FILE_COUNTRIES) $@

$(OUTPUT_FILE_PREFIX_COUNTRIES)-labels-z4.txt: $(INPUT_POINT_FILE_COUNTRIES)
	python dymo/dymo-prepare-places.py -z 4 $(FONTS_Z4_COUNTRIES) $(INPUT_POINT_FILE_COUNTRIES) $@

$(OUTPUT_FILE_PREFIX_COUNTRIES)-labels-z5.txt: $(INPUT_POINT_FILE_COUNTRIES)
	python dymo/dymo-prepare-places.py -z 5 $(FONTS_Z5_COUNTRIES) $(INPUT_POINT_FILE_COUNTRIES) $@

$(OUTPUT_FILE_PREFIX_COUNTRIES)-labels-z6.txt.gz: $(INPUT_POINT_FILE_COUNTRIES)
	python dymo/dymo-prepare-places.py -z 6 $(FONTS_Z6_COUNTRIES) $(INPUT_POINT_FILE_COUNTRIES) $@

# STATES
$(OUTPUT_FILE_PREFIX_STATES)-labels-z4.txt: $(INPUT_POINT_FILE_STATES)
	python dymo/dymo-prepare-places.py -z 4 $(FONTS_Z4_STATES) $(INPUT_POINT_FILE_STATES) $@

$(OUTPUT_FILE_PREFIX_STATES)-labels-z5.txt: $(INPUT_POINT_FILE_STATES)
	python dymo/dymo-prepare-places.py -z 5 $(FONTS_Z5_STATES) $(INPUT_POINT_FILE_STATES) $@

$(OUTPUT_FILE_PREFIX_STATES)-labels-z6.txt.gz: $(INPUT_POINT_FILE_STATES)
	python dymo/dymo-prepare-places.py -z 6 $(FONTS_Z6_STATES) $(INPUT_POINT_FILE_STATES) $@

$(OUTPUT_FILE_PREFIX_STATES)-labels-z7.txt: $(INPUT_POINT_FILE_STATES)
	python dymo/dymo-prepare-places.py -z 7 $(FONTS_Z7_STATES) $(INPUT_POINT_FILE_STATES) $@



geojson/$(OUTPUT_FILE_PREFIX_COUNTRIES)-labels-z3.json: $(OUTPUT_FILE_PREFIX_COUNTRIES)-labels-z3.txt
	python dymo/dymo-label.py -z 3 -m 1 --name-field label_z3 --labels-file geojson/$(OUTPUT_FILE_PREFIX_COUNTRIES)-labels-z3.json --places-file geojson/$(OUTPUT_FILE_PREFIX_COUNTRIES)-points-z4.json --registrations-file geojson/$(OUTPUT_FILE_PREFIX_COUNTRIES)-registrations-z3.json $(OUTPUT_FILE_PREFIX_COUNTRIES)-labels-z3.txt

geojson/$(OUTPUT_FILE_PREFIX_COUNTRIES)-labels-z4.json: $(OUTPUT_FILE_PREFIX_COUNTRIES)-labels-z4.txt
	python dymo/dymo-label.py -z 4 -m 1 --name-field label_z4 --labels-file geojson/$(OUTPUT_FILE_PREFIX_COUNTRIES)-labels-z4.json --places-file geojson/$(OUTPUT_FILE_PREFIX_COUNTRIES)-points-z4.json --registrations-file geojson/$(OUTPUT_FILE_PREFIX_COUNTRIES)-registrations-z4.json $(OUTPUT_FILE_PREFIX_COUNTRIES)-labels-z4.txt

geojson/$(OUTPUT_FILE_PREFIX_COUNTRIES)-labels-z5.json: $(OUTPUT_FILE_PREFIX_COUNTRIES)-labels-z5.txt
	python dymo/dymo-label.py -z 5 -m 1 --name-field label_z5 --labels-file geojson/$(OUTPUT_FILE_PREFIX_COUNTRIES)-labels-z5.json --places-file geojson/$(OUTPUT_FILE_PREFIX_COUNTRIES)-points-z5.json --registrations-file geojson/$(OUTPUT_FILE_PREFIX_COUNTRIES)-registrations-z5.json $(OUTPUT_FILE_PREFIX_COUNTRIES)-labels-z5.txt

geojson/$(OUTPUT_FILE_PREFIX_COUNTRIES)-labels-z6.json: $(OUTPUT_FILE_PREFIX_COUNTRIES)-labels-z6.txt.gz
	python dymo/dymo-label.py -z 6 -m 1 --name-field label_z6 --labels-file geojson/$(OUTPUT_FILE_PREFIX_COUNTRIES)-labels-z6.json --places-file geojson/$(OUTPUT_FILE_PREFIX_COUNTRIES)-points-z6.json --registrations-file geojson/$(OUTPUT_FILE_PREFIX_COUNTRIES)-registrations-z6.json $(OUTPUT_FILE_PREFIX_COUNTRIES)-labels-z6.txt.gz



geojson/$(OUTPUT_FILE_PREFIX_STATES)-labels-z4.json: $(OUTPUT_FILE_PREFIX_STATES)-labels-z4.txt
	python dymo/dymo-label.py -z 4 -m 1 --name-field label_z4 --labels-file geojson/$(OUTPUT_FILE_PREFIX_STATES)-labels-z4.json --places-file geojson/$(OUTPUT_FILE_PREFIX_STATES)-points-z4.json --registrations-file geojson/$(OUTPUT_FILE_PREFIX_STATES)-registrations-z4.json $(OUTPUT_FILE_PREFIX_STATES)-labels-z4.txt

geojson/$(OUTPUT_FILE_PREFIX_STATES)-labels-z5.json: $(OUTPUT_FILE_PREFIX_STATES)-labels-z5.txt
	python dymo/dymo-label.py -z 5 -m 1 --name-field label_z5 --labels-file geojson/$(OUTPUT_FILE_PREFIX_STATES)-labels-z5.json --places-file geojson/$(OUTPUT_FILE_PREFIX_STATES)-points-z5.json --registrations-file geojson/$(OUTPUT_FILE_PREFIX_STATES)-registrations-z5.json $(OUTPUT_FILE_PREFIX_STATES)-labels-z5.txt

geojson/$(OUTPUT_FILE_PREFIX_STATES)-labels-z6.json: $(OUTPUT_FILE_PREFIX_STATES)-labels-z6.txt.gz
	python dymo/dymo-label.py -z 6 -m 1 --name-field label_z6 --labels-file geojson/$(OUTPUT_FILE_PREFIX_STATES)-labels-z6.json --places-file geojson/$(OUTPUT_FILE_PREFIX_STATES)-points-z6.json --registrations-file geojson/$(OUTPUT_FILE_PREFIX_STATES)-registrations-z6.json $(OUTPUT_FILE_PREFIX_STATES)-labels-z6.txt.gz

geojson/$(OUTPUT_FILE_PREFIX_STATES)-labels-z7.json: $(OUTPUT_FILE_PREFIX_STATES)-labels-z7.txt
	python dymo/dymo-label.py -z 7 -m 1 --name-field label_z7 --labels-file geojson/$(OUTPUT_FILE_PREFIX_STATES)-labels-z7.json --places-file geojson/$(OUTPUT_FILE_PREFIX_STATES)-points-z7.json --registrations-file geojson/$(OUTPUT_FILE_PREFIX_STATES)-registrations-z7.json $(OUTPUT_FILE_PREFIX_STATES)-labels-z7.txt

	

../shp/labels_admin/: geojson/$(OUTPUT_FILE_PREFIX_COUNTRIES)-labels-z3.json \
				   		geojson/$(OUTPUT_FILE_PREFIX_COUNTRIES)-labels-z4.json \
				   		geojson/$(OUTPUT_FILE_PREFIX_COUNTRIES)-labels-z5.json \
					    geojson/$(OUTPUT_FILE_PREFIX_COUNTRIES)-labels-z6.json \
					    geojson/$(OUTPUT_FILE_PREFIX_STATES)-labels-z4.json \
					    geojson/$(OUTPUT_FILE_PREFIX_STATES)-labels-z5.json \
					    geojson/$(OUTPUT_FILE_PREFIX_STATES)-labels-z6.json \
					    geojson/$(OUTPUT_FILE_PREFIX_STATES)-labels-z7.json
	rm -f ../shp/labels_admin/*-labels*.* ../shp/labels_admin/*-points*.*  ../shp/labels_admin/*-registrations*.*
	ogr2ogr -f "ESRI Shapefile" ../shp/labels_admin/$(OUTPUT_FILE_PREFIX_COUNTRIES)-labels-z3.shp geojson/$(OUTPUT_FILE_PREFIX_COUNTRIES)-labels-z3.json
	ogr2ogr -f "ESRI Shapefile" ../shp/labels_admin/$(OUTPUT_FILE_PREFIX_COUNTRIES)-points-z3.shp geojson/$(OUTPUT_FILE_PREFIX_COUNTRIES)-points-z3.json
	ogr2ogr -f "ESRI Shapefile" ../shp/labels_admin/$(OUTPUT_FILE_PREFIX_COUNTRIES)-registrations-z3.shp geojson/$(OUTPUT_FILE_PREFIX_COUNTRIES)-registrations-z3.json
	ogr2ogr -f "ESRI Shapefile" ../shp/labels_admin/$(OUTPUT_FILE_PREFIX_COUNTRIES)-labels-z4.shp geojson/$(OUTPUT_FILE_PREFIX_COUNTRIES)-labels-z4.json
	ogr2ogr -f "ESRI Shapefile" ../shp/labels_admin/$(OUTPUT_FILE_PREFIX_COUNTRIES)-points-z4.shp geojson/$(OUTPUT_FILE_PREFIX_COUNTRIES)-points-z4.json
	ogr2ogr -f "ESRI Shapefile" ../shp/labels_admin/$(OUTPUT_FILE_PREFIX_COUNTRIES)-registrations-z4.shp geojson/$(OUTPUT_FILE_PREFIX_COUNTRIES)-registrations-z4.json
	ogr2ogr -f "ESRI Shapefile" ../shp/labels_admin/$(OUTPUT_FILE_PREFIX_COUNTRIES)-labels-z5.shp geojson/$(OUTPUT_FILE_PREFIX_COUNTRIES)-labels-z5.json
	ogr2ogr -f "ESRI Shapefile" ../shp/labels_admin/$(OUTPUT_FILE_PREFIX_COUNTRIES)-points-z5.shp geojson/$(OUTPUT_FILE_PREFIX_COUNTRIES)-points-z5.json
	ogr2ogr -f "ESRI Shapefile" ../shp/labels_admin/$(OUTPUT_FILE_PREFIX_COUNTRIES)-registrations-z5.shp geojson/$(OUTPUT_FILE_PREFIX_COUNTRIES)-registrations-z5.json
	ogr2ogr -f "ESRI Shapefile" ../shp/labels_admin/$(OUTPUT_FILE_PREFIX_COUNTRIES)-labels-z6.shp geojson/$(OUTPUT_FILE_PREFIX_COUNTRIES)-labels-z6.json
	ogr2ogr -f "ESRI Shapefile" ../shp/labels_admin/$(OUTPUT_FILE_PREFIX_COUNTRIES)-points-z6.shp geojson/$(OUTPUT_FILE_PREFIX_COUNTRIES)-points-z6.json
	ogr2ogr -f "ESRI Shapefile" ../shp/labels_admin/$(OUTPUT_FILE_PREFIX_COUNTRIES)-registrations-z6.shp geojson/$(OUTPUT_FILE_PREFIX_COUNTRIES)-registrations-z6.json	
	ogr2ogr -f "ESRI Shapefile" ../shp/labels_admin/$(OUTPUT_FILE_PREFIX_STATES)-labels-z4.shp geojson/$(OUTPUT_FILE_PREFIX_STATES)-labels-z4.json
	ogr2ogr -f "ESRI Shapefile" ../shp/labels_admin/$(OUTPUT_FILE_PREFIX_STATES)-points-z4.shp geojson/$(OUTPUT_FILE_PREFIX_STATES)-points-z4.json
	ogr2ogr -f "ESRI Shapefile" ../shp/labels_admin/$(OUTPUT_FILE_PREFIX_STATES)-registrations-z4.shp geojson/$(OUTPUT_FILE_PREFIX_STATES)-registrations-z4.json
	ogr2ogr -f "ESRI Shapefile" ../shp/labels_admin/$(OUTPUT_FILE_PREFIX_STATES)-labels-z5.shp geojson/$(OUTPUT_FILE_PREFIX_STATES)-labels-z5.json
	ogr2ogr -f "ESRI Shapefile" ../shp/labels_admin/$(OUTPUT_FILE_PREFIX_STATES)-points-z5.shp geojson/$(OUTPUT_FILE_PREFIX_STATES)-points-z5.json
	ogr2ogr -f "ESRI Shapefile" ../shp/labels_admin/$(OUTPUT_FILE_PREFIX_STATES)-registrations-z5.shp geojson/$(OUTPUT_FILE_PREFIX_STATES)-registrations-z5.json
	ogr2ogr -f "ESRI Shapefile" ../shp/labels_admin/$(OUTPUT_FILE_PREFIX_STATES)-labels-z6.shp geojson/$(OUTPUT_FILE_PREFIX_STATES)-labels-z6.json
	ogr2ogr -f "ESRI Shapefile" ../shp/labels_admin/$(OUTPUT_FILE_PREFIX_STATES)-points-z6.shp geojson/$(OUTPUT_FILE_PREFIX_STATES)-points-z6.json
	ogr2ogr -f "ESRI Shapefile" ../shp/labels_admin/$(OUTPUT_FILE_PREFIX_STATES)-registrations-z6.shp geojson/$(OUTPUT_FILE_PREFIX_STATES)-registrations-z6.json	
	ogr2ogr -f "ESRI Shapefile" ../shp/labels_admin/$(OUTPUT_FILE_PREFIX_STATES)-labels-z7.shp geojson/$(OUTPUT_FILE_PREFIX_STATES)-labels-z7.json
	ogr2ogr -f "ESRI Shapefile" ../shp/labels_admin/$(OUTPUT_FILE_PREFIX_STATES)-points-z7.shp geojson/$(OUTPUT_FILE_PREFIX_STATES)-points-z7.json
	ogr2ogr -f "ESRI Shapefile" ../shp/labels_admin/$(OUTPUT_FILE_PREFIX_STATES)-registrations-z7.shp geojson/$(OUTPUT_FILE_PREFIX_STATES)-registrations-z7.json
	touch shp/labels_admin
	
#beware!!!
clean:
	mkdir -p ../shp/labels_admin
	mkdir -p geojson
	rm -f *-labels-z*.t*
	rm -f geojson/*-labels*.json geojson/*-points*.json geojson/*-registrations*.json