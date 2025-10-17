-- Record your SQL detective process here!  Write down: 
  -- 1. The SQL queries you ran
SELECT * 
FROM final_interviews;
SELECT * 
FROM guest;
SELECT guest.id, guest.name, guest.occupation, guest.invitation_code, final_interviews.confession
FROM guest 
JOIN final_interviews  ON guest.id = final_interviews.guest_id
WHERE final_interviews.confession IS NOT NULL;
SELECT guest.id, guest.name, guest.occupation, guest.invitation_code, COUNT(witness_statements.clue) AS suspicious_mentions
FROM guest 
JOIN witness_statements  ON guest.id = witness_statements.guest_id
GROUP BY guest.id, guest.name, guest.occupation, guest.invitation_code
ORDER BY suspicious_mentions DESC;
SELECT guest.id, guest.name, guest.occupation, guest.invitation_code, witness_statements.clue
FROM guest 
JOIN witness_statements  ON guest.id = witness_statements.guest_id
WHERE guest.name = 'Jasper Cox';
SELECT guest.id, guest.name, guest.occupation, guest.invitation_code, witness_statements.clue
FROM guest 
JOIN witness_statements  ON guest.id = witness_statements.guest_id
WHERE guest.name = 'Luna Matthews';
SELECT guest.id, guest.name, guest.occupation, guest.invitation_code, witness_statements.clue
FROM guest 
JOIN witness_statements  ON guest.id = witness_statements.guest_id
WHERE guest.name = 'Felix Morgan';
SELECT guest.id, guest.name, guest.occupation, guest.invitation_code, witness_statements.clue
FROM guest 
JOIN witness_statements  ON guest.id = witness_statements.guest_id
WHERE guest.name = 'Phoenix Mason';
SELECT guest.name, final_interviews.confession
FROM guest 
JOIN final_interviews ON guest.id = final_interviews.guest_id
WHERE final_interviews.confession IS NOT NULL;
SELECT guest.id, guest.name, guest.occupation, guest.invitation_code, final_interviews.confession
FROM guest 
JOIN final_interviews ON guest.id = final_interviews.guest_id
WHERE final_interviews.confession LIKE '%plan%'
   OR final_interviews.confession LIKE '%job%'
   OR final_interviews.confession LIKE '%heist%'
   OR final_interviews.confession LIKE '%deal%'
   OR final_interviews.confession LIKE '%exchange%'
   OR final_interviews.confession LIKE '%security%'
   OR final_interviews.confession LIKE '%cover%';
SELECT guest.id, guest.name, guest.occupation, guest.invitation_code, final_interviews.confession
FROM guest 
JOIN final_interviews ON guest.id = final_interviews.guest_id
WHERE final_interviews.confession LIKE '%gala%'
   OR final_interviews.confession LIKE '%diamond%'
   OR final_interviews.confession LIKE '%necklace%'
   OR final_interviews.confession LIKE '%charity%'
   OR final_interviews.confession LIKE '%Fontainebleau%';
SELECT guest.id, guest.name, guest.occupation, guest.invitation_code, marina_rentals.dock_number, marina_rentals.rental_date, marina_rentals.boat_name
FROM guest 
JOIN marina_rentals  ON guest.id = marina_rentals.renter_guest_id
ORDER BY marina_rentals.rental_date DESC;
SELECT * FROM crime_scene;
SELECT *
FROM guest
WHERE occupation LIKE '%Actor%'
   OR (occupation LIKE '%Consultant%' AND name LIKE '%an');
SELECT guest.id, guest.name, guest.occupation, guest.invitation_code, final_interviews.confession
FROM guest 
JOIN final_interviews 
  ON guest.id = final_interviews.guest_id
WHERE guest.occupation LIKE '%Consultant%';
SELECT id, name, occupation, invitation_code
FROM guest
WHERE id = 129                  
   OR name = 'Vivian Nair'; 
SELECT guest.name, guest.occupation, guest.invitation_code, witness_statements.clue
FROM guest 
JOIN witness_statements 
  ON guest.id = witness_statements.guest_id
WHERE guest.name = 'Clint Eastwood'
   OR guest.name = 'Vivian Nair';
SELECT guest.id, guest.name, guest.occupation, guest.invitation_code, marina_rentals.dock_number, marina_rentals.rental_date, marina_rentals.boat_name
FROM guest 
JOIN marina_rentals 
  ON guest.id = marina_rentals.renter_guest_id
WHERE guest.invitation_code = 'VIP-R'
  AND marina_rentals.dock_number = 3;
  -- 2. Any notes or insights as SQL comments
--Pulled all interviews to see if anyone gave important or relevant info 
--Then I wanted to join with guest table to match confessions to guest info
--Next I wanted to identify guests who actually said something relevant or guests with confessions like Luna Odom, Phoenix Farley, Eden Todd, etc.
--Then I wanted to determine which confessions contain keywords related to criminal activity from there I got Vivian Nair, Phoenix Farley, Eden Todd, Luna Conley, etc.
--The list was still too long so I filtered again using same keywords as in briefing: diamond, heist, etc.
--From there I got two guests: Vivian Nair, Clint Eastwood so I decided to filter by occupation and witness hints
--They both matched the witness statements in regards to one being an actor and the other a consultant
--So then I used Join to match guest with witness statements for clues: Vivian saw a VIP-R guest and Clint heard dock 3 marina mentioned
--So I did a filtered search again to check the marina rental from dock 3 that only were VIP-R guests
--That gave me Mike Manning and Felix Morgan so I ran both the names and Mike Manning's was a success
--Got the following message: "Outstanding detective work! The evidence conclusively shows that Mike Manning is the thief."






  -- 3. Your final conclusion: who did it?
