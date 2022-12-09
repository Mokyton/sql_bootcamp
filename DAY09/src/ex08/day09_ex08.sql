CREATE FUNCTION fnc_fibonacci(IN pstop int default 10)
    RETURNS SETOF int AS
$$
BEGIN
    return query (WITH RECURSIVE fib(Num, Prev) as (
        SELECT 0, 1
        UNION ALL
        SELECT fib.Num + fib.Prev, fib.Num
        FROM fib
        WHERE fib.Num < pstop - fib.Prev
    )
    SELECT Num
    FROM fib);
END
$$ LANGUAGE plpgsql;
