SELECT name
FROM person
LEFT JOIN person_order ON person.id = person_order.person_id
LEFT JOIN menu ON menu.id = person_order.menu_id
WHERE person.gender = 'male' AND (person.address = 'Moscow' or person.address = 'Samara')
AND (menu.pizza_name = 'mushroom pizza' OR menu.pizza_name = 'pepperoni pizza')