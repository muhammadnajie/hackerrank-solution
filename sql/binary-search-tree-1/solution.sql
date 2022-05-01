SELECT CONCAT(node, " ", note)
FROM (
    SELECT N as node, 
    CASE 
        WHEN p IS NULL THEN "Root"
        WHEN n IN (SELECT DISTINCT p FROM bst) THEN "Inner"
        ELSE "Leaf"
    END AS note 
    FROM bst
) bw
ORDER BY bw.node;