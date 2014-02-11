This is the place where are the non-database-y things required to generate the
"Toner" Mapnik stylesheets are kept.

At the end of the day Toner generates stylesheets that can be used by a program
called Mapnik to draw maps. Those maps might be a single large image for print
or a lot of small images for map tiles but as far as Mapnik is concerned there
is an image of a set size that covers a specific geographic area and a bunch of
rules (styles) for how to draw the stuff inside those boxes.

Toner relies on a tool called Cascadenik so that map styles can be defined using
a CSS-like syntax that is a little more friendly than the XML-based markup
language that Mapnik uses by default. With Cascadenik you define two kinds of
files: Things ending in '.mss' are where the actual look and feel for a map;
Things ending in '.mml' are where you define administrative bits like database
passwords and queries for things to show on the map. The '.mml' files also refer to
some '.ini' files which define the location of each required datasource.

The style.mml and related .mss files control the look and feel of the Toner 
cartography. These files are writen in a preprocessor language called Cascadenik.  
If you make changes to the stylesheets, you will need to convert this to the native
XML format that Mapnik supports to render the map tiles. Use the following command:

	make style.xml

Which is really just a shortcut for typing this:

	cascadenik-compile.py style.mml > style.xml

This will take your 'style.mml' and all the '.mss' files (the instructions that
define the look and feel of the Toner maps) and smush them together to create a
new file called 'style.xml'. This new file is what Mapnik uses to render maps.

If you're not sure what the "Make" program is, don't worry. It is a very old
tool that was written to automate a series of discrete tasks and give them
labels so that they can be invoked (repeated) with a minimum of fuss.

Since Toner now consists of several different styles, you can make them all using this command:

	make all-styles
	
This is equivalent to typing

	make style-toner-standard.xml
	make toner-hybrid-with-labels.xml
	make toner-hybrid-only-labels.xml
	make toner-hybrid-only-lines.xml

There are also other Make commands for testing changes to the stylesheet by
generating images of cities all over the world at different zoom levels. To test
your Toner stylesheet you would type:

	make all
	
Or simply:
	
	make

Which is the equivalent of typing:

	cascadenik-compile.py style.mml > style.xml
	python mapnik-render.py -f fonts -s style.xml -l 0 0 -z 1 -d 1024 600 -o low-zoom-world-1.png
	python mapnik-render.py -f fonts -s style.xml -l 0 0 -z 2 -d 1024 600 -o low-zoom-world-2.png
	python mapnik-render.py -f fonts -s style.xml -l 38 -90 -z 3 -d 1024 600 -o low-zoom-world-usa-3.png
	...and so on...

The sample images will be stored in the 'mapnik/renders/' directory. If you make any changes after you have rendered these images, you can use the following command to delete the generated images and remove old .xml files:

	make clean

After you've created your new 'style.xml' file you could also create images for specific parts of the world. Use the 'nik2img' program that is included with Mapnik to render a map of the USA like this:

	nik2img.py -b -126 24 -66 49 -s 900913 -d 1024 768 \
		--fonts=fonts/Arial.ttf,fonts/Arial\ Bold.ttf,fonts/Arial\ Italic.ttf \
		style.xml usa.png

A sample 'usa.png' rendering is included in the 'examples' directory.

If you wanted to use the TileStache server libraries to draw map tiles using
Mapnik, you must copy your style.xml from the 'mapnik' directory into the 'tilestache' directory. The makefile will do this for you if you run the following command 
(from inside the 'mapnik' directory):

	make tilestache-update
	
Then, before you run TileStache, you would create a new layer (in your TileStache config file) like this:

	"toner": {
		"provider": {
			"name": "mapnik",
			"mapfile": "/path/to/mapnik/style.xml",
			"fonts": "/path/to/mapnik/fonts"
		},
		"projection": "spherical mercator",
		"metatile": { "rows": 4, "columns": 4 }
	}

Take a look in the 'tilestache' directory for more details about using the
Toner stylesheets with TileStache.

Toner comes in 3 flavors!
--

* **More Toner flavors**: Introduces specific flavors of Toner optimized for [map sandwiches](http://blogs.esri.com/esri/arcgis/2009/07/13/the-map-sandwich/), easy to integrating with and promoting your custom map stories: toner-standard ([toner](tilefarm.stamen.com/toner-2012)), toner-hybrid-with-labels ([toner-hybrid](tilefarm.stamen.com/toner-hybrid-with-labels)), toner-hybrid-only-lines ([toner-lines](tilefarm.stamen.com/toner-lines)), toner-hybrid-only-labels ([toner-labels](tilefarm.stamen.com/toner-labels)), toner-no-labels ([toner-background](tilefarm.stamen.com/toner-no-labels)).

Option 1:
---
Normally we want to show the labels with the basemap. 

The MML file would then read:
     
    <Stylesheet src="naturalearth-lowzooms.mss"/>
    <Stylesheet src="stylesheet.mss"/> 
    <Stylesheet src="labels.mss"/>
    <!-- 
          <Stylesheet src="labels_only.mss"/>  
    -->
     
Option 2: 
---
For map-only (no label) render
    
The MML file would then read:
     
    <Stylesheet src="naturalearth-lowzooms.mss"/>
    <Stylesheet src="stylesheet.mss"/> 
    <!-- 
          <Stylesheet src="labels.mss"/>
          <Stylesheet src="labels_only.mss"/>  
    -->
     
Option 3:
---
For labels-only render, we want the map background to be transparent, not black.

The MML file would then read:
         
    <!--  <Stylesheet src="naturalearth-lowzooms.mss"/>
          <Stylesheet src="stylesheet.mss"/> 
    -->
    <Stylesheet src="labels.mss"/>
    <Stylesheet src="labels_only.mss"/>
