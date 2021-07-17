--
-- Learning SQL
-- Exercise 15-2
--

SELECT
    concat(
        'ALTER TABLE ',
        i.table_name,
        ' ADD INDEX ',
        i.index_name,
        ' (',
        i.column_names,
        ');'
    )
FROM (
    SELECT
      table_name, index_name, group_concat(column_name) column_names
    FROM
      information_schema.statistics
    WHERE
      table_schema = 'sakila'
    GROUP BY
      table_name, index_name
) i
