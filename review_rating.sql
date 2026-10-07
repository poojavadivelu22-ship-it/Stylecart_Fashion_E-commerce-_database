CREATE TABLE Review (
    Review_ID NUMBER PRIMARY KEY,
    Customer_ID NUMBER NOT NULL,
    Product_ID NUMBER NOT NULL,
    Rating NUMBER(1) NOT NULL,
    Review_Comment VARCHAR2(500) NOT NULL,
    Review_Date DATE NOT NULL,
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
    FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID)
);             
Table Created.
CREATE TABLE Rating (
    Rating_ID NUMBER PRIMARY KEY,
    Review_ID NUMBER NOT NULL,
    Product_ID NUMBER NOT NULL,
    Rating_Value NUMBER(1) NOT NULL,
    FOREIGN KEY (Review_ID) REFERENCES Review(Review_ID),
    FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID)
);      
Table Created.
INSERT INTO Review
(Review_ID, Customer_ID, Product_ID, Rating, Review_Comment, Review_Date)
VALUES
(601, 1, 1, 5, 'Good quality product', SYSDATE);

INSERT INTO Review
(Review_ID, Customer_ID, Product_ID, Rating, Review_Comment, Review_Date)
VALUES
(602, 2, 2, 4, 'Very comfortable and stylish', SYSDATE);

INSERT INTO Review
(Review_ID, Customer_ID, Product_ID, Rating, Review_Comment, Review_Date)
VALUES
(603, 3, 3, 5, 'Nice product and good quality', SYSDATE);

INSERT INTO Review
(Review_ID, Customer_ID, Product_ID, Rating, Review_Comment, Review_Date)
VALUES
(604, 1, 4, 3, 'Average quality', SYSDATE);

INSERT INTO Review
(Review_ID, Customer_ID, Product_ID, Rating, Review_Comment, Review_Date)
VALUES
(605, 4, 1, 4, 'Good product for the price', SYSDATE);

COMMIT;
SELECT * FROM Review;
INSERT INTO Rating
(Rating_ID, Review_ID, Product_ID, Rating_Value)
VALUES (701, 601, 1, 5);

INSERT INTO Rating
(Rating_ID, Review_ID, Product_ID, Rating_Value)
VALUES (702, 602, 2, 4);

INSERT INTO Rating
(Rating_ID, Review_ID, Product_ID, Rating_Value)
VALUES (703, 603, 3, 5);

INSERT INTO Rating
(Rating_ID, Review_ID, Product_ID, Rating_Value)
VALUES (704, 604, 4, 3);

INSERT INTO Rating
(Rating_ID, Review_ID, Product_ID, Rating_Value)
VALUES (705, 605, 1, 4);

COMMIT;
SELECT * FROM Rating;
SELECT
    r.Review_ID,
    r.Customer_ID,
    r.Product_ID,
    p.Product_Name,
    r.Rating,
    r.Review_Comment,
    r.Review_Date
FROM Review r
JOIN Product p
ON r.Product_ID = p.Product_ID
ORDER BY r.Product_ID;      
SELECT
    p.Product_ID,
    p.Product_Name,
    COUNT(r.Review_ID) AS Total_Reviews,
    ROUND(AVG(r.Rating), 2) AS Average_Rating
FROM Product p
JOIN Review r
ON p.Product_ID = r.Product_ID
GROUP BY p.Product_ID, p.Product_Name
ORDER BY Average_Rating DESC;   
    p.Product_ID,
    p.Product_Name,
    ROUND(AVG(r.Rating), 2) AS Average_Rating
FROM Product p
JOIN Review r
ON p.Product_ID = r.Product_ID
GROUP BY p.Product_ID, p.Product_Name
HAVING AVG(r.Rating) >= 4
ORDER BY Average_Rating DESC;       
SELECT
    p.Product_ID,
    p.Product_Name,
    COUNT(r.Review_ID) AS Total_Reviews,
    ROUND(AVG(r.Rating), 2) AS Average_Rating,
    MAX(r.Rating) AS Highest_Rating,
    MIN(r.Rating) AS Lowest_Rating
FROM Product p
JOIN Review r
ON p.Product_ID = r.Product_ID
GROUP BY p.Product_ID, p.Product_Name
ORDER BY Average_Rating DESC;           
