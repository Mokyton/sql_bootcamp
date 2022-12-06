ALTER TABLE person_discounts
ADD constraint ch_nn_person_id CHECK ( person_id IS NOT NULL),
ADD constraint ch_nn_pizzeria_id CHECK ( pizzeria_id IS NOT NULL),
ADD constraint ch_nn_discount CHECK ( discount IS NOT NULL),
ALTER discount
set default 0,
ADD constraint ch_range_discount CHECK ( discount BETWEEN 0 AND 100);