--
-- Learning SQL
-- Exercise 3-4
--

SELECT
  c.email, r.return_date
FROM
  customer AS c
  INNER JOIN rental AS r ON c.customer_id = r.customer_id
WHERE
  date(r.rental_date) = '2005-06-14'
ORDER BY
  -- inspecting the result set we can make 2 observations:
  -- 1. email column does not seem to be in osrted order
  -- 2. return date is in reverse / descending sorted order
  -- hence we can assume that the result set is in reverse sorted order.
  date(r.return_date) DESC;
