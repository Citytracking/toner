.osm-place-points[zoom=11][place=city] name 
{
    text-allow-overlap: false;
    text-face-name: 'Arial Bold';
    text-fill: #000;
    text-halo-radius: 2;
    text-halo-fill: #fff;
    text-size: 20;
}


/*
.osm-place-points[zoom=11][place=town] name
{
    text-allow-overlap: false;
    text-face-name: 'Arial Bold';
    text-fill: #000;
    text-halo-radius: 2;
    text-halo-fill: #fff;
	text-size: 13;
}
*/






#green-areas-labels[zoom=12][kind=park][area>2000000] name 
{ 
    text-face-name: 'Arial Italic';
    text-size: 11;
    text-placement: point;
    text-max-char-angle-delta: 30;
    text-fill: #000;
    text-halo-radius: 2;
    text-halo-fill: #fff;
    text-spacing: 100;
    text-allow-overlap: true;
    text-wrap-width: 30;
}
#green-areas-labels[zoom=13][kind=park][area>200000] name 
{ 
    text-face-name: 'Arial Italic';
    text-size: 11;
    text-placement: point;
    text-max-char-angle-delta: 30;
    text-fill: #000;
    text-halo-radius: 2;
    text-halo-fill: #fff;
    text-spacing: 100;
    text-allow-overlap: true;
    text-wrap-width: 30;
}
#green-areas-labels[zoom=14][kind=park][area>50000] name 
{ 
    text-face-name: 'Arial Italic';
    text-size: 11;
    text-placement: point;
    text-max-char-angle-delta: 30;
    text-fill: #000;
    text-halo-radius: 2;
    text-halo-fill: #fff;
    text-spacing: 100;
    text-allow-overlap: true;
    text-wrap-width: 30;
}
#green-areas-labels[zoom=15][kind=park][area>20000] name 
{ 
    text-face-name: 'Arial Italic';
    text-size: 11;
    text-placement: point;
    text-max-char-angle-delta: 30;
    text-fill: #000;
    text-halo-radius: 2;
    text-halo-fill: #fff;
    text-spacing: 100;
    text-allow-overlap: true;
    text-wrap-width: 30;
}

#green-areas-labels[zoom>=16][kind=park] name 
{ 
    text-face-name: 'Arial Italic';
    text-size: 12;
    text-placement: point;
    text-max-char-angle-delta: 30;
    text-wrap-width: 40;
    text-fill: #000;
    text-halo-radius: 2;
    text-halo-fill: #fff;
    text-spacing: 100;
    text-allow-overlap: true;
    text-wrap-width: 40;
}








#major-road-labels[zoom>=12] name
{
    text-face-name: 'Arial Regular';
    text-placement: line;
    text-max-char-angle-delta: 30;
    text-fill: #000;
    text-halo-radius: 1;
    text-halo-fill: #fff;
    text-spacing: 100;
}

#major-road-labels[highway=trunk][zoom>=14] name
{
    text-face-name: 'Arial Bold';
    text-placement: line;
    text-max-char-angle-delta: 30;
    text-fill: #000;
    text-halo-radius: 1;
    text-halo-fill: #fff;
    text-spacing: 100;
}

#major-road-labels[highway=primary][zoom>=14] name
{
    text-face-name: 'Arial Bold';
    text-placement: line;
    text-max-char-angle-delta: 30;
    text-fill: #000;
    text-halo-radius: 1;
    text-halo-fill: #fff;
    text-spacing: 100;
}

#major-road-labels[highway=primary][zoom>=16] name
{
    text-halo-radius: 2;
}

#major-road-labels[zoom=16] name
{
    text-fill: #000;
    text-halo-fill: #fff;
}

#major-road-labels[is_tunnel=yes][zoom>=15] name
{
    text-fill: #777;
    text-halo-fill: #fff;
}

#minor-road-labels[zoom>=16] name
{
    text-face-name: 'Arial Regular';
    text-placement: line;
    text-max-char-angle-delta: 30;
    text-fill: #000;
    text-halo-radius: 1;
    text-halo-fill: #fff;
    text-spacing: 100;
}

#major-road-labels[zoom=12] name { text-dy: 7; }
#major-road-labels[highway=trunk][zoom=12] name { text-size: 12; }
#major-road-labels[highway=primary][zoom=12] name { text-size: 12; }

#major-road-labels[zoom=13] name { text-dy: 8; }
#major-road-labels[highway=trunk][zoom=13] name { text-size: 13; }
#major-road-labels[highway=primary][zoom=13] name { text-size: 13; }

#major-road-labels[highway=trunk][zoom=14] name { text-dy: 9; text-size: 14; }
#major-road-labels[highway=primary][zoom=14] name { text-dy: 9; text-size: 14; }
#major-road-labels[highway=secondary][zoom=14] name { text-dy: 7; text-size: 12; }

#major-road-labels[highway=trunk][zoom=15] name { text-dy: 12; text-size: 15; }
#major-road-labels[highway=primary][zoom=15] name { text-dy: 12; text-size: 15; }
#major-road-labels[highway=secondary][zoom=15] name { text-dy: 11; text-size: 13; }
#major-road-labels[highway=tertiary][zoom=15] name { text-dy: 11; text-size: 13; }

#major-road-labels[highway=trunk][zoom=16] name { text-dy: 13; text-size: 14; }
#major-road-labels[highway=primary][zoom=16] name { text-dy: 13; text-size: 14; }
#major-road-labels[highway=secondary][zoom=16] name { text-dy: 13; text-spacing: 124; text-size: 13; text-halo-radius: 2; }
#major-road-labels[highway=tertiary][zoom=16] name { text-dy: 13; text-spacing: 124; text-size: 13; text-halo-radius: 2; }
#minor-road-labels[zoom=16] name { text-dy: 10; text-spacing: 124; text-size: 10; text-halo-radius: 2; }

#major-road-labels[highway=trunk][zoom=17] name { text-dy: 16; text-size: 16; }
#major-road-labels[highway=primary][zoom=17] name { text-dy: 14; text-size: 14; }
#major-road-labels[highway=secondary][zoom=17] name { text-dy: 14; text-spacing: 180; text-size: 14; text-halo-radius: 2; }
#major-road-labels[highway=tertiary][zoom=17] name { text-dy: 13; text-spacing: 180; text-size: 12; text-halo-radius: 2; }
#minor-road-labels[zoom=17] name { text-dy: 13; text-spacing: 180; text-size: 12; text-halo-radius: 2; }

#major-road-labels[highway=trunk][zoom>=18] name { text-size: 16; }
#major-road-labels[highway=primary][zoom>=18] name { text-size: 14; }
#major-road-labels[highway=secondary][zoom>=18] name { text-size: 14; text-spacing: 300; text-halo-radius: 2; }
#major-road-labels[highway=tertiary][zoom>=18] name { text-size: 12; text-spacing: 400; text-halo-radius: 2; }
#minor-road-labels[zoom>=18] name { text-size: 12; text-spacing: 400; text-halo-radius: 2; }


#poi-stations[zoom>=18][railway=station] name 
{ 
    text-face-name: 'Arial Bold';
    text-size: 12;
    text-placement: point;
    text-max-char-angle-delta: 30;
    text-fill: #4581C3;
    text-halo-radius: 1;
    text-halo-fill: #fff;
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
