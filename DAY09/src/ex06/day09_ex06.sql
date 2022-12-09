CREATE OR REPLACE FUNCTION
    fnc_person_visits_and_eats_on_date(IN pperson varchar default 'Dmitriy', pprice numeric default 500,
    IN pdate date default '2022-01-08')
RETURNS varchar as $$
    DECLARE piz_name varchar;
    BEGIN
SELECT piz.name INTO piz_name
FROM person
JOIN person_visits pv on person.id = pv.person_id
JOIN person_order po on pv.visit_date = po.order_date
JOIN menu m on m.id = po.menu_id
JOIN pizzeria piz on pv.pizzeria_id = piz.id
WHERE person.name = pperson AND m.price < pprice AND pv.visit_date = pdate;
    RETURN piz_name;
    END;
$$ language plpgsql;

select *
from fnc_person_visits_and_eats_on_date(pprice := 800);


select *
from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');
