-- Drops the animals_db if it exists currently --
DROP DATABASE IF EXISTS bamazon;
-- Creates the "animals_db" database --
CREATE DATABASE bamazon;

-- Makes it so all of the following code will affect animals_db --
USE bamazon;

-- Creates the table "people" within animals_db --
CREATE TABLE product (
  item_id int NOT NULL AUTO_INCREMENT,
  product_name varchar(50),
  department_name varchar(50),
  price float,
  stock_quantity int(2),
  PRIMARY KEY (item_id)
);

-- Creates new rows containing data in all named columns --
INSERT INTO product (product_name, department_name, price, stock_quantity)
VALUES ("R/C Plane", "Toys", 50.43, 10);

INSERT INTO product (product_name, department_name, price, stock_quantity)
VALUES ("Monopoly", "Games", 15.99, 23);

INSERT INTO product (product_name, department_name, price, stock_quantity)
VALUES ("Mega Spork", "Kitchen Stuff", 8.23, 28);

INSERT INTO product (product_name, department_name, price, stock_quantity)
VALUES ("Mega Chopsticks", "Kitchen Stuff", 9.03, 30);

INSERT INTO product (product_name, department_name, price, stock_quantity)
VALUES ("Dumb Hat", "Clothing", 12.95, 15);

INSERT INTO product (product_name, department_name, price, stock_quantity)
VALUES ("Cool Hat", "Clothing", 22.00, 20);

INSERT INTO product (product_name, department_name, price, stock_quantity)
VALUES ("Smash-Up", "Games", 49.22, 7);

INSERT INTO product (product_name, department_name, price, stock_quantity)
VALUES ("Refurbished Pants", "Clothing", 5.00, 1);

INSERT INTO product (product_name, department_name, price, stock_quantity)
VALUES ("Smashed Penny", "Misc", .01, 100);

INSERT INTO product (product_name, department_name, price, stock_quantity)
VALUES ("Jar of Hot Air", "Misc", 100.43, 62);

INSERT INTO product (product_name, department_name, price, stock_quantity)
VALUES ("Hat Full of Assholes", "Misc", 22.02, 46);


