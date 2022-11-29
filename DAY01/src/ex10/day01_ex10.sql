SELECT person.name as person_name,
       menu.pizza_name as pizza_name,
       pizzeria.name as pizzeria_name
       FROM person
           INNER JOIN person_order ON person.id = person_order.person_id
           INNER JOIN menu ON person_order.menu_id = menu.id
           INNER JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
ORDER BY person_name ASC,
         pizza_name ASC,
         pizzeria_name ASC;