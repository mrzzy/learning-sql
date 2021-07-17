--
-- Learning SQL
-- Exercise 15-1
--

SELECT index_name, table_name
FROM information_schema.statistics
WHERE table_schema = 'sakila';
