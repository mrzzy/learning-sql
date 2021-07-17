--
-- Learning SQL
-- Exercise 14-1
--

CREATE VIEW film_ctgry_actor AS
  SELECT
    f.title,
    c.name AS category_name,
    a.first_name,
    a.last_name
  FROM
    film AS f
    INNER JOIN film_category AS fc ON fc.film_id = f.film_id
    INNER JOIN category AS c ON
        c.category_id = fc.category_id
    INNER JOIN film_actor AS fa ON fa.film_id = f.film_id
    INNER JOIN actor AS a ON a.actor_id = fa.actor_id;

-- given query used to test created view
SELECT
  title, category_name, first_name, last_name
FROM
  film_ctgry_actor
WHERE
  last_name = 'FAWCETT'
