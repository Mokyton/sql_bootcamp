SET enable_bitmapscan  = off;
SET enable_seqscan = off;

EXPLAIN ANALYSE
SELECT m.pizza_name,
       pizzeria.name
FROM pizzeria JOIN menu m on pizzeria.id = m.pizzeria_id;