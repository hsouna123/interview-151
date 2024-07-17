-- Intuition
-- SELECT
-- ROUND(SUM(IF(order_date = customer_pref_delivery_date, 1, 0))*100/COUNT(DISTINCT customer_id),2) --> If order date and customer_pref_delivery_date is same then, consider 1 otherwise 0 and sum after this we can calculate immediate_percentage finally, round off the answer...
-- AS immediate_percentage
-- FROM Delivery --> Alias as immediate_percentage FROM Delivery table...
-- WHERE (customer_id, order_date) IN (SELECT customer_id, MIN(order_date) AS first_order_date
-- FROM Delivery
-- GROUP BY customer_id); --> only consider minimum order date & these are the conditions given in problem...

-- Approach
-- Using Fundamentals of SQL...

-- Complexity
-- Time complexity: O(n)
-- Space complexity: O(1)
-- Code
SELECT 
ROUND(SUM(IF(order_date = customer_pref_delivery_date, 1, 0))*100/COUNT(DISTINCT customer_id),2) 
AS immediate_percentage 
FROM Delivery 
WHERE (customer_id, order_date) IN 
(SELECT customer_id, MIN(order_date) AS first_order_date 
FROM Delivery 
GROUP BY customer_id);
