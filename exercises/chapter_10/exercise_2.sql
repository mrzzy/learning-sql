--
-- Learning SQL
-- Exercise 10-2
--


-- simulate 'Customer' and 'Payment' tables given in the exercise with CTE.
WITH Customer AS (
    SELECT 1 Customer_id, 'John Smith' Name
    UNION ALL
    SELECT 2 Customer_id, 'Kathy Jones' Name
    UNION ALL
    SELECT 3 Customer_id, 'Greg Oliver' Name
), Payment AS (
    SELECT 101 Payment_id, 1 Customer_id, 8.99 Amount
    UNION ALL
    SELECT 102 Payment_id, 3 Customer_id, 4.99 Amount
    UNION ALL
    SELECT 103 Payment_id, 1 Customer_id, 7.99 Amount
)

-- use lright join this time
SELECT
  c.name, sum(COALESCE(p.amount, 0)) total_payments
FROM
  payment p
  RIGHT JOIN customer c ON c.customer_id = p.customer_id
GROUP BY
  c.name
