-- Intuition
-- Objective: Find the first year each product was sold, along with the quantity and price for that year.
-- Steps:
-- Identify the earliest year for each product.
-- Retrieve details (quantity, price) for the product in that first year.
-- Complexity
-- Time Complexity: O(n) due to table scan for the aggregate function.
-- Space Complexity: O(n) due to the use of a Common Table Expression (CTE).
-- Approach
-- CTE Creation: Create a CTE (CTE) to find the minimum year (minyear) for each product (product_id).
-- Join and Filter: Use an INNER JOIN to link the Sales table with the CTE to fetch rows where the year matches the minyear.*
--   # Write your MySQL query statement below

WITH CTE AS (
    SELECT product_id, MIN(year) AS minyear 
    FROM Sales 
    GROUP BY product_id 
)
SELECT s.product_id, s.year AS first_year, s.quantity, s.price 
FROM Sales s
INNER JOIN CTE 
ON cte.product_id = s.product_id AND s.year = cte.minyear;
