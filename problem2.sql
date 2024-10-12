-- Problem 2 - Online Store Inventory and Orders System


-- Create Tables

CREATE TABLE customers (
	id SERIAL PRIMARY KEY,
	first_name TEXT,
	last_name TEXT,
	email TEXT
);

CREATE TABLE products (
	id SERIAL PRIMARY KEY,
	product_name TEXT,
	price DECIMAL(10,2),
	stock_quantity INT
);

CREATE TABLE orders (
	id SERIAL PRIMARY KEY,
	customer_id INT REFERENCES customers(id),
	order_date DATE
);

CREATE TABLE order_items (
    order_id INT REFERENCES orders(id),
    product_id INT REFERENCES products(id),
    quantity INT,
    PRIMARY KEY (order_id, product_id)
);


-- Insert Data

INSERT INTO products (product_name, price, stock_quantity)
VALUES
	('Dog bed', 49.99, 10),
	('Kong', 19.99, 15),
	('Collar',12.99, 20),
	('Leash', 15.99, 20),
	('Crate', 59.99, 10);

INSERT INTO customers (first_name, last_name, email)
VALUES
	('Mary','Sue', 'msue@example.com'),
	('Billy','Bob', 'billy@example.com'),
	('Cesar', 'Millan','dogwhisperer@example.com'),
	('Oprah','Winfrey','yougetacar@example.com');

INSERT INTO orders (customer_id, order_date)
VALUES
	(1,'2024-08-16'),
	(2,'2024-09-20'),	
	(3,'2024-09-21'),
	(1,'2024-10-01'),
	(4,'2024-10-10');

INSERT INTO order_items (order_id, product_id, quantity)
VALUES
	(1,1,1),
	(1,2,2),
	(1,5,1),
	(2,3,1),
	(2,4,1),
	(2,1,1),
	(3,3,2),
	(3,4,2),
	(4,3,1),
	(4,4,1),
	(4,2,2),
	(5,3,2),
	(5,4,2);


-- Write SQL queries

-- Retrieve the names and stock quantities of all products
SELECT products.product_name, products.stock_quantity FROM products;

-- Retrieve the product names and quantites for one of the orders placed
SELECT products.product_name, order_items.quantity FROM order_items
JOIN products ON order_items.product_id = products.id
WHERE order_items.order_id = 1;

-- Retrieve all orders placed by a specific customer (includind ID's of what was ordered and quantities)
SELECT orders.customer_id, order_items.order_id, order_items.product_id, order_items.quantity
FROM order_items
JOIN orders ON order_items.order_id = orders.id
JOIN products ON order_items.product_id = products.id
JOIN customers ON orders.customer_id = customers.id
WHERE orders.customer_id = 1;


-- Update data

-- Perform an update to simulate the reducing of stock quantities of items after a customer places an order
-- This update is for order id # 1 (1 dog bed, 2 kongs, 1 crate)
UPDATE products 
SET stock_quantity = stock_quantity - 2
WHERE products.product_name = 'Kong';

UPDATE products 
SET stock_quantity = stock_quantity - 1
WHERE products.product_name = 'dog bed' OR products.product_name = "crate";
