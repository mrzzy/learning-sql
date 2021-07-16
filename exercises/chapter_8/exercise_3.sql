--
-- Learning SQL
-- Exercise 8-3
--

SELECT
    customer_id, COUNT(*) num_payments, SUM(amount) total_amount
FROM
    payment
GROUP BY
    customer_id
HAVING
    num_payments >= 40;
