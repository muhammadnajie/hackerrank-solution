SELECT 
    MAX(CASE WHEN Occupation = 'Doctor' THEN Name ELSE NULL END),
    MAX(CASE WHEN Occupation = 'Professor' THEN Name ELSE NULL END),
    MAX(CASE WHEN Occupation = 'Singer' THEN Name ELSE NULL END),
    MAX(CASE WHEN Occupation = 'Actor' THEN Name ELSE NULL END)
FROM (
    SELECT name, occupation, 
        ROW_NUMBER() OVER (PARTITION BY occupation ORDER BY name ASC) rank_by_occupation
    FROM occupations
) ranked
GROUP BY ranked.rank_by_occupation;