INSERT INTO person_discounts
SELECT row_number() over(),
       po.person_id,
       m.pizzeria_id,
       (CASE
           WHEN count(m.pizzeria_id) = 1 THEN 10.5
           WHEN count(m.pizzeria_id) = 2 THEN 22
           ELSE 30 END)
FROM person_order po
         LEFT JOIN menu m on m.id = po.menu_id
group by po.person_id, m.pizzeria_id;
