-- Record your SQL detective process here!  Write down: 
  -- 1. The SQL queries you ran
SELECT * FROM crime_scene
WHERE date = 19830715;
SELECT * FROM witnesses
WHERE crime_scene_id = 65;
SELECT * FROM suspects
WHERE bandana_color = 'red' OR accessory = 'watch';
SELECT * FROM interviews
WHERE suspect_id = 35 OR suspect_id = 44 OR suspect_id = 97







  -- 2. Any notes or insights as SQL comments
--Following the instructions I reviwed the crime scene report from that day (crime scene id: 65, date: 19830715)
--Then I went through the witness statements that matched the crime scene id (first person id:28, clue: man wearing red bandana. Second person: 75, clue: man wearing gold watch) 
--Then I went through suspects that matched one of each description: red bandana or gold watch. 
--People that match description: Tony Ramirez(id:35), Mickey Rivera(id:44), and Rico Delgado(id:97)
--So I looked at the interviews with those ids and saw that 97 Rico Delgado admitted to taking the record. Got this message that confirmed: Excellent work, detective! Rico Delgado has confessed to stealing the prized vinyl record.









  -- 3. Your final conclusion: who did it?
