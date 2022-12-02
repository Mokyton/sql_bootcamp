CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
SELECT p.name FROM person LEFT JOIN person_visits pv on person.id = pv.person_id
LEFT JOIN menu m on pv.pizzeria_id = m.pizzeria_id
LEFT JOIN person_order po on m.id = po.menu_id
LEFT JOIN pizzeria p on m.pizzeria_id = p.id
WHERE person.name = 'Dmitriy' AND pv.visit_date = '2022-01-08' AND m.price < 800;