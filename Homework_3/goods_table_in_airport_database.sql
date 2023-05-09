CREATE TABLE goods (
id SERIAL PRIMARY KEY,
title VARCHAR(255),
quantity INTEGER,
price INTEGER DEFAULT 0
);

INSERT INTO goods (title, quantity) VALUES
('Item_1', 10),
('Item_2', 20),
('Item_3', 15),
('Item_4', 5);

SELECT * FROM goods;

UPDATE goods
SET price = 25
WHERE id = 3;

DELETE FROM goods WHERE id = 1;

INSERT INTO goods VALUES (5, 'Item_5', 50, 175);
				
DROP TABLE goods;

CREATE TABLE new_goods AS
SELECT id, title, quantity FROM goods WHERE price > 0;