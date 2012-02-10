# make -j4 renders/*-10.*
# make -j4 renders/*-10-hybrid.*

INPUT_POINT_FILE=Australia-New-Zealand-all.txt.gz
OUTPUT_FILE_PREFIX=australia-new-zealand

FONT_TTF="../fonts/Arial.ttf"
FONT_TTF2="../fonts/Arial Bold.ttf"
FONTS_Z4= --font 0 $(FONT_TTF) 10  --font 25000 $(FONT_TTF) 10  --font 100000 $(FONT_TTF) 10  --font 1000000 $(FONT_TTF) 14
FONTS_Z5= --font 0 $(FONT_TTF) 12  --font 25000 $(FONT_TTF) 12  --font 100000 $(FONT_TTF) 12  --font 1000000 $(FONT_TTF) 16
FONTS_Z6= --font 0 $(FONT_TTF) 12  --font 25000 $(FONT_TTF) 12  --font 100000 $(FONT_TTF) 12  --font 1000000 $(FONT_TTF) 18
FONTS_Z7= --font 0 $(FONT_TTF2) 12  --font 25000 $(FONT_TTF2) 12  --font 100000 $(FONT_TTF2) 12  --font 1000000 $(FONT_TTF2) 18
FONTS_Z8= --font 0 $(FONT_TTF2) 13  --font 25000 $(FONT_TTF2) 13  --font 100000 $(FONT_TTF2) 20  --font 1000000 $(FONT_TTF2) 20
FONTS_Z9= --font 0 $(FONT_TTF2) 13  --font 25000 $(FONT_TTF2) 13  --font 100000 $(FONT_TTF2) 20  --font 1000000 $(FONT_TTF2) 20
FONTS_Z10= --font 0 $(FONT_TTF2) 13  --font 25000 $(FONT_TTF2) 13  --font 100000 $(FONT_TTF2) 20  --font 1000000 $(FONT_TTF2) 20
#FONTS_Z11= --font 0 $(FONT_TTF22) 22  --font 20 $(FONT_TTF2) 16 --font 50 $(FONT_TTF2) 12


all: ../shp/labels/


$(OUTPUT_FILE_PREFIX)-labels-z4.txt: $(INPUT_POINT_FILE)
	python dymo/dymo-prepare-places.py -z 4 $(FONTS_Z4) $(INPUT_POINT_FILE) $@

$(OUTPUT_FILE_PREFIX)-labels-z5.txt: $(INPUT_POINT_FILE)
	python dymo/dymo-prepare-places.py -z 5 $(FONTS_Z5) $(INPUT_POINT_FILE) $@

$(OUTPUT_FILE_PREFIX)-labels-z6.txt.gz: $(INPUT_POINT_FILE)
	python dymo/dymo-prepare-places.py -z 6 $(FONTS_Z6) $(INPUT_POINT_FILE) $@

$(OUTPUT_FILE_PREFIX)-labels-z7.txt.gz: $(INPUT_POINT_FILE)
	python dymo/dymo-prepare-places.py -z 7 $(FONTS_Z7) $(INPUT_POINT_FILE) $@

$(OUTPUT_FILE_PREFIX)-labels-z8.txt.gz: $(INPUT_POINT_FILE)
	python dymo/dymo-prepare-places.py -z 8 $(FONTS_Z8) $(INPUT_POINT_FILE) $@

$(OUTPUT_FILE_PREFIX)-labels-z9.txt.gz: $(INPUT_POINT_FILE)
	python dymo/dymo-prepare-places.py -z 9 $(FONTS_Z9) $(INPUT_POINT_FILE) $@

$(OUTPUT_FILE_PREFIX)-labels-z10.txt.gz: $(INPUT_POINT_FILE)
	python dymo/dymo-prepare-places.py -z 10 $(FONTS_Z10) $(INPUT_POINT_FILE) $@



geojson/$(OUTPUT_FILE_PREFIX)-labels-z4.json: $(OUTPUT_FILE_PREFIX)-labels-z4.txt
	python dymo/dymo-label.py -z 4 -m 100  --labels-file geojson/$(OUTPUT_FILE_PREFIX)-labels-z4.json --places-file geojson/$(OUTPUT_FILE_PREFIX)-points-z4.json --registrations-file geojson/$(OUTPUT_FILE_PREFIX)-registrations-z4.json $(OUTPUT_FILE_PREFIX)-labels-z4.txt

geojson/$(OUTPUT_FILE_PREFIX)-labels-z5.json: $(OUTPUT_FILE_PREFIX)-labels-z5.txt
	python dymo/dymo-label.py -z 5 -m 100  --labels-file geojson/$(OUTPUT_FILE_PREFIX)-labels-z5.json --places-file geojson/$(OUTPUT_FILE_PREFIX)-points-z5.json --registrations-file geojson/$(OUTPUT_FILE_PREFIX)-registrations-z5.json $(OUTPUT_FILE_PREFIX)-labels-z5.txt

geojson/$(OUTPUT_FILE_PREFIX)-labels-z6.json: $(OUTPUT_FILE_PREFIX)-labels-z6.txt.gz
	python dymo/dymo-label.py -z 6 -m 100  --labels-file geojson/$(OUTPUT_FILE_PREFIX)-labels-z6.json --places-file geojson/$(OUTPUT_FILE_PREFIX)-points-z6.json --registrations-file geojson/$(OUTPUT_FILE_PREFIX)-registrations-z6.json $(OUTPUT_FILE_PREFIX)-labels-z6.txt.gz

geojson/$(OUTPUT_FILE_PREFIX)-labels-z7.json: $(OUTPUT_FILE_PREFIX)-labels-z7.txt.gz
	python dymo/dymo-label.py -z 7 -m 1000  --labels-file geojson/$(OUTPUT_FILE_PREFIX)-labels-z7.json --places-file geojson/$(OUTPUT_FILE_PREFIX)-points-z7.json --registrations-file geojson/$(OUTPUT_FILE_PREFIX)-registrations-z7.json $(OUTPUT_FILE_PREFIX)-labels-z7.txt.gz
	
geojson/$(OUTPUT_FILE_PREFIX)-labels-z8.json: $(OUTPUT_FILE_PREFIX)-labels-z8.txt.gz
	python dymo/dymo-label.py -z 8 -m 10000  --labels-file geojson/$(OUTPUT_FILE_PREFIX)-labels-z8.json --places-file geojson/$(OUTPUT_FILE_PREFIX)-points-z8.json --registrations-file geojson/$(OUTPUT_FILE_PREFIX)-registrations-z8.json $(OUTPUT_FILE_PREFIX)-labels-z8.txt.gz
	
geojson/$(OUTPUT_FILE_PREFIX)-labels-z9.json: $(OUTPUT_FILE_PREFIX)-labels-z9.txt.gz
	python dymo/dymo-label.py -z 9 -m 10000  --labels-file geojson/$(OUTPUT_FILE_PREFIX)-labels-z9.json --places-file geojson/$(OUTPUT_FILE_PREFIX)-points-z9.json --registrations-file geojson/$(OUTPUT_FILE_PREFIX)-registrations-z9.json $(OUTPUT_FILE_PREFIX)-labels-z9.txt.gz
	
geojson/$(OUTPUT_FILE_PREFIX)-labels-z10.json: $(OUTPUT_FILE_PREFIX)-labels-z10.txt.gz
	python dymo/dymo-label.py -z 10 -m 15000  --labels-file geojson/$(OUTPUT_FILE_PREFIX)-labels-z10.json --places-file geojson/$(OUTPUT_FILE_PREFIX)-points-z10.json --registrations-file geojson/$(OUTPUT_FILE_PREFIX)-registrations-z10.json $(OUTPUT_FILE_PREFIX)-labels-z10.txt.gz

	

../shp/labels/: geojson/$(OUTPUT_FILE_PREFIX)-labels-z4.json \
				   geojson/$(OUTPUT_FILE_PREFIX)-labels-z5.json \
				   geojson/$(OUTPUT_FILE_PREFIX)-labels-z6.json \
				   geojson/$(OUTPUT_FILE_PREFIX)-labels-z7.json \
				   geojson/$(OUTPUT_FILE_PREFIX)-labels-z8.json \
				   geojson/$(OUTPUT_FILE_PREFIX)-labels-z9.json \
				   geojson/$(OUTPUT_FILE_PREFIX)-labels-z10.json
	rm -f ../shp/labels/*-labels*.* ../shp/labels/*-points*.*  ../shp/labels/*-registrations*.*
	ogr2ogr -f "ESRI Shapefile" ../shp/labels/$(OUTPUT_FILE_PREFIX)-labels-z4.shp geojson/$(OUTPUT_FILE_PREFIX)-labels-z4.json
	ogr2ogr -f "ESRI Shapefile" ../shp/labels/$(OUTPUT_FILE_PREFIX)-points-z4.shp geojson/$(OUTPUT_FILE_PREFIX)-points-z4.json
	ogr2ogr -f "ESRI Shapefile" ../shp/labels/$(OUTPUT_FILE_PREFIX)-registrations-z4.shp geojson/$(OUTPUT_FILE_PREFIX)-registrations-z4.json
	ogr2ogr -f "ESRI Shapefile" ../shp/labels/$(OUTPUT_FILE_PREFIX)-labels-z5.shp geojson/$(OUTPUT_FILE_PREFIX)-labels-z5.json
	ogr2ogr -f "ESRI Shapefile" ../shp/labels/$(OUTPUT_FILE_PREFIX)-points-z5.shp geojson/$(OUTPUT_FILE_PREFIX)-points-z5.json
	ogr2ogr -f "ESRI Shapefile" ../shp/labels/$(OUTPUT_FILE_PREFIX)-registrations-z5.shp geojson/$(OUTPUT_FILE_PREFIX)-registrations-z5.json
	ogr2ogr -f "ESRI Shapefile" ../shp/labels/$(OUTPUT_FILE_PREFIX)-labels-z6.shp geojson/$(OUTPUT_FILE_PREFIX)-labels-z6.json
	ogr2ogr -f "ESRI Shapefile" ../shp/labels/$(OUTPUT_FILE_PREFIX)-points-z6.shp geojson/$(OUTPUT_FILE_PREFIX)-points-z6.json
	ogr2ogr -f "ESRI Shapefile" ../shp/labels/$(OUTPUT_FILE_PREFIX)-registrations-z6.shp geojson/$(OUTPUT_FILE_PREFIX)-registrations-z6.json
	ogr2ogr -f "ESRI Shapefile" ../shp/labels/$(OUTPUT_FILE_PREFIX)-labels-z7.shp geojson/$(OUTPUT_FILE_PREFIX)-labels-z7.json
	ogr2ogr -f "ESRI Shapefile" ../shp/labels/$(OUTPUT_FILE_PREFIX)-points-z7.shp geojson/$(OUTPUT_FILE_PREFIX)-points-z7.json
	ogr2ogr -f "ESRI Shapefile" ../shp/labels/$(OUTPUT_FILE_PREFIX)-registrations-z7.shp geojson/$(OUTPUT_FILE_PREFIX)-registrations-z7.json
	ogr2ogr -f "ESRI Shapefile" ../shp/labels/$(OUTPUT_FILE_PREFIX)-labels-z8.shp geojson/$(OUTPUT_FILE_PREFIX)-labels-z8.json
	ogr2ogr -f "ESRI Shapefile" ../shp/labels/$(OUTPUT_FILE_PREFIX)-points-z8.shp geojson/$(OUTPUT_FILE_PREFIX)-points-z8.json
	ogr2ogr -f "ESRI Shapefile" ../shp/labels/$(OUTPUT_FILE_PREFIX)-registrations-z8.shp geojson/$(OUTPUT_FILE_PREFIX)-registrations-z8.json
	ogr2ogr -f "ESRI Shapefile" ../shp/labels/$(OUTPUT_FILE_PREFIX)-labels-z9.shp geojson/$(OUTPUT_FILE_PREFIX)-labels-z9.json
	ogr2ogr -f "ESRI Shapefile" ../shp/labels/$(OUTPUT_FILE_PREFIX)-points-z9.shp geojson/$(OUTPUT_FILE_PREFIX)-points-z9.json
	ogr2ogr -f "ESRI Shapefile" ../shp/labels/$(OUTPUT_FILE_PREFIX)-registrations-z9.shp geojson/$(OUTPUT_FILE_PREFIX)-registrations-z9.json
	ogr2ogr -f "ESRI Shapefile" ../shp/labels/$(OUTPUT_FILE_PREFIX)-labels-z10.shp geojson/$(OUTPUT_FILE_PREFIX)-labels-z10.json
	ogr2ogr -f "ESRI Shapefile" ../shp/labels/$(OUTPUT_FILE_PREFIX)-points-z10.shp geojson/$(OUTPUT_FILE_PREFIX)-points-z10.json
	ogr2ogr -f "ESRI Shapefile" ../shp/labels/$(OUTPUT_FILE_PREFIX)-registrations-z10.shp geojson/$(OUTPUT_FILE_PREFIX)-registrations-z10.json
	
	touch shp/labels
	
	
clean:
	mkdir -p ../shp/labels
	mkdir -p geojson
	rm -f *-labels-z*.t*
	rm -f geojson/*-labels*.json geojson/*-points*.json geojson/*-registrations*.json