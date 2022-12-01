WITH tmp AS (
    SELECT menu.pizza_name, menu.price, pizzeria.name pizzeria_name, person_visits.visit_date
    FROM person
    LEFT JOIN person_visits ON person.id = person_visits.person_id
    LEFT JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
    LEFT JOIN menu ON pizzeria.id = menu.pizzeria_id
    WHERE person.name = 'Kate' AND price BETWEEN '800' AND '1000'
)
SELECT pizza_name,
       price,
       pizzeria_name,
       visit_date
FROM tmp
ORDER BY pizza_name,
         price,
         pizzeria_name

