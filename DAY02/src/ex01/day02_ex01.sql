SELECT cast(pv as date) as missing_date
FROM generate_series('2022-01-01'::timestamp, '2022-01-10', '1 day') pv
LEFT JOIN (SELECT visit_date FROM person_visits WHERE person_id = 1 OR person_id = 2) p ON visit_date = pv
WHERE visit_date is NULL
ORDER BY visit_date;