SELECT 
    *
FROM
    walmart_db.walmart;
--  1. Count Total Transactions
SELECT 
    COUNT(*) AS total_transactions
FROM
    walmart;
--  2. Transactions by Payment Method
SELECT 
    payment_method, COUNT(*) AS number_of_transactions
FROM
    walmart
GROUP BY payment_method;
-- 3. Number of Branches
SELECT 
    COUNT(DISTINCT branch) AS total_branches
FROM
    walmart;
-- 4. Minimum Quantity Sold
SELECT 
    MIN(quantity) AS minimum_quantity
FROM
    walmart;
-- 5. Transactions & Quantity by Payment Method
SELECT 
    payment_method,
    COUNT(*) AS total_transactions,
    SUM(quantity) AS total_quantity_sold
FROM
    walmart
GROUP BY payment_method;
--  6. Highest Rated Category per Branch
SELECT 
    branch, category, AVG(rating) AS avg_rating
FROM
    walmart
GROUP BY branch , category;
--  7. Busiest Day per Branch
SELECT 
    branch,
    DAYNAME(STR_TO_DATE(date, '%d/%m/%Y')) AS day_name,
    COUNT(*) AS transactions
FROM
    walmart
GROUP BY branch , day_name;
--  8. Quantity Sold by Payment Method
SELECT 
    payment_method, SUM(quantity) AS total_quantity
FROM
    walmart
GROUP BY payment_method;
-- 9. Rating Stats by City & Category
SELECT 
    city,
    category,
    MIN(rating) AS min_rating,
    MAX(rating) AS max_rating,
    AVG(rating) AS avg_rating
FROM
    walmart
GROUP BY city , category;
-- 10. Total Profit by Category
-- (Assuming profit margin = 10%)
SELECT 
    category, SUM(unit_price * quantity * 0.1) AS total_profit
FROM
    walmart
GROUP BY category
ORDER BY total_profit DESC;
-- 11. Most Used Payment Method per Branch
SELECT 
    branch, payment_method, COUNT(*) AS total_transactions
FROM
    walmart
GROUP BY branch , payment_method
ORDER BY branch , total_transactions DESC;
-- 12. Invoice Count by Time Shift
SELECT 
    branch,
    CASE
        WHEN HOUR(TIME(time)) < 12 THEN 'Morning'
        WHEN HOUR(TIME(time)) < 18 THEN 'Afternoon'
        ELSE 'Evening'
    END AS shift,
    COUNT(*) AS total_invoices
FROM
    walmart
GROUP BY branch , shift;
-- 13. Revenue in 2022 vs 2023 by Branch
SELECT 
    branch,
    SUM(CASE
        WHEN YEAR(STR_TO_DATE(date, '%d/%m/%Y')) = 2022 THEN total
        ELSE 0
    END) AS revenue_2022,
    SUM(CASE
        WHEN YEAR(STR_TO_DATE(date, '%d/%m/%Y')) = 2023 THEN total
        ELSE 0
    END) AS revenue_2023
FROM
    walmart
GROUP BY branch;


