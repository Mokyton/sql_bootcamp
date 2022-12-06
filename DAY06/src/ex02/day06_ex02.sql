SELECT person.name,
       m.pizza_name,
       m.price,
       m.price - (m.price / 100 * pd.discount) discount_price,
       p.name pizzeria_name
FROM person
         JOIN person_discounts pd on person.id = pd.person_id
         JOIN menu m on pd.pizzeria_id = m.pizzeria_id
         JOIN pizzeria p on m.pizzeria_id = p.id
ORDER BY person.name, pizza_name;
