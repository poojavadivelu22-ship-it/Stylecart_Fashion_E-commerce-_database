CREATE TABLE Payment (
    Payment_ID NUMBER PRIMARY KEY,
    Order_ID NUMBER NOT NULL,
    Payment_Method VARCHAR2(30) NOT NULL,
    Payment_Date DATE NOT NULL,
    Payment_Status VARCHAR2(20) NOT NULL,
    Amount_Paid NUMBER(10,2) NOT NULL,
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID)
);
Table Created.

INSERT INTO Payment 
(Payment_ID, Order_ID, Payment_Method, Payment_Date, Payment_Status, Amount_Paid) 
VALUES 
(501, 1001, 'UPI', SYSDATE, 'Successful', 2098.00);
1 row created.

INSERT INTO Payment 
(Payment_ID, Order_ID, Payment_Method, Payment_Date, Payment_Status, Amount_Paid) 
VALUES 
(502, 1002, 'Credit Card', SYSDATE, 'Successful', 1599.00);
1 row created.

INSERT INTO Payment 
(Payment_ID, Order_ID, Payment_Method, Payment_Date, Payment_Status, Amount_Paid) 
VALUES 
(503, 1003, 'Debit Card', SYSDATE, 'Failed', 899.00);
1 row created.

COMMIT;
SELECT * FROM Payment;
SELECT * 
FROM Payment 
WHERE Payment_Status = 'Successful';
SELECT * 
FROM Payment 
WHERE Payment_Status = 'Failed';
UPDATE Payment 
SET Payment_Status = 'Successful' 
WHERE Payment_ID = 503;

COMMIT;

SELECT * 
FROM Payment 
WHERE Payment_ID = 503;
SELECT 
    Payment_Method,
    COUNT(*) AS Total_Transactions
FROM Payment
GROUP BY Payment_Method
ORDER BY Total_Transactions DESC;
SELECT 
    Payment_Method,
    SUM(Amount_Paid) AS Total_Amount_Collected
FROM Payment
WHERE Payment_Status = 'Successful'
GROUP BY Payment_Method;
SELECT 
    p.Payment_ID,
    p.Order_ID,
    p.Payment_Method,
    p.Payment_Date,
    p.Payment_Status,
    p.Amount_Paid
FROM Payment p
JOIN Orders o
    ON p.Order_ID = o.Order_ID
ORDER BY p.Payment_Date;
