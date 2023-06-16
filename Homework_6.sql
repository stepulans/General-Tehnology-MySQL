
CREATE TABLE customers (
    id INT PRIMARY KEY AUTO_INCREMENT, 
    name VARCHAR(20),
    lastname VARCHAR(20),
    gender char(1) check(gender in ('f', 'm')),
    age integer
);

CREATE TABLE orders (
    id INT PRIMARY KEY AUTO_INCREMENT, 
    customerid integer,
    productid integer,
    ordertype varchar(128),
    product_count integer
);


CREATE TABLE products (
    id INT PRIMARY KEY AUTO_INCREMENT, 
    title varchar(128),
    price numeric(8, 2)
);


INSERT INTO orders (customerid, productid, ordertype, product_count) VALUES (1, 3, 'online', 3);
INSERT INTO orders (customerid, productid, ordertype, product_count) VALUES (1, 2, 'online', 5);
INSERT INTO orders (customerid, productid, ordertype, product_count) VALUES (3, 1, 'direct', 2);
INSERT INTO orders (customerid, productid, ordertype, product_count) VALUES (3, 4, 'direct', 6);
INSERT INTO orders (customerid, productid, ordertype, product_count) VALUES (3, 3, 'direct', 3);
INSERT INTO orders (customerid, productid, ordertype, product_count) VALUES (1, 3, 'online', 4);
INSERT INTO orders (customerid, productid, ordertype, product_count) VALUES (5, 7, 'online', 2);
INSERT INTO orders (customerid, productid, ordertype, product_count) VALUES (5, 9, 'online', 7);
INSERT INTO orders (customerid, productid, ordertype, product_count) VALUES (6, 5, 'direct', 4);


INSERT INTO customers (name, lastname, age, gender) VALUES ('Гайк', 'Инанц', 29, 'm');
INSERT INTO customers (name, lastname, age, gender) VALUES ('Максим', 'Грибов', 32, 'm');
INSERT INTO customers (name, lastname, age, gender) VALUES ('Антон', 'Куликов', 27, 'm');
INSERT INTO customers (name, lastname, age, gender) VALUES ('Юрий', 'Митрофанов', 30, 'm');
INSERT INTO customers (name, lastname, age, gender) VALUES ('Нелли', 'Ефремян', 25, 'f');
INSERT INTO customers (name, lastname, age, gender) VALUES ('Ольга', 'Степанова', 35, 'f');


INSERT INTO products (title, price) VALUES ('молоко', 70);
INSERT INTO products (title, price) VALUES ('колбаса', 230);
INSERT INTO products (title, price) VALUES ('хлопья', 150);
INSERT INTO products (title, price) VALUES ('хлеб', 30);
INSERT INTO products (title, price) VALUES ('масло', 120);
INSERT INTO products (title, price) VALUES ('чипсики', 60);
INSERT INTO products (title, price) VALUES ('шоколад', 70);
INSERT INTO products (title, price) VALUES ('кетчуп', 150);
INSERT INTO products (title, price) VALUES ('яблоко', 70);

-- 1) вывести название продукта, который чаще всего встречается в заказах
SELECT p.title
FROM products p
JOIN orders o ON o.productid = p.id
GROUP BY o.productid
ORDER BY COUNT(*) DESC
LIMIT 1;

-- 2) вывести название продукта, который покупают чаще всего (нужно посчетать общее количество купленных единиц)
SELECT p.title
FROM products p
JOIN orders o ON o.productid = p.id
GROUP BY o.productid
ORDER BY SUM(o.product_count) DESC
LIMIT 1;

-- 3) вывести общую выручку магазина. Сумма всех купленных единиц товара.
SELECT SUM(p.price * o.product_count) AS total_revenue
FROM products p
JOIN orders o ON o.productid = p.id;

-- 4) определить сумму выручки за онлайн продажи (online) и за продажи в магазине (direct)
SELECT
    ordertype,
    SUM(p.price * o.product_count) AS revenue
FROM
    orders o
JOIN
    products p ON o.productid = p.id
GROUP BY
    ordertype;
