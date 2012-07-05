**Changelog**

_Published by YYYY. If second or more updates in a year, YYYY-MM. Milestones noted with each publication date._


# Toner 2012

Visible at [http://tile.stamen.com/toner-2012/](tile.stamen.com/toner-2012).

***About Toner v2 aka 2012, "Milestone 2" in Github***

![Toner changes animated thru time in San Francisco](https://github.com/Citytracking/toner/raw/master/images/toner_animated_gif_v1_2010_to_v2_gm_2012.gif)

## General

* **Easy-to-use tiles**: Stamen now hosts easy to embed Toner tiles with CC license from [maps.stamen.com](http://maps.stamen.com), thanks to the [Knight Foundation](http://newschallenge.tumblr.com/) and our [Citytracking.org](http://citytracking.org/) [grant](http://content.stamen.com/knight_news_challenge_update)! No server hardware or software setup needed, just start using the tiles in your favorite web mapping API client side. You can still roll your own tiles using the data and setup readme's in the Github repo. [Read more »](http://maps.stamen.com)

* **More international**: Plays better outside of the United States! Now displays local names in non-Latin writing scripts (like Japanese and Arabic) and better accent marks in Europe. We optimized the road symbology to more places world wide. [Issue 30](https://github.com/Citytracking/toner/issues/30)

* **More Toner flavors**: Introduces specific flavors of Toner optimized for [map sandwiches](http://blogs.esri.com/esri/arcgis/2009/07/13/the-map-sandwich/), easy to integrating with and promoting your custom map stories: toner-standard ([toner](tilefarm.stamen.com/toner-2012)), toner-hybrid-with-labels ([toner-hybrid](tilefarm.stamen.com/toner-hybrid-with-labels)), toner-hybrid-only-lines ([toner-lines](tilefarm.stamen.com/toner-lines)), toner-hybrid-only-labels ([toner-labels](tilefarm.stamen.com/toner-labels)), toner-no-labels ([toner-background](tilefarm.stamen.com/toner-no-labels)). [Issue 10](https://github.com/Citytracking/toner/issues/10).

* **Easy to read stylesheets**: General stylesheet cleanup, consolidation. Restructured all the OSM roads using [High Roads](http://github.com/migurski/high-roads/). Now uses Postgres views by zoom level, making it much easier to design what big, medium, and small roads should look like consistently between layers while abstracting the data part. Similar appraoch is taken for water bodies using [Imposm](http://imposm.org/) tables. [Issue 9](https://github.com/Citytracking/toner/issues/9)

* **More content**: Added reservoirs, state boundaries, and more. Map now zooms to 19+, important when you're inventory mapping stories at the city block level where locations along a street and buildings/venues are helpful. Before they stopped at zoom 18 but often when you're looking at street-level incidents (as in [Dotspotting.org](http://www.dotspotting.org)), you need more detail [Issue 18](https://github.com/Citytracking/toner/issues/18). Along with that, the transition between bold black roads and cased white roads now starts at zoom 18 and carries thru to zoom 19+ ([Issue 17](https://github.com/Citytracking/toner/issues/17)). This preserves the strong contrast of Toner, but also allows better use as a background map visually at these zooms so your story points stay the focus (and consumes much less ink if you print the maps using a service like Stamen's [Field Papers](http://www.fieldpapers.org). 

* **Urban wayfinding**: At these most detailed zooms building footprints help us orient to the build landscape so we start adding those progressively in starting around zoom 14 (big airport terminals and convention center sized buildings) but most noticeably at zoom 16+. We also show metro (subway) stations now, helping navigate by landmarks in big cities like New York, London, and Tokyo. [Issue 16](https://github.com/Citytracking/toner/issues/16),  [Issue 48](https://github.com/Citytracking/toner/issues/48), [Issue 40](https://github.com/Citytracking/toner/issues/40).

## Boundaries

* **Improved graphic styling of country boundary lines** at zooms 8 and 9. [Issue 27](https://github.com/Citytracking/toner/issues/27)

* **Added state boundary lines** at the city and regional zooms. Important for places like Washington DC where a metropolitan area sprawls across multiple admin-1 jurisdictions. Made sure they stack above the water and made upstream changes in OSM master data to allow for boudnaries in the water that aren't indicator level to be not shown in Toner when using newest OSM [Issue 11](https://github.com/Citytracking/toner/issues/11), [Issue 24](https://github.com/Citytracking/toner/issues/24), [Issue 7](https://github.com/Citytracking/toner/issues/7), [Issue 6](https://github.com/Citytracking/toner/issues/6), and [Issue 50](https://github.com/Citytracking/toner/issues/50).

## Map labels

* Added support for **international Unicode (UTF-8) labels** from OSM by re-authoring fonts. Primarily seen in street labels and park names. [Issue 30](https://github.com/Citytracking/toner/issues/30)

* **Removed map label overlap** by manually adjusting the Dymo output around other map features like bodies of waters, country labels, and state labels. [Issue 34](https://github.com/Citytracking/toner/issues/34), [Issue 35](https://github.com/Citytracking/toner/issues/35). Version 3 will address remaining occational placement funk and overlap of marine labels.

* Added in **more city labels** in zooms 9, 10, and 11 from Dymo [Issue 15](https://github.com/Citytracking/toner/issues/15), [Issue 1](https://github.com/Citytracking/toner/issues/1), [Issue 51](https://github.com/Citytracking/toner/issues/51), [Issue 29](https://github.com/Citytracking/toner/issues/51), [Issue 27](https://github.com/Citytracking/toner/issues/27)

* Added **new park labels progressively** per the zoom. [Issue 13](https://github.com/Citytracking/toner/issues/13), [Issue 42](https://github.com/Citytracking/toner/issues/42).

* **Easier to read street labels** at zooms 17+. [Issue 25](https://github.com/Citytracking/toner/issues/25)

## Clean-up

* **Parks** are now tucked under the water in the street-level maps. This is a OSM pecularity where some parks are mapped to the shoreline and others extend out into the water. As these are black-and-white maps, we take a shortcut by making a transparent pattern with the black stipples. When it's over the water, the black park is still drawn, but the water is also black so win-win. MapBox Streets uses a transparency on the polygon-color instead. [Issue 12](https://github.com/Citytracking/toner/issues/12)

* **Added reservoirs** to the "inland water" aka "lakes" symbolization. Removed smaller lakes at zoms 8 to 12. Since the water is solid black, these tiny lakes attracted undue attention. Instead, they are now progressively added on each zoom in. This reduces the visual noise in the map. [Issue 23](https://github.com/Citytracking/toner/issues/23), [Issue 45](https://github.com/Citytracking/toner/issues/45), [Issue 39](https://github.com/Citytracking/toner/issues/39)

* For **lake labels**, similar progressive approach but with a slight zoom delay. [Issue 44](https://github.com/Citytracking/toner/issues/44)

* Similar approach to **adding parks progressively**. Added full set of "green areas" in OSM, this captures cemeteries such as Arlington National Cemetary in Washington, DC. [Issue 42](https://github.com/Citytracking/toner/issues/42), [Issue 43](https://github.com/Citytracking/toner/issues/43), [Issue 45](https://github.com/Citytracking/toner/issues/45)

## Transportation

* Now uses **[High Roads](https://github.com/migurski/HighRoad)** for all OSM roads in the midzooms and street-level zooms. [Issue 9](https://github.com/Citytracking/toner/issues/9), [Issue 35](https://github.com/Citytracking/toner/issues/35)

* Now uses new Natural Earth 1.5 **global roads** in the world zooms. [Issue 2](https://github.com/Citytracking/toner/issues/2), [Issue 3](https://github.com/Citytracking/toner/issues/3) [Issue 5](https://github.com/Citytracking/toner/issues/5), and  [Issue 6](https://github.com/Citytracking/toner/issues/6), [Issue 52](https://github.com/Citytracking/toner/issues/52) Caveat, these are an early beta release from NE now.

* **Tunnel stret labels** are now grey to match their grey linework. [Issue 22](https://github.com/Citytracking/toner/issues/22)

* Where Tunnels pass under land, not just water, we introduce an additional grey outline as **visual trim**. [Issue 21](https://github.com/Citytracking/toner/issues/21), [Issue 49](https://github.com/Citytracking/toner/issues/49)

* Added **airports**! Symbolized and labeled using combination of [Mile High Club](http://github/nvkelso/mile-high-club/) and OSM. [Issue 41](https://github.com/Citytracking/toner/issues/41)

* Added **metro (subway) icons** at zooms 18 and 19, helpful for city wayfinding. [Issue 26](https://github.com/Citytracking/toner/issues/26)

## Setup

* Added data import scripts to PostGIS, still rough.

* Include explicate MML and MSS for the project, including label shapefiles, so it's immediately deployable [Issue 38](https://github.com/Citytracking/toner/issues/38), [Issue 37](https://github.com/Citytracking/toner/issues/37)

* Updated the Readme.md [Issue 36](https://github.com/Citytracking/toner/issues/36)

## &etc

A beta version of Toner v2 was released in late 2011. The final release mostly focuses on airport icons and making map labels more legibile (less overlap).

##Visual changelog for Toner 2012:

Toner v2 (2012 and 2011) uses [High Road](https://github.com/migurski/HighRoad) for more sophisticated roads and tucks San Francisco's punky park mohock under the water.

![Toner changes thru time](https://github.com/Citytracking/toner/raw/master/images/sf_mohack_high_roads.gif)

There is now a "lite" version that is less high contrast, better for printing out analog style or overlaying polygons client-side.

![Toner changes thru time](https://github.com/Citytracking/toner/raw/master/images/sf_toner_lite.gif)

We added reservoirs!

![Toner changes thru time](https://github.com/Citytracking/toner/raw/master/images/dc_md_va_reservoirs_roads_state_lines.gif)

And better about showing walking and biking paths thru the meadows and woods:

![Toner changes thru time](https://github.com/Citytracking/toner/raw/master/images/sf_reservoirs_roads.gif)

Back in the urban grid, we've added subways and building footprints to help wayfind:

![Toner changes thru time](https://github.com/Citytracking/toner/raw/master/images/nyc_subway_building_wayfinding.gif)

Speaking of buildings, big ones get added first, then all on the most detailed zooms:

![Toner changes thru time](https://github.com/Citytracking/toner/raw/master/images/dc_buildings_v2.gif)

We cleaned up labels so they don't overlap as much:

![Toner changes thru time](https://github.com/Citytracking/toner/raw/master/images/east_coast_label_overlap.gif)

And added city labels world wide:

![Toner changes thru time](https://github.com/Citytracking/toner/raw/master/images/london_paris_everywhere.gif)

And now draw kanji and other non-Latin scripts right:

![Toner changes thru time](https://github.com/Citytracking/toner/raw/master/images/tokyo_everywhere.gif)


# Toner 2011

Visible at [http://tile.stamen.com/toner-2011/](tile.stamen.com/toner-2011).

Beta version of Toner v2. See above for details.


# Toner 2010

Visible at [http://tile.stamen.com/toner-2010/](tile.stamen.com/toner-2010).

Initial release.
