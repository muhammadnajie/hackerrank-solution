SELECT
    s.name
FROM 
    students s
INNER JOIN
    friends f
    ON s.id = f.id
INNER JOIN 
    packages p1
    ON f.id = p1.id
INNER JOIN
    packages p2
    ON f.friend_id = p2.id
WHERE p2.salary > p1.salary
ORDER BY p2.salary