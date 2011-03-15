.lo-lines,
.med-lines,
.hi-lines
{
	line-join: round;
	line-cap: round;
}


/*
	Zoom Level 9
*/

.lo-sublines[highway=trunk][zoom=9] { line-width: 1; }

.lo-inlines[highway=motorway][zoom=9] { line-width: 1.6; }
.lo-outlines[highway=motorway][zoom=9] { line-width: 4; }

/*
	Zoom Level 10
*/

.lo-inlines[highway=motorway][zoom=10] { line-width: 2; }
.lo-outlines[highway=motorway][zoom=10] { line-width: 6; }

.lo-lines[highway=trunk][zoom=10] { line-width: 1; }
.lo-lines[highway=primary][zoom=10] { line-width: 1; }
.lo-lines[highway=secondary][zoom=10] { line-width: 0.15; }


/*
	Zoom Level 11
*/

.med-inlines[highway=motorway][zoom=11] { line-width: 2.5; }
.med-outlines[highway=motorway][zoom=11] { line-width: 7; }

.med-lines[highway=trunk][zoom=11] { line-width: 1.25; }
.med-outlines[highway=trunk][zoom=11] { line-width: 4; }

.med-lines[highway=primary][zoom=11] { line-width: 1; }
.med-lines[highway=secondary][zoom=11] { line-width: 0.15; }
/*
.med-lines[highway=tertiary][zoom=11] { line-width: 0.15; }
.med-lines[kind=minor_road][highway!=service][zoom=11] { line-width: 0.15; }
.med-lines[highway=service][zoom=11] { line-width: 0.15; }
*/


/*
	Zoom Level 12
*/
.med-inlines[highway=motorway][zoom=12] { line-width: 3.2; }
.med-outlines[highway=motorway][zoom=12] { line-width: 8; }
.med-inlines[highway=motorway_link][zoom=12] { line-width: 1; }

.med-inlines[highway=trunk][zoom=12] { line-width: 1.5; }
.med-outlines[highway=trunk][zoom=12] { line-width: 4; }
.med-inlines[highway=trunk_link][zoom=12] { line-width: 1; }

.med-inlines[highway=primary][zoom=12] { line-width: 2; }
.med-outlines[highway=primary][zoom=12] { line-width: 6; }
.med-inlines[highway=primary_link][zoom=12] { line-width: 1; }

.med-inlines[highway=secondary][zoom=12] { line-width: 1; }

.med-inlines[highway=tertiary][zoom=12] { line-width: 0.15; }
/*
.med-inlines[kind=minor_road][highway!=service][zoom=12] { line-width: 0.2; }
.med-inlines[highway=service][zoom=12] { line-width: 0.2; }
.med-inlines[kind=path][zoom=12] { line-width: 0.15; }
*/


/*
	Zoom Level 13
*/
.med-inlines[highway=motorway][zoom=13] { line-width: 4; }
.med-outlines[highway=motorway][zoom=13] { line-width: 10; }
.med-inlines[highway=motorway_link][zoom=13] { line-width: 1.1; }
.med-outlines[highway=motorway_link][zoom=13] { line-width: 2.5; }

.med-inlines[highway=trunk][zoom=13] { line-width: 2; }
.med-outlines[highway=trunk][zoom=13] { line-width: 5; }
.med-inlines[highway=trunk_link][zoom=13] { line-width: 1; }
.med-outlines[highway=trunk_link][zoom=13] { line-width: 3; }

.med-inlines[highway=primary][zoom=13] { line-width: 2; }
.med-outlines[highway=primary][zoom=13] { line-width: 4; }
.med-inlines[highway=primary_link][zoom=13] { line-width: 1; }

.med-inlines[highway=secondary][zoom=13] { line-width: 2; }
.med-outlines[highway=secondary][zoom=13] { line-width: 4; }
.med-inlines[highway=secondary_link][zoom=13] { line-width: 1; }

.med-inlines[highway=tertiary][zoom=13] { line-width: 0.15; }
.med-inlines[kind=minor_road][highway!=service][zoom=13] { line-width: 0.15; }
/*
.med-inlines[highway=service][zoom=13] { line-width: 0.4; }
.med-inlines[kind=path][zoom=13] { line-width: 0.25; }
*/


/*
	Zoom Level 14
*/
.hi-inlines[highway=motorway][zoom=14] { line-width: 5; }
.hi-outlines[highway=motorway][zoom=14] { line-width: 10; }
.hi-inlines[highway=motorway_link][zoom=14] { line-width: 2.2; }
.hi-outlines[highway=motorway_link][zoom=14] { line-width: 3.8; }

.hi-inlines[highway=trunk][zoom=14] { line-width: 2.2; }
.hi-outlines[highway=trunk][zoom=14] { line-width: 3.8; }
.hi-inlines[highway=trunk_link][zoom=14] { line-width: 1.1; }
.hi-outlines[highway=trunk_link][zoom=14] { line-width: 2; }

.hi-inlines[highway=primary][zoom=14] { line-width: 2.2; }
.hi-outlines[highway=primary][zoom=14] { line-width: 3.8; }
.hi-inlines[highway=primary_link][zoom=14] { line-width: 1; }

.hi-inlines[highway=secondary][zoom=14] { line-width: 2.2; }
.hi-outlines[highway=secondary][zoom=14] { line-width: 3.8; }
.hi-inlines[highway=secondary_link][zoom=14] { line-width: 1; }

.hi-inlines[highway=tertiary][zoom=14] { line-width: 2; }
.hi-outlines[highway=tertiary][zoom=14] { line-width: 2.4; }

.hi-inlines[kind=minor_road][highway!=service][zoom=14] { line-width: 0.25; }
.hi-inlines[highway=service][zoom=14] { line-width: 0.25; }
.hi-inlines[kind=path][zoom=14] { line-width: 0.15; }


/*
	Zoom Level 15
*/
.hi-sublines[zoom=15] { line-width: .5; }

.hi-inlines[highway=motorway][zoom=15] { line-width: 6; }
.hi-outlines[highway=motorway][zoom=15] { line-width: 10.4; }
.hi-inlines[highway=motorway_link][zoom=15] { line-width: 3; }
.hi-outlines[highway=motorway_link][zoom=15] { line-width: 5; }

.hi-inlines[highway=trunk][zoom=15] { line-width: 6; }
.hi-outlines[highway=trunk][zoom=15] { line-width: 10.4; }
.hi-inlines[highway=trunk_link][zoom=15] { line-width: 3; }
.hi-outlines[highway=trunk_link][zoom=15] { line-width: 5; }

.hi-inlines[highway=primary][zoom=15] { line-width: 6; }
.hi-outlines[highway=primary][zoom=15] { line-width: 10.4; }
.hi-inlines[highway=primary_link][zoom=15] { line-width: 1; }
.hi-outlines[highway=primary_link][zoom=15] { line-width: 1.6; }

.hi-inlines[highway=secondary][zoom=15] { line-width: 5.5; }
.hi-outlines[highway=secondary][zoom=15] { line-width: 9.5; }
.hi-inlines[highway=secondary_link][zoom=15] { line-width: 1; }
.hi-outlines[highway=secondary_link][zoom=15] { line-width: 1.6; }

.hi-inlines[highway=tertiary][zoom=15] { line-width: 2; }
.hi-outlines[highway=tertiary][zoom=15] { line-width: 2.4; }

.hi-inlines[kind=minor_road][highway!=service][zoom=15] { line-width: 2; }
.hi-outlines[kind=minor_road][highway!=service][zoom=15] { line-width: 2.4; }

.hi-inlines[highway=service][zoom=15] { line-width: 0.5; }

.hi-inlines[kind=minor_road][zoom=15] { line-width: 6; }

.hi-inlines[kind=path][zoom=15] { line-width: 1; }


/*
	Zoom Level 16
*/
.hi-sublines[zoom=16] { line-width: .5; }

.hi-inlines[highway=motorway][zoom=16] { line-width: 14; }
.hi-outlines[highway=motorway][zoom=16] { line-width: 20; }
.hi-inlines[highway=motorway_link][zoom=16] { line-width: 7; }
.hi-outlines[highway=motorway_link][zoom=16] { line-width: 9; }

.hi-inlines[highway=trunk][zoom=16] { line-width: 14; }
.hi-outlines[highway=trunk][zoom=16] { line-width: 20; }
.hi-inlines[highway=trunk_link][zoom=16] { line-width: 7; }
.hi-outlines[highway=trunk_link][zoom=16] { line-width: 9; }

.hi-inlines[highway=primary][zoom=16] { line-width: 12; }
.hi-outlines[highway=primary][zoom=16] { line-width: 16; }
.hi-inlines[highway=primary_link][zoom=16] { line-width: 4; }
.hi-outlines[highway=primary_link][zoom=16] { line-width: 6; }

.hi-inlines[highway=secondary][zoom=16] { line-width: 12; }
.hi-outlines[highway=secondary][zoom=16] { line-width: 16; }
.hi-inlines[highway=secondary_link][zoom=16] { line-width: 4; }
.hi-outlines[highway=secondary_link][zoom=16] { line-width: 6; }

.hi-inlines[highway=tertiary][zoom=16] { line-width: 9; }
.hi-outlines[highway=tertiary][zoom=16] { line-width: 11; }

.hi-inlines[kind=minor_road][zoom=16] { line-width: 9; }
.hi-outlines[kind=minor_road][zoom=16] { line-width: 11; }

.hi-inlines[highway=service][zoom=16] { line-width: 9; }
.hi-outlines[highway=service][zoom=16] { line-width: 11; }

.hi-inlines[kind=path][zoom=16] { line-width: 1; }
.hi-outlines[kind=path][zoom=16] { line-width: 2; }

/*
	Zoom Level 17
*/
.hi-sublines[zoom=17] { line-width: .5; }

.hi-inlines[highway=motorway][zoom=17] { line-width: 22; }
.hi-outlines[highway=motorway][zoom=17] { line-width: 30; }
.hi-inlines[highway=motorway_link][zoom=17] { line-width: 13; }
.hi-outlines[highway=motorway_link][zoom=17] { line-width: 19; }

.hi-inlines[highway=trunk][zoom=17] { line-width: 18; }
.hi-outlines[highway=trunk][zoom=17] { line-width: 22; }
.hi-inlines[highway=trunk_link][zoom=17] { line-width: 6; }
.hi-outlines[highway=trunk_link][zoom=17] { line-width: 8; }

.hi-inlines[highway=primary][zoom=17] { line-width: 18; }
.hi-outlines[highway=primary][zoom=17] { line-width: 22; }
.hi-inlines[highway=primary_link][zoom=17] { line-width: 6; }
.hi-outlines[highway=primary_link][zoom=17] { line-width: 8; }

.hi-inlines[highway=secondary][zoom=17] { line-width: 18; }
.hi-outlines[highway=secondary][zoom=17] { line-width: 22; }
.hi-inlines[highway=secondary_link][zoom=17] { line-width: 6; }
.hi-outlines[highway=secondary_link][zoom=17] { line-width: 8; }

.hi-inlines[highway=tertiary][zoom=17] { line-width: 13; }
.hi-outlines[highway=tertiary][zoom=17] { line-width: 15; }

.hi-inlines[kind=minor_road][zoom=17] { line-width: 11; }
.hi-outlines[kind=minor_road][zoom=17] { line-width: 13; }

.hi-inlines[highway=service][zoom=17] { line-width: 11; }
.hi-outlines[highway=service][zoom=17] { line-width: 13; }

.hi-inlines[kind=path][zoom>=17] { line-width: 2; }
.hi-outlines[kind=path][zoom>=17] { line-width: 3; }