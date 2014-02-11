/* Define feature colors */
@color_physical: #000;
@color_physical_bright: #fff;
@color_water: #000;
@color_administrative_dark: #000;
@color_administrative_bright: #fff;
@color_administrative_medium_low: #000;
@color_administrative_medium_high: #000;
@color_administrative_medium_high2: #000;
@color_city: #000;
@color_transport: #000;
@color_transport_casing: #fff;
@color_transport_inline: #fff;
@color_transport_tunnel: #ccc;
@color_transport_minor: #ccc;
@color_transport_rail: #444;
@color_transport_path: #ededed;
@color_poi: #000;
@color_building_outline: #000;
@color_building_outline_special: #00aeef;
@color_airport_runways: #eee;
@color_airport_runways_detail: #f2f2f2;


/* Define text colors */
@label_color_physical: #000;
@label_color_physical_halo: #fff;
@label_color_administrative: #000;
@label_color_administrative_halo: #fff;
@label_color_city: #000;
@label_color_city_halo: #fff;
@label_color_transport: #000;
@label_color_transport_halo: #fff;
@label_color_poi: #000;
@label_color_poi_trains: #4581C3;
@label_color_poi_halo: #fff;

/* Define fonts */
@text_font_physical: 'Arial Unicode MS Regular';
@text_font_physical_bold: 'Arial Unicode MS Bold';
@text_font_water: 'Arial Unicode MS Italic';
@text_font_water_bold: 'Arial Unicode MS Bold Italic';
@text_font_administrative: 'Arial Unicode MS Regular';
@text_font_administrative_bold: 'Arial Unicode MS Bold';
@text_font_city: 'Arial Unicode MS Regular';
@text_font_city_bold: 'Arial Unicode MS Bold';
@text_font_transport: 'Arial Unicode MS Regular';
@text_font_transport_bold: 'Arial Unicode MS Bold';
@text_font_poi_bold: 'Arial Unicode MS Bold Italic';
@text_font_poi_trains_bold: 'Arial Unicode MS Bold';

/* Define text sizes */
@text_font_size_xxsm: 10;
@text_font_size_xsm: 12;
@text_font_size_sm: 13;
@text_font_size_medium: 14;
@text_font_size_medium_plus: 16;
@text_font_size_large: 18;
@text_font_size_xlarge: 20;

/* Define text halo sizes */
@text_font_halo_radius_sm: 1;
@text_font_halo_radius_large: 2;

/* Symbols */
@symbol_subway_sm: 'icons/subway_sm.png';
@symbol_subway: 'icons/subway.png';
@symbol_airplane: 'icons/airplane-19-reverse.png';

/* Pattersn */
@pattern_building_special: 'icons/stripe_color.png';
@pattern_building_sm: 'icons/stripe_sm.png';
@pattern_building_med: 'icons/stripe_med.png';
@pattern_building: 'icons/stripe.png';
@pattern_parks_transparent: 'icons/halftone2-transparent.png';
@pattern_parks: 'icons/halftone2.png';


/*   
    This stylesheet is for the general world and mid-zooms.
    Mostly Natural Earth data, but a little OSM and lots of Dymo.
    Covers zooms 0 to 8 (primarily).
    Note: Bleed over of shoreline and land styles between this and the main stylesheet.mss

    Used in map style MMLs:
    
    • Normal map style
        - just this MSS
    • No labels map style
        - just this MSS
    • Hybrid map style
        - also overriden by: 
          toner-hybrid-with-labels.mss

*/

Map
{
    map-bgcolor: @color_physical;      /* the "ocean" is black */
}

/*
"shore" is a general class for layers with continents, coastlines,
lakes, and other kinds of meeting points between water and land.
*/
.shore
{
    line-color: @color_physical;
    line-cap: round;
    line-join: round;
}

#country-shapes-110m[zoom>=2][zoom<3]
{
    line-width: 0.25;
    polygon-fill: @color_administrative_bright;
}


/*
This is a mix of Natural Earth and OSM, careful.
*/
#land-shapes-110m[zoom<2],
#country-shapes-50m[zoom>=3][zoom<6],
#country-shapes-10m[zoom>=6][zoom<8],
#processed-coast-outline[zoom>=10],
#processed-coast-inline[zoom>=10]
{
    line-width: 0.75;
    polygon-fill: @color_physical_bright;
}

/*
Adjust the inner and outer line-widths and fatten up the inner shap
with some land color to account for tiled data in the coastline tab
Just OSM here.
*/
#processed-coast-outline[zoom>=10] 
{ 
	line-width: 2.5; 
}
#processed-coast-inline[zoom>=10] 
{ 
	line-width: 0.5; 
	line-color: @color_physical_bright; 
}

.country-boundary-10m[zoom=6]
{
    line-color: @color_administrative_dark;
    line-width: 1.2;
}
.country-boundary-10m[zoom=7],
.country-boundary-10m[zoom=8],
.country-boundary-10m[zoom=9]
{
    line-color: @color_administrative_dark;
    line-width: 1.2;
    line-dasharray: 3,7;
	line-cap: round;
}
.country-boundary-10m-whiteout[zoom=7],
.country-boundary-10m-whiteout[zoom=8],
.country-boundary-10m-whiteout[zoom=9]
{
    line-color: @color_administrative_bright;
    line-width: 2;
}

#admin1-lines-50m[zoom>=3][zoom<6]
{
    line-width: 0.35;
    line-color: @color_administrative_dark;
}

#admin1-lines-10m[zoom=6]
{
    line-width: 0.6;
    line-color: @color_administrative_dark;
}
#admin1-lines-10m[zoom=7]
{
    line-width: 1.5;
    line-color: @color_administrative_medium_low;
    line-dasharray: 1,5;
	line-cap: round;
}
#admin1-lines-10m[zoom=8]
{
    line-width: 2.0;
    line-color: @color_administrative_medium_high;
    line-dasharray: 1,5;
	line-cap: round;
}


#lakes-110m[zoom<3][scalerank<1],
#lakes-50m[zoom=3][scalerank<2],
#lakes-50m[zoom=4][scalerank<3],
#lakes-50m[zoom=5][scalerank<5],
#lakes-50m[zoom=6],
#lakes-10m[zoom=7]
{
    line-width: 1;
    polygon-fill: @color_physical;
}


/*
Roads at the mid-zooms
*/

#ne-roads-inline[zoom=6][scalerank>=3][scalerank<=6]
{
	line-width: 0.1;
    line-color: @color_transport;
}

/** z7: major, minor, then casing */

#ne-roads-inline[zoom=7][scalerank>=3][scalerank<=5]
{
	line-width: 1.5 !important;
}

#ne-roads-inline[zoom=7][scalerank<=6],
#ne-roads-inline[zoom=7][scalerank<=7][expressway=1],
#ne-roads-inline[zoom=7][scalerank<=7][type="Major Highway"],
#ne-roads-inline[zoom=7][scalerank<=7][type="Secondary Highway"]
{
	line-width: 0.1;
    line-color: @color_transport;
}

#ne-roads-casing[zoom=7][scalerank<=7]
{
	line-width: 2.25;
	line-color: @color_transport_casing;
	line-opacity: 0.5;
}

/** z8: major, minor, then casing */

#ne-roads-inline[zoom=8][type="Beltway"],
#ne-roads-inline[zoom=8][scalerank<=8][expressway=1]
{
	line-width: 1.5 !important;
}

#ne-roads-inline[zoom=8][scalerank<=8]
{
	line-width: .1;
	line-color: @color_transport;
}

#ne-roads-casing[zoom=8][scalerank<=8]
{ 	
	line-width: 3.25;
	line-color: @color_transport_casing;
	line-opacity: 0.5;
}
