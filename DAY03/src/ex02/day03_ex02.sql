SELECT menu.pizza_name, menu.price, pizzeria.name pizzeria_name
FROM menu
FULL JOIN person_order ON person_order.menu_id = menu.id
FULL JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
WHERE person_id IS NULL
ORDER BY menu.pizza_name,
         menu.price,
         pizzeria_name

