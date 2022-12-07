SELECT p.name,
       count(m.pizzeria_id),
       round(avg(m.price), 2)
        average_price,
       max(price) max_price,
       min(price) min_price
FROM person_order po
         join menu m on m.id = po.menu_id
         join pizzeria p on p.id = m.pizzeria_id
GROUP BY p.name, m.pizzeria_id
ORDER BY p.name