USE market_research;

-- Query to find the most popular pizzas by total quantity sold
SELECT pizza_name,   -- Select the pizza name
SUM(quantity) AS total_sold -- Sum the total quantity sold for each pizza
FROM pizza_sales   -- From the pizza_sales table
GROUP BY pizza_name  -- Group the results by pizza name
ORDER BY total_sold DESC;  -- Order by total quantity sold in descending order


-- Query to calculate total revenue for each pizza
SELECT pizza_name, pizza_category,   -- Select the pizza name
SUM(CAST(REPLACE(total_price, '$', '') AS DECIMAL(10, 2))) AS total_revenue  -- Sum the total revenue by removing the dollar sign and casting the price as a decimal
FROM pizza_sales     -- From the pizza_sales table
GROUP BY pizza_name, pizza_category  -- Group the results by pizza name and category
ORDER BY total_revenue DESC;   -- Order by total revenue in descending order


-- Query to find the total quantity of pizzas sold per category
SELECT pizza_category, -- Select the pizza category
SUM(quantity) AS total_sold -- Sum the total quantity sold for each pizza category
FROM pizza_sales -- From the pizza_sales table
GROUP BY pizza_category  -- Group the results by pizza category
ORDER BY total_sold DESC;  -- Order by total quantity sold in descending order


-- Query to find peak order times by extracting the hour and counting total orders per hour
SELECT HOUR(STR_TO_DATE(order_time, '%H:%i:%s')) AS peak_hours, -- Extract the hour from the order time
COUNT(order_id) AS total_orders -- Count the total number of orders in that hour
FROM pizza_sales -- From the pizza_sales table
GROUP BY peak_hours -- Group the results by order hour
ORDER BY total_orders DESC;  -- Order by total number of orders in descending order
                                    

SELECT DAYNAME(STR_TO_DATE(order_date, '%m/%d/%Y')) AS day_of_week,  -- Extract the name of the day from the order date
COUNT(order_id) / COUNT(DISTINCT order_date) AS avg_orders_per_day,  -- Calculate the average number of orders per day
AVG(CAST(REPLACE(total_price, '$', '') AS DECIMAL(10, 2))) AS avg_price_per_order  -- Calculate the average price per order
FROM pizza_sales  -- From the pizza_sales table
GROUP BY day_of_week  -- Group the results by day of the week
ORDER BY avg_orders_per_day DESC;  -- Order by average number of orders per day in descending order


-- Query to find the number of orders by month
SELECT MONTHNAME(STR_TO_DATE(order_date, '%m/%d/%Y')) AS order_month,  -- Extract the name of the month from the order date
COUNT(order_id) AS total_orders,  -- Count the total number of orders for that month
SUM(CAST(REPLACE(total_price, '$', '') AS DECIMAL(10, 2))) AS total_revenue  -- Calculate the total revenue by removing the dollar sign and casting the price as a decimal
FROM pizza_sales  -- From the pizza_sales table
GROUP BY order_month  -- Group the results by order month
ORDER BY total_revenue DESC;  -- Order by total revenue in descending order                                      






    
   



