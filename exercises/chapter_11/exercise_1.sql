--
-- Learning SQL
-- Exercise 11-1
--

-- query given in exercise rewritten in searched case
SELECT name,
  CASE
    WHEN name = 'English' THEN 'latin1'
    WHEN name = 'Italian' THEN 'latin1'
    WHEN name = 'French' THEN 'latin1'
    WHEN name = 'German' THEN 'latin1'
    WHEN name = 'Japanese' THEN 'utf8'
    WHEN name = 'Mandarin' THEN 'utf8'
    ELSE name = 'Unknown'
  END character_set
FROM language;
