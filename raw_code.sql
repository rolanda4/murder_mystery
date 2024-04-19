/** create a database to contain project**/
CREATE DATABASE whodunnit;
USE whodunnit;

SELECT * 
FROM crime_scene_report;

SELECT * 
FROM crime_scene_report
WHERE date = '20180115'
	AND type = 'murder'
    AND city LIKE '%SQL%'

