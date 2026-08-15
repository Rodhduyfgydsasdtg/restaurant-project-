-- 1 combine  the menu_items and order_details tables into a single table 
SELECT*
FROM restaurant_db.order_details od LEFT JOIN restaurant_db.menu_items mi
	ON od.item_id =mi.menu_item_id ;
    
-- 2 what were the least and most order items ,what categories were they in ?
SELECT item_name ,category ,COUNT(order_details_id) AS num_purchases
FROM restaurant_db.order_details od LEFT JOIN restaurant_db.menu_items mi
	ON od.item_id =mi.menu_item_id
    GROUP BY item_name,category
    ORDER BY num_purchases;  
    
-- 3     what were the top 5 orders that spent the most money ?
SELECT order_id ,SUM(price) AS total_spend 
FROM restaurant_db.order_details od LEFT JOIN restaurant_db.menu_items mi
	ON od.item_id =mi.menu_item_id
    GROUP BY order_id
    ORDER BY total_spend DESC 
    LIMIT 5 ;  
    
-- 4 view the details of the highest  spend ordernwhat insight can you gather from the result 
    SELECT category ,COUNT(item_id) AS num_items
FROM restaurant_db.order_details od LEFT JOIN restaurant_db.menu_items mi
	ON od.item_id =mi.menu_item_id
    GROUP BY order_id =440
    ORDER BY category ;
    
    -- 5 view the details of the top 5 higest spend orders ,what insight can you gather from the results ?
    SELECT order_id ,category ,COUNT(item_id) AS num_items 
FROM restaurant_db.order_details od LEFT JOIN restaurant_db.menu_items mi
	ON od.item_id =mi.menu_item_id
    WHERE order_id IN (440,2075,330,2675)
    GROUP BY category ,order_id;
    