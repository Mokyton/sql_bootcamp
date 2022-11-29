SELECT person_id
FROM (SELECT person_id, order_date
FROM person_order
EXCEPT ALL SELECT person_id, visit_date FROM person_visits) as pv
WHERE order_date = '2022-01-07';