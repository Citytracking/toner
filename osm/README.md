motorways.pgsql
--

This is a series of Postgres commands for creating a new table called
'planet_osm_motorways' derived from the 'planet_osm_line' table.

For example:

	psql -U osm planet_osm < motorways.pgsql

Remember: This means you will need to have finished setting up a local
planet_osm database before you do this.
