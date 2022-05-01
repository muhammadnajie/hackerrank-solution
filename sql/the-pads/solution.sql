SELECT CONCAT(
    name, 
    "(",
    left(occupation, 1),
    ")"
) FROM occupations
ORDER BY name ASC;

SELECT CONCAT("There are a total of ", oc, " ", lower(occupation), "s.")
FROM (
    SELECT 
        COUNT(occupation) AS oc,
        occupation
    FROM occupations
    GROUP BY occupation
    ORDER BY oc ASC
) AS occupation_counts;