-- Record your SQL detective process here!  Write down: 
  -- 1. The SQL queries you ran
SELECT * FROM crime_scene
WHERE date = 19860814;
SELECT *
FROM person
WHERE address LIKE '300%Ocean Drive%';
SELECT *
FROM person
WHERE name LIKE '%ul %ez';
SELECT *
FROM person
WHERE address LIKE '%Ocean Drive%';
SELECT *
FROM hotel_checkins
WHERE person_id IN (101, 102);
SELECT *
FROM surveillance_records
WHERE hotel_checkin_id IN (89, 91);
SELECT *
FROM person
WHERE id = 7;
SELECT *
FROM interviews
WHERE person_id = 7;
SELECT *
FROM confessions
WHERE person_id = 7;
SELECT *
FROM surveillance_records
WHERE person_id = 7;
SELECT *
FROM interviews
WHERE person_id = 101 OR person_id = 102
SELECT *
FROM surveillance_records
WHERE person_id = 102 OR person_id = 101 OR person_id = 7
SELECT *
FROM confessions
SELECT *
FROM surveillance_records surveillance_records
JOIN hotel_checkins hotel_checkins
    ON surveillance_records.hotel_checkin_id = hotel_checkins.id
WHERE surveillance_records.suspicious_activity IS NOT NULL
  AND hotel_checkins.person_id = 7 OR  hotel_checkins.person_id = 101 OR hotel_checkins.person_id = 102;
SELECT *
FROM person
WHERE id = 107;
SELECT *
FROM interviews
WHERE person_id = 107;
SELECT *
FROM confessions
WHERE person_id = 107;
SELECT person.id, person.name, confessions.confession
FROM person 
JOIN confessions  ON person.id = confessions.person_id;

  -- 2. Any notes or insights as SQL comments
--Started at the crime scene and used the date use in the case debriefing Aug 14 1986
--Saw there were 3 cases that day but only one occured by Coral Bay Marina (case id:43, clue: The body of an unidentified man was found near the docks. Two people were seen nearby: one who lives on 300ish "Ocean Drive" and another whose first name ends with "ul" and his last name ends with "ez".)
--So next given I had the info about the two witnesses I decided to look them up using the descriptions that were given, that query didnt work so I tried the next description and it pulled up a nightclub owner named Raul Gutierrez
--Raul Gutierrez id: 102 alias: The Cobra job: nightclub owner address: 45 Sunset Drive
--I wanted to make sure the other witness actually existed so I modified the search and got 5 results but the only person who had 300 in their address was Carlos Mendez
-- So far I have (id: 101	name: Carlos Mendez	alias:Los Ojos	job:Fisherman	address:369 Ocean Drive) and (Raul Gutierrez id: 102 alias: The Cobra job: nightclub owner address: 45 Sunset Drive)
--Ok so in the debriefing it said the body was found near the docks of Coral Bay Marina and given one is a fisherman I feel like that makes the most sense but still had to be sure
--I decided to look in the hotel check in schema by their id to see if that would give more info 
--It pulled two records: Carlos at Coral View Resort and Raul at Marina Paradise Inn
--Okay now the dates are close to when the murder happened so I want to look at the survelliance to see EXACTLY who was there that same day using the hotel id's
--From there the survelliance caught Carlos arguing with an unknown person which to me gives motive. Whoever it was has a person id of 7.
--That pulled up Robert Smith (id:7	job:Red Rob	Mechanic	address:789 Beach Road)
--So then I wanted to see if Robert was a witness or an accomplice so I checked interviews and witness statements using his id
--He didnt have any interview info so i looked in confessions and he stated he was walking his dog that night so now I want to make sure the survelliance matches that statement.
--From here I knew he was def lying because survelliance shows otherwise
--So then I looked at the interviews for the other two people Raul and Carlos.. Carlos said he saw someone check into somewhere with the mame 'Sunset' and Raul said he saw someone checking in that looked really nervous
--So I pulled survelliance again but for all 3 but the only suspicious one that pulled up was Robert
--I ran the confessions again for all 3, and Raul said he runs a blackmail operation, Robert is lying, and Carlos gave a vague response
--So them I decide to cross reference each hotel check in and surveillance video
--From all these things I figured Carlos was the closest suspect because of the following: He was one of the people identified arguing at the resort which is close to where the murder happened, and he doesnt have an alibi 
--So I put his name in the thing but it was wrong so then I realized another person did appear in one of the searches that was at Coral Bay 107 who when I looked said Derek Anderson and he matches the following: hes a sailor meaning he was at the bay most likely,
--Then I looked back in confessions when I saw he didnt have an interview result but he also had nothing in confessions so then I looked at survelliance but that was also null.
--At this point I was confused so I went back through the confessions for everyone and thats when I spotted Thomas Brown's confession.. "Alright! I did it. I was paid to make sure he never left the marina alive."
--So i put that into the submit and turns out it was him the whole time. 
  -- 3. Your final conclusion: who did it?
