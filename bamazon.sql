DROP DATABASE IF EXISTS bamazon;

CREATE DATABASE bamazon;

USE bamazon;

CREATE TABLE products(
  id INT NOT NULL AUTO_INCREMENT,
  product_name VARCHAR(45) NOT NULL,
  department_name VARCHAR(45) NOT NULL,
  price DECIMAL(6,2) DEFAULT 0,
  stock_quantity INT ,
  PRIMARY KEY (id)
); KEY (id)

-- table showing all products
Describe Products;

SELECT * FROM Products;

INSERT INTO Products (product_name, department_name, price, stock_quantity) VALUES ("Elastic_Exercise_Bands", "Sports & Outdoors", 10.95, 876);
INSERT INTO Products (product_name, department_name, price, stock_quantity) VALUES ("Pet_Grooming_Brush", "Pet Supplies", 10.63, 793);
INSERT INTO Products (product_name, department_name, price, stock_quantity) VALUES ("Grill_Mat", "Patio, Lawn & Garden", 19.95, 332);
INSERT INTO Products (product_name, department_name, price, stock_quantity) VALUES ("Vegetable_Spiralizer", "Kitchen & Dining", 29.13, 208);
INSERT INTO Products (product_name, department_name, price, stock_quantity) VALUES ("Pet_Nail_Clippers", "Pet Supplies", 12.99, 373);
INSERT INTO Products (product_name, department_name, price, stock_quantity) VALUES ("Yoga_Mat", "Sports & Outdoors", 11.85, 364);
INSERT INTO Products (product_name, department_name, price, stock_quantity) VALUES ("Bento_Boxes", "Kitchen & Dining", 18.70, 222);
INSERT INTO Products (product_name, department_name, price, stock_quantity) VALUES ("Stainless_Steel_Straw", "Kitchen & Dining", 8.99, 459);
INSERT INTO Products (product_name, department_name, price, stock_quantity) VALUES ("Stainless_Steel_Tumblers", "Kitchen & Dining", 14.86, 232);
INSERT INTO Products (product_name, department_name, price, stock_quantity) VALUES ("Muscle_Roller", "Health & Household", 12.99, 263);
INSERT INTO Products (product_name, department_name, price, stock_quantity) VALUES ("Silicone_BBQ_Gloves", "Patio, Lawn & Garden", 16.95, 1);
INSERT INTO Products (product_name, department_name, price, stock_quantity) VALUES ("Marshmallow_Roasting_Sticks", "Patio, Lawn & Garden", 13.79, 2);

SELECT * FROM Products;