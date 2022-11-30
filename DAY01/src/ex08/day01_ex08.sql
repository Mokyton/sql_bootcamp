SELECT order_date,
       format('%s (age:%s)', person.name, person.age) as person_information
FROM person NATURAL  JOIN (SELECT order_date, person_id as id FROM person_order) as pcdc
ORDER BY order_date ASC,
         person_information ASC;

