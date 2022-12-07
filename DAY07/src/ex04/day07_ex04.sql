WITH tmp AS (SELECT name, count(person_id) as count
FROM person
         JOIN person_visits pv ON pv.person_id = person.id
GROUP BY name)
SELECT person.name, tmp.count from person INNER JOIN tmp ON tmp.name = person.name AND tmp.count > 3;
