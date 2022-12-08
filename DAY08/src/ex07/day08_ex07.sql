-- Session #1
BEGIN TRANSACTION;
-- Session #2
BEGIN TRANSACTION;
-- Session #1
UPDATE pizzeria SET rating = 0.6 WHERE id = 1;
-- Session #2
UPDATE pizzeria SET rating = 0.4 WHERE id = 2;
-- Session #1
UPDATE pizzeria SET rating = 0.8 WHERE id = 2;
-- Session #2
UPDATE pizzeria SET rating = 0.9 WHERE id = 1;
-- Session #1
COMMIT;
-- Session #2
COMMIT;