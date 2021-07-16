--
-- Learning SQL
-- Exercise 9-1
--

-- non-correlated subquery against the category table
SELECT
  film_id
FROM
  film_category
WHERE
  category_id
  = (SELECT category_id FROM category WHERE name = 'Action');
