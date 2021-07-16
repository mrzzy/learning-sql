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
  date(r.return_date) DESC;
