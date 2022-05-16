-- subquery solution
SELECT
    h.hacker_id, name, agg_score
FROM
-- sum all values of each hacker
(
    SELECT
        hacker_id, SUM(max_score_each_challenge) agg_score
    FROM
    -- get all hackers with its max score in each challenge they've tried
        (
            SELECT 
                hacker_id, challenge_id, MAX(score) max_score_each_challenge
            FROM 
                submissions
            GROUP BY
                challenge_id, hacker_id
        ) ss
    GROUP BY hacker_id
) final_score
-- join with hackers table to get the name
INNER JOIN
    hackers h 
    ON h.hacker_id = final_score.hacker_id
-- exclude hackers with 0 score
WHERE agg_score > 0
ORDER BY 
    final_score.agg_score DESC, final_score.hacker_id