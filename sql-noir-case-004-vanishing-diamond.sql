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



  -- 2. Any notes or insights as SQL comments








  -- 3. Your final conclusion: who did it?
