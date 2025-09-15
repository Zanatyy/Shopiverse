--###############################################################CUSTOMER############################################################
CREATE TABLE dbo.Customer_Errors (
    Error_ID INT IDENTITY(1,1) PRIMARY KEY,
    Cust_ID varchar(50),
    Kids bigint,
    YOB bigint,
    Full_Name VARCHAR(100),
    Segment VARCHAR(50),
    Error_Reason NVARCHAR(255),
    Error_Date DATETIME DEFAULT GETDATE()
);


--###################################ORDER####################################################################################

CREATE TABLE dbo.Orders_Errors (
    Error_ID INT IDENTITY(1,1) PRIMARY KEY,
    Order_ID varchar(50),
    Ship_Date varchar(50),
    Order_Date varchar(50),
    Ship_Mode VARCHAR(50),
    Order_Prio VARCHAR(50),
    Cust_ID varchar(50),
    Address_ID INT,
    Market NVARCHAR(50),
    Error_Reason NVARCHAR(255),
    Error_Date DATETIME DEFAULT GETDATE()
);





--##########################################CATEGORY_ERRORS###########################################################################################


CREATE TABLE dbo.Category_Errors (
    Error_ID INT IDENTITY(1,1) PRIMARY KEY,
    Category_ID INT,
    Category VARCHAR(50),
    Error_Reason NVARCHAR(255),
    Error_Date DATETIME DEFAULT GETDATE()
);



--#############################################SUBCATEGORY_ERRORS###############################################################################

CREATE TABLE dbo.Subcategory_Errors (
    Error_ID INT IDENTITY(1,1) PRIMARY KEY,
    Subcategory_ID INT,
    Subcategory_name VARCHAR(50),
    Category_ID INT,
    Error_Reason NVARCHAR(255),
    Error_Date DATETIME DEFAULT GETDATE()
);



--###############################################ADDRESS_ERRORS###################################################################################

CREATE TABLE dbo.Addr_Errors (
    Error_ID INT IDENTITY(1,1) PRIMARY KEY,
    Add_ID INT,
    Region VARCHAR(100),
    Country VARCHAR(100),
    [State] VARCHAR(100),
    City VARCHAR(100),
    Postal_Code VARCHAR(100),
    Error_Reason NVARCHAR(255),
    Error_Date DATETIME DEFAULT GETDATE()
);



--##############################################ORDER DETAIL ERRORS#############################################################################################
CREATE TABLE dbo.Order_Details_Errors (
    Error_ID INT IDENTITY(1,1) PRIMARY KEY,
    order_detail_id varchar(50),
    Quantity float,
    Profit float,
    Sales float,
    Discount FLOAT,
    Shipping_Cost float,
    order_id varchar(50),
    prod_id varchar(50),
    sellerID INT,
    Error_Reason NVARCHAR(255),
    Error_Date DATETIME DEFAULT GETDATE()
);


--####################################################PRODUCTS ERRORS###################################################################################################

CREATE TABLE dbo.Product_Errors (
    Error_ID INT IDENTITY(1,1) PRIMARY KEY,
    Prod_ID varchar(50),
    Subcategory_ID INT,
    Product_Name VARCHAR(200),
    Error_Reason NVARCHAR(255),
    Error_Date DATETIME DEFAULT GETDATE()
);


--##########################################SELLER ERRORS##############################################################################################################
CREATE TABLE dbo.Seller_Errors (
    Error_ID INT IDENTITY(1,1) PRIMARY KEY,
    SellerID INT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Date_Of_Join datetime,
    Error_Reason NVARCHAR(255),
    Error_Date DATETIME DEFAULT GETDATE()
);
