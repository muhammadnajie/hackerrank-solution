SELECT
    f1.x, f1.y
FROM
    functions f1
INNER JOIN 
    functions f2
    ON f1.x = f2.y AND f1.y = f2.x
GROUP BY f1.x, f1.y
-- Filter only x1 <= y1 and if there is two rows with the same value
HAVING f1.x < f1.y OR COUNT(*) > 1
ORDER BY f1.x