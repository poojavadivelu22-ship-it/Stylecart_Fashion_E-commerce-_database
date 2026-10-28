SELECT
    c.Customer_ID,
    c.First_Name,
    o.Order_ID,
    o.Order_Date,
    o.Total_Amount
FROM Customer c
INNER JOIN Orders o
    ON c.Customer_ID = o.Customer_ID
ORDER BY c.Customer_ID;

SELECT
    c.Customer_ID,
    c.First_Name,
    o.Order_ID,
    o.Total_Amount
FROM Customer c
LEFT JOIN Orders o
    ON c.Customer_ID = o.Customer_ID
ORDER BY c.Customer_ID;

SELECT
    c.Customer_ID,
    c.First_Name,
    o.Order_ID,
    o.Total_Amount
FROM Customer c
RIGHT JOIN Orders o
    ON c.Customer_ID = o.Customer_ID
ORDER BY o.Order_ID;

SELECT
    c.Customer_ID,
    c.First_Name,
    c.Last_Name,
    o.Order_ID,
    o.Order_Date,
    pr.Product_Name,
    oi.Quantity,
    oi.Unit_Price,
    oi.Quantity * oi.Unit_Price AS Subtotal,
    o.Total_Amount,
    o.Order_Status,
    p.Payment_Method,
    p.Payment_Status,
    p.Amount_Paid
FROM Customer c
INNER JOIN Orders o
    ON c.Customer_ID = o.Customer_ID
INNER JOIN Order_Item oi
    ON o.Order_ID = oi.Order_ID
INNER JOIN Product pr
    ON oi.Product_ID = pr.Product_ID
LEFT JOIN Payment p
    ON o.Order_ID = p.Order_ID
ORDER BY o.Order_ID;

SELECT
    c.Customer_ID,
    c.First_Name,
    c.Last_Name,
    o.Order_ID,
    o.Order_Date,
    pr.Product_Name,
    oi.Quantity,
    oi.Unit_Price,
    o.Order_Status
FROM Customer c
INNER JOIN Orders o
    ON c.Customer_ID = o.Customer_ID
INNER JOIN Order_Item oi
    ON o.Order_ID = oi.Order_ID
INNER JOIN Product pr
    ON oi.Product_ID = pr.Product_ID
ORDER BY c.Customer_ID, o.Order_Date;

SELECT
    c.First_Name,
    c.Last_Name,
    o.Order_ID,
    o.Order_Date,
    pr.Product_Name,
    oi.Quantity,
    oi.Unit_Price,
    o.Order_Status
FROM Customer c
JOIN Orders o
    ON c.Customer_ID = o.Customer_ID
JOIN Order_Item oi
    ON o.Order_ID = oi.Order_ID
JOIN Product pr
    ON oi.Product_ID = pr.Product_ID
WHERE c.Customer_ID = 1
ORDER BY o.Order_Date;

SELECT
    c.Customer_ID,
    c.First_Name,
    c.Last_Name,
    COUNT(o.Order_ID) AS Total_Orders,
    NVL(SUM(o.Total_Amount), 0) AS Total_Purchase
FROM Customer c
LEFT JOIN Orders o
    ON c.Customer_ID = o.Customer_ID
GROUP BY
    c.Customer_ID,
    c.First_Name,
    c.Last_Name
ORDER BY c.Customer_ID;

SELECT
    p.Product_ID,
    p.Product_Name,
    NVL(SUM(oi.Quantity), 0) AS Quantity_Sold,
    NVL(SUM(oi.Quantity * oi.Unit_Price), 0) AS Total_Sales
FROM Product p
LEFT JOIN Order_Item oi
    ON p.Product_ID = oi.Product_ID
GROUP BY
    p.Product_ID,
    p.Product_Name
ORDER BY Total_Sales DESC;

SELECT
    o.Order_ID,
    c.First_Name,
    o.Total_Amount,
    p.Payment_Method,
    p.Payment_Status,
    p.Amount_Paid
FROM Orders o
JOIN Customer c
    ON o.Customer_ID = c.Customer_ID
LEFT JOIN Payment p
    ON o.Order_ID = p.Order_ID
ORDER BY o.Order_ID;

SELECT
    c.First_Name,
    o.Order_ID,
    p.Product_Name,
    oi.Quantity,
    oi.Quantity * oi.Unit_Price AS Subtotal,
    o.Order_Status,
    pay.Payment_Status
FROM Customer c
JOIN Orders o
    ON c.Customer_ID = o.Customer_ID
JOIN Order_Item oi
    ON o.Order_ID = oi.Order_ID
JOIN Product p
    ON oi.Product_ID = p.Product_ID
LEFT JOIN Payment pay
    ON o.Order_ID = pay.Order_ID
ORDER BY o.Order_ID;

