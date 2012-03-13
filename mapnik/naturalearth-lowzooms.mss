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
    map-bgcolor: #000;      /* the "ocean" is black */
}

/*
"shore" is a general class for layers with continents, coastlines,
lakes, and other kinds of meeting points between water and land.
*/
.shore
{
    line-color: #000;
    line-cap: round;
    line-join: round;
}

#country-shapes-110m[zoom>=2][zoom<3]
{
    line-width: 0.25;
    polygon-fill: #fff;
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
    polygon-fill: #fff;
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
	line-color: #fff; 
}

.country-boundary-10m[zoom=6]
{
    line-color: #000;
    line-width: 1.2;
}
.country-boundary-10m[zoom=7],
.country-boundary-10m[zoom=8],
.country-boundary-10m[zoom=9]
{
    line-color: #000;
    line-width: 1.2;
    line-dasharray: 3,7;
	line-cap: round;
}
.country-boundary-10m-whiteout[zoom=7],
.country-boundary-10m-whiteout[zoom=8],
.country-boundary-10m-whiteout[zoom=9]
{
    line-color: #fff;
    line-width: 2;
}

#admin1-lines-50m[zoom>=3][zoom<6]
{
    line-width: 0.35;
    line-color: #000;
}

#admin1-lines-10m[zoom=6]
{
    line-width: 0.6;
    line-color: #000;
}
#admin1-lines-10m[zoom=7]
{
    line-width: 1.5;
    line-color: #686868;
    line-dasharray: 1,5;
	line-cap: round;
}
#admin1-lines-10m[zoom=8]
{
    line-width: 2.0;
    line-color: #4d4d4d;
    line-dasharray: 1,5;
	line-cap: round;
}


#lakes-110m[zoom<3],
#lakes-50m[zoom>=3][zoom<6][scalerank<3],
#lakes-50m[zoom>=6][zoom<6],
#lakes-10m[zoom>=6][zoom<8]
{
    line-width: 1;
    polygon-fill: #000;
}


/*
Roads at the mid-zooms
*/

.ne_10m_z6_roads[zoom=6]
{
	line-width: 0.1;
    line-color: #000;
}


.ne_10m_z7_roads_casing[zoom=7]
{
	line-width: 2.25;
	line-color: #fff;
	line-opacity: 0.5;
}
.ne_10m_z7_roads_inline[zoom=7]
{
	line-width: 0.12;
    line-color: #000;
}
.ne_10m_z7_roads_inline[zoom=7][scalerank=3],
.ne_10m_z7_roads_inline[zoom=7][scalerank=4],
.ne_10m_z7_roads_inline[zoom=7][roadtype="Beltway"],
.ne_10m_z7_roads_inline[zoom=7][scalerank<=5][type_2="Expressway"]
{
	line-width: 1.5;
}

.ne_10m_z7_roads_casing[zoom=8]
{ 	
	line-width: 3.25;
	line-color: #fff;
	line-opacity: 0.5;
}
.ne_10m_z7_roads_inline[zoom=8]
{
	line-width: .2;
	line-color: #000;
}
.ne_10m_z7_roads_inline[zoom=8][scalerank=3],
.ne_10m_z7_roads_inline[zoom=8][scalerank=4],
.ne_10m_z7_roads_inline[zoom=8][roadtype="Beltway"],
.ne_10m_z7_roads_inline[zoom=8][scalerank<=5][type_2="Expressway"]
{
	line-width: 1.5;
}
