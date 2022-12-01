WITH female As (
    SELECT pizzeria.name
    FROM person
    LEFT JOIN person_visits ON person.id = person_visits.person_id
    LEFT JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id
    WHERE person.gender = 'female' AND person.gender != 'male'
),
     male AS (
    SELECT pizzeria.name
    FROM person
    LEFT JOIN person_visits ON person.id = person_visits.person_id
    LEFT JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id
    WHERE person.gender = 'male' AND person.gender != 'female'
     ),
     femaleOnly AS (
         SELECT * FROM female EXCEPT ALL SELECT * FROM male
     ),
     maleOnly AS (
         SELECT * FROM male EXCEPT ALL SELECT * from female
     )
SELECT name pizzeria_name
FROM femaleOnly UNION SELECT name FROM maleOnly
ORDER BY pizzeria_name;