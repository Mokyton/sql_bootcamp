SELECT menu.id as menu_id
FROM menu
EXCEPT (SELECT menu_id FROM person_order)
ORDER BY menu_id

