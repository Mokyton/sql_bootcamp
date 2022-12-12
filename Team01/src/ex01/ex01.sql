-- insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
-- insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');

CREATE OR REPLACE FUNCTION t1(cur timestamp, cur_id integer)
RETURNS table (
    rate_to_usd numeric
              )
as
$$
    BEGIN
    RETURN QUERY
        SELECT
           dsd.rate_to_usd
        FROM
         (SELECT * FROM currency WHERE updated <= cur AND currency.id = cur_id) as dsd
    WHERE dsd.updated = (SELECT max(dsd.updated) FROM (SELECT * FROM currency WHERE updated <= cur AND currency.id = cur_id) dsd);
    END;
$$
    LANGUAGE plpgsql;

-- VERSION 1 t2

CREATE OR REPLACE FUNCTION t2(cur timestamp, cur_id integer)
RETURNS table (
    rate_to_usd numeric
              )
as
$$
    BEGIN
    RETURN QUERY
        SELECT
           dsd.rate_to_usd
        FROM
         (SELECT * FROM currency WHERE updated > cur AND currency.id = cur_id) as dsd
    WHERE dsd.updated = (SELECT min(dsd.updated) FROM (SELECT * FROM currency WHERE updated > cur AND currency.id = cur_id) dsd);
    END;
$$
    LANGUAGE plpgsql;

WITH result AS (SELECT coalesce(u.name, 'not defined') name,
       coalesce(u.lastname, 'not defined') lastname,
       c.name currency_name,
       b.money * (CASE WHEN (SELECT count(*) FROM t1(b.updated, b.currency_id)) != 0 then (SELECT * FROM t1(b.updated, b.currency_id))
    else  (SELECT * FROM t2(b.updated, b.currency_id)) END) currency_in_usd

FROM "user" u
FULL JOIN balance b on u.id = b.user_id
JOIN currency c on c.id = b.currency_id
    ORDER BY name DESC, lastname ASC, currency_name ASC
    )
SELECT DISTINCT name,
       lastname,
       currency_name,
       currency_in_usd
FROM result
ORDER BY name DESC, lastname ASC, currency_name ASC;