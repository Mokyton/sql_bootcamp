SELECT pizzeria.name, menu.pizza_name
FROM person ps
LEFT JOIN person_visits ON ps.id = person_visits.person_id
LEFT JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
LEFT JOIN menu ON pizzeria.id = menu.pizzeria_id
WHERE ps.name = 'Dmitriy' AND person_visits.visit_date = '2022-01-08' AND menu.price < 800
ORDER BY menu.pizza_name, pizzeria.name;