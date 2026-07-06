-- Total sales overall
SELECT SUM(money) AS total_sales 
FROM new_data.index_1;

-- Most profitable type of coffee and total sales for each coffee type
SELECT SUM(money) AS all_sales, coffee_name 
FROM new_data.index_1
GROUP BY coffee_name
ORDER BY all_sales DESC;

-- Most commonly bought type of coffe
SELECT COUNT(*) AS num_sales, coffee_name 
FROM new_data.index_1
GROUP BY coffee_name
ORDER BY num_sales DESC;

-- sales for each month
SELECT 
    SUM(money) AS sales, 
    DATE_FORMAT(date, '%Y-%m') AS month
FROM new_data.index_1
GROUP BY month
ORDER BY sales DESC;

-- daily revenue and weekly average revenue 
SELECT date, ROUND(SUM(money), 2) AS daily_revenue, ROUND(AVG(SUM(money)) OVER(ORDER BY date ROWS BETWEEN 6 PRECEDING AND CURRENT ROW), 2) AS avg_week_revenue
FROM new_data.index_1
GROUP BY date
ORDER BY date;