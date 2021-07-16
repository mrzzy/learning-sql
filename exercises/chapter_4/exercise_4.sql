--
-- Learning SQL
-- Exercise 4-4
--

SELECT customer_id, last_name
FROM customer
-- filter name with 'A' in 2nd position & 'W' after 'A' in any position.
WHERE last_name LIKE '_A%W%';
