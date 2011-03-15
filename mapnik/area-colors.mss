Map { map-bgcolor: #000000; }
#water-bodies[zoom>=9] { polygon-fill: #000000; }

#processed-coast-background[zoom>=9] { polygon-fill: #ffffff; }

#green-areas[zoom>=9][kind=forest],
#green-areas[zoom>=10][kind=park],
#green-areas[zoom>=12]
{
    polygon-pattern-file: url('halftone2.png');
}

/*
#civic-areas[zoom>=12] { polygon-pattern-file: url('halftone2.png'); }

#parking-areas[zoom>=12] { polygon-pattern-file: url('halftone2.png'); }

#building-areas[zoom>=12] { polygon-pattern-file: url('halftone2.png'); }
*/
