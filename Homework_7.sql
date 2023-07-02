use tmp2;

-- найдите имя и фамилию пользователей, у которых нет заказов
SELECT 
	c.name, 
    c.lastname
FROM customers c
LEFT JOIN orders o
ON c.id = o.customerid
WHERE o.id IS NULL;

-- найдите название товаров, которые ни разу не заказывали
SELECT 
p.title
FROM products p
LEFT JOIN orders o 
ON p.id = o.productid
WHERE o.id IS NULL;

-- найдите название товаров, которые ни разу не заказывали онлайн
SELECT p.title
FROM products p
WHERE p.id NOT IN (
    SELECT DISTINCT 
		productid
    FROM orders
    WHERE ordertype = 'online'
);

-- найдите имя и фамилию покупателя, который сделал самый дорогой заказ
SELECT 
	c.name, 
    c.lastname
FROM customers c
JOIN orders o 
ON c.id = o.customerid
WHERE o.product_count * (SELECT price FROM products WHERE id = o.productid) = (
    SELECT MAX(o.product_count * (SELECT price FROM products WHERE id = o.productid))
    FROM orders o
);
