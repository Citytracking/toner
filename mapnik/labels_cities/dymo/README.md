Dymo
====

Dymo is a placement script for map labels, isolated from the purpose-built code in
[GeoIQ’s Acetate](https://github.com/fortiusone/acetate). Dymo resolves positions for
densely-packed point labels, and results in layouts make your maps look like they’ve been
[touched by a cartographer](http://www.flickr.com/photos/mmigurski/5194528400/sizes/l/in/photostream/).

Dymo uses [Simulated Annealing](http://en.wikipedia.org/wiki/Simulated_annealing)
to derive an acceptable global label set, described in Steven Wouderberg’s
[October 2007 presentation](http://www.cs.uu.nl/docs/vakken/gd/steven2.pdf)
at Utrecht University. See an animation of the process over time in these two
videos of U.S. and European place names:

<p>
    <a href="http://vimeo.com/migurski/dymo-n-america"><img src="https://github.com/migurski/Dymo/raw/master/images/us-video-still.jpg" width="440" height="219">
    <a href="http://vimeo.com/migurski/dymo-europe"><img src="https://github.com/migurski/Dymo/raw/master/images/europe-video-still.jpg" width="440" height="219">
</p>

Using Dymo
----------

```dymo-label.py``` is a script that converts lists of cities with included font
information to GeoJSON point and label files suitable for use in geographic
rendering.

Place U.S. city labels at zoom 6 for two minutes:

    python dymo-label.py -z 6 --minutes 2 --labels-file labels.json --places-file points.json data/US-z6.csv.gz

Place U.S. city labels at zoom 5 over a 10000-iteration 10.0 - 0.01 temperature range:

    python dymo-label.py -z 5 --steps 10000 --max-temp 10 --min-temp 0.01 -l labels.json -p points.json data/US-z5.csv

Both examples will result in a pair of GeoJSON files, ```labels.json``` and
```points.json.``` The first will contain rectangular label areas, the second
will contain center points of places successfully positioned by Dymo. Because
labels will collide in different ways depending on map scale, labels must be
placed separately for each zoom level:

![U.S. Labels](http://farm5.static.flickr.com/4123/5413923643_be14a6b13b_b.jpg)

A trick for determining the right temperature range for a given data input is to
run ```dymo-label.py``` once for a short time, e.g. ```--minutes 0.1```, noting
the temperature ranges reported in the output. You can then vary the number of
steps up and down to arrive at a good-looking label set without waiting for the
first “Exploring temperature landscape” step each time.

Data Included
-------------

Look in ```data/``` for a list of zoom-by-zoom city locations, organized by
continent and selected by Justin O’Bierne. Data is distributed separately from
code, see [downloads](https://github.com/migurski/Dymo/downloads) for a link.

To prepare your own city lists or modify fonts and font sizes in input lists,
Use ```dymo-prepare-places.py``` to apply population-specific font choices to
an in-bound list:

    python dymo-prepare-places.py --font 0 fonts/Arial.ttf 10 --font 1000000 fonts/Arial.ttf 12 --zoom 5 data/North-America-all.txt.gz data/North-America-z5.txt

Sample Output
-------------

These sample images were created during the development of Acetate, and show
the results of town placement.

[Central Japan](http://www.flickr.com/photos/mmigurski/5194528400/):

![Central Japan](http://farm5.static.flickr.com/4148/5194528400_abf78d0c09_b.jpg)

[Western Europe](http://www.flickr.com/photos/mmigurski/5193928891/):

![Western Europe](http://farm5.static.flickr.com/4111/5193928891_25ae4e213c_b.jpg)

[Northen Appalachians](http://www.flickr.com/photos/mmigurski/5194532290/):

![Northen Appalachians](http://farm5.static.flickr.com/4092/5194532290_96776a8241_b.jpg)

Who
---

Copyright 2010-2011 Michal Migurski and GeoIQ, offered under the [BSD license](http://www.opensource.org/licenses/bsd-license.php). Uses Richard J. Wagner’s [Python annealing library](http://www-personal.umich.edu/~wagnerr/PythonAnneal.html).

We’re not affiliated with [Dymo Corporation](http://dymo.com).
