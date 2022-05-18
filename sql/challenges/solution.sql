SELECT 
    hacker_id
    , c.challenge_created
    , (
        SELECT COUNT(DISTINCT hacker_id)
        FROM challenges
        GROUP BY hacker_id
            HAVING COUNT(challenge_id) = c.challenge_created
    ) asd
    -- , COUNT(*) OVER (PARTITION BY c.challenge_created) ccn
FROM (
        SELECT
            hacker_id, 
            COUNT(*) challenge_created
        FROM challenges
        GROUP BY hacker_id
    ) c