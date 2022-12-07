SELECT p.name, count(pizzeria_id) count_of_visits
FROM person_visits JOIN person p on p.id = person_visits.person_id
GROUP BY p.name
ORDER BY 2 DESC, 1 ASC LIMIT 4;