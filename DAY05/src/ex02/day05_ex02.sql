CREATE INDEX idx_person_name ON person(upper(name));

EXPLAIN ANALYSE
SELECT name FROM person WHERE upper(name) IS NOT NULL;