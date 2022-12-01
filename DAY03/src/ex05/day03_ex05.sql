WITH visit As (
    SELECT p.name
    FROM person
             LEFT JOIN person_visits pv on person.id = pv.person_id
             LEFT JOIN pizzeria p on pv.pizzeria_id = p.id
    WHERE person.name = 'Andrey'
),
     ordered AS (
         SELECT pizzeria.name
         FROM person
                  LEFT JOIN person_order ON person.id = person_order.person_id
                  LEFT JOIN menu ON person_order.menu_id = menu.id
                  LEFT JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
         WHERE person.name = 'Andrey'
     ),
     uk AS (
         SELECT *
         FROM visit
         EXCEPT
         SELECT *
         FROM ordered
     ),
     qk AS (
         SELECT *
         FROM ordered
         EXCEPT
         SELECT *
         from visit
     )
SELECT name pizzeria_name
FROM uk
UNION
SELECT name
FROM qk
ORDER BY pizzeria_name;