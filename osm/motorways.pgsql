SELECT DropGeometryColumn('', 'planet_osm_motorways', 'way_orig');
SELECT DropGeometryColumn('', 'planet_osm_motorways', 'way_zoom6');
SELECT DropGeometryColumn('', 'planet_osm_motorways', 'way_zoom7');
SELECT DropGeometryColumn('', 'planet_osm_motorways', 'way_zoom8');
SELECT DropGeometryColumn('', 'planet_osm_motorways', 'way_zoom9');

DROP TABLE "planet_osm_motorways";

BEGIN;

CREATE TABLE "planet_osm_motorways" (

    osm_id  INTEGER,
    highway TEXT,
    name    TEXT,
    ref     TEXT,
    route   TEXT

);

SELECT AddGeometryColumn('', 'planet_osm_motorways', 'way_orig', '900913', 'LINESTRING', 2);
SELECT AddGeometryColumn('', 'planet_osm_motorways', 'way_zoom6', '900913', 'LINESTRING', 2);
SELECT AddGeometryColumn('', 'planet_osm_motorways', 'way_zoom7', '900913', 'LINESTRING', 2);
SELECT AddGeometryColumn('', 'planet_osm_motorways', 'way_zoom8', '900913', 'LINESTRING', 2);
SELECT AddGeometryColumn('', 'planet_osm_motorways', 'way_zoom9', '900913', 'LINESTRING', 2);

INSERT INTO "planet_osm_motorways"

    SELECT osm_id, name, highway, ref, route,
           way AS way_orig,
           ST_Simplify(way, 20037508*2 / 2^(8 +  6)) AS way_zoom6,
           ST_Simplify(way, 20037508*2 / 2^(8 +  7)) AS way_zoom7,
           ST_Simplify(way, 20037508*2 / 2^(8 +  8)) AS way_zoom8,
           ST_Simplify(way, 20037508*2 / 2^(8 +  9)) AS way_zoom9
    FROM planet_osm_line
    WHERE highway IN ('motorway', 'trunk');

COMMIT;
