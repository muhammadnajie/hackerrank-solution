WITH student_salary AS
(
    SELECT
        students.id, name, salary
    FROM 
        students
    INNER JOIN 
        packages ON packages.id = students.id
)

SELECT
    ss1.name
FROM 
    friends
INNER JOIN
    student_salary ss1
    ON friends.id = ss1.id
INNER JOIN
    student_salary ss2
    ON friends.friend_id = ss2.id
WHERE ss2.salary > ss1.salary
ORDER BY ss2.salary