-- Record your SQL detective process here!  Write down: 
 SELECT * FROM crime_scene;
SELECT * FROM crime_scene
WHERE type = 'theft';
SELECT * FROM suspects 
WHERE scar = 'left cheek' AND attire = 'trench coat';
SELECT * FROM interviews
WHERE suspect_id = 3 OR suspect_id = 183;
SELECT * FROM suspects
WHERE id = 183;







  -- 2. Any notes or insights as SQL comments
 -- 1. The SQL queries you ran
--Since the first clue in the case brief stated that someone from the crime scene was a witness I plugged in the crime_scene schema to get the full scope of what I was seeing
--Then I decided I wanted to narrow down the crimes that were only thefts given that was the crime being investigated and due to the fact that those types of crimes seemed to have the most witnesses. 
--The only one on the list from the location of the description Blue Note Lounge was case_id 76 and it said the person was wearing a trench coat and had a scar on their left cheek.
--So then I looked at the list of suspects and narrowed it down for who best fit the description: scar on left cheek and trench coat. 
--The two people that popped up were Frank Lombardi and Vincent Malone
--I then decided to narrow it down by looking into their interviews with their id numbers
--The transcript showed that suspect 183 admitted to stealing so I went back and cross referenced id numbers again to verify the name of the person. 
--From there it showed Vincent Malone and I put it in and got this message "Case Solved! Congratulations, detective! You have successfully identified Vincent Malone as the culprit."










  -- 3. Your final conclusion: who did it?
