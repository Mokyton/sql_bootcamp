WITH tmp AS (
    SELECT p.id, pizza_name, price, p.name as pizzeria_name, pizzeria_id
    FROM menu
             LEFT JOIN pizzeria p on menu.pizzeria_id = p.id
)
    SELECT t1.pizza_name, t1.pizzeria_name pizzeria_name_1, t2.pizzeria_name pizzeira_name_2, t1.price
FROM tmp as t1 LEFT JOIN tmp t2 ON t1.price = t2.price AND t1.pizza_name = t2.pizza_name
WHERE  t1.price = t2.price AND t1.pizza_name = t2.pizza_name AND t1.id > t2.id
ORDER BY 1;