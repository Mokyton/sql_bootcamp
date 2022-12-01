SELECT p.name as pizzeria_name
FROM person
JOIN person_order po on person.id = po.person_id
JOIN person_visits pv on person.id = pv.person_id
JOIN pizzeria p on pv.pizzeria_id = p.id
WHERE person.name = 'Andrey' and po.order_date != pv.visit_date