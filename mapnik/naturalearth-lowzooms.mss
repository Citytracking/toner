Map
{
    map-bgcolor: #000000;
}

/*
"shore" is a general class for layers with continents, coastlines,
lakes, and other kinds of meeting points between water and land.
*/
.shore
{
    line-color: #000000;
    line-cap: round;
    line-join: round;
}


#country-shapes-110m[zoom>=2][zoom<3]
{
    line-width: 0.25;
    polygon-fill: #fff;
}


#land-shapes-110m[zoom<2],
#country-shapes-50m[zoom>=3][zoom<6],
#country-shapes-10m[zoom>=6][zoom<8],
#processed-coast-outline[zoom>=8],
#processed-coast-inline[zoom>=8]
{
    line-width: 0.75;
    polygon-fill: #fff;
}

/*
Adjust the inner and outer line-widths and fatten up the inner shap
with some land color to account for tiled data in the coastline tab
*/
#processed-coast-outline[zoom>=8] { line-width: 2.5; }
#processed-coast-inline[zoom>=8] { line-width: 0.5; line-color: #fff; }

#admin1-lines-50m[zoom>=3][zoom<6]
{
    line-width: 0.35;
    line-color: #000;
}

#admin1-lines-10m[zoom>=6][zoom<=8]
{
    line-width: 0.6;
    line-color: #000;
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
Continent labels are just points.
*/
#continent-labels[zoom>=1][zoom<3] name
{
    text-face-name: 'Arial Bold';
    text-wrap-width: 32;
    text-size: 14;
    text-fill: #000;
    text-halo-radius: 3;
    text-halo-fill: #fff;
}


/*
Ocean, Sea, Bay and other marine labels. Some use of scalerank column
here helps define exactly which features come in at which zoom levels.
*/
#marine-labels-110m[zoom=2][scalerank=0] name,
#marine-labels-110m[zoom=3] name,
#marine-labels-50m[zoom=4][scalerank<4] name
{
    text-face-name: 'Arial Bold Italic';
    text-wrap-width: 80;
    text-size: 14;
    text-fill: #fff;
    text-halo-radius: 1;
    text-halo-fill: #000;
}

#marine-labels-50m[zoom>=5][zoom<6] name,
#marine-labels-10m[zoom>=6] name
{
    text-face-name: 'Arial Italic';
    text-wrap-width: 80;
    text-size: 14;
    text-fill: #fff;
    text-halo-radius: 1;
    text-halo-fill: #000;
}

/*
Todo: draw names of small countries at higher zoom levels?
*/
#country-labels-110m[zoom=3][longfrom<=3] name,
#country-labels-110m[zoom=3][longfrom>3] shortname
{
    text-face-name: 'Arial Regular';
    text-wrap-width: 80;
    text-size: 13;
    text-fill: #000;
    text-halo-radius: 2;
    text-halo-fill: #fff;
}

#country-labels-110m[zoom=4][longfrom<=4] name,
#country-labels-110m[zoom=4][longfrom>4] shortname
{
    text-face-name: 'Arial Bold';
    text-wrap-width: 80;
    text-size: 14;
    text-fill: #000;
    text-halo-radius: 2;
    text-halo-fill: #fff;
}

#country-labels-110m[zoom=5][longfrom<=5] name,
#country-labels-110m[zoom=5][longfrom>5] shortname
{
    text-face-name: 'Arial Bold';
    text-wrap-width: 80;
    text-size: 16;
    text-fill: #000;
    text-halo-radius: 2;
    text-halo-fill: #fff;
}

#country-labels-110m[zoom>=6][zoom<7][longfrom<=6] name,
#country-labels-110m[zoom>=6][zoom<7][longfrom>6] shortname
{
    text-face-name: 'Arial Bold';
    text-wrap-width: 80;
    text-size: 18;
    text-fill: #000;
    text-halo-radius: 2;
    text-halo-fill: #fff;
}



#admin1-labels-50m[zoom>=4][zoom<6] abbr,
#admin1-labels-50m[zoom>=6][zoom<8] name
{
    text-face-name: 'Arial Regular';
    text-wrap-width: 80;
    text-fill: #000;
    text-halo-radius: 2;
    text-halo-fill: #fff;
}

#admin1-labels-50m[zoom=4]{ text-size: 12; }
#admin1-labels-50m[zoom=5]{ text-size: 16; }
#admin1-labels-50m[zoom=6]{ text-size: 18; }
#admin1-labels-50m[zoom=7]{ text-size: 20; }
#admin1-labels-50m[zoom=8]{ text-size: 20; }

#city-points-z4[zoom=4],
#city-points-z5[zoom=5],
#city-points-z6[zoom=6],
#city-points-z7[zoom=7],
#city-points-z8[zoom=8]
{
    point-file: url('dot.png');
}

/*
#city-points-z6[name="Washington"][zoom=6]
{
    point-file: url('star.png');
}

#city-points-z6[name="Berlin"][zoom=6]
{
    point-file: url('star.png');
}

#city-points-z6[name="Prague"][zoom=6]
{
    point-file: url('star.png');
}

#city-points-z6[name="Warsaw"][zoom=6]
{
    point-file: url('star.png');
}

#city-points-z6[name="Brussels"][zoom=6]
{
    point-file: url('star.png');
}

#city-points-z6[name="Paris"][zoom=6]
{
    point-file: url('star.png');
}
*/



#city-labels-z4[zoom=4] name,
#city-labels-z5[zoom=5] name,
#city-labels-z6[zoom=6] name
{
    text-allow-overlap: true;
    text-face-name: 'Arial Regular';
    text-fill: #000;
    text-halo-radius: 2;
    text-halo-fill: #fff;
}

#city-labels-z7[zoom=7] name,
#city-labels-z8[zoom=8] name
{
    text-allow-overlap: true;
    text-face-name: 'Arial Bold';
    text-fill: #000;
    text-halo-radius: 2;
    text-halo-fill: #fff;
}

/*
City Labels ZOOM 4
*/
.city-labels[zoom=4] name { text-size: 10; }
.city-labels[zoom=4][population>=25000] name { text-size: 10; }
.city-labels[zoom=4][population>=100000] name { text-size: 10; }
.city-labels[zoom=4][population>=1000000] name { text-size: 14; }

/*
City Labels ZOOM 5
*/
.city-labels[zoom=5] name { text-size: 12; }
.city-labels[zoom=5][population>=25000] name { text-size: 12; }
.city-labels[zoom=5][population>=100000] name { text-size: 12; }
.city-labels[zoom=5][population>=1000000] name { text-size: 16; }

/*
City Labels ZOOM 6
*/
.city-labels[zoom=6] name { text-size: 12; }
.city-labels[zoom=6][population>=25000] name { text-size: 12; }
.city-labels[zoom=6][population>=100000] name { text-size: 12; }
.city-labels[zoom=6][population>=1000000] name { text-size: 18; }

/*
City Labels ZOOM 7
*/
.city-labels[zoom=7] name { text-size: 12; }
.city-labels[zoom=7][population>=25000] name { text-size: 12; }
.city-labels[zoom=7][population>=100000] name { text-size: 12; }
.city-labels[zoom=7][population>=1000000] name { text-size: 18; }

/*
City Labels ZOOM 8
*/
.city-labels[zoom=8] name { text-size: 13; }
.city-labels[zoom=8][population>=25000] name { text-size: 13; }
.city-labels[zoom=8][population>=100000] name { text-size: 20; }
.city-labels[zoom=8][population>=1000000] name { text-size: 20; }
