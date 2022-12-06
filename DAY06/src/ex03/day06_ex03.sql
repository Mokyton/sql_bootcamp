CREATE UNIQUE INDEX idx_person_discounts_unique ON person_discounts(person_id, pizzeria_id);
SET enable_bitmapscan  = off;
SET enable_seqscan = off;
EXPLAIN ANALYSE
SELECT person_id, pizzeria_id FROM person_discounts;