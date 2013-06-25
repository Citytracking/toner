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
    The labels are for world zooms, mid-zooms, and detailed city zooms, all in one file.
    Covers zooms 0 to 19.
    
    Used in map style MMLs:
    
    • Normal map style
        - just this MSS
    • Hybrid map style
        - also overriden by: 
          toner-hybrid-with-labels.mss
    • Hybrid map style - labels only    
        - also overriden by:
          toner-hybrid-only-labels.mss
*/


/*
Continent labels are just points.
*/
#continent-labels[zoom>=1][zoom<3] name
{
    text-face-name: @text_font_physical_bold;
    text-wrap-width: 32;
    text-size: @text_font_size_medium;
    text-fill: @label_color_physical;
    text-halo-radius: 3;
    text-halo-fill: @label_color_physical_halo;
}


/*
Ocean, Sea, Bay and other marine labels. Some use of scalerank column
here helps define exactly which features come in at which zoom levels.
*/
#marine-labels-110m[zoom=2][scalerank=0] name,
#marine-labels-110m[zoom=3] name,
#marine-labels-50m[zoom=4][scalerank<4] name
{
    text-face-name: @text_font_water_bold;
    text-wrap-width: 80;
    text-size: @text_font_size_medium;
    text-fill: @label_color_physical_halo;
    text-halo-radius: @text_font_halo_radius_sm;
    text-halo-fill: @label_color_physical;
}

#marine-labels-50m[zoom>=5][zoom<6] name,
#marine-labels-10m[zoom>=6][zoom<=8] name
{
    text-face-name: @text_font_water;
    text-wrap-width: 80;
    text-size: @text_font_size_medium;
    text-fill: @label_color_physical_halo;
    text-halo-radius: @text_font_halo_radius_sm;
    text-halo-fill: @label_color_physical;
}


/*
Country labels
*/
.country-labels-110m-z3[zoom=3][longfrom<=3] name,
.country-labels-110m-z3[zoom=3][longfrom>3] shortname
{
    text-face-name: @text_font_administrative;
    text-wrap-width: 80;
    text-size: @text_font_size_sm;
    text-fill: @label_color_administrative;
    text-halo-radius: @text_font_halo_radius_large;
    text-halo-fill: @label_color_administrative_halo;
}

.country-labels-110m-z4[zoom=4] label_z4
{
    text-face-name: @text_font_administrative_bold;
    text-wrap-width: 80;
    text-size: @text_font_size_medium;
    text-fill: @label_color_administrative;
    text-halo-radius: @text_font_halo_radius_large;
    text-halo-fill: @label_color_administrative_halo;
}

.country-labels-110m-z5[zoom=5] label_z5
{
    text-face-name: @text_font_administrative_bold;
    text-wrap-width: 80;
    text-size: @text_font_size_medium_plus;
    text-fill: @label_color_administrative;
    text-halo-radius: @text_font_halo_radius_large;
    text-halo-fill: @label_color_administrative_halo;
}

.country-labels-110m-z6[zoom=6] label_z6
{
    text-face-name: @text_font_administrative_bold;
    text-wrap-width: 80;
    text-size: @text_font_size_large;
    text-fill: @label_color_administrative;
    text-halo-radius: @text_font_halo_radius_large;
    text-halo-fill: @label_color_administrative_halo;
}


/*
Admin-1 (states, provinces) labels
*/
.admin1-labels-50m-z4[zoom=4] label_z4,
.admin1-labels-50m-z5[zoom=5] label_z5,
.admin1-labels-50m-z6[zoom=6] label_z6,
.admin1-labels-50m-z7[zoom=7] label_z7
{
    text-face-name: @text_font_administrative;
    text-wrap-width: 80;
    text-fill: @label_color_administrative;
    text-halo-radius: @text_font_halo_radius_large;
    text-halo-fill: @label_color_administrative_halo;
}

.admin1-labels-50m-z4[zoom=4]{ text-size: @text_font_size_xsm; }
.admin1-labels-50m-z5[zoom=5]{ text-size: @text_font_size_medium_plus; }
.admin1-labels-50m-z6[zoom=6]{ text-size: @text_font_size_large; }
.admin1-labels-50m-z7[zoom=7]{ text-size: @text_font_size_large; }


/*
City labels
*/
.city-points-z4[zoom=4],
.city-points-z5[zoom=5],
.city-points-z6[zoom=6],
.city-points-z7[zoom=7],
.city-points-z8[zoom=8]
{
    point-file: url('icons/dot.png');
    point-allow-overlap: true;
}

/*
.city-labels-z4[zoom=4][justified='left'],
.city-labels-z5[zoom=5][justified='left'],
.city-labels-z6[zoom=6][justified='left'],
.city-labels-z7[zoom=7][justified='left'],
.city-labels-z8[zoom=8][justified='left']
{
    text-dx: -5;
    text-dy: 1;
}
*/

/*
.city-labels-z4[zoom=4][justified='right'],
.city-labels-z5[zoom=5][justified='right'],
.city-labels-z6[zoom=6][justified='right'],
.city-labels-z7[zoom=7][justified='right'],
.city-labels-z8[zoom=8][justified='right']
{
    text-dx: 5;
    text-dy: 1;
}
*/


.city-labels-z4[zoom=4] name,
.city-labels-z5[zoom=5] name,
.city-labels-z6[zoom=6] name
{
    text-allow-overlap: true;
    text-face-name: @text_font_city;
    text-fill: @label_color_city;
    text-halo-radius: @text_font_halo_radius_large;
    text-halo-fill: @label_color_city_halo;
}

.city-labels-z7[zoom=7] name,
.city-labels-z8[zoom=8] name
{
    text-allow-overlap: true;
    text-face-name: @text_font_city_bold;
    text-fill: @label_color_city;
    text-halo-radius: @text_font_halo_radius_large;
    text-halo-fill: @label_color_city_halo;    
}

/* 
    We loose the townspot and don't use Dymo 
    placement anymore, so don't let Mapnik 
    overlap 
*/

.city-points-z9[zoom=9] name,
.city-points-z10[zoom=10] name,
.city-points-z11[zoom=11] name,
.city-points-z12[zoom=12] name
{
    text-allow-overlap: false;
    text-face-name: @text_font_city_bold;
    text-fill: @label_color_city;
    text-halo-radius: @text_font_halo_radius_large;
    text-halo-fill: @label_color_city_halo;    
}

/*
City Labels ZOOM 4
*/
.city-labels-z4[zoom=4] name { text-size: @text_font_size_xxsm; }
.city-labels-z4[zoom=4][font_size=14] name { text-size: @text_font_size_medium; }

/* About:                                                    */
/* Labels should look pretty, that's where Dymo comes in     */
/* These are for the Dymo settings, and for debug            */
/* Once it goes thru Dymo, we just use font_size             */

/* NOTE: We use font_size instead of population proxy,       */
/* as Mapnik freaks when pop is not a number, and sometimes  */
/* Dymo doesn't spit out the right field formating.          */

/*
City Labels ZOOM 5
*/
.city-labels-z5[zoom=5] name { text-size: @text_font_size_xsm; }
.city-labels-z5[zoom=5][font_size=16] name { text-size: @text_font_size_medium_plus; }

/*
City Labels ZOOM 6
*/
.city-labels-z6[zoom=6] name { text-size: @text_font_size_xsm; }
.city-labels-z6[zoom=6][font_size=18] name { text-size: @text_font_size_large; }

/*
City Labels ZOOM 7
*/
.city-labels-z7[zoom=7] name { text-size: @text_font_size_xsm; }
.city-labels-z7[zoom=7][font_size=18] name { text-size: @text_font_size_large; }

/*
City Labels ZOOM 8, 9 10
*/
.city-labels-z8[zoom=8] name { text-size: @text_font_size_sm; }
.city-labels-z8[zoom=8][font_size=20] name { text-size: @text_font_size_large; }
.city-points-z9[zoom=9] name { text-size: @text_font_size_sm; }
.city-points-z9[zoom=9][font_size=20] name { text-size: @text_font_size_large; }
.city-points-z10[zoom=10] name { text-size: @text_font_size_sm; }
.city-points-z10[zoom=10][font_size=20] name { text-size: @text_font_size_large; }
.city-points-z11[zoom=11] name { text-size: @text_font_size_sm; }
.city-points-z11[zoom=11][font_size=20] name { text-size: @text_font_size_large; }
.city-points-z12[zoom=12] name { text-size: @text_font_size_sm; }
.city-points-z12[zoom=12][font_size=20] name { text-size: @text_font_size_large; }

/*
If you wanted to use OSM labels instead...
Note: make sure that layer is 'on' in the MML
*/

/*
.osm-place-points[zoom=11][place=city] name 
{
    text-allow-overlap: false;
    text-face-name: @text_font_city_bold;
    text-fill: @label_color_city;
    text-halo-radius: @text_font_halo_radius_large;
    text-halo-fill: @label_color_city_halo;
    text-size: @text_font_size_large;
}
.osm-place-points[zoom=11][place=town] name
{
    text-allow-overlap: false;
    text-face-name: @text_font_city_bold;
    text-fill: @label_color_city;
    text-halo-radius: @text_font_halo_radius_large;
    text-halo-fill: @label_color_city_halo;
	text-size: @text_font_size_sm;
}
*/




/*
Park labels
*/

#water-bodies-labels-low[zoom=9][area>100000000][type=reservoir],
#water-bodies-labels-low[zoom=10][area>100000000][type=reservoir],
#water-bodies-labels-med[zoom=11][area>25000000],
#water-bodies-labels-med[zoom=12][area>5000000][type=reservoir],
#green-areas-labels-med[zoom=12][area>5000000],
#water-bodies-labels-med[zoom=13][area>2000000][type=reservoir],
#green-areas-labels-med[zoom=13][area>2000000],
#water-bodies-labels-high[zoom=14][area>200000],
#green-areas-labels-high[zoom=14][area>200000],
#water-bodies-labels-high[zoom=15][area>50000],
#green-areas-labels-high[zoom=15][area>50000],
#water-bodies-labels-high[zoom=16][area>10000],
#water-bodies-labels-high[zoom>=17],
#green-areas-labels-high[zoom=16][area>10000],
#green-areas-labels-high[zoom>=17]
{ 
   /* note: no colors defined here */

    name
    {
        text-face-name: @text_font_water;
        text-placement: point;
        text-max-char-angle-delta: 30;
        text-wrap-width: 40;
        text-halo-radius: @text_font_halo_radius_large;
        text-allow-overlap: false;
    }
    
    &[zoom>=9][zoom<12] name
    {
        text-size: @text_font_size_xsm;
        text-spacing: 200;
        text-wrap-width: 50;
    }
    
    &[zoom=12] name
    {
        text-size: @text_font_size_xsm;
        text-spacing: 200;
        text-wrap-width: 70;
    }
    
    &[zoom=13] name
    {
        text-size: @text_font_size_xsm;
        text-spacing: 100;
        text-wrap-width: 70;
    }
    
    &[zoom=14] name
    {
        text-size: @text_font_size_xsm;
        text-spacing: 100;
        text-wrap-width: 70;
    }
    
    &[zoom=15] name
    {
        text-size: @text_font_size_xsm;
        text-spacing: 100;
        text-wrap-width: 30;
    }
    
    &[zoom>=15] name
    {
        text-size: @text_font_size_sm;
        text-spacing: 100;
        text-wrap-width: 40;
    }
}

#water-bodies-labels-low[zoom=9],
#water-bodies-labels-low[zoom=10],
#water-bodies-labels-med[zoom=11],
#water-bodies-labels-med[zoom=12],
#water-bodies-labels-med[zoom=13],
#water-bodies-labels-high[zoom=14],
#water-bodies-labels-high[zoom=15],
#water-bodies-labels-high[zoom=16],
#water-bodies-labels-high[zoom>=17]
{ 
    name
    {
        text-fill: @label_color_physical_halo;
        text-halo-fill: @label_color_physical;
    }

    &[zoom>=9][zoom<16] name { text-size: 13 !important }
    &[zoom>=16] name { text-size: 14 !important }
}

#green-areas-labels-med[zoom=12][area>5000000],
#green-areas-labels-med[zoom=13][area>2000000],
#green-areas-labels-high[zoom=14][area>200000],
#green-areas-labels-high[zoom=15][area>50000],
#green-areas-labels-high[zoom=16][area>10000],
#green-areas-labels-high[zoom>=17]
{ 
    name
    {
        text-fill: @label_color_physical;
        text-halo-fill: @label_color_physical_halo;
    }
}



/*
Road labels
*/
#major-road-labels[zoom>=12] name
{
    text-face-name: @text_font_transport_bold;
    text-placement: line;
    text-max-char-angle-delta: 30;
    text-fill: @label_color_transport;
    text-halo-radius: @text_font_halo_radius_sm;
    text-halo-fill: @label_color_transport_halo;
    text-spacing: 100;
}

#major-road-labels[highway=trunk][zoom>=14] name
{
    text-face-name: @text_font_transport_bold;
    text-placement: line;
    text-max-char-angle-delta: 30;
    text-fill: @label_color_transport;
    text-halo-radius: @text_font_halo_radius_sm;
    text-halo-fill: @label_color_transport_halo;
    text-spacing: 100;
}

#major-road-labels[highway=primary][zoom>=14] name
{
    text-face-name: @text_font_transport_bold;
    text-placement: line;
    text-max-char-angle-delta: 30;
    text-fill: @label_color_transport;
    text-halo-radius: @text_font_halo_radius_sm;
    text-halo-fill: @label_color_transport_halo;
    text-spacing: 100;
}

#major-road-labels[highway=primary][zoom>=16] name
{
    text-halo-radius: @text_font_halo_radius_large;
}

#major-road-labels[zoom=16] name
{
    text-fill: @label_color_transport;
    text-halo-fill: @label_color_transport_halo;
}

#major-road-labels[is_tunnel=yes][zoom>=15] name
{
    text-fill: #777;
    text-halo-fill: @label_color_transport_halo;
}

#minor-road-labels[zoom>=16] name
{
    text-face-name: @text_font_transport_bold;
    text-placement: line;
    text-max-char-angle-delta: 30;
    text-fill: @label_color_transport;
    text-halo-radius: @text_font_halo_radius_sm;
    text-halo-fill: @label_color_transport_halo;
    text-spacing: 100;
}

#major-road-labels[zoom=12] name { text-dy: 7; }
#major-road-labels[highway=trunk][zoom=12] name { text-size: @text_font_size_xsm; }
#major-road-labels[highway=primary][zoom=12] name { text-size: @text_font_size_xsm; }

#major-road-labels[zoom=13] name { text-dy: 8; }
#major-road-labels[highway=trunk][zoom=13] name { text-size: @text_font_size_sm; }
#major-road-labels[highway=primary][zoom=13] name { text-size: 13; }

#major-road-labels[highway=trunk][zoom=14] name { text-dy: 9; text-size: @text_font_size_medium; }
#major-road-labels[highway=primary][zoom=14] name { text-dy: 9; text-size: @text_font_size_medium; }
#major-road-labels[highway=secondary][zoom=14] name { text-dy: 7; text-size: @text_font_size_xsm; }

#major-road-labels[highway=trunk][zoom=15] name { text-dy: @text_font_size_xsm; text-size: 15; }
#major-road-labels[highway=primary][zoom=15] name { text-dy: @text_font_size_xsm; text-size: 15; }
#major-road-labels[highway=secondary][zoom=15] name { text-dy: 11; text-size: @text_font_size_sm; }
#major-road-labels[highway=tertiary][zoom=15] name { text-dy: 11; text-size: @text_font_size_sm; }

#major-road-labels[highway=trunk][zoom=16] name { text-dy: 13; text-size: @text_font_size_medium; }
#major-road-labels[highway=primary][zoom=16] name { text-dy: 13; text-size: @text_font_size_medium; }
#major-road-labels[highway=secondary][zoom=16] name { text-dy: 13; text-spacing: 124; text-size: @text_font_size_sm; text-halo-radius: @text_font_halo_radius_large; }
#major-road-labels[highway=tertiary][zoom=16] name { text-dy: 13; text-spacing: 124; text-size: @text_font_size_sm; text-halo-radius: @text_font_halo_radius_large; }
#minor-road-labels[zoom=16] name { text-dy: 10; text-spacing: 124; text-size: @text_font_size_xxsm; text-halo-radius: @text_font_halo_radius_large; }

#major-road-labels[highway=trunk][zoom=17] name { text-dy: 16; text-size: @text_font_size_medium_plus; }
#major-road-labels[highway=primary][zoom=17] name { text-dy: 14; text-size: @text_font_size_medium; }
#major-road-labels[highway=secondary][zoom=17] name { text-dy: 14; text-spacing: 180; text-size: @text_font_size_medium; text-halo-radius: @text_font_halo_radius_large; }
#major-road-labels[highway=tertiary][zoom=17] name { text-dy: 13; text-spacing: 180; text-size: @text_font_size_xsm; text-halo-radius: @text_font_halo_radius_large; }
#minor-road-labels[zoom=17] name { text-dy: 13; text-spacing: 180; text-size: @text_font_size_xsm; text-halo-radius: @text_font_halo_radius_large; }

#major-road-labels[highway=trunk][zoom>=18] name { text-size: @text_font_size_medium_plus; }
#major-road-labels[highway=primary][zoom>=18] name { text-size: @text_font_size_medium; }
#major-road-labels[highway=secondary][zoom>=18] name { text-size: @text_font_size_medium; text-spacing: 300; text-halo-radius: @text_font_halo_radius_large; }
#major-road-labels[highway=tertiary][zoom>=18] name { text-size: @text_font_size_xsm; text-spacing: 400; text-halo-radius: @text_font_halo_radius_large; }
#minor-road-labels[zoom>=18] name { text-size: @text_font_size_xsm; text-spacing: 400; text-halo-radius: @text_font_halo_radius_large; }


/*
Subway stations and icons
*/
#poi-stations[zoom>=18][railway=station] name 
{ 
    text-face-name: @text_font_poi_trains_bold;
    text-size: @text_font_size_xsm;
    text-placement: point;
    text-max-char-angle-delta: 30;
    text-fill: @label_color_poi_trains;
    text-halo-radius: @text_font_halo_radius_sm;
    text-halo-fill: @label_color_poi_halo;
    text-spacing: 100;
    text-allow-overlap: true;
    text-wrap-width: 30;
    text-dx: 0;
    text-dy: 8;
}

#poi-station-labels[zoom=17][railway=station] { 
	point-file: url('icons/subway_sm.png'); 
}

#poi-station-labels[zoom>=18][railway=station] { 
	point-file: url('icons/subway.png'); 
}


/*
.airports[zoom=2][natlscale>148],
.airports[zoom=3][natlscale>74],
.airports[zoom=4][natlscale>37],
.airports[zoom=5][natlscale>18],
.airports[zoom=6][natlscale>9.2],
.airports[zoom=7][natlscale>4.6],
.airports[zoom=8][natlscale>2.3],
.airports[zoom=9][natlscale>1.2],
*/
.airports[zoom=10][natlscale>.57],
.airports[zoom=11][natlscale>.29],
/*
.airports[zoom=12][natlscale>.14],
.airports[zoom=13][natlscale>.07]
*/
.airports[zoom=12][natlscale>.29],
.airports[zoom=13][natlscale>.29]
{
    point-file: url('icons/airplane-19-reverse.png');

}

/*
.airports[zoom=14][natlscale>.04],
.airports[zoom=15][natlscale>.02],
.airports[zoom>=16][natlscale>.01],
.airports[zoom=14][natlscale>.29],
.airports[zoom=15][natlscale>.29],
.airports[zoom>=16][natlscale>.29]
{
    point-file: url('icons/airplane-35-reverse.png');
}
*/


/*
.airports[zoom=2][natlscale>148] label_sm,
.airports[zoom=3][natlscale>74] label_sm,
.airports[zoom=4][natlscale>37] label_sm,
.airports[zoom=5][natlscale>18] label_sm,
.airports[zoom=6][natlscale>9.2] label_sm,
.airports[zoom=7][natlscale>4.6] label_sm,
.airports[zoom=8][natlscale>2.3] label_sm,
.airports[zoom=9][natlscale>1.2] label_sm,
.airports[zoom=10][natlscale>.57] label_sm,
*/
/*
.airports[zoom=11][natlscale>.29] label_sm,
.airports[zoom=12][natlscale>.29] label_sm,
*/
/*
.airports[zoom=12][natlscale>.14] label_sm,
.airports[zoom=13][natlscale>.07] label_lng,
.airports[zoom=14][natlscale>.04] label_lng,
.airports[zoom=15][natlscale>.02] label_lng,
.airports[zoom>=16][natlscale>.01] label_lng
*/
.airports[zoom=13][natlscale>.29] label_lng,
.airports[zoom=14][natlscale>.29] label_lng,
.airports[zoom=15][natlscale>.29] label_lng,
.airports[zoom>=16][natlscale>.29] label_lng
{
    text-face-name: @text_font_poi_bold;
    text-fill: @label_color_poi;
    text-size: @text_font_size_medium;
    
    text-halo-fill: @label_color_poi_halo;
    text-halo-radius: @text_font_halo_radius_large;
    
    text-wrap-width: 128;
    text-dy: 14;

    text-allow-overlap: true;
}

.airports[zoom=14][natlscale>.29] label_lng,
.airports[zoom=15][natlscale>.29] label_lng,
.airports[zoom>=16][natlscale>.29] label_lng
{
    text-dy: 0;
}
