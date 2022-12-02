INSERT INTO person_visits (id, person_id, pizzeria_id, visit_date)
VALUES ((SELECT max(id) FROM person_visits) + 1, (SELECT id FROM person WHERE name = 'Dmitriy'),
        (SELECT p.id
         FROM menu m
                  LEFT JOIN pizzeria p on m.pizzeria_id = p.id
                LEFT JOIN mv_dmitriy_visits_and_eats mat on true
        WHERE m.price < 800 AND mat.name != p.name LIMIT 1), '2022-01-08');
REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;