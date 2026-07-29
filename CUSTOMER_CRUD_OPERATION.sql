CREATE TABLE CUST6 (
    Customer_Id NUMBER PRIMARY KEY,
    First_Name VARCHAR2(50) NOT NULL,
    Last_Name VARCHAR2(50) NOT NULL,
    Email VARCHAR2(100) UNIQUE,
    Phone VARCHAR2(15) UNIQUE,
    Password VARCHAR2(50) NOT NULL,
    Address VARCHAR2(100) NOT NULL,
    City VARCHAR2(50),
    State VARCHAR2(50),
    Pincode NUMBER(6)
);
INSERT INTO CUST6 VALUES
(501, 'Anu', 'R', 'anu@gmail.com', '9876543210', 'Anu@123', 'Anna Nagar', 'Chennai', 'Tamil Nadu', 600040);

INSERT INTO CUST6 VALUES
(502, 'Priya', 'S', 'priya@gmail.com', '9876543211', 'Priya@123', 'RS Puram', 'Coimbatore', 'Tamil Nadu', 641002);

INSERT INTO CUST6 VALUES
(503, 'Divya', 'K', 'divya@gmail.com', '9876543212', 'Divya@123', 'KK Nagar', 'Madurai', 'Tamil Nadu', 625020);

INSERT INTO CUST6 VALUES
(504, 'Keerthana', 'M', 'keerthana@gmail.com', '9876543213', 'Keer@123', 'Hasthampatti', 'Salem', 'Tamil Nadu', 636007);

INSERT INTO CUST6 VALUES
(505, 'Nisha', 'P', 'nisha@gmail.com', '9876543214', 'Nisha@123', 'Cantonment', 'Trichy', 'Tamil Nadu', 620001);

INSERT INTO CUST6 VALUES
(506, 'Kavya', 'R', 'kavya@gmail.com', '9876543215', 'Kavya@123', 'Katpadi', 'Vellore', 'Tamil Nadu', 632007);

INSERT INTO CUST6 VALUES
(507, 'Meena', 'L', 'meena@gmail.com', '9876543216', 'Meena@123', 'Perundurai', 'Erode', 'Tamil Nadu', 638052);

INSERT INTO CUST6 VALUES
(508, 'Harini', 'T', 'harini@gmail.com', '9876543217', 'Harini@123', 'Palayamkottai', 'Tirunelveli', 'Tamil Nadu', 627002);

INSERT INTO CUST6 VALUES
(509, 'Swathi', 'V', 'swathi@gmail.com', '9876543218', 'Swathi@123', 'Medical College Road', 'Thanjavur', 'Tamil Nadu', 613004);

INSERT INTO CUST6 VALUES
(510, 'Anitha', 'B', 'anitha@gmail.com', '9876543219', 'Anitha@123', 'Gandhi Road', 'Kanchipuram', 'Tamil Nadu', 631501);

COMMIT;

SELECT * FROM CUST6;

INSERT INTO CUST6
VALUES (511, 'Rahul', 'K', 'rahul@gmail.com', '9876543220', 'Rahul@123', 'T Nagar', 'Chennai', 'Tamil Nadu', 600017);

COMMIT;

UPDATE CUST6
SET First_Name = 'Sonakshi',
    Email = 'sonakshi@gmail.com'
WHERE Customer_Id = 507;

COMMIT;

DELETE FROM CUST6
WHERE Customer_Id = 511;

COMMIT;

