/*   
    This stylesheet is for the detailed city zooms using OSM data exclusively.
    Well, a couple Natural Earth themes.
    Covers zooms 8 to 19+.
    Note: Bleed over of shoreline and land styles between this and the main stylesheet.mss
    
    Option 1:
    Normally we want to show the labels with the basemap. 

    The MML file would then read:
     
    <Stylesheet src="naturalearth-lowzooms.mss"/>
    <Stylesheet src="stylesheet.mss"/> 
    <Stylesheet src="labels.mss"/>
    <!-- 
          <Stylesheet src="labels_only.mss"/>  
     -->
     
    Option 2: 
    For map-only (no label) render
    
    The MML file would then read:
     
    <Stylesheet src="naturalearth-lowzooms.mss"/>
    <Stylesheet src="stylesheet.mss"/> 
    <!-- 
          <Stylesheet src="labels.mss"/>
          <Stylesheet src="labels_only.mss"/>  
     -->
     
     Option 3:
     For labels-only render, we want the map background to be transparent, not black.

     The MML file would then read:
     
    <!--  <Stylesheet src="naturalearth-lowzooms.mss"/>
          <Stylesheet src="stylesheet.mss"/> 
    -->
    <Stylesheet src="labels.mss"/>
    <Stylesheet src="labels_only.mss"/>
     
*/


/*
ocean and lakes and river polygons
*/
#water-bodies[zoom=8][area>50000000],
#water-bodies[zoom=9][area>10000000],
#water-bodies[zoom=10][area>2500000],
#water-bodies[zoom=11][ area>800000],
#water-bodies[zoom>=12][area>500000],
#water-bodies[zoom>=13][ area>25000],
#water-bodies[zoom>=14][ area>10000],
#water-bodies[zoom>=15]
{ 
	polygon-fill: #000;
}

/*land, map background*/
#land[zoom>=8] 
{ 
	polygon-fill: #fff; 
}

#land[zoom=8] 
{ 
	line-width: 0.5; 
	line-color: #fff;
}

/*
touch of Natural Earth again
*/
#admin1-lines-10m[zoom=9],
#admin1-lines-osm[zoom>9]
{
    line-width: 2.0;
    line-color: #4d4d4d;
    line-dasharray: 1,5;
	line-cap: round;
}


#buildings[zoom=13][area>=40000],
#buildings[zoom=14][area>=20000],
#buildings[zoom=15][area>=16000],
#buildings[zoom=16][area>=8000],
#buildings[zoom=17][area>=4000],
#buildings[zoom>=18]
{ 
	/*polygon-fill: #e0e0e0;*/
	polygon-pattern-file: url('icons/stripe.png');
	line-width: 0.5; 
	line-color: #000;
}

#buildings[zoom=16] 
{ 
	line-width: 0.5;
}


/* Stamen HQ fancy candycane striping */
#buildings-stamen[zoom>=18]
{ 
	polygon-pattern-file: url('icons/stripe_color.png');
	line-width: 1.5; 
	line-color: #00aeef;
}


/*
parks
*/

.green-areas-transparent[zoom=10][area>5000000],
.green-areas-transparent[zoom=11][area>1000000],
.green-areas-transparent[zoom=12][area> 500000],
.green-areas-transparent[zoom=12][area> 200000],
.green-areas-transparent[zoom=13][area>  75000],
.green-areas-transparent[zoom=14][area>  10000],
.green-areas-transparent[zoom>14]
{
    polygon-pattern-file: url('icons/halftone2-transparent.png');
}

.green-areas[zoom=10][area>5000000],
.green-areas[zoom=11][area>1000000],
.green-areas[zoom=12][area> 500000],
.green-areas[zoom=12][area> 200000],
.green-areas[zoom=13][area>  75000],
.green-areas[zoom=14][area>  10000],
.green-areas[zoom>14]
{
    polygon-pattern-file: url('icons/halftone2.png');
}


/*
#civic-areas[zoom>=12] { polygon-pattern-file: url('halftone2-transparent.png'); }
#parking-areas[zoom>=12] { polygon-pattern-file: url('halftone2-transparent.png'); }
#building-areas[zoom>=12] { polygon-pattern-file: url('halftone2-transparent.png'); }
*/

#aeroways
{
    line-color: #eee;
    line-cap: square;
    line-join: miter;
}

#aeroways[zoom>=15]
{
    line-color: #f2f2f2;    /*#f2f2f2    this lighter color is in the palette ACT file now */
}

#aeroways[aeroway=runway][zoom=12] { line-width: 2; }
#aeroways[aeroway=runway][zoom=13] { line-width: 4; }
#aeroways[aeroway=runway][zoom=14] { line-width: 8; }
#aeroways[aeroway=runway][zoom=15] { line-width: 16; }
#aeroways[aeroway=runway][zoom=16] { line-width: 32; }
#aeroways[aeroway=runway][zoom=17] { line-width: 64; }
#aeroways[aeroway=runway][zoom>=18] { line-width: 128; }

#aeroways[aeroway=taxiway][zoom=13] { line-width: 1; }
#aeroways[aeroway=taxiway][zoom=14] { line-width: 2; }
#aeroways[aeroway=taxiway][zoom=15] { line-width: 4; }
#aeroways[aeroway=taxiway][zoom=16] { line-width: 8; }
#aeroways[aeroway=taxiway][zoom=17] { line-width: 16; }
#aeroways[aeroway=taxiway][zoom>=18] { line-width: 32; }




/*
begin High Road styles
https://github.com/migurski/HighRoad
*/

/*//////// Base line styles */

.roads {
	line-join: round;
	line-cap: round;
}

.roads[render=outline],
.roads[render=casing]
{
    line-cap: butt;
}

.roads[zoom>=14][is_tunnel=yes][render=outline],
.roads[zoom>=14][is_tunnel=yes][render=casing]
{
    line-opacity: 0.5;
}

.roads[zoom>=15][is_tunnel=yes][render=inline]
{
    line-opacity: 0.0;
}


/*//////// Colors */

.roads[kind=highway][render=inline]
{
	line-color: #000;
}

.roads[kind=highway][render=outline],
.roads[kind=highway][render=casing]
{
	line-color: #fff;
}

.roads[zoom<=13][kind=highway][is_link=yes][render=inline]
{
	line-color: #000;
}

.roads[zoom<=13][kind=highway][is_link=yes][render=outline],
.roads[zoom<=13][kind=highway][is_link=yes][render=casing]
{
	line-color: #fff;
}

.roads[kind=major_road][render=inline]
{
	line-color: #000;
}

.roads[kind=major_road][zoom<=12][render=inline]
{
	line-color: #000 !important;
}

.roads[kind=major_road][render=outline],
.roads[kind=major_road][render=casing]
{
	line-color: #fff;
}

.roads[zoom<=13][kind=major_road][is_link=yes][render=inline]
{
	line-color: #000;
}

.roads[zoom<=13][kind=major_road][is_link=yes][render=outline],
.roads[zoom<=13][kind=major_road][is_link=yes][render=casing]
{
	line-color: #fff;
}

.roads[kind=minor_road][render=inline]
{
	line-color: #fff;
}

.roads[kind=minor_road][zoom<=14][render=inline]
{
	line-color: #999 !important;
}

.roads[kind=minor_road][zoom=15][render=inline]
{
	line-color: #000;
}

.roads[kind=minor_road][zoom>=16][render=inline]
{
	line-color: #ccc;
}

.roads[kind=minor_road][render=outline],
.roads[kind=minor_road][render=casing]
{
	line-color: #000;
}

.roads[kind=rail][render=inline],
.roads[kind=rail][render=casing],
.roads[kind=rail][render=outline]
{
	line-color: #444;
}

.roads[kind=path][zoom>=15][render=inline]
{
	line-color: #fff;
	/*line-dasharray: 2,5;*/
}


/*//////// Zoom Level 9 */

/*
.ne_10m_roads_north_america_inline[zoom=9][ScaleRank<=10]
{
	line-width: .2;
	line-color: #000;
}

.ne_10m_roads_north_america_casing[zoom=9][ScaleRank<=8]
{ 	
	line-width: 4.25;
	line-color: #fff;
}
.ne_10m_roads_north_america_inline[zoom=9][ScaleRank<=8]
{
	line-width: 1.5;
	line-color: #000;
}
*/

#z10-roads[zoom=9][kind=highway][render=inline]
{ 	
	line-width: 1.5;
	line-color: #000;
}

#z10-roads[zoom=9][kind=highway][render=outline]
{ 	
	line-width: 4.25;
	line-color: #fff;
}

#z10-roads[zoom=9][kind=major_road][render=inline]
{ 	
	line-width: 0.15; 
}

/*
#z10-roads[zoom=9][kind=minor_road][render=inline]
{ 	
	line-width: 1; 
}
*/


/*//////// Zoom Level 10 */

#z10-roads[zoom=10][kind=highway][render=inline]
{ 	
	line-width: 2;
}

#z10-roads[zoom=10][kind=highway][render=outline]
{ 	
	line-width: 6;
}

#z10-roads[zoom=10][kind=major_road][render=inline]
{ 	
	line-width: 0.5; 
}

#z10-roads[zoom=10][kind=minor_road][render=inline]
{ 	
	line-width: 0.2; 
}

/*//////// Zoom Level 11 */

#z11-roads[zoom=11][kind=highway][render=inline]
{ 	
	line-width: 2.5;
}

#z11-roads[zoom=11][kind=highway][render=outline]
{ 	
	line-width: 6;
}

#z11-roads[zoom=11][kind=major_road][render=inline]
{ 	
	line-width: 0.7; 
}

#z11-roads[zoom=11][kind=major_road][render=outline]
{ 	
	line-width: 1.25; 
}

#z11-roads[zoom=11][kind=minor_road][render=inline]
{ 	
	line-width: 0.2; 
}

/*//////// Zoom Level 12 */

#z12-roads[zoom=12][kind=highway][is_link=no][render=inline]
{ 	
	line-width: 3;
}

#z12-roads[zoom=12][kind=highway][is_link=no][render=outline]
{ 	
	line-width: 8;
}

#z12-roads[zoom=12][kind=major_road][render=inline]
{ 	
	line-width: 1;
}

#z12-roads[zoom=12][kind=major_road][render=outline]
{ 	
	line-width: 5;
}

#z12-roads[zoom=12][kind=minor_road][render=inline]
{ 	
	line-width: 0.2;
}

#z12-roads[zoom=12][is_link=yes][render=inline]
{ 	
	line-width: 0.5;
}

/*//////// Zoom Level 13 */

#z13-roads[zoom=13][kind=highway][is_link=no][render=inline]
{ 
	line-width: 3;
}

#z13-roads[zoom=13][kind=highway][is_link=no][render=outline]
{ 
	line-width: 8;
	line-color: #fff;
}

#z13-roads[zoom=13][kind=highway][is_link=yes][render=inline]
{ 
	line-width: 1;
}

#z13-roads[zoom=13][kind=highway][is_link=yes][is_bridge=yes][render=outline]
{ 
	line-width: 3;
}

#z13-roads[zoom=13][kind=highway][is_link=yes][render=inline]
{ 
	line-width: 1;	
}

#z13-roads[zoom=13][kind=highway][is_link=yes][render=outline]
{ 
	line-width: 3;
}

#z13-roads[zoom=13][kind=major_road][render=inline]
{ 	
	line-width: 1.5;
}

#z13-roads[zoom=13][kind=major_road][is_link=no][render=outline]
{ 
	line-width: 5;
}

#z13-roads[zoom=13][kind=minor_road][render=inline]
{
 	line-width: 0.4;
}


/*//////// Zoom Level 14 */

#z14-roads[zoom=14][kind=highway][render=inline]
{
	line-width: 4;
}

#z14-roads[zoom=14][kind=highway][render=outline],
#z14-roads[zoom=14][kind=highway][is_bridge=yes][render=casing]
{
	line-width: 8;
}

#z14-roads[zoom=14][kind=highway][is_link=yes][render=inline]
{
	line-width: 2.5;	
}

#z14-roads[zoom=14][kind=highway][is_link=yes][render=outline],
#z14-roads[zoom=14][kind=highway][is_link=yes][is_bridge=yes][render=casing]
{
	line-width: 6;
}

#z14-roads[zoom=14][kind=major_road][render=inline]
{
	line-width: 1.9;
}

#z14-roads[zoom=14][kind=major_road][render=outline],
#z14-roads[zoom=14][kind=major_road][is_bridge=yes][render=casing]
{
	line-width: 6;
}

#z14-roads[zoom=14][kind=major_road][is_link=yes][render=inline]
{
	line-width: 1.9;
}

#z14-roads[zoom=14][kind=major_road][is_link=yes][render=outline],
#z14-roads[zoom=14][kind=major_road][is_link=yes][is_bridge=yes][render=casing]
{
	line-width: 6;
}

#z14-roads[zoom=14][kind=minor_road][render=inline]
{
	line-width: 0.8;
}

/*
#z14-roads[zoom=14][kind=minor_road][render=outline],
#z14-roads[zoom=14][kind=minor_road][is_bridge=yes][render=casing]
{
	line-width: 3.5;
}
*/

#z14-roads[zoom=14][kind=rail][render=inline]
{
	line-width: 1;
}

#z14-roads[zoom=14][kind=rail][render=casing]
{
	line-width: 3;
	line-dasharray: 1,3;
	line-cap: butt;
}


/*//////// Zoom Level 15 */

#z15plus-roads[zoom=15][kind=highway][render=inline]
{
	line-width: 6;
}

#z15plus-roads[zoom=15][kind=highway][render=casing]
{
	line-width: 11;
}

#z15plus-roads[zoom=15][kind=highway][is_link=yes][render=inline]
{
	line-width: 2.25;	
}

#z15plus-roads[zoom=15][kind=highway][is_link=yes][render=casing]
{
	line-width: 6.5;
}

#z15plus-roads[zoom=15][kind=major_road][render=inline]
{
	line-width: 5;
}

#z15plus-roads[zoom=15][kind=major_road][render=casing]
{
	line-width: 8;
}

#z15plus-roads[zoom=15][kind=major_road][is_link=yes][render=inline]
{
	line-width: 2.25;
}

#z15plus-roads[zoom=15][kind=major_road][is_link=yes][render=casing]
{
	line-width: 5.5;
}

#z15plus-roads[zoom=15][is_tunnel=yes][render=casing]
{
    line-width: 3;
    line-opacity: 0.7;
    line-color: #ccc;
}

#z15plus-roads[zoom=15][is_tunnel=yes][is_link=yes][render=casing]
{
    line-width: 2.25;
    line-opacity: 0.7;
    line-color: #ccc;
}

#z15plus-roads[zoom=15][kind=minor_road][render=inline]
{
	line-width: 1.5;
	line-color: #000;
}

/*
#z15plus-roads[zoom=15][kind=minor_road][render=casing]
{
	line-width: 6;
	line-color: #fff;
}
*/

#z15plus-roads[zoom=15][highway=service][render=inline]
{
	line-width: 1.5;
	line-color: #000;
}

/*
#z15plus-roads[zoom=15][highway=service][render=casing]
{
	line-width: 3.5;
}
*/

#z15plus-roads[zoom=15][kind=rail][render=inline]
{
	line-width: 1;
}

#z15plus-roads[zoom=15][kind=rail][render=casing]
{
	line-width: 3;
	line-dasharray: 1,3;
	line-cap: butt;
}

#z15plus-roads[zoom=15][kind=path][render=inline]
{
	line-width: 2.25; 
	/*line-dasharray: 2,3;*/
	line-cap: butt;
}

/*//////// Zoom Level 16 */

#z15plus-roads[zoom=16][kind=highway][render=inline]
{
	line-width: 9;
}

#z15plus-roads[zoom=16][kind=highway][render=casing]
{
	line-width: 14;
}

#z15plus-roads[zoom=16][is_link=yes][render=inline]
{
	line-width: 2.5;
}

#z15plus-roads[zoom=16][is_link=yes][render=casing]
{
	line-width: 7;
}

#z15plus-roads[zoom=16][kind=major_road][render=inline]
{
	line-width: 7;
	line-color: #000;
}


#z15plus-roads[zoom=16][kind=major_road][is_link=no][render=casing]
{
	line-width: 11;
	line-color: #fff;
}

#z15plus-roads[zoom=16][kind=major_road][is_link=yes][render=inline]
{
	line-width: 2.5;
	line-color: #000;
}

#z15plus-roads[zoom=16][kind=major_road][is_link=yes][render=casing]
{
	line-width: 7;
	line-color: #fff;
}

#z15plus-roads[zoom=16][is_tunnel=yes][render=casing]
{
	line-width: 7;
    line-opacity: 0.4;
    line-color: #ccc;
}
#z15plus-roads[zoom=16][is_tunnel=yes][render=inline]
{
	line-width: 3;
    line-opacity: 0.7;
    line-color: #ccc;
}

#z15plus-roads[zoom=16][is_tunnel=yes][is_link=yes][render=casing]
{
	line-width: 7;
    line-opacity: 0.4;
    line-color: #fff;
}

#z15plus-roads[zoom=16][kind=minor_road][render=inline]
{
	line-width: 4;
	line-color: #000;
}


#z15plus-roads[zoom=16][kind=minor_road][render=casing]
{
	line-width: 7;
	line-color: #fff;
}


#z15plus-roads[zoom=16][highway=service][render=inline]
{
	line-width: 2;
	line-color: #000;
}

#z15plus-roads[zoom=16][highway=service][render=casing]
{
	line-width: 4;
	line-color: #fff;
}

#z15plus-roads[zoom=16][kind=rail][render=inline]
{
	line-width: 1;
}

#z15plus-roads[zoom=16][kind=rail][render=casing]
{
	line-width: 5;
	line-dasharray: 1,4;
	line-cap: butt;
}

#z15plus-roads[zoom=16][kind=path][render=inline]
{
	line-width: 3;
	/*line-dasharray: 2,3;*/
	line-cap: butt;
}

/*//////// Zoom Level 17 */

#z15plus-roads[zoom=17][kind=highway][render=inline]
{
	line-width: 15;
}

#z15plus-roads[zoom=17][kind=highway][render=casing]
{
	line-width: 24;
}

#z15plus-roads[zoom=17][kind=highway][is_link=yes][render=inline]
{
	line-width: 5;
}

#z15plus-roads[zoom=17][kind=highway][is_link=yes][render=casing]
{
	line-width: 9;
}

#z15plus-roads[zoom=17][kind=major_road][render=inline]
{
	line-width: 12;
	line-color: #000;
}

#z15plus-roads[zoom=17][kind=major_road][render=casing]
{
	line-width: 18;
	line-color: #fff;
}

#z15plus-roads[zoom=17][kind=major_road][is_link=yes][render=inline]
{
	line-width: 4;
	line-color: #000;
}

#z15plus-roads[zoom=17][kind=major_road][is_link=yes][render=casing]
{
	line-width: 8;
	line-color: #fff;
}

#z15plus-roads[zoom=17][is_tunnel=yes][render=casing]
{
	line-width: 12;
    line-opacity: 0.7;
    line-color: #ccc;
}

#z15plus-roads[zoom=17][is_tunnel=yes][is_link=yes][render=casing]
{
	line-width: 4;
    line-opacity: 0.7;
    line-color: #ccc;
}

#z15plus-roads[zoom=17][kind=minor_road][render=inline]
{
	line-width: 7;
	line-color: #000;
}

#z15plus-roads[zoom=17][kind=minor_road][render=casing]
{
	line-width: 9;
	line-color: #fff;
}

#z15plus-roads[zoom=17][highway=service][render=inline]
{
	line-width: 4;
	line-color: #000;
}

#z15plus-roads[zoom=17][highway=service][render=casing]
{
	line-width: 6;
	line-color: #fff;
}

#z15plus-roads[zoom=17][kind=rail][render=inline]
{
	line-width: 1;
}

#z15plus-roads[zoom=17][kind=rail][render=casing]
{
	line-width: 5;
	line-dasharray: 1,4;
	line-cap: butt;
}

#z15plus-roads[zoom=17][kind=path][render=inline]
{
	line-width: 4; 
	/*line-dasharray: 4,6;*/
	line-cap: butt;
}
	
	
/*//////// Zoom Level 18+ */

#z15plus-roads[zoom>=18][kind=highway][render=inline]
{
	line-width: 28;
	line-color: #fff;
}

#z15plus-roads[zoom>=18][kind=highway][render=casing]
{
	line-width: 42;
	line-color: #000;
}

#z15plus-roads[zoom>=18][kind=highway][is_link=yes][render=inline]
{
	line-width: 10;
	line-color: #fff;
}

#z15plus-roads[zoom>=18][kind=highway][is_link=yes][render=casing]
{
	line-width: 14;
	line-color: #000;
}

#z15plus-roads[zoom>=18][kind=major_road][render=inline]
{
	line-width: 18;
	line-color: #fff;
}

#z15plus-roads[zoom>=18][kind=major_road][render=casing]
{
	line-width: 22;
	line-color: #000;
}

#z15plus-roads[zoom>=18][kind=major_road][is_link=yes][render=inline]
{
	line-width: 9;
	line-color: #fff;
}

#z15plus-roads[zoom>=18][kind=major_road][is_link=yes][render=casing]
{
	line-width: 13;
	line-color: #000;
}

#z15plus-roads[zoom>=18][is_tunnel=yes][render=casing]
{
	line-width: 18;
    line-opacity: 0.7;
    line-color: #ccc;
}

#z15plus-roads[zoom>=18][is_tunnel=yes][is_link=yes][render=casing]
{
	line-width: 9;
    line-opacity: 0.7;
    line-color: #ccc;
}


#z15plus-roads[zoom>=18][kind=minor_road][render=inline]
{
	line-width: 13;
	line-color: #fff;
}

#z15plus-roads[zoom>=18][kind=minor_road][render=casing]
{
	line-width: 17;
	line-color: #000;
}

#z15plus-roads[zoom=18][kind=rail][render=inline]
{
	line-width: 2;
}

#z15plus-roads[zoom=18][kind=rail][render=casing]
{
	line-width: 7;
	line-dasharray: 2,6;
	line-cap: butt;
}

#z15plus-roads[zoom>=18][kind=path][render=inline]
{
	line-width: 2; 
	/*line-dasharray: 4,6;*/
	line-cap: butt;
}

/*//////// Zoom Level 19+ */

#z15plus-roads[zoom>18][kind=highway][render=inline]
{
	line-width: 35;
	line-color: #fff;
}

#z15plus-roads[zoom>18][kind=highway][render=casing]
{
	line-width: 49;
	line-color: #000;
}

#z15plus-roads[zoom>18][kind=highway][is_link=yes][render=inline]
{
	line-width: 16;
	line-color: #fff;
}

#z15plus-roads[zoom>18][kind=highway][is_link=yes][render=casing]
{
	line-width: 20;
	line-color: #000;
}

#z15plus-roads[zoom>18][kind=major_road][render=inline]
{
	line-width: 26;
	line-color: #fff;
}

#z15plus-roads[zoom>18][kind=major_road][render=casing]
{
	line-width: 30;
	line-color: #000;
}

#z15plus-roads[zoom>18][kind=major_road][is_link=yes][render=inline]
{
	line-width: 13;
	line-color: #fff;
}

#z15plus-roads[zoom>18][kind=major_road][is_link=yes][render=casing]
{
	line-width: 17;
	line-color: #000;
}

#z15plus-roads[zoom>18][is_tunnel=yes][render=casing]
{
	line-width: 24;
    line-opacity: 0.7;
    line-color: #ccc;
}

#z15plus-roads[zoom>18][is_tunnel=yes][is_link=yes][render=casing]
{
	line-width: 12;
    line-opacity: 0.7;
    line-color: #ccc;
}


#z15plus-roads[zoom>18][kind=minor_road][render=inline]
{
	line-width: 16;
	line-color: #fff;
}

#z15plus-roads[zoom>18][kind=minor_road][render=casing]
{
	line-width: 20;
	line-color: #000;
}

#z15plus-roads[zoom>18][kind=rail][render=inline]
{
	line-width: 4;
}

#z15plus-roads[zoom>18][kind=rail][render=casing]
{
	line-width: 9;
	line-dasharray: 4,7;
	line-cap: butt;
}

#z15plus-roads[zoom>18][kind=path][render=inline]
{
	line-width: 4; 
	/*line-dasharray: 4,6;*/
	line-cap: butt;
}