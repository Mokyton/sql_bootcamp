SELECT name
FROM person
LEFT JOIN person_order ON person.id = person_order.person_id
LEFT JOIN menu ON menu.id = person_order.menu_id
WHERE person.gender = 'female' AND (menu.pizza_name = 'cheese pizza' OR menu.pizza_name = 'pepperoni pizza')
GROUP BY name HAVING count(*)> 1
ORDER BY person.name ASC;