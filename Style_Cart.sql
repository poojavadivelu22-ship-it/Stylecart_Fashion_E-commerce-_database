CREATE TABLE Category (
    Category_ID INT PRIMARY KEY,
    Category_Name VARCHAR(100) NOT NULL UNIQUE,
    Description VARCHAR(200)
);
Table created.

CREATE TABLE Product (
        Product_ID INT PRIMARY KEY,
        Product_Name VARCHAR(100) NOT NULL,
        Category_ID INT,
        Price NUMBER(10,2) NOT NULL,
        Stock_Quantity INT NOT NULL,
        FOREIGN KEY (Category_ID)
        REFERENCES Category(Category_ID)
         );

Table created.

INSERT INTO Category VALUES
(1, 'Men', 'Fashion products for men');
1 row created.
INSERT INTO Category VALUES
(2, 'Women', 'Fashion products for women');
1 row created.
INSERT INTO Category VALUES
(3, 'Kids', 'Fashion products for kids');
1 row created.
INSERT INTO Category VALUES
(4, 'Footwear', 'Shoes and sandals');
1 row created.
INSERT INTO Category VALUES
(5, 'Accessories', 'Fashion accessories');
1 row created.

INSERT INTO Product VALUES
(101, 'Cotton Shirt', 1, 799.00, 25);
1 row created.
INSERT INTO Product VALUES
(102, 'Denim Jeans', 1, 1299.00, 15);
1 row created.
INSERT INTO Product VALUES
(103, 'Floral Kurti', 2, 999.00, 20);
1 row created.
INSERT INTO Product VALUES
(104, 'Kids T-Shirt', 3, 499.00, 30);
1 row created.
INSERT INTO Product VALUES
(105, 'Running Shoes', 4, 1999.00, 10);
1 row created.
INSERT INTO Product VALUES
(106, 'Leather Belt', 5, 599.00, 18);
1 row created.

SELECT * FROM Category;

SELECT * FROM Product;

UPDATE Product
SET Price = 899.00
WHERE Product_ID = 101;
1 row updated.

UPDATE Product
SET Stock_Quantity = 35
WHERE Product_ID = 104;
1 row updated.

DELETE FROM Product
WHERE Product_ID = 106;
1 row deleted.

DELETE FROM Product
WHERE Product_ID = 105;
1 row deleted.

SELECT
    c.Category_Name,
    p.Product_Name,
    p.Price,
    p.Stock_Quantity
FROM Category c
JOIN Product p
ON c.Category_ID = p.Category_ID
ORDER BY c.Category_Name;


SELECT
    p.Product_ID,
    p.Product_Name,
    p.Price,
    p.Stock_Quantity
FROM Product p
JOIN Category c
ON p.Category_ID = c.Category_ID
WHERE c.Category_Name = 'Women';

SELECT
    c.Category_Name,
    COUNT(p.Product_ID) AS Product_Count
FROM Category c
LEFT JOIN Product p
ON c.Category_ID = p.Category_ID
GROUP BY c.Category_Name;