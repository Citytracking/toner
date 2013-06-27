BEGIN;

-- We have city points and city labels for each continent at each zoom
-- level, but we want to union them together into a single worldwide
-- table for each zoom. We create database views to do this.

DROP VIEW IF EXISTS city_labels_z4;
DROP VIEW IF EXISTS city_labels_z5;
DROP VIEW IF EXISTS city_labels_z6;
DROP VIEW IF EXISTS city_labels_z7;
DROP VIEW IF EXISTS city_labels_z8;
DROP VIEW IF EXISTS city_labels_z9;
DROP VIEW IF EXISTS city_points_z4;
DROP VIEW IF EXISTS city_points_z5;
DROP VIEW IF EXISTS city_points_z6;
DROP VIEW IF EXISTS city_points_z7;
DROP VIEW IF EXISTS city_points_z8;
DROP VIEW IF EXISTS city_points_z9;

DELETE FROM geometry_columns
WHERE f_table_name
   IN ('city_labels_z4', 'city_labels_z5', 'city_labels_z6',
       'city_labels_z7', 'city_labels_z8', 'city_labels_z9',
       'city_points_z4', 'city_points_z5', 'city_points_z6',
       'city_points_z7', 'city_points_z8', 'city_points_z9');

-- Many of the component tables have the population column incorrectly 
-- stored as a varchar instead of a double. Must fix these before we can 
-- create our UNIONed views.

ALTER TABLE south_america_labels_z5 ALTER COLUMN population SET DATA TYPE double precision USING population::double precision;

ALTER TABLE south_america_labels_z6 ALTER COLUMN population SET DATA TYPE double precision USING population::double precision;

ALTER TABLE south_america_labels_z7 ALTER COLUMN population SET DATA TYPE double precision USING population::double precision;

ALTER TABLE south_america_labels_z8 ALTER COLUMN population SET DATA TYPE double precision USING population::double precision;

ALTER TABLE south_america_labels_z9 ALTER COLUMN population SET DATA TYPE double precision USING population::double precision;

ALTER TABLE south_america_points_z5 ALTER COLUMN population SET DATA TYPE double precision USING population::double precision;

ALTER TABLE south_america_points_z6 ALTER COLUMN population SET DATA TYPE double precision USING population::double precision;

ALTER TABLE north_america_points_z7 ALTER COLUMN population SET DATA TYPE double precision USING population::double precision;

ALTER TABLE south_america_points_z7 ALTER COLUMN population SET DATA TYPE double precision USING population::double precision;

ALTER TABLE south_america_points_z8 ALTER COLUMN population SET DATA TYPE double precision USING population::double precision;

ALTER TABLE south_america_points_z9 ALTER COLUMN population SET DATA TYPE double precision USING population::double precision;

CREATE VIEW city_labels_z4 AS
  SELECT * FROM africa_labels_z4
  UNION
  SELECT * FROM asia_labels_z4
  UNION
  SELECT * FROM australia_new_zealand_labels_z4
  UNION
  SELECT * FROM europe_labels_z4
  UNION
  SELECT * FROM north_america_labels_z4
  UNION
  SELECT * FROM south_america_labels_z4;

CREATE VIEW city_labels_z5 AS
  SELECT * FROM africa_labels_z5
  UNION
  SELECT * FROM asia_labels_z5
  UNION
  SELECT * FROM australia_new_zealand_labels_z5
  UNION
  SELECT * FROM europe_labels_z5
  UNION
  SELECT * FROM north_america_labels_z5
  UNION
  SELECT * FROM south_america_labels_z5;

CREATE VIEW city_labels_z6 AS
  SELECT * FROM africa_labels_z6
  UNION
  SELECT * FROM asia_labels_z6
  UNION
  SELECT * FROM australia_new_zealand_labels_z6
  UNION
  SELECT * FROM europe_labels_z6
  UNION
  SELECT * FROM north_america_labels_z6
  UNION
  SELECT * FROM south_america_labels_z6;

CREATE VIEW city_labels_z7 AS
  SELECT * FROM africa_labels_z7
  UNION
  SELECT * FROM asia_labels_z7
  UNION
  SELECT * FROM australia_new_zealand_labels_z7
  UNION
  SELECT * FROM europe_labels_z7
  UNION
  SELECT * FROM north_america_labels_z7
  UNION
  SELECT * FROM south_america_labels_z7;

CREATE VIEW city_labels_z8 AS
  SELECT * FROM africa_labels_z8
  UNION
  SELECT * FROM asia_labels_z8
  UNION
  SELECT * FROM australia_new_zealand_labels_z8
  UNION
  SELECT * FROM europe_labels_z8
  UNION
  SELECT * FROM north_america_labels_z8
  UNION
  SELECT * FROM south_america_labels_z8;

CREATE VIEW city_labels_z9 AS
  SELECT * FROM africa_labels_z9
  UNION
  SELECT * FROM asia_labels_z9
  UNION
  SELECT * FROM australia_new_zealand_labels_z9
  UNION
  SELECT * FROM europe_labels_z9
  UNION
  SELECT * FROM north_america_labels_z9
  UNION
  SELECT * FROM south_america_labels_z9;

CREATE VIEW city_points_z4 AS
  SELECT * FROM africa_points_z4
  UNION
  SELECT * FROM asia_points_z4
  UNION
  SELECT * FROM australia_new_zealand_points_z4
  UNION
  SELECT * FROM europe_points_z4
  UNION
  SELECT * FROM north_america_points_z4
  UNION
  SELECT * FROM south_america_points_z4;

CREATE VIEW city_points_z5 AS
  SELECT * FROM africa_points_z5
  UNION
  SELECT * FROM asia_points_z5
  UNION
  SELECT * FROM australia_new_zealand_points_z5
  UNION
  SELECT * FROM europe_points_z5
  UNION
  SELECT * FROM north_america_points_z5
  UNION
  SELECT * FROM south_america_points_z5;

CREATE VIEW city_points_z6 AS
  SELECT * FROM africa_points_z6
  UNION
  SELECT * FROM asia_points_z6
  UNION
  SELECT * FROM australia_new_zealand_points_z6
  UNION
  SELECT * FROM europe_points_z6
  UNION
  SELECT * FROM north_america_points_z6
  UNION
  SELECT * FROM south_america_points_z6;

CREATE VIEW city_points_z7 AS
  SELECT * FROM africa_points_z7
  UNION
  SELECT * FROM asia_points_z7
  UNION
  SELECT * FROM australia_new_zealand_points_z7
  UNION
  SELECT * FROM europe_points_z7
  UNION
  SELECT * FROM north_america_points_z7
  UNION
  SELECT * FROM south_america_points_z7;

CREATE VIEW city_points_z8 AS
  SELECT * FROM africa_points_z8
  UNION
  SELECT * FROM asia_points_z8
  UNION
  SELECT * FROM australia_new_zealand_points_z8
  UNION
  SELECT * FROM europe_points_z8
  UNION
  SELECT * FROM north_america_points_z8
  UNION
  SELECT * FROM south_america_points_z8;

CREATE VIEW city_points_z9 AS
  SELECT * FROM africa_points_z9
  UNION
  SELECT * FROM asia_points_z9
  UNION
  SELECT * FROM australia_new_zealand_points_z9
  UNION
  SELECT * FROM europe_points_z9
  UNION
  SELECT * FROM north_america_points_z9
  UNION
  SELECT * FROM south_america_points_z9;

COMMIT;
