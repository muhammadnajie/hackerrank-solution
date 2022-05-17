-- It does perfectly pass the test, but it iterate through all the rows of the from clause
-- which is at least 300 rows
SET @n = 21;
SET @pattern = '* ';
SELECT 
    REPEAT(@pattern, @n := @n - 1) 
FROM information_schema.tables;