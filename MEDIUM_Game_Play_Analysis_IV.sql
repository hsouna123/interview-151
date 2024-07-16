-- -- Intuition
-- -- To determine the fraction of players who log in exactly one day after their first login, we need to track the first login date for each player and then check if there are subsequent logins exactly one day after that date. This involves calculating the date difference between the login events and the first login date.

-- -- Approach
-- -- Calculate First Login Date: Use a Common Table Expression (CTE) to calculate and store the first login date for each player.
-- -- Join with Activity: Join the original Activity table with the CTE on player_id to access both the login events and the first login date.
-- -- Calculate Date Difference: Use the DATEDIFF function to check if the event date is exactly one day after the first login date.
-- -- Aggregate Results: Sum up the cases where the condition is true and divide by the total number of unique players to get the desired fraction. Round the result to two decimal places.
-- Complexity
-- Time complexity:
-- The time complexity is O(n), where n is the number of rows in the Activity table. This is because the query processes each row in the Activity table to calculate the first login date and checks the date difference for each login event.

-- Space complexity:
-- The space complexity is O(n), where n is the number of players, because the CTE temp will store the first login date for each player.
# Write your MySQL query statement below #
-- First, let's store the first login date of each player.
WITH temp AS (
    SELECT player_id, MIN(event_date) AS first_login_date
    FROM Activity 
    GROUP BY player_id
)

# Calculate the fraction of players who logged in exactly one day after their first login.
SELECT 
    ROUND(
        SUM(DATEDIFF(a.event_date, t.first_login_date) = 1) / COUNT(DISTINCT a.player_id), 2
    ) AS fraction
FROM Activity a
JOIN temp t ON a.player_id = t.player_id;
