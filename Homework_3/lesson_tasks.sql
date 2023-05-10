-- 1.
 CREATE TABLE goods(
id SERIAL PRIMARY KEY,
title VARCHAR(255),
quantity INTEGER CHECK (quantity BETWEEN 0 AND 100)
);
-- 2
INSERT INTO goods (title, quantity) VALUES
("Велосипед", 4),
("Лыжи", 5),
("Коньки", 7),
("Скейт", 2);
-- 3
ALTER TABLE goods
ADD COLUMN price INTEGER DEFAULT 0;
-- 4
SELECT * FROM goods;
-- 5
UPDATE goods
SET price = NULL;

ALTER TABLE goods
MODIFY COLUMN price NUMERIC;
-- 6
ALTER TABLE goods
MODIFY COLUMN price INTEGER;
-- 7
ALTER TABLE goods
RENAME COLUMN price TO item_price;
-- 8
ALTER TABLE goods
DROP COLUMN item_price;
-- ------------------------------------------------------------------------------------------------------ 
-- 1
CREATE TABLE students(
name VARCHAR (255) NOT NULL,
lastname VARCHAR (255) NOT NULL,
avg_mark NUMERIC(3,2) CHECK(avg_mark >= 0 AND avg_mark <= 5),
gender VARCHAR(128) CHECK(gender = 'M' OR gender = 'F')
);
-- 2
INSERT INTO students (name, lastname, avg_mark, gender) VALUES
('Олег', 'Петров', 4.3, 'M'),
('Семен', 'Степанов', 3.1, 'M'), 
('Ольга', 'Семенова', 4.7, 'F'), 
('Игорь', 'Романов', 3.1, 'M'), 
('Ирина', 'Иванова', 2.2, 'F');
-- 3
ALTER TABLE students
ADD id INTEGER PRIMARY KEY AUTO_INCREMENT;
-- 4
ALTER TABLE students
MODIFY COLUMN gender VARCHAR(1);
-- 5
ALTER TABLE students
RENAME COLUMN name TO firstname;
-- 6
SELECT
	*
FROM students
WHERE avg_mark > 4;

SELECT
	*
FROM students
WHERE avg_mark < 3 OR avg_mark > 4;

SELECT 
	*
FROM students
WHERE firstname LIKE 'И%';

SELECT
	*
FROM students
WHERE avg_mark IN (2.2, 3.1, 4.7)
-- 7
CREATE VIEW v_students_m AS
SELECT
	*
FROM students
WHERE gender = 'M';
-- 8
CREATE VIEW v_students_f AS
SELECT
	*
FROM students
WHERE gender = 'F';
-- 9
ALTER TABLE students MODIFY COLUMN avg_mark INTEGER;
ALTER TABLE students
DROP CONSTRAINT students_chk_1;

UPDATE students
SET avg_mark = avg_mark * 10;
-- 10
UPDATE students
SET lastname = 'Сидоров'
WHERE firstname = 'Олег' AND lastname = 'Петров';

-- 11
UPDATE students
SET avg_mark = avg_mark + 10
WHERE avg_mark <= 31;

SELECT * FROM students;
