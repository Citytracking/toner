This is the place where are the non-database-y things required to generate the
"Toner" Mapnik stylesheets are kept.

The first thing you'll need to do is create a 'style.mml' file that contains all
of your database configurations. There is an example file in the 'mapnik' folder
called 'style.mml.example' that you can start with. Just fill in the places
where it says "CHANGE TO YOUR..." with the relevant values and rename the file
as 'style.mml'.

(This Git repository has been configured to ignore any files ending in '.mml' so
that sensitive data like database passwords aren't accidentally checked in and
shared with people you don't want to see that kind of thing.)

Once you've create your 'style.mml' file you can type (from inside the 'mapnik'
directory):

	make style.xml

Which is really just a shortcut for typing this:

	cascadenik-compile.py style.mml > style.xml

This will take your 'style.mml' and all the '.mss' files (the things that define
the look and feel of the Toner maps) and smush them together to create a new
file called 'style.xml'. This new file is what Mapnik uses to render maps.

There are also other Make commands for testing changes to the stylesheet by
generating images of cities all over the world at different zoom levels. To test
your Toner stylesheet for low (zoomed out) levels you would type:

	$> make low-zoom-world.html
	cascadenik-compile.py style.mml > style.xml
	python mapnik-render.py -f fonts -s style.xml -l 0 0 -z 1 -d 1024 600 -o low-zoom-world-1.png
	python mapnik-render.py -f fonts -s style.xml -l 0 0 -z 2 -d 1024 600 -o low-zoom-world-2.png
	python mapnik-render.py -f fonts -s style.xml -l 38 -90 -z 3 -d 1024 600 -o low-zoom-world-usa-3.png
	...and so on...

(If you're not sure what the "Make" program is, don't worry. It is a very old
tool that was written to automate a series of discrete tasks and give them
labels so that they can be invoked (repeated) with a minimum of fuss.
