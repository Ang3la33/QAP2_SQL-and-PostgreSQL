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


