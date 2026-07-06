-- Total revenue overall
SELECT SUM(money) AS total_revenue
FROM index_1;

-- Most profitable type of coffee and total sales for each coffee type
SELECT SUM(money) AS total_revenue, coffee_name 
FROM index_1
GROUP BY coffee_name
ORDER BY total_revenue DESC;

-- Most commonly bought type of coffee
SELECT COUNT(*) AS num_sales, coffee_name 
FROM index_1
GROUP BY coffee_name
ORDER BY num_sales DESC;

-- Total revenue in each month
SELECT 
    ROUND(SUM(money), 2) AS total_revenue, 
    DATE_FORMAT(date, '%Y-%m') AS month
FROM index_1
GROUP BY month
ORDER BY month;

-- Daily revenue and weekly average revenue 
SELECT date, ROUND(SUM(money), 2) AS daily_revenue, ROUND(AVG(SUM(money)) OVER(ORDER BY date ROWS BETWEEN 6 PRECEDING AND CURRENT ROW), 2) AS avg_week_revenue
FROM index_1
GROUP BY date
ORDER BY date;

-- Cash vs card sales
SELECT SUM(money) AS total, COUNT(*) AS num_of_sales, cash_type
FROM index_1
GROUP BY cash_type;