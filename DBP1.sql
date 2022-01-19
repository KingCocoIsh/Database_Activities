CREATE DATABASE dbe_1;
USE dbe_1;
# Create the tables.
CREATE TABLE users (
user_id INT AUTO_INCREMENT,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
age INT NOT NULL,
email VARCHAR(50) NOT NULL,
PRIMARY KEY (user_id)
);

CREATE TABLE products (
product_id INT AUTO_INCREMENT,
product_name VARCHAR(50) NOT NULL,
product_description VARCHAR(50) NOT NULL,
price DECIMAL(6,2) NOT NULL,
stock_level INT NOT NULL,
PRIMARY KEY (product_id)
);

CREATE TABLE orders (
order_id INT AUTO_INCREMENT,
order_date DATE NOT NULL,
fk_product_id INT NOT NULL,
fk_user_id INT NOT NULL,
PRIMARY KEY (order_id),
FOREIGN KEY (fk_user_id) REFERENCES users(user_id),
FOREIGN KEY (fk_product_id) REFERENCES products(product_id)
);

CREATE TABLE orderline (
orderline_id INT AUTO_INCREMENT,
fk_product_id1 INT NOT NULL,
fk_order_id INT NOT NULL,
PRIMARY KEY (orderline_id),
FOREIGN KEY (fk_order_id) REFERENCES orders(order_id),
FOREIGN KEY (fk_product_id1) REFERENCES products(product_id)
);
SHOW TABLES;

# Insert at least five records per table.
INSERT INTO users (first_name, last_name, age, email)
VALUES ('Jack', 'Hammer', 27, 'J.hammer@gmail.com'), 
('Baki', 'Hanma', 20, 'B.hanma@gmail.com'), 
('King', 'James', 36, 'K.james@gmail.com'),
('Arthur', 'Dragon', 76, 'A.dragon@gmail.com'),
('Lighting', 'Mcqueen', 25, 'L.mcqueen@gmail.com');
SELECT * FROM users;

INSERT INTO products (product_name, product_description, price, stock_level)
VALUES ('Boxing Gloves', 'Sports', '50.00', 2),
('Trainers', 'Sports', '75.00', 1),
('Basketball', 'Sports', '45.00', 5),
('Jukebox', 'Music', '23.00', 1),
('Tyres', 'Sports', '50.00', 2);
SELECT * FROM products;

INSERT INTO orders (order_date, fk_product_id, fk_user_id)
VALUES ('2008-11-11', 1, 1),
('2008-11-09', 2, 2),
('2008-11-29', 3, 3),
('2008-11-19', 4, 4),
('2008-11-23', 5, 5);
SELECT * FROM orders;

INSERT INTO orderline (fk_product_id1, fk_order_id)
VALUES (1, 1), (2, 2), (3, 3), (4, 4), (5, 5);
SELECT * FROM orderline;

# Then update at least two records per table.
UPDATE users
SET age=32, email='J.hammer1@gmail.com'
WHERE user_id=1;
SELECT * FROM users;
UPDATE users
SET age=22, last_name='McQueen'
WHERE user_id = 5;
SELECT * FROM users;

UPDATE products
SET product_name = 'Chicken Nuggets' , product_description='Food'
WHERE product_id = 3;
SELECT * FROM products;

UPDATE orders
SET order_date='2021-11-11', fk_product_id=2
WHERE order_id = 1;
SELECT * FROM orders;

UPDATE orders
SET order_date='2021-11-09', fk_product_id=1
WHERE order_id = 2;
SELECT * FROM orders;

UPDATE orderline
SET fk_product_id1=2, fk_order_id=1
WHERE orderline_id = 1;
SELECT * FROM orderline;

UPDATE orderline
SET fk_product_id1=1, fk_order_id=1
WHERE orderline_id = 1;
SELECT * FROM orderline;
# Query your database (at least 10 different queries).

#1
SELECT first_name, last_name, email FROM users;
#2
SELECT * FROM products WHERE price > 40;
#3
SELECT * FROM Orders WHERE order_date BETWEEN '2020-01-01' AND '2022-01-01';
#4
SELECT product_name, stock_level, price, stock_level*price AS total_cost FROM products;
#5
SELECT * FROM orders ORDER BY order_date DESC LIMIT 3;
#6
SELECT MAX(price) FROM products;
SELECT MIN(price) FROM products;
#7
SELECT user_id, first_name, last_name
FROM users
WHERE user_id=(
    SELECT user_id
    FROM orders
    WHERE order_id=1
);
#8
SELECT * FROM users u JOIN orders o ON u.user_id=o.fk_user_id
JOIN products p ON p.product_id=o.fk_product_id;
#9
SELECT product_name FROM products p JOIN orderline ol ON p.product_id=ol.fk_product_id1 WHERE orderline_id = 1;
#10
SELECT order_date FROM orders o JOIN orderline ol ON o.order_id=ol.fk_order_id WHERE orderline_id = 1;

# Delete one record per table. Make sure you don't delete all of them by accident!
SET FOREIGN_KEY_CHECKS=0;
DELETE FROM orders WHERE order_id = 5;
SELECT * FROM orders;

DELETE FROM users WHERE user_id = 5;
SELECT * FROM users;

DELETE FROM products WHERE product_id = 5;
SELECT * FROM products;

DELETE FROM orderline WHERE orderline_id = 5;
SELECT * FROM orderline;

# Try to add one more table to your diagram and then to your database. It should be called 'Reviews'

CREATE TABLE reviews (
review_id INT AUTO_INCREMENT,
fk_product_id2 INT NOT NULL,
fk_user_id2 INT NOT NULL,
fk_order_id2 INT NOT NULL,
PRIMARY KEY (review_id),
FOREIGN KEY (fk_user_id2) REFERENCES users(user_id),
FOREIGN KEY (fk_product_id2) REFERENCES products(product_id),
FOREIGN KEY (fk_order_id2) REFERENCES orders(order_id)
);

SELECT * FROM reviews;
INSERT INTO reviews (fk_user_id2, fk_product_id2, fk_order_id2)
VALUES (1, 1, 1), (2, 2, 2), (3, 3, 3), (4, 4, 4), (5, 5, 5);
SELECT * FROM reviews;



 













