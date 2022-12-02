SELECT gd.generated_date missing_date
FROM v_generated_dates gd
         LEFT JOIN person_visits pv ON gd.generated_date = pv.visit_date
WHERE pv.id IS NULL
ORDER BY missing_date;