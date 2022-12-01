WITH female As (
    SELECT pizzeria.name
    FROM person
             LEFT JOIN person_order ON person.id = person_order.person_id
             LEFT JOIN menu ON person_order.menu_id = menu.id
             LEFT JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
    WHERE person.gender = 'female'
),
     male AS (
         SELECT pizzeria.name
         FROM person
                  LEFT JOIN person_order ON person.id = person_order.person_id
                  LEFT JOIN menu ON person_order.menu_id = menu.id
                  LEFT JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
         WHERE person.gender = 'male'
     ),
     femaleOnly AS (
         SELECT *
         FROM female
         EXCEPT
         SELECT *
         FROM male
     ),
     maleOnly AS (
         SELECT *
         FROM male
         EXCEPT
         SELECT *
         from female
     )
SELECT name pizzeria_name
FROM femaleOnly
UNION
SELECT name
FROM maleOnly
ORDER BY pizzeria_name;