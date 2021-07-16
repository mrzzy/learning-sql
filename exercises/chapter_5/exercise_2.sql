--
-- Learning SQL
-- Exercise 5-2
--

SELECT f.title
FROM film f
  INNER JOIN film_actor fa ON fa.film_id = f.film_id
  INNER JOIN actor a ON a.actor_id = fa.actor_id
-- use LIKE as we want to include any actor with 'JOHN' appearing in their last_name
-- not just actors with last_name exactly matching 'JOHN'
WHERE a.first_name LIKE '%JOHN%'
