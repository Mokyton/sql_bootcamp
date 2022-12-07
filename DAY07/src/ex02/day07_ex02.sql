WITH order_ AS (
    SELECT p.name, count(m.pizzeria_id) count, ('order') action_type
    FROM person_order po
             JOIN menu m on po.menu_id = m.id
             JOIN pizzeria p on p.id = m.pizzeria_id
    GROUP BY p.name
    ORDER BY action_type ASC, count DESC
    LIMIT 3
),
     visit_ AS (
         SELECT p2.name, count(person_visits.pizzeria_id) count, ('visit') action_type
         FROM person_visits
                  JOIN pizzeria p2 on p2.id = person_visits.pizzeria_id
         GROUP BY p2.name
         ORDER BY action_type ASC, count DESC
         LIMIT 3
     )
SELECT *
FROM order_
UNION
(SELECT * FROM visit_)
ORDER BY action_type ASC, count DESC;
