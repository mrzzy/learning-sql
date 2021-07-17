--
-- Learning SQL
-- Exercise 10-3
--

SELECT
  o.ones + t.tens
FROM
  (
    SELECT 0 AS ones UNION ALL SELECT 1 AS ones
    UNION ALL SELECT 2 AS ones
    UNION ALL SELECT 3 AS ones
    UNION ALL SELECT 4 AS ones
    UNION ALL SELECT 5 AS ones
    UNION ALL SELECT 6 AS ones
    UNION ALL SELECT 7 AS ones
    UNION ALL SELECT 8 AS ones
    UNION ALL SELECT 9 AS ones
  )
    AS o
  CROSS JOIN (
      SELECT 0 AS tens UNION ALL SELECT 10 AS tens
      UNION ALL SELECT 20 AS tens
      UNION ALL SELECT 30 AS tens
      UNION ALL SELECT 40 AS tens
      UNION ALL SELECT 50 AS tens
      UNION ALL SELECT 60 AS tens
      UNION ALL SELECT 70 AS tens
      UNION ALL SELECT 80 AS tens
      UNION ALL SELECT 90 AS tens
      UNION ALL SELECT 100 AS tens
    )
      AS t
WHERE
  (o.ones + t.tens) BETWEEN 1 AND 100
