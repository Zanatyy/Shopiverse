select*from [Addr]

CREATE TABLE [dbo].[Addr_Audit] (
    AuditID INT IDENTITY(1,1) PRIMARY KEY,
    Add_id INT,
    Region VARCHAR(100),
    Country VARCHAR(100),
    State VARCHAR(100),
    City VARCHAR(100),
    Postal_code VARCHAR(100),
    ActionType VARCHAR(10),
    ActionDate DATETIME DEFAULT GETDATE(),
    ActionBy NVARCHAR(100)
)


select *  from [Category]


CREATE TABLE [dbo].[Category_Audit] (
    AuditID INT IDENTITY(1,1) PRIMARY KEY,
    Category_ID INT,
    Category VARCHAR(50),
    ActionType VARCHAR(10),
    ActionDate DATETIME DEFAULT GETDATE(),
    ActionBy NVARCHAR(100)
)


CREATE TABLE [dbo].[Customer_Audit] (
    AuditID INT IDENTITY(1,1) PRIMARY KEY,
    Cust_ID VARCHAR(50),
    Kids BIGINT,
    YOB BIGINT,
    Full_name VARCHAR(100),
    Segment VARCHAR(50),
    ActionType VARCHAR(10),
    ActionDate DATETIME DEFAULT GETDATE(),
    ActionBy NVARCHAR(100)
)

select * from [Order_Details]



CREATE TABLE [dbo].[Order_Details_Audit] (
    AuditID INT IDENTITY(1,1) PRIMARY KEY,
    Order_detail_id VARCHAR(50),
    Order_id VARCHAR(50),
    Discount FLOAT,
    Profit FLOAT,
    Shipping_cost FLOAT,
    SellerID INT,
    Prod_ID VARCHAR(50),
    Quantity FLOAT,
    Sales FLOAT,
    ActionType VARCHAR(10),
    ActionDate DATETIME DEFAULT GETDATE(),
    ActionBy NVARCHAR(100)
)

select * from [Orders]


CREATE TABLE [dbo].[Orders_Audit] (
    AuditID INT IDENTITY(1,1) PRIMARY KEY,
    Order_id VARCHAR(50),
    Ship_date VARCHAR(50),
    Order_Date VARCHAR(50),
    Ship_mode VARCHAR(50),
    Order_prio VARCHAR(50),
    Cust_ID VARCHAR(50),
    Address_ID INT,
    Market VARCHAR(50),
    ActionType VARCHAR(10),
    ActionDate DATETIME DEFAULT GETDATE(),
    ActionBy NVARCHAR(100)
)

select * from [Product]


CREATE TABLE [dbo].[Product_Audit] (
    AuditID INT IDENTITY(1,1) PRIMARY KEY,
    Subcategory_ID INT,
    Product_name VARCHAR(200),
    Prod_ID VARCHAR(50),
    ActionType VARCHAR(10),
    ActionDate DATETIME DEFAULT GETDATE(),
    ActionBy NVARCHAR(100)
)

CREATE TABLE [dbo].[Seller_Audit] (
    AuditID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    SellerID INT,
    Date_of_join DATETIME,
    ActionType VARCHAR(10),
    ActionDate DATETIME DEFAULT GETDATE(),
    ActionBy NVARCHAR(100)
)

CREATE TABLE [dbo].[Seller_Product_Audit] (
    AuditID INT IDENTITY(1,1) PRIMARY KEY,
    Prod_ID VARCHAR(50),
    SellerID INT,
    ActionType VARCHAR(10),
    ActionDate DATETIME DEFAULT GETDATE(),
    ActionBy NVARCHAR(100)
)


CREATE TABLE [dbo].[Subcategory_Audit] (
    AuditID INT IDENTITY(1,1) PRIMARY KEY,
    Subcategory_name VARCHAR(50),
    Subcategory_ID INT,
    Category_ID INT,
    ActionType VARCHAR(10),
    ActionDate DATETIME DEFAULT GETDATE(),
    ActionBy NVARCHAR(100)
)  