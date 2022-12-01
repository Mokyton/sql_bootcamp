SELECT menu.id as menu_id
FROM menu
FULL JOIN person_order ON person_order.menu_id = menu.id
WHERE person_id IS NULL
ORDER BY menu_id

