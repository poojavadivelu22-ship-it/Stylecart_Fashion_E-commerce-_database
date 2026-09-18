CREATE TABLE Seller (
    Seller_ID NUMBER PRIMARY KEY,
    Seller_Name VARCHAR2(50) NOT NULL,
    Contact_Number VARCHAR2(15) UNIQUE,
    Email VARCHAR2(100) UNIQUE,
    Address VARCHAR2(100)
);
Table created.
CREATE TABLE Product(
   product_ID NUMBER PRIMARY KEY,
   Product_Name VARCHAR2(100) NOT NULL,
   Price NUMBER(10,2),
   Stock NUMBER,
   Category VARCHAR2(50)
  );
Table created.
  CREATE TABLE Inventory (
    Inventory_ID NUMBER PRIMARY KEY,
    Product_ID NUMBER,
    Seller_ID NUMBER,
    Stock_Quantity NUMBER NOT NULL,
    Stock_Status VARCHAR2(20),
    FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID),
    FOREIGN KEY (Seller_ID) REFERENCES Seller(Seller_ID)
);
Table created.
INSERT INTO Seller
VALUES (101, 'Trendy Fashions', '9876543210',
        'trendy@gmail.com', 'Chennai');
1 row created.
INSERT INTO Seller
VALUES (102, 'Fashion Hub', '9876543211',
        'fashionhub@gmail.com', 'Bangalore');
1 row created.
INSERT INTO Seller
VALUES (103, 'Style World', '9876543212',
        'styleworld@gmail.com', 'Coimbatore');
1 row created.
INSERT INTO Seller
VALUES (104, 'Urban Wear', '9876543213',
        'urbanwear@gmail.com', 'Hyderabad');
1 row created.
INSERT INTO Seller
VALUES (105, 'Classic Styles', '9876543214',
        'classic@gmail.com', 'Mumbai');
1 row created.
COMMIT;
Commit complete

INSERT INTO Inventory
VALUES (1, 1, 101, 50, 'Available');
1 row created.
INSERT INTO Inventory
VALUES (2, 2, 102, 30, 'Available');
1 row created.
INSERT INTO Inventory
VALUES (3, 3, 103, 0, 'Unavailable');
1 row created.
INSERT INTO Inventory
VALUES (4, 4, 104, 25, 'Available');
1 row created.
INSERT INTO Inventory
VALUES (5, 5, 105, 0, 'Unavailable');
1 row created.
COMMIT;
commit complete 

INSERT INTO Product
VALUES (1, 'Cotton T-Shirt', 599.00, 50, 'Men');
1 row created.
INSERT INTO Product
VALUES (2, 'Denim Jeans', 999.00, 30, 'Women');
1 row created.
INSERT INTO Product
VALUES (3, 'Floral Dress', 799.00, 20, 'Women');
1 row created.
INSERT INTO Product
VALUES (4, 'Casual Shirt', 699.00, 25, 'Men');
1 row created.
INSERT INTO Product
VALUES (5, 'Hoodie', 899.00, 40, 'Unisex');
1 row created.
COMMIT;
commit complete

SELECT * FROM Seller;

SELECT * FROM Inventory;

SELECT * FROM Product;

SELECT
    i.Inventory_ID,
    p.Product_Name,
    s.Seller_Name,
    i.Stock_Quantity,
    i.Stock_Status
FROM Inventory i
JOIN Product p
ON i.Product_ID = p.Product_ID
JOIN Seller s
ON i.Seller_ID = s.Seller_ID;

SELECT
    i.Inventory_ID,
    p.Product_Name,
    i.Stock_Quantity,
    i.Stock_Status
FROM Inventory i
JOIN Product p
ON i.Product_ID = p.Product_ID
WHERE i.Stock_Status = 'Available';

SELECT
    i.Inventory_ID,
    p.Product_Name,
    i.Stock_Quantity,
    i.Stock_Status
FROM Inventory i
JOIN Product p
ON i.Product_ID = p.Product_ID
WHERE i.Stock_Status = 'Unavailable';

UPDATE Inventory
SET Stock_Quantity = 20,
    Stock_Status = 'Available'
WHERE Inventory_ID = 3;