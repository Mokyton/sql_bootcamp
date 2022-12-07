WITH num AS (
    SELECT address,
           cast(age as numeric(7,2))
    FROM person
),
     fm AS (
SELECT address,
       round((max(age) - (min(age)/max(age))), 2) formula,
       round(avg(age), 2) average
FROM num
GROUP BY address
     )
SELECT address, formula, average, formula > average comprarison
FROM fm
ORDER BY address;