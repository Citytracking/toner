BEGIN;

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

CREATE VIEW city_labels_z4 AS
  SELECT * FROM africa_labels_z4
  UNION
  SELECT * FROM asia_labels_z4
  UNION
  SELECT * FROM australia_new_zealand_labels_z4
  UNION
  SELECT * FROM europe_labels_z4
  UNION
  SELECT * FROM north_america_labels_z4;
--  UNION
--  SELECT * FROM south_america_labels_z4;

CREATE VIEW city_labels_z5 AS
  SELECT * FROM africa_labels_z5
  UNION
  SELECT * FROM asia_labels_z5
  UNION
  SELECT * FROM australia_new_zealand_labels_z5
  UNION
  SELECT * FROM europe_labels_z5
  UNION
  SELECT * FROM north_america_labels_z5;
--  UNION
--  SELECT * FROM south_america_labels_z5;

CREATE VIEW city_labels_z6 AS
  SELECT * FROM africa_labels_z6
  UNION
  SELECT * FROM asia_labels_z6
  UNION
  SELECT * FROM australia_new_zealand_labels_z6
  UNION
  SELECT * FROM europe_labels_z6
  UNION
  SELECT * FROM north_america_labels_z6;
--  UNION
--  SELECT * FROM south_america_labels_z6;

CREATE VIEW city_labels_z7 AS
  SELECT * FROM africa_labels_z7
  UNION
  SELECT * FROM asia_labels_z7
  UNION
  SELECT * FROM australia_new_zealand_labels_z7
  UNION
  SELECT * FROM europe_labels_z7
  UNION
  SELECT * FROM north_america_labels_z7;
--  UNION
--  SELECT * FROM south_america_labels_z7;

CREATE VIEW city_labels_z8 AS
  SELECT * FROM africa_labels_z8
  UNION
  SELECT * FROM asia_labels_z8
  UNION
  SELECT * FROM australia_new_zealand_labels_z8
  UNION
  SELECT * FROM europe_labels_z8
  UNION
  SELECT * FROM north_america_labels_z8;
--  UNION
--  SELECT * FROM south_america_labels_z8;

CREATE VIEW city_labels_z9 AS
  SELECT * FROM africa_labels_z9
  UNION
  SELECT * FROM asia_labels_z9
  UNION
  SELECT * FROM australia_new_zealand_labels_z9
  UNION
  SELECT * FROM europe_labels_z9
  UNION
  SELECT * FROM north_america_labels_z9;
--  UNION
--  SELECT * FROM south_america_labels_z9;

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
  SELECT * FROM north_america_points_z5;
--  UNION
--  SELECT * FROM south_america_points_z5;

CREATE VIEW city_points_z6 AS
  SELECT * FROM africa_points_z6
  UNION
  SELECT * FROM asia_points_z6
  UNION
  SELECT * FROM australia_new_zealand_points_z6
  UNION
  SELECT * FROM europe_points_z6
  UNION
  SELECT * FROM north_america_points_z6;
--  UNION
--  SELECT * FROM south_america_points_z6;

CREATE VIEW city_points_z7 AS
  SELECT * FROM africa_points_z7
  UNION
  SELECT * FROM asia_points_z7
  UNION
  SELECT * FROM australia_new_zealand_points_z7
  UNION
  SELECT * FROM europe_points_z7;
--  UNION
--  SELECT * FROM north_america_points_z7;
--  UNION
--  SELECT * FROM south_america_points_z7;

CREATE VIEW city_points_z8 AS
  SELECT * FROM africa_points_z8
  UNION
  SELECT * FROM asia_points_z8
  UNION
  SELECT * FROM australia_new_zealand_points_z8
  UNION
  SELECT * FROM europe_points_z8
  UNION
  SELECT * FROM north_america_points_z8;
--  UNION
--  SELECT * FROM south_america_points_z8;

CREATE VIEW city_points_z9 AS
  SELECT * FROM africa_points_z9
  UNION
  SELECT * FROM asia_points_z9
  UNION
  SELECT * FROM australia_new_zealand_points_z9
  UNION
  SELECT * FROM europe_points_z9
  UNION
  SELECT * FROM north_america_points_z9;
--  UNION
--  SELECT * FROM south_america_points_z9;

COMMIT;
