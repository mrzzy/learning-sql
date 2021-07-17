--
-- Learning SQL
-- Exercise 13-1
--

ALTER TABLE rental
  ADD CONSTRAINT fk_customer_id FOREIGN KEY (customer_id) REFERENCES customer (customer_id) ON DELETE RESTRICT
