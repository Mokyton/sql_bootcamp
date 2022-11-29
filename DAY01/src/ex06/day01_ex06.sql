SELECT order_date as action_date,
       name as person_name
FROM (SELECT order_date ,
       person_id
FROM person_order
INTERSECT
SELECT visit_date,
       person_id
FROM person_visits) as pv INNER JOIN person ON pv.person_id = person.id
ORDER BY action_date ASC,
         person_name DESC;

