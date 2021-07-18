--
-- Learning SQL
-- Exercise 16-1
--

-- simulate the Sales_Fact table given in the question with a CTE
WITH Sales_Fact AS (
    SELECT 2019 year_no, 1 month_no, 19228 tot_sales
    UNION ALL
    SELECT 2019 year_no, 2 month_no, 18554 tot_sales
    UNION ALL
    SELECT 2019 year_no, 3 month_no, 17325 tot_sales
    UNION ALL
    SELECT 2019 year_no, 4 month_no, 13221 tot_sales
    UNION ALL
    SELECT 2019 year_no, 5 month_no, 9964 tot_sales
    UNION ALL
    SELECT 2019 year_no, 6 month_no, 12658 tot_sales
    UNION ALL
    SELECT 2019 year_no, 7 month_no, 14233 tot_sales
    UNION ALL
    SELECT 2019 year_no, 8 month_no, 17342 tot_sales
    UNION ALL
    SELECT 2019 year_no, 9 month_no, 16853 tot_sales
    UNION ALL
    SELECT 2019 year_no, 10 month_no, 17121 tot_sales
    UNION ALL
    SELECT 2019 year_no, 11 month_no, 19095 tot_sales
    UNION ALL
    SELECT 2019 year_no, 12 month_no, 21436 tot_sales
    UNION ALL
    SELECT 2020 year_no, 1 month_no, 20347 tot_sales
    UNION ALL
    SELECT 2020 year_no, 2 month_no, 17434 tot_sales
    UNION ALL
    SELECT 2020 year_no, 3 month_no, 16225 tot_sales
    UNION ALL
    SELECT 2020 year_no, 4 month_no, 13853 tot_sales
    UNION ALL
    SELECT 2020 year_no, 5 month_no, 14589 tot_sales
    UNION ALL
    SELECT 2020 year_no, 6 month_no, 13248 tot_sales
    UNION ALL
    SELECT 2020 year_no, 7 month_no, 8728 tot_sales
    UNION ALL
    SELECT 2020 year_no, 8 month_no, 9378 tot_sales
    UNION ALL
    SELECT 2020 year_no, 9 month_no, 11467 tot_sales
    UNION ALL
    SELECT 2020 year_no, 10 month_no, 13842 tot_sales
    UNION ALL
    SELECT 2020 year_no, 11 month_no, 15742 tot_sales
    UNION ALL
    SELECT 2020 year_no, 12 month_no, 18636 tot_sales
)

-- rank sales in descending order
SELECT *, RANK() OVER (ORDER BY tot_sales DESC) sales_rank
FROM Sales_Fact;
