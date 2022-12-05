CREATE TABLE IF NOT EXISTS cities
(
    point1 VARCHAR(10) NOT NULL,
    point2 VARCHAR(10) NOT NULL,
    cost   INT4        NOT NULL
);

INSERT INTO cities (point1, point2, cost)
VALUES ('a', 'b', 10),
       ('a', 'c', 15),
       ('a', 'd', 20),
       ('b', 'a', 10),
       ('b', 'd', 25),
       ('b', 'c', 35),
       ('c', 'b', 35),
       ('c', 'a', 15),
       ('c', 'd', 30),
       ('d', 'a', 20),
       ('d', 'b', 25),
       ('d', 'c', 30);
