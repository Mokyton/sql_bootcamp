CREATE VIEW v_price_with_discount AS
SELECT person.name, m.pizza_name, m.price, round(m.price - m.price * 0.1) disocunt_price
FROM person
         LEFT JOIN person_order po ON person.id = po.person_id
         LEFT JOIN menu m ON po.menu_id = m.id
order by 1, 2;