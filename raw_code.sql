/** create a database to contain project**/
CREATE DATABASE whodunnit;
USE whodunnit;

SELECT * 
FROM crime_scene_report;

SELECT * 
FROM crime_scene_report
WHERE date = '20180115'
	AND type = 'murder'
    AND city LIKE '%SQL%';

SELECT description 
FROM crime_scene_report
WHERE date = '20180115'
	AND type = 'murder'
    AND city LIKE '%SQL%';
    
SELECT *
FROM person
LIMIT 5;

SELECT *
FROM person
WHERE address_street_name = 'Northwestern Dr'
	or (name LIKE '%Annabel%'
        AND address_street_name = 'Franklin Ave');

SELECT *
FROM person
WHERE (address_street_name = 'Northwestern Dr'
       AND address_number = (
         SELECT MAX(address_number)
         FROM person
         WHERE address_street_name = 'Northwestern Dr')
	or (name LIKE '%Annabel%'
        AND address_street_name = 'Franklin Ave'));

SELECT *
FROM interview
WHERE person_id IN ('14887' , '16371');

SELECT *
FROM get_fit_now_check_in
WHERE check_in_date = '20180109'
	AND membership_id LIKE '%48Z%';

SELECT *
FROM get_fit_now_member
WHERE id IN ('48Z7A' , '48Z55');

SELECT *
FROM drivers_license
WHERE id IN ('67318 ','28819');

SELECT *
FROM drivers_license
WHERE id IN ('67318 ','28819', '14887' , '16371');

SELECT *
FROM drivers_license
WHERE plate_number LIKE '%H42W%';

SELECT *
FROM person
WHERE license_id IN (183779 , 423327 , 664760);


SELECT p.*
FROM drivers_license AS dl
INNER JOIN person AS p
ON dl.id = p.license_id
INNER JOIN get_fit_now_member AS g
ON p.id = g.person_id
INNER JOIN get_fit_now_check_in AS c
ON g.id = c.membership_id
WHERE plate_number LIKE '%H42W%'
	AND membership_status = 'gold'
    AND check_in_date = '20180109';


SELECT *
FROM interview
WHERE person_id = '67318';

SELECT *
FROM drivers_license
WHERE hair_color = 'red'
	AND gender = 'female'
    AND car_make = 'Tesla'
	AND height >=65
    AND height <=67;

SELECT p.name, fc.event_name ,COUNT(fc.person_id) AS number_of_events
FROM person AS p
INNER JOIN drivers_license AS dl
ON p.license_id = dl.id
INNER JOIN facebook_event_checkin AS fc
ON p.id = fc.person_id
WHERE license_id IN (202298,291182,918773)
GROUP BY p.name, fc.event_name;

SELECT dls.gender, AVG(inco.annual_income) AS avgfem_annual_income
FROM drivers_license AS dls
INNER JOIN person AS ps
ON dls.id = ps.license_id
INNER JOIN income AS inco
on ps.ssn = inco.ssn
GROUP BY dls.gender;

SELECT p.id, p.name, p.address_street_name, ssn, inc.annual_income 
FROM person AS p
INNER JOIN income AS inc
USING (ssn)
WHERE name LIKE '%Miranda%';





    

