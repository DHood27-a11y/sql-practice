-- Record your SQL detective process here!  Write down: 
--   1. The SQL queries you ran
--   2. Any notes or insights as SQL comments
--   3. Your final conclusion: who did it?

-- Using these SQL clauses will help you solve the mystery: 
--    SELECT, FROM, WHERE, AND, OR, ORDER BY, LIMIT, LIKE, DISTINCT, BETWEEN, AS


--Started with the following clause to get crime report:
SELECT * FROM crime_scene_report;
--Then used info from article to fill in date and city since they provided that info:
SELECT *
FROM crime_scene_report
WHERE date = 20180115
AND CITY = 'SQL City';

--There was 2 assualts and a murder from this date so I looked into the murder one by doing the following:
SELECT *
FROM crime_scene_report
WHERE date = 20180115
AND city = 'SQL City'
AND type = 'murder';

--There was only one person who was a witness so I looked specifically for her: Annabelle
SELECT *
FROM person
WHERE name LIKE '%Annabel%'
AND address_street_name = 'Franklin Ave';

--then I looked for her interview by her ID number:
SELECT *
FROM interview
WHERE person_id = 16371;

--Ok so she gave a date and said she saw the killer so we want to look at the gym check in and see who all was there on the date she said:
SELECT *
FROM get_fit_now_check_in
WHERE check_in_date = 20180109;

--Ok so there were 2 other people there that day and she said one of them is the killer but we only see their membership id so we can try to search the name:
SELECT * FROM get_fit_now_member
WHERE id = '48Z7A' OR id = '48Z55';

--From this there were only 2 suspects (Jeremy Bowers and Joe Germuska) and so I plugged in both answers/names into the solution and Jeremy Bowers turned out to be the killer!





