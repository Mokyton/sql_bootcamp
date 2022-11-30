SELECT pizza_name pizza_name,
       name pizzeria_name,
       price
FROM menu INNER JOIN pizzeria ON pizzeria.id = pizzeria_id
WHERE menu.pizza_name = 'mushroom pizza' OR menu.pizza_name = 'pepperoni pizza'
ORDER BY pizza_name,
         pizzeria_name;
