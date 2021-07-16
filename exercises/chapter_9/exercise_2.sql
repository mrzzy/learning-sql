--
-- Learning SQL
-- Exercise 9-2
--

-- correlated subquery against the category table
SELECT
  fc.film_id
FROM
  film_category AS fc
WHERE
  EXISTS(
    SELECT
      1
    FROM
      category AS c
    WHERE
      c.category_id = fc.category_id AND c.name = 'Action'
  );
