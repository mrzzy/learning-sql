--
-- Learning SQL
-- Exercise 12-1
--

-- create tables with data given in exercise description
START TRANSACTION;
CREATE TABLE IF NOT EXISTS Account (
    account_id SMALLINT UNSIGNED,
    avail_balance FLOAT,
    last_activity_date DATETIME,
    CONSTRAINT pk_Account PRIMARY KEY (account_id)
);

INSERT INTO Account (account_id, avail_balance, last_activity_date)
VALUES (123, 500, '2019-07-10 20:53:27');

INSERT INTO Account (account_id, avail_balance, last_activity_date)
VALUES (789, 75, '2019-07-10 20:53:27');


CREATE TABLE IF NOT EXISTS Transaction (
    txn_id SMALLINT UNSIGNED AUTO_INCREMENT,
    txn_date DATE,
    account_id SMALLINT UNSIGNED,
    txn_type_cd ENUM('C', 'D'),
    amount FLOAT,
    CONSTRAINT pk_Transaction PRIMARY KEY (txn_id)
);

INSERT INTO Transaction (txn_id, txn_date, account_id, txn_type_cd, amount)
VALUES (1001, '2019-05-15', 123, 'C', 500);

INSERT INTO Transaction (txn_id, txn_date, account_id, txn_type_cd, amount)
VALUES (1002, '2019-06-01', 789, 'C', 75);
COMMIT;

-- use transaction to create an atomic unit of work
-- transfer $50 from account 123 to 789
START TRANSACTION;

-- insert transactions for transfer
INSERT INTO Transaction (txn_date, account_id, txn_type_cd, amount)
VALUES (DATE(NOW()), 123, 'C', 50);

INSERT INTO Transaction (txn_date, account_id, txn_type_cd, amount)
VALUES (DATE(NOW()), 789, 'D', 50);

---- update account balances after transfer
UPDATE Account
SET
    avail_balance = (SELECT avail_balance FROM Account WHERE account_id = 123) - 50,
    last_activity_date = DATE(NOW())
WHERE
    account_id = 123;

UPDATE Account
SET
    avail_balance = (SELECT avail_balance FROM Account WHERE account_id = 789) + 50,
    last_activity_date = DATE(NOW())
WHERE
    account_id = 789;
-- commit changes made to database
COMMIT;

SELECT * FROM Account;
SELECT * FROM Transaction;

-- clean up created tables
DROP TABLE Account;
DROP TABLE Transaction;
