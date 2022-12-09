drop function fnc_persons_female();
drop function fnc_persons_male();

CREATE OR REPLACE FUNCTION fnc_persons(IN pgender varchar default 'female')
RETURNS setof text as $$
SELECT name FROM person WHERE gender = pgender
$$language sql;