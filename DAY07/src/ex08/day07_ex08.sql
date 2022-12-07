SELECT p.address, pizzeria.name, count(pizzeria_id) count_of_orders
FROM person_order po
JOIN person p on p.id = po.person_id
JOIN menu m on po.menu_id = m.id
JOIN pizzeria on m.pizzeria_id = pizzeria.id
GROUP BY p.address, pizzeria.name, pizzeria_id
ORDER BY address, name;
