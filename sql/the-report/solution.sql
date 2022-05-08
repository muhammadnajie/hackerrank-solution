-- https://hackerrank.com/challenges/the-report/problem
SELECT 
    CASE WHEN grade < 8 THEN NULL ELSE name END,
    grade, 
    marks
FROM students, grades
WHERE students.marks 
    BETWEEN grades.min_mark AND max_mark
ORDER BY 
    grade DESC, 
    -- CASE WHEN grade < 8 THEN marks ELSE name END 
    name, marks
    -- name is null for grade < 8 then the only thing that matters is marks