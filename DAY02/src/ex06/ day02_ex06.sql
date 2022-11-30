SELECT pizzeria.name, menu.pizza_name
FROM person ps
LEFT JOIN person_order ON ps.id = person_order.person_id
LEFT JOIN menu ON person_order.menu_id = menu.id
LEFT JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
WHERE ps.name = 'Denis' OR ps.name = 'Anna'
ORDER BY menu.pizza_name, pizzeria.name;