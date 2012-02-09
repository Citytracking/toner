SFO_LATLON = 37.764740 -122.419523
OAK_LATLON = 37.807613 -122.279891
NYC_LATLON = 40.756749 -73.998284
DC_LATLON = 38.90254 -77.03944
LON_LATLON = 51.507553 -0.008271
MOS_LATLON = 55.882322 37.724175
TOKYO_LATLON = 35.6595 139.7004

all: index.html

index.html: \
	renders/low-zoom-world-1.png renders/low-zoom-world-2.png \
	renders/low-zoom-world-usa-3.png renders/low-zoom-world-berlin-3.png \
	renders/low-zoom-world-tokyo-3.png renders/low-zoom-world-usa-4.png \
	renders/low-zoom-world-berlin-4.png renders/low-zoom-world-tokyo-4.png \
	renders/low-zoom-world-dc-5.png renders/low-zoom-world-berlin-5.png \
	renders/low-zoom-world-tokyo-5.png renders/low-zoom-world-oakland-5.png \
	renders/low-zoom-world-dc-6.png renders/low-zoom-world-berlin-6.png \
	renders/low-zoom-world-tokyo-6.png renders/low-zoom-world-oakland-6.png \
	renders/low-zoom-world-dc-7.png renders/low-zoom-world-berlin-7.png \
	renders/low-zoom-world-tokyo-7.png renders/low-zoom-world-oakland-7.png \
	renders/low-zoom-world-dc-8.png renders/low-zoom-world-berlin-8.png \
	renders/low-zoom-world-tokyo-8.png renders/low-zoom-world-oakland-8.png \
	renders/low-zoom-world-dc-9.png renders/low-zoom-world-berlin-9.png \
	renders/low-zoom-world-tokyo-9.png renders/low-zoom-world-oakland-9.png \
	renders/sanfrancisco-10.png renders/sanfrancisco-11.png renders/sanfrancisco-12.png \
	renders/sanfrancisco-13.png renders/sanfrancisco-14.png renders/sanfrancisco-15.png \
	renders/sanfrancisco-16.png renders/sanfrancisco-17.png renders/sanfrancisco-18.png \
	renders/sanfrancisco-19.png \
	renders/oakland-10.png renders/oakland-11.png renders/oakland-12.png \
	renders/oakland-13.png renders/oakland-14.png renders/oakland-15.png \
	renders/oakland-16.png renders/oakland-17.png renders/oakland-18.png \
	renders/oakland-19.png \
	renders/newyork-10.png renders/newyork-11.png renders/newyork-12.png \
	renders/newyork-13.png renders/newyork-14.png renders/newyork-15.png \
	renders/newyork-16.png renders/newyork-17.png renders/newyork-18.png \
	 renders/newyork-19.png \
	renders/dc-10.png renders/dc-11.png renders/dc-12.png \
	renders/dc-13.png renders/dc-14.png renders/dc-15.png \
	renders/dc-16.png renders/dc-17.png renders/dc-18.png \
	 renders/dc-19.png \
	renders/london-10.png renders/london-11.png renders/london-12.png \
	renders/london-13.png renders/london-14.png renders/london-15.png \
	renders/london-16.png renders/london-17.png renders/london-18.png \
	renders/london-19.png \
	renders/moscow-10.png renders/moscow-11.png renders/moscow-12.png \
	renders/moscow-13.png renders/moscow-14.png renders/moscow-15.png \
	renders/moscow-16.png renders/moscow-17.png renders/moscow-18.png \
	renders/moscow-19.png



renders/low-zoom-world-1.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l 0 0 -z 1 -d 1024 600 -o $@

renders/low-zoom-world-2.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l 0 0 -z 2 -d 1024 600 -o $@

renders/low-zoom-world-usa-3.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l 38 -90 -z 3 -d 1024 600 -o $@

renders/low-zoom-world-usa-4.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l 38 -90 -z 4 -d 1024 600 -o $@


renders/low-zoom-world-dc-5.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l 38.8893 -77.0502 -z 5 -d 1024 600 -o $@

renders/low-zoom-world-dc-6.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l 38.8893 -77.0502 -z 6 -d 1024 600 -o $@

renders/low-zoom-world-dc-7.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l 38.8893 -77.0502 -z 7 -d 1024 600 -o $@

renders/low-zoom-world-dc-8.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l 38.8893 -77.0502 -z 8 -d 1024 600 -o $@

renders/low-zoom-world-dc-9.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l 38.8893 -77.0502 -z 9 -d 1024 600 -o $@


renders/low-zoom-world-berlin-3.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l 52.5096 13.3765 -z 3 -d 1024 600 -o $@

renders/low-zoom-world-berlin-4.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l 52.5096 13.3765 -z 4 -d 1024 600 -o $@

renders/low-zoom-world-berlin-5.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l 52.5096 13.3765 -z 5 -d 1024 600 -o $@

renders/low-zoom-world-berlin-6.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l 52.5096 13.3765 -z 6 -d 1024 600 -o $@

renders/low-zoom-world-berlin-7.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l 52.5096 13.3765 -z 7 -d 1024 600 -o $@

renders/low-zoom-world-berlin-8.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l 52.5096 13.3765 -z 8 -d 1024 600 -o $@

renders/low-zoom-world-berlin-9.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l 52.5096 13.3765 -z 9 -d 1024 600 -o $@


renders/low-zoom-world-tokyo-3.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l 35.6595 90 -z 3 -d 1024 600 -o $@

renders/low-zoom-world-tokyo-4.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l 35.6595 135 -z 4 -d 1024 600 -o $@

renders/low-zoom-world-tokyo-5.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l 35.6595 139.7004 -z 5 -d 1024 600 -o $@

renders/low-zoom-world-tokyo-6.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l 35.6595 139.7004 -z 6 -d 1024 600 -o $@

renders/low-zoom-world-tokyo-7.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l 35.6595 139.7004 -z 7 -d 1024 600 -o $@

renders/low-zoom-world-tokyo-8.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l 35.6595 139.7004 -z 8 -d 1024 600 -o $@

renders/low-zoom-world-tokyo-9.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l 35.6595 139.7004 -z 9 -d 1024 600 -o $@


renders/low-zoom-world-oakland-5.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(SFO_LATLON) -z 5 -d 1024 600 -o $@

renders/low-zoom-world-oakland-6.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(SFO_LATLON) -z 6 -d 1024 600 -o $@

renders/low-zoom-world-oakland-7.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(SFO_LATLON) -z 7 -d 1024 600 -o $@

renders/low-zoom-world-oakland-8.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(SFO_LATLON) -z 8 -d 1024 600 -o $@

renders/low-zoom-world-oakland-9.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(SFO_LATLON) -z 9 -d 1024 600 -o $@


renders/sanfrancisco-10.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(SFO_LATLON) -z 10 -d 1024 512 -o $@

renders/sanfrancisco-11.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(SFO_LATLON) -z 11 -d 1024 512 -o $@

renders/sanfrancisco-12.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(SFO_LATLON) -z 12 -d 1024 512 -o $@

renders/sanfrancisco-13.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(SFO_LATLON) -z 13 -d 1024 512 -o $@

renders/sanfrancisco-14.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(SFO_LATLON) -z 14 -d 1024 512 -o $@

renders/sanfrancisco-15.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(SFO_LATLON) -z 15 -d 1024 512 -o $@

renders/sanfrancisco-16.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(SFO_LATLON) -z 16 -d 1024 512 -o $@

renders/sanfrancisco-17.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(SFO_LATLON) -z 17 -d 1024 512 -o $@

renders/sanfrancisco-18.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(SFO_LATLON) -z 18 -d 1024 512 -o $@

renders/sanfrancisco-19.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(SFO_LATLON) -z 19 -d 1024 512 -o $@


renders/oakland-10.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(OAK_LATLON) -z 10 -d 1024 512 -o $@

renders/oakland-11.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(OAK_LATLON) -z 11 -d 1024 512 -o $@

renders/oakland-12.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(OAK_LATLON) -z 12 -d 1024 512 -o $@

renders/oakland-13.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(OAK_LATLON) -z 13 -d 1024 512 -o $@

renders/oakland-14.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(OAK_LATLON) -z 14 -d 1024 512 -o $@

renders/oakland-15.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(OAK_LATLON) -z 15 -d 1024 512 -o $@

renders/oakland-16.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(OAK_LATLON) -z 16 -d 1024 512 -o $@

renders/oakland-17.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(OAK_LATLON) -z 17 -d 1024 512 -o $@

renders/oakland-18.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(OAK_LATLON) -z 18 -d 1024 512 -o $@

renders/oakland-19.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(OAK_LATLON) -z 19 -d 1024 512 -o $@


renders/newyork-10.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(NYC_LATLON) -z 10 -d 1024 512 -o $@

renders/newyork-11.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(NYC_LATLON) -z 11 -d 1024 512 -o $@

renders/newyork-12.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(NYC_LATLON) -z 12 -d 1024 512 -o $@

renders/newyork-13.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(NYC_LATLON) -z 13 -d 1024 512 -o $@

renders/newyork-14.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(NYC_LATLON) -z 14 -d 1024 512 -o $@

renders/newyork-15.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(NYC_LATLON) -z 15 -d 1024 512 -o $@

renders/newyork-16.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(NYC_LATLON) -z 16 -d 1024 512 -o $@

renders/newyork-17.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(NYC_LATLON) -z 17 -d 1024 512 -o $@

renders/newyork-18.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(NYC_LATLON) -z 18 -d 1024 512 -o $@

renders/newyork-19.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(NYC_LATLON) -z 19 -d 1024 512 -o $@
	
	
renders/dc-10.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(DC_LATLON) -z 10 -d 1024 512 -o $@

renders/dc-11.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(DC_LATLON) -z 11 -d 1024 512 -o $@

renders/dc-12.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(DC_LATLON) -z 12 -d 1024 512 -o $@

renders/dc-13.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(DC_LATLON) -z 13 -d 1024 512 -o $@

renders/dc-14.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(DC_LATLON) -z 14 -d 1024 512 -o $@

renders/dc-15.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(DC_LATLON) -z 15 -d 1024 512 -o $@

renders/dc-16.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(DC_LATLON) -z 16 -d 1024 512 -o $@

renders/dc-17.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(DC_LATLON) -z 17 -d 1024 512 -o $@

renders/dc-18.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(DC_LATLON) -z 18 -d 1024 512 -o $@

renders/dc-19.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(DC_LATLON) -z 19 -d 1024 512 -o $@	



renders/london-10.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(LON_LATLON) -z 10 -d 1024 512 -o $@

renders/london-11.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(LON_LATLON) -z 11 -d 1024 512 -o $@

renders/london-12.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(LON_LATLON) -z 12 -d 1024 512 -o $@

renders/london-13.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(LON_LATLON) -z 13 -d 1024 512 -o $@

renders/london-14.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(LON_LATLON) -z 14 -d 1024 512 -o $@

renders/london-15.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(LON_LATLON) -z 15 -d 1024 512 -o $@

renders/london-16.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(LON_LATLON) -z 16 -d 1024 512 -o $@

renders/london-17.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(LON_LATLON) -z 17 -d 1024 512 -o $@

renders/london-18.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(LON_LATLON) -z 18 -d 1024 512 -o $@

renders/london-19.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(LON_LATLON) -z 19 -d 1024 512 -o $@



renders/moscow-10.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(TOKYO_LATLON) -z 10 -d 1024 512 -o $@

renders/moscow-11.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(TOKYO_LATLON) -z 11 -d 1024 512 -o $@

renders/moscow-12.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(TOKYO_LATLON) -z 12 -d 1024 512 -o $@

renders/moscow-13.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(TOKYO_LATLON) -z 13 -d 1024 512 -o $@

renders/moscow-14.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(TOKYO_LATLON) -z 14 -d 1024 512 -o $@

renders/moscow-15.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(TOKYO_LATLON) -z 15 -d 1024 512 -o $@

renders/moscow-16.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(TOKYO_LATLON) -z 16 -d 1024 512 -o $@

renders/moscow-17.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(TOKYO_LATLON) -z 17 -d 1024 512 -o $@

renders/moscow-18.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(TOKYO_LATLON) -z 18 -d 1024 512 -o $@

renders/moscow-19.png: style.xml
	python mapnik-render.py -f ../fonts -s style.xml -l $(TOKYO_LATLON) -z 19 -d 1024 512 -o $@



style.xml: style.mml stylesheet.mss naturalearth-lowzooms.mss
	cascadenik-compile.py style.mml style.xml

clean:
	rm -f low-zoom-world-*.png
	rm -f sanfrancisco-*.png
	rm -f oakland-*.png
	rm -f newyork-*.png
	rm -f london-*.png
	rm -f moscow-*.png
	rm -f style.xml
