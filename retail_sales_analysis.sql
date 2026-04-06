CREATE DATABASE retail_db;
USE retail_db;

CREATE TABLE customers (
  customer_id INT PRIMARY KEY,
  customer_name VARCHAR(50),
  city VARCHAR(50)
);

INSERT INTO customers VALUES
(1,'Ravi','Hyderabad'),
(2,'Anita','Chennai'),
(3,'Kiran','Bangalore'),
(4,'Giridhar','Vizag'),
(5,'Ram','Pune'),
(6,'Sushanth','Mumbai');

SELECT * FROM customers;

CREATE TABLE products (
  product_id INT PRIMARY KEY,
  product_name VARCHAR(50),
  category VARCHAR(50),
  price INT
);

INSERT INTO products VALUES
(101,'Laptop','Electronics',60000),
(102,'Phone','Electronics',20000),
(103,'Shoes','Fashion',3000),
(104,'Tv','Electronics',30000),
(105,'Cycle','Vehicle',7500),
(106,'Earbuds','Electronics',5000);

SELECT * FROM products;

DELETE FROM products WHERE product_id in ('1','2','3','4','5','6');

CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  customer_id INT,
  product_id INT,
  quantity INT,
  order_date DATE
);

INSERT INTO orders VALUES
(1,11,101,1,'2024-01-10'),
(2,12,102,2,'2024-02-15'),
(3,13,103,1,'2024-03-05'),
(4,14,104,3,'2024-03-20'),
(5,15,105,4,'2024-04-25'),
(6,16,106,2,'2024-06-28');

SELECT * FROM orders;

SELECT SUM(p.price * o.quantity) AS total_sales
FROM orders o
JOIN products p ON o.product_id = p.product_id;


SELECT p.product_name, SUM(o.quantity) AS total_qty
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_qty DESC;


SELECT 
    c.city ,
    SUM(IFNULL(p.price,0) * IFNULL(o.quantity,0)) AS city_sales
FROM orders o
LEFT JOIN customers c 
    ON o.customer_id = c.customer_id
LEFT JOIN products p 
    ON o.product_id = p.product_id
GROUP BY c.city;

SELECT COUNT(*) FROM orders;
SELECT COUNT(*) FROM customers;
SELECT COUNT(*) FROM products;

SELECT * 
FROM orders o
LEFT JOIN customers c ON o.customer_id = c.customer_id
LEFT JOIN products p ON o.product_id = p.product_id;

