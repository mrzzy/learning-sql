--
-- Learning SQL
-- Exercise 3-2
--

SELECT
  actor_id, first_name, last_name
FROM
  actor
WHERE
  last_name IN ('WILLIAMS', 'DAVIS');
