--
-- Learning SQL
-- Exercise 4-2
--

-- obtain subset of rows given for the exercise from the payment table
WITH payment_subset AS (
    SELECT
        payment_id, customer_id, amount, payment_date
    FROM
        payment
    WHERE payment_id IN (
        101, 102, 103, 104, 105, 106, 107, 108, 109, 110,
        111, 112, 113, 114, 115, 116, 117, 118, 119, 120
    )
)


SELECT
    payment_id
FROM
    payment_subset
WHERE
    -- condition given the the exercise statement
    customer_id = 5 AND NOT (amount > 6 OR date(payment_date) = '2005-06-19')
