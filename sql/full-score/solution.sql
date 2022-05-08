SELECT
    h.hacker_id, h.name
FROM submissions s
    INNER JOIN hackers h ON s.hacker_id = h.hacker_id
    INNER JOIN (
        SELECT 
            c.challenge_id, d.score 
        FROM challenges c
            INNER JOIN difficulty d
            ON c.difficulty_level = d.difficulty_level
    ) AS ds -- ds for difficulty score 
    ON ds.challenge_id = s.challenge_id
WHERE s.score = ds.score
GROUP BY h.hacker_id, h.name
    HAVING COUNT(s.submission_id) > 1
ORDER BY 
    COUNT(s.submission_id) DESC, h.hacker_id 