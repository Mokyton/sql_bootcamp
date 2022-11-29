SELECT order_date,
       format('%s (age:%s)', person.name, person.age) as person_information
FROM person NATURAL  JOIN (SELECT id as order_id, order_date, person_id as id FROM person_order) as pv
ORDER BY order_date ASC,
         person_information ASC;

