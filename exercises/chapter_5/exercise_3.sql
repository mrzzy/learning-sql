--
-- Learning SQL
-- Exercise 5-3
--

-- select address pairs a1, a2 that exist in the same city city_id.
SELECT a1.address, a2.address, a1.city_id
FROM address a1
  -- join addresses in the same city
  INNER JOIN address a2 ON a1.city_id = a2.city_id
-- filter out duplicates where address a1 is the same as address a2
WHERE a1.address != a2.address;
