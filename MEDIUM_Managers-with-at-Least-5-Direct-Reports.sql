**********************************************************************************************
Intuition
Query 1
Count the number of direct reports for each manager, based on managerID
Apply the condition i.e. managers with direct reports >=5
Query 2
3. Find the name of employee whose ID is in your first query
Complexity
Time complexity: 308ms
**********************************************************************************************
SELECT name
FROM Employee
WHERE id IN 

(SELECT managerId as id
FROM Employee
GROUP BY managerId
HAVING COUNT(*) >=5
)
**********************************************************************************************
