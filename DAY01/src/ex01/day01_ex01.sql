SELECT  name as object_name
FROM (SELECT name FROM person UNION ALL SELECT pizza_name FROM menu) AS pv
ORDER BY object_name;