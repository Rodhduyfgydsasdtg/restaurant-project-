-- 1 view the order details table 
SELECT * FROM restaurant_db.order_details;

-- 2 what is the date range of the table ?
SELECT MIN(order_date),MAX(order_date)
FROM restaurant_db.order_details;

-- 3 how many orders were ordered within this date_range ?
SELECT COUNT(DISTINCT order_id) AS total_items
FROM restaurant_db.order_details;

-- 4 how many items were ordered within this date_range ?
SELECT COUNT(*) AS total_items
FROM restaurant_db.order_details;

-- 5 which orders had the most number of items 
SELECT order_id,COUNT(item_id) AS num_items
FROM restaurant_db.order_details
GROUP BY order_id 
ORDER BY num_items DESC ;

-- 6 how many orders had more than 12 items ?
SELECT COUNT(*) AS num_items FROM
(SELECT order_id,COUNT(item_id) AS num_items
FROM restaurant_db.order_details
GROUP BY order_id
HAVING num_items > 12 ) AS num_orders;

