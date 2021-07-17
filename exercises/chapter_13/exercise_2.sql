--
-- Learning SQL
-- Exercise 13-2
--

ALTER TABLE payment
ADD INDEX idx_date_amt (payment_date, amount);
