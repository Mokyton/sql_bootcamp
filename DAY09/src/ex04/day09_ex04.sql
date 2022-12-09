CREATE OR REPLACE FUNCTION fnc_persons_female()
RETURNS setof text as $$
SELECT name FROM person WHERE gender = 'female'
$$language sql;

CREATE OR REPLACE FUNCTION fnc_persons_male()
RETURNS setof text as $$
SELECT name FROM person WHERE gender = 'male'
$$language sql;
