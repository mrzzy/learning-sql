--
-- Learning SQL
-- Exercise 3-3
--

SELECT DISTINCT
  customer_id
FROM
  rental
WHERE
  date(rental_date) = '2005-07-05';
