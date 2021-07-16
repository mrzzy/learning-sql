--
-- Learning SQL
-- Exercise 7-1
--

-- +1 required to compute the length of substr as its inclusive of the 25th char.
SELECT SUBSTR('Please find the substring in this string', 17, 25 + 1 - 17);
