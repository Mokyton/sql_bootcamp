with summa as (
    select sum(money) por, type, user_id, currency_id
    from balance
    group by type, user_id, currency_id
), last as (
    SELECT *
 FROM (
   SELECT
        cb.*,
        row_number() OVER (PARTITION BY id ORDER BY  updated DESC) r
      FROM currency cb
    ) t
  WHERE r = 1
), tmp as (
SELECT DISTINCT (case
    when u.name IS NULL then 'not defined'
    else u.name
    end) name,
       (case
    when u.lastname IS NULL then 'not defined'
    else u.lastname
    end) lastname,
       b.type, b.por as volume,
       (case
    when c.name  IS NULL then 'not defined'
    else c.name
    end) as currency_name,
       (case
    when l.rate_to_usd  IS NULL then 1
    else  l.rate_to_usd
           end) last_rate_to_usd

FROM "user" u
FULL JOIN summa b on b.user_id = u.id
FULL JOIN currency c on b.currency_id = c.id
FULL JOIN last l on l.id = b.currency_id)

SELECT name, lastname, type, volume, currency_name, last_rate_to_usd, volume * last_rate_to_usd as total_volume_in_usd
FROM tmp
ORDER BY name DESC , lastname ASC, type ASC;