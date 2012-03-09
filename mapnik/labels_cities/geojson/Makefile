ZOOMS456789=australia-new-zealand asia south-america africa europe north-america

ZOOMS10=australia-new-zealand south-america africa

all: \
	$(ZOOMS456789:%=%-labels-z4.json) \
	$(ZOOMS456789:%=%-labels-z5.json) \
	$(ZOOMS456789:%=%-labels-z6.json) \
	$(ZOOMS456789:%=%-labels-z7.json) \
	$(ZOOMS456789:%=%-labels-z8.json) \
	$(ZOOMS456789:%=%-labels-z9.json) \
	$(ZOOMS10:%=%-labels-z10.json) \
	$(ZOOMS456789:%=%-points-z4.json) \
	$(ZOOMS456789:%=%-points-z5.json) \
	$(ZOOMS456789:%=%-points-z6.json) \
	$(ZOOMS456789:%=%-points-z7.json) \
	$(ZOOMS456789:%=%-points-z8.json) \
	$(ZOOMS456789:%=%-points-z9.json) \
	$(ZOOMS10:%=%-points-z10.json) \
	$(ZOOMS456789:%=%-registrations-z4.json) \
	$(ZOOMS456789:%=%-registrations-z5.json) \
	$(ZOOMS456789:%=%-registrations-z6.json) \
	$(ZOOMS456789:%=%-registrations-z7.json) \
	$(ZOOMS456789:%=%-registrations-z8.json) \
	$(ZOOMS456789:%=%-registrations-z9.json) \
	$(ZOOMS10:%=%-registrations-z10.json)
	
	touch ../../shp/labels	

%-labels-z4.json:
	ogr2ogr -f "ESRI Shapefile" ../../shp/labels/$*-labels-z4.shp $@
%-points-z4.json:
	ogr2ogr -f "ESRI Shapefile" ../../shp/labels/$*-points-z4.shp $@
%-registrations-z4.json:
	ogr2ogr -f "ESRI Shapefile" ../../shp/labels/$*-registrations-z4.shp $@

%-labels-z5.json:
	ogr2ogr -f "ESRI Shapefile" ../../shp/labels/$*-labels-z5.shp $@
%-points-z5.json:
	ogr2ogr -f "ESRI Shapefile" ../../shp/labels/$*-points-z5.shp $@
%-registrations-z5.json:
	ogr2ogr -f "ESRI Shapefile" ../../shp/labels/$*-registrations-z5.shp $@

%-labels-z6.json:
	ogr2ogr -f "ESRI Shapefile" ../../shp/labels/$*-labels-z6.shp $@
%-points-z6.json:
	ogr2ogr -f "ESRI Shapefile" ../../shp/labels/$*-points-z6.shp $@
%-registrations-z6.json:
	ogr2ogr -f "ESRI Shapefile" ../../shp/labels/$*-registrations-z6.shp $@

%-labels-z7.json:
	ogr2ogr -f "ESRI Shapefile" ../../shp/labels/$*-labels-z7.shp $@
%-points-z7.json:
	ogr2ogr -f "ESRI Shapefile" ../../shp/labels/$*-points-z7.shp $@
%-registrations-z7.json:
	ogr2ogr -f "ESRI Shapefile" ../../shp/labels/$*-registrations-z7.shp $@

%-labels-z8.json:
	ogr2ogr -f "ESRI Shapefile" ../../shp/labels/$*-labels-z8.shp $@
%-points-z8.json:
	ogr2ogr -f "ESRI Shapefile" ../../shp/labels/$*-points-z8.shp $@
%-registrations-z8.json:
	ogr2ogr -f "ESRI Shapefile" ../../shp/labels/$*-registrations-z8.shp $@

%-labels-z9.json:
	ogr2ogr -f "ESRI Shapefile" ../../shp/labels/$*-labels-z9.shp $@
%-points-z9.json:
	ogr2ogr -f "ESRI Shapefile" ../../shp/labels/$*-points-z9.shp $@
%-registrations-z9.json:
	ogr2ogr -f "ESRI Shapefile" ../../shp/labels/$*-registrations-z9.shp $@

%-labels-z10.json:
	ogr2ogr -f "ESRI Shapefile" ../../shp/labels/$*-labels-z10.shp $@
%-points-z10.json:
	ogr2ogr -f "ESRI Shapefile" ../../shp/labels/$*-points-z10.shp $@
%-registrations-z10.json:
	ogr2ogr -f "ESRI Shapefile" ../../shp/labels/$*-registrations-z10.shp $@
		
clean:
	mkdir -p ../../shp/labels
	rm -f ../../shp/labels/*-labels*.* ../../shp/labels/*-points*.*  ../../shp/labels/*-registrations*.*
