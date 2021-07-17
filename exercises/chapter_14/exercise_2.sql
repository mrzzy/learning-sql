--
-- Learning SQL
-- Exercise 14-2
--

CREATE VIEW report AS
  -- subquery computes the total payments of all customers residing a given country
  SELECT
    c.country, sum(p.amount) AS tot_payments
  FROM
    country AS c
    INNER JOIN city ON city.country_id = c.country_id
    INNER JOIN address AS a ON a.city_id = city.city_id
    INNER JOIN customer AS cus ON
        cus.address_id = a.address_id
    INNER JOIN payment AS p ON p.customer_id = cus.customer_id
  GROUP BY
    c.country
