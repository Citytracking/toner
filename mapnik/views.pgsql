-- High Road
--
-- This file is a collection of Postgres views that make rendering roads from
-- OpenStreetMap data easier and better-looking. They are broken up by zoom
-- level, corresponding to numbered levels in the traditional web-map spherical
-- mercator projects. Zoom 0 is the entire planet, zoom 10 is where the street
-- details of cities become visible, and zoom 15 is where complex physical road
-- layering such as overpasses and tunnels becomes important.
-- 
-- Taking a cue from Justin O’Bierne’s dearly-departed 41Latitude blog, High
-- Road ensures that each zoom level contains exactly three distinct levels of
-- road: highways, major roads, and minor roads, a simplification of
-- OpenStreetMap’s conventional six-level hierarchy of motorway, trunk, primary,
-- secondary, tertiary, and small local roads.
-- 
-- These three categories are represented by the "kind" attribute, with values
-- of "highway", "major_road", and "minor_road". At the highest zoom levels, a
-- fourth value of "path" appears for footpaths.
-- 
-- 
-- Setup
-- 
-- High Road can be applied to an existing OpenStreetMap rendering database
-- created with osm2pgsql (http://wiki.openstreetmap.org/wiki/Osm2pgsql). Using
-- the command-line psql utility, you can add High Road views like this:
-- 
--     psql -U username -f views.pgsql databasename
-- 
-- The views here assume that you've created your database using the default
-- settings of osm2pgsql, including the prefix of "planet_osm". If you've chosen
-- a different prefix, you should find every instance of "planet_osm" in the
-- script below and replace is with your chosen prefix.
-- 
-- 
-- Rendering
-- 
-- In order to work well with Mapnik, Cascadenik and Carto and make it easy to
-- add road casings that look physically correct, High Road returns multiple
-- copies of each geometry with a "render" attribute.
-- 
-- Render="outline" is used to attach casings around entire classes of roads,
-- and ensures that multiple carriageways and complex interchanges merge cleanly
-- to reduce map noise.
-- 
-- Render="inline" is used for the inner lines of the roads themselves, and
-- represents the road surface.
-- 
-- Render="casing" is present only at zoom level 14 and above, and is used to
-- introduce local outlines to roads that overlap one another. An example use of
-- features with this attribute would be to correctly show overpasses in a
-- complex highway interchange.
-- 
-- 
-- Inclusion
-- 
-- At zoom levels 10 and 11, local and residential streets are omitted. Bold,
-- simple highways dominate the map, and the visual layering is categorical to
-- clearly separate each road type.
-- 
-- At zoom levels 12 and 13, local roads are added for texture but remain
-- separated from highways and arterial roads. Visual layering is by category,
-- with highways appearing in front of everything else.
-- 
-- At zoom level 14, highways remain separate from other roads but the physical
-- layering of on-ramps becomes visible.
-- 
-- At zoom level 15 and above, roads are layered physically using the tunnel,
-- bridge, and layer tags from OpenStreetMap to create correctly-drawn
-- intersections between different types of roads. Footpaths begin to appear
-- at this zoom level as well.
--

BEGIN;

DROP VIEW IF EXISTS planet_osm_line_z15plus_big;
DROP VIEW IF EXISTS planet_osm_line_z15plus_small;
DROP VIEW IF EXISTS planet_osm_line_z15plus;
DROP VIEW IF EXISTS planet_osm_line_z14;
DROP VIEW IF EXISTS planet_osm_line_z13;
DROP VIEW IF EXISTS planet_osm_line_z12;
DROP VIEW IF EXISTS planet_osm_line_z11;
DROP VIEW IF EXISTS planet_osm_line_z10;

DELETE FROM geometry_columns
WHERE f_table_name
   IN ('planet_osm_line_z15plus_big', 'planet_osm_line_z15plus_small',
       'planet_osm_line_z15plus', 'planet_osm_line_z14', 'planet_osm_line_z13',
       'planet_osm_line_z12', 'planet_osm_line_z11', 'planet_osm_line_z10');



CREATE VIEW planet_osm_line_z10 AS
  SELECT way,
         highway,
         railway,
         render,

         (CASE WHEN highway IN ('motorway') THEN 'highway'
               WHEN highway IN ('trunk', 'primary') THEN 'major_road'
               ELSE 'minor_road' END) AS kind,

         'no'::VARCHAR AS is_link,
         (CASE WHEN tunnel IN ('yes', 'true') THEN 'yes'
               ELSE 'no' END) AS is_tunnel,
         (CASE WHEN bridge IN ('yes', 'true') THEN 'yes'
               ELSE 'no' END) AS is_bridge,

         (CASE WHEN highway IN ('motorway') THEN 0
               WHEN highway IN ('trunk', 'primary') THEN 1
               WHEN highway IN ('secondary', 'tertiary') THEN 2
               ELSE 99 END) AS priority
  FROM (

      SELECT *, 'outline' AS render, 1 AS is_outline
      FROM planet_osm_line
      WHERE highway IN ('motorway')
         OR highway IN ('trunk', 'primary')
         OR highway IN ('secondary')
    
      UNION
      
      SELECT *, 'inline' AS render, 0 AS is_outline
      FROM planet_osm_line
      WHERE highway IN ('motorway')
         OR highway IN ('trunk', 'primary')
         OR highway IN ('secondary')

  ) AS roads

ORDER BY priority DESC, is_outline DESC;



CREATE VIEW planet_osm_line_z11 AS
  SELECT way,
         highway,
         railway,
         render,

         (CASE WHEN highway IN ('motorway') THEN 'highway'
               WHEN highway IN ('trunk', 'primary') THEN 'major_road'
               ELSE 'minor_road' END) AS kind,

         'no'::VARCHAR AS is_link,
         (CASE WHEN tunnel IN ('yes', 'true') THEN 'yes'
               ELSE 'no' END) AS is_tunnel,
         (CASE WHEN bridge IN ('yes', 'true') THEN 'yes'
               ELSE 'no' END) AS is_bridge,

         (CASE WHEN highway IN ('motorway') THEN 0
               WHEN highway IN ('trunk', 'primary') THEN 1
               WHEN highway IN ('secondary', 'tertiary') THEN 2
               ELSE 99 END) AS priority
  FROM (

      SELECT *, 'outline' AS render, 1 AS is_outline
      FROM planet_osm_line
      WHERE highway IN ('motorway')
         OR highway IN ('trunk', 'primary')
         OR highway IN ('secondary', 'tertiary')
    
      UNION
      
      SELECT *, 'inline' AS render, 0 AS is_outline
      FROM planet_osm_line
      WHERE highway IN ('motorway')
         OR highway IN ('trunk', 'primary')
         OR highway IN ('secondary', 'tertiary')

  ) AS roads

ORDER BY priority DESC, is_outline DESC;



CREATE VIEW planet_osm_line_z12 AS
  SELECT way,
         highway,
         railway,
         render,

         (CASE WHEN highway IN ('motorway', 'motorway_link') THEN 'highway'
               WHEN highway IN ('trunk', 'trunk_link', 'secondary', 'primary') THEN 'major_road'
               ELSE 'minor_road' END) AS kind,

         (CASE WHEN highway LIKE '%_link' THEN 'yes'
               ELSE 'no' END) AS is_link,
         (CASE WHEN tunnel IN ('yes', 'true') THEN 'yes'
               ELSE 'no' END) AS is_tunnel,
         (CASE WHEN bridge IN ('yes', 'true') THEN 'yes'
               ELSE 'no' END) AS is_bridge,

         (CASE WHEN highway IN ('motorway') THEN 0
               WHEN highway IN ('trunk', 'secondary', 'primary') THEN 1
               WHEN highway IN ('tertiary', 'residential', 'unclassified', 'road') THEN 2
               WHEN highway LIKE '%_link' THEN 3
               ELSE 99 END) AS priority
  FROM (
    
      SELECT *, 'outline' AS render, 1 AS is_outline
      FROM planet_osm_line
      WHERE highway IN ('motorway', 'motorway_link')
         OR highway IN ('trunk', 'trunk_link', 'secondary', 'primary')
         OR highway IN ('tertiary', 'residential', 'unclassified', 'road', 'unclassified')
    
      UNION
      
      SELECT *, 'inline' AS render, 0 AS is_outline
      FROM planet_osm_line
      WHERE highway IN ('motorway', 'motorway_link')
         OR highway IN ('trunk', 'trunk_link', 'secondary', 'primary')
         OR highway IN ('tertiary', 'residential', 'unclassified', 'road', 'unclassified')

  ) AS roads

ORDER BY priority DESC, is_outline DESC;



CREATE VIEW planet_osm_line_z13 AS
  SELECT way,
         highway,
         railway,
         render,

         (CASE WHEN highway IN ('motorway', 'motorway_link') THEN 'highway'
               WHEN highway IN ('trunk', 'trunk_link', 'primary', 'primary_link', 'secondary', 'secondary_link', 'tertiary', 'tertiary_link') THEN 'major_road'
               ELSE 'minor_road' END) AS kind,

         (CASE WHEN highway LIKE '%_link' THEN 'yes'
               ELSE 'no' END) AS is_link,
         (CASE WHEN tunnel IN ('yes', 'true') THEN 'yes'
               ELSE 'no' END) AS is_tunnel,
         (CASE WHEN bridge IN ('yes', 'true') THEN 'yes'
               ELSE 'no' END) AS is_bridge,

         (CASE WHEN highway IN ('motorway') THEN 0
               WHEN highway IN ('motorway_link') THEN 1
               WHEN highway IN ('trunk', 'primary', 'secondary', 'tertiary') THEN 2
               WHEN highway IN ('trunk_link', 'primary_link', 'secondary_link') THEN 3
               WHEN highway IN ('residential', 'unclassified', 'road') THEN 4
               ELSE 99 END) AS priority
  FROM (
    
      SELECT *, 'outline' AS render, 1 AS is_outline
      FROM planet_osm_line
      WHERE highway IN ('motorway', 'motorway_link')
         OR highway IN ('trunk', 'trunk_link', 'primary', 'primary_link', 'secondary', 'secondary_link', 'tertiary')
         OR highway IN ('residential', 'unclassified', 'road', 'unclassified')
    
      UNION
      
      SELECT *, 'inline' AS render, 0 AS is_outline
      FROM planet_osm_line
      WHERE highway IN ('motorway', 'motorway_link')
         OR highway IN ('trunk', 'trunk_link', 'primary', 'primary_link', 'secondary', 'secondary_link', 'tertiary')
         OR highway IN ('residential', 'unclassified', 'road', 'unclassified')

  ) AS roads

ORDER BY priority DESC, is_outline DESC;



CREATE VIEW planet_osm_line_z14 AS
  SELECT way,
         highway,
         railway,
         render,

         (CASE WHEN highway IN ('motorway', 'motorway_link') THEN 'highway'
               WHEN highway IN ('trunk', 'trunk_link', 'primary', 'primary_link', 'secondary', 'secondary_link', 'tertiary', 'tertiary_link') THEN 'major_road'
               WHEN highway IN ('residential', 'unclassified', 'road', 'minor') THEN 'minor_road'
               WHEN railway IN ('rail') THEN 'rail'
               ELSE 'unknown' END) AS kind,

         (CASE WHEN highway LIKE '%_link' THEN 'yes'
               ELSE 'no' END) AS is_link,
         (CASE WHEN tunnel IN ('yes', 'true') THEN 'yes'
               ELSE 'no' END) AS is_tunnel,
         (CASE WHEN bridge IN ('yes', 'true') THEN 'yes'
               ELSE 'no' END) AS is_bridge,

         -- highways still need to be layered on top of everything else at z14
         (CASE WHEN highway IN ('motorway', 'motorway_link', 'trunk', 'trunk_link') THEN 0
               ELSE 99 END) AS grouping,

         -- explicit layer is the physical layering of under- and overpasses
         (CASE WHEN layer ~ E'^-?[[:digit:]]+(\.[[:digit:]]+)?$' THEN CAST (layer AS FLOAT)
               ELSE 0
               END) AS explicit_layer,

         (CASE WHEN highway IN ('motorway') THEN 0
               WHEN highway IN ('trunk') THEN 1
               WHEN highway IN ('primary') THEN 2
               WHEN highway IN ('secondary') THEN 3
               WHEN highway IN ('tertiary') THEN 4
               WHEN highway LIKE '%_link' THEN 5
               WHEN highway IN ('residential', 'unclassified', 'road', 'minor') THEN 6
               WHEN railway IN ('rail') THEN 7
               ELSE 99 END) AS priority
  FROM (
    
      SELECT *, 'outline' AS render, 1 AS is_outline, 1 AS is_casing
      FROM planet_osm_line
      WHERE highway IN ('motorway', 'motorway_link')
         OR highway IN ('trunk', 'trunk_link', 'primary', 'primary_link', 'secondary', 'secondary_link', 'tertiary', 'tertiary_link')
         OR highway IN ('residential', 'unclassified', 'road', 'minor')
         OR railway IN ('rail')
    
      UNION
      
      SELECT *, 'casing' AS render, 0 AS is_outline, 1 AS is_casing
      FROM planet_osm_line
      WHERE highway IN ('motorway', 'motorway_link')
         OR highway IN ('trunk', 'trunk_link', 'primary', 'primary_link', 'secondary', 'secondary_link', 'tertiary', 'tertiary_link')
         OR highway IN ('residential', 'unclassified', 'road', 'minor')
         OR railway IN ('rail')
    
      UNION
      
      SELECT *, 'inline' AS render, 0 AS is_outline, 0 AS is_casing
      FROM planet_osm_line
      WHERE highway IN ('motorway', 'motorway_link')
         OR highway IN ('trunk', 'trunk_link', 'primary', 'primary_link', 'secondary', 'secondary_link', 'tertiary', 'tertiary_link')
         OR highway IN ('residential', 'unclassified', 'road', 'minor')
         OR railway IN ('rail')

  ) AS roads

-- Large roads are drawn on top of smaller roads.
-- Casings for segments are underneath corresponding inlines.
-- Explicit physical layers are drawn in order.
-- Outlines go behind everything else.
-- Highways are separated from other roads and drawn on top.
--
ORDER BY grouping DESC, is_outline DESC, explicit_layer ASC, is_casing DESC, priority DESC;



CREATE VIEW planet_osm_line_z15plus AS
  SELECT way,
         highway,
         railway,
         render,

         (CASE WHEN highway IN ('motorway', 'motorway_link') THEN 'highway'
               WHEN highway IN ('trunk', 'trunk_link', 'primary', 'primary_link', 'secondary', 'secondary_link', 'tertiary', 'tertiary_link') THEN 'major_road'
               WHEN highway IN ('footpath', 'track', 'footway', 'steps', 'pedestrian', 'path', 'cycleway') THEN 'path'
               WHEN railway IN ('rail', 'tram', 'light_rail', 'narrow_guage', 'monorail') THEN 'rail'
               ELSE 'minor_road' END) AS kind,

         (CASE WHEN highway LIKE '%_link' THEN 'yes'
               ELSE 'no' END) AS is_link,
         (CASE WHEN tunnel IN ('yes', 'true') THEN 'yes'
               ELSE 'no' END) AS is_tunnel,
         (CASE WHEN bridge IN ('yes', 'true') THEN 'yes'
               ELSE 'no' END) AS is_bridge,

         -- explicit layer is the physical layering of under- and overpasses
         (CASE WHEN layer ~ E'^-?[[:digit:]]+(\.[[:digit:]]+)?$' THEN CAST (layer AS FLOAT)
               ELSE 0
               END) AS explicit_layer,

         -- implied layer is guessed based on bridges and tunnels
         (CASE WHEN tunnel in ('yes', 'true') THEN -1
               WHEN bridge in ('yes', 'true') THEN 1
               ELSE 0
               END) AS implied_layer,

         (CASE WHEN highway IN ('motorway') THEN 0
               WHEN railway IN ('rail', 'tram', 'light_rail', 'narrow_guage', 'monorail') THEN .5
               WHEN highway IN ('trunk') THEN 1
               WHEN highway IN ('primary') THEN 2
               WHEN highway IN ('secondary') THEN 3
               WHEN highway IN ('tertiary') THEN 4
               WHEN highway LIKE '%_link' THEN 5
               WHEN highway IN ('residential', 'unclassified', 'road') THEN 6
               WHEN highway IN ('unclassified', 'service', 'minor') THEN 7
               ELSE 99 END) AS priority
  FROM (
    
      SELECT 'outline' AS render, 1 AS is_outline, 1 AS is_casing,
             way, highway, NULL AS railway, tunnel, bridge, layer
      FROM planet_osm_line
      WHERE highway IN ('motorway', 'motorway_link')
         OR highway IN ('trunk', 'trunk_link', 'primary', 'primary_link', 'secondary', 'secondary_link', 'tertiary', 'tertiary_link')
         OR highway IN ('residential', 'unclassified', 'road', 'unclassified', 'service', 'minor')
         OR highway IN ('footpath', 'track', 'footway', 'steps', 'pedestrian', 'path', 'cycleway')
    
      UNION
      
      SELECT 'casing' AS render, 0 AS is_outline, 1 AS is_casing,
             way, highway, NULL AS railway, tunnel, bridge, layer
      FROM planet_osm_line
      WHERE highway IN ('motorway', 'motorway_link')
         OR highway IN ('trunk', 'trunk_link', 'primary', 'primary_link', 'secondary', 'secondary_link', 'tertiary', 'tertiary_link')
         OR highway IN ('residential', 'unclassified', 'road', 'unclassified', 'service', 'minor')
         OR highway IN ('footpath', 'track', 'footway', 'steps', 'pedestrian', 'path', 'cycleway')
    
      UNION
      
      SELECT 'inline' AS render, 0 AS is_outline, 0 AS is_casing,
             way, highway, NULL AS railway, tunnel, bridge, layer
      FROM planet_osm_line
      WHERE highway IN ('motorway', 'motorway_link')
         OR highway IN ('trunk', 'trunk_link', 'primary', 'primary_link', 'secondary', 'secondary_link', 'tertiary', 'tertiary_link')
         OR highway IN ('residential', 'unclassified', 'road', 'unclassified', 'service', 'minor')
         OR highway IN ('footpath', 'track', 'footway', 'steps', 'pedestrian', 'path', 'cycleway')
    
      UNION
      
      SELECT 'outline' AS render, 1 AS is_outline, 1 AS is_casing,
             way, NULL AS highway, railway, tunnel, bridge, layer
      FROM planet_osm_line
      WHERE railway IN ('rail', 'tram', 'light_rail', 'narrow_guage', 'monorail')
    
      UNION
      
      SELECT 'casing' AS render, 0 AS is_outline, 1 AS is_casing,
             way, NULL AS highway, railway, tunnel, bridge, layer
      FROM planet_osm_line
      WHERE railway IN ('rail', 'tram', 'light_rail', 'narrow_guage', 'monorail')
    
      UNION
      
      SELECT 'inline' AS render, 0 AS is_outline, 0 AS is_casing,
             way, NULL AS highway, railway, tunnel, bridge, layer
      FROM planet_osm_line
      WHERE railway IN ('rail', 'tram', 'light_rail', 'narrow_guage', 'monorail')

  ) AS roads

-- Large roads are drawn on top of smaller roads.
-- Casings for segments are underneath corresponding inlines.
-- Implicit physical layers (tunnels, bridges) are drawn in order.
-- Explicit physical layers are drawn in order.
-- Outlines go behind everything else.
--
ORDER BY is_outline DESC, explicit_layer ASC, implied_layer ASC, is_casing DESC, priority DESC;



CREATE VIEW planet_osm_line_z15plus_big AS
  SELECT *
  FROM planet_osm_line_z15plus
  WHERE highway IN ('motorway', 'motorway_link', 'trunk', 'trunk_link', 'primary', 'primary_link')
     OR highway IN ('secondary', 'secondary_link', 'tertiary', 'tertiary_link')
  ORDER BY priority DESC;



CREATE VIEW planet_osm_line_z15plus_small AS
  SELECT *
  FROM planet_osm_line_z15plus
  WHERE highway IN ('residential', 'unclassified', 'road', 'unclassified', 'service', 'minor')
     OR highway IN ('footpath', 'track', 'footway', 'steps', 'pedestrian', 'path', 'cycleway')
  ORDER BY priority DESC;



INSERT INTO geometry_columns
(f_table_catalog, f_table_schema, f_table_name, f_geometry_column, coord_dimension, srid, "type")
VALUES
    ('', 'public', 'planet_osm_line_z10', 'way', 2, 900913, 'LINESTRING'),
    ('', 'public', 'planet_osm_line_z11', 'way', 2, 900913, 'LINESTRING'),
    ('', 'public', 'planet_osm_line_z12', 'way', 2, 900913, 'LINESTRING'),
    ('', 'public', 'planet_osm_line_z13', 'way', 2, 900913, 'LINESTRING'),
    ('', 'public', 'planet_osm_line_z14', 'way', 2, 900913, 'LINESTRING'),
    ('', 'public', 'planet_osm_line_z15plus', 'way', 2, 900913, 'LINESTRING'),
    ('', 'public', 'planet_osm_line_z15plus_big', 'way', 2, 900913, 'LINESTRING'),
    ('', 'public', 'planet_osm_line_z15plus_small', 'way', 2, 900913, 'LINESTRING');



COMMIT;
