--
-- Learning SQL
-- Exercise 5-1
--

SELECT c.first_name, c.last_name, a.address, ct.city
FROM customer c
  INNER JOIN address a
  ON c.address_id = a.address_id
  INNER JOIN city ct
  -- the common column between the address & cit tables is 'city_id',
  -- hence we can safely assume the result set is derieved from a inner join on 'city_id'
  ON a.city_id = ct.city_id
WHERE a.district = 'California';
