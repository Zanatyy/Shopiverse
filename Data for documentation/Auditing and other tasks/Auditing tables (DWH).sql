
CREATE TABLE [dbo].[Audit_Dim_Address] (
    Audit_ID INT IDENTITY(1,1) PRIMARY KEY,
    Audit_Action VARCHAR(10),        -- INSERT, UPDATE, DELETE
    Audit_Timestamp DATETIME DEFAULT GETDATE(),
    User_Name NVARCHAR(100) DEFAULT SYSTEM_USER,

    SK_Add_id INT,
    BK_Add_ID INT,
    Region VARCHAR(100),
    Country VARCHAR(100),
    State VARCHAR(100),
    City VARCHAR(100),
    Postal_code VARCHAR(100)
)

CREATE TABLE [dbo].[Dim_Customer_Audit] (
    Audit_ID       INT IDENTITY(1,1) PRIMARY KEY,
    Cust_SK        INT,
    Cust_ID_BK     VARCHAR(50),
    Full_name      VARCHAR(100),
    Kids           TINYINT,
    YOB            INT,
    Segment        VARCHAR(50),
    Sales          FLOAT,
    Operation_Type VARCHAR(10),
    Change_Date    DATETIME DEFAULT GETDATE(),
    Changed_By     VARCHAR(100),
    Old_Full_name  VARCHAR(100),
    Old_Kids       TINYINT,
    Old_YOB        INT,
    Old_Segment    VARCHAR(50),
    Old_Sales      FLOAT)


CREATE TABLE [dbo].[Dim_Date_Audit] (
    Audit_ID       INT IDENTITY(1,1) PRIMARY KEY,
    Sk_date        INT,
    Day            INT,
    Month          INT,
    Year           INT,
    Operation_Type VARCHAR(10),
    Change_Date    DATETIME DEFAULT GETDATE(),
    Changed_By     VARCHAR(100),
    Old_Day        INT,
    Old_Month      INT,
    Old_Year       INT)


CREATE TABLE [dbo].[Dim_Product_Audit] (
    Audit_ID           INT IDENTITY(1,1) PRIMARY KEY,
    Sk_prod_id         INT,
    Bk_prod_id         VARCHAR(50),
    Subcategory_name   VARCHAR(50),
    Category           VARCHAR(50),
    Product_name       VARCHAR(200),
    Operation_Type     VARCHAR(10),
    Change_Date        DATETIME DEFAULT GETDATE(),
    Changed_By         VARCHAR(100),
    Old_Subcategory_name VARCHAR(50),
    Old_Category         VARCHAR(50),
    Old_Product_name     VARCHAR(200))


CREATE TABLE [dbo].[Dim_Seller_Audit] (
    Audit_ID        INT IDENTITY(1,1) PRIMARY KEY,
    Sk_seller       INT,
    Bk_seller_id    INT,
    FirstName       VARCHAR(50),
    LastName        VARCHAR(50),
    Dateofjoin      DATETIME,
    Total_sales     FLOAT,
    Operation_Type  VARCHAR(10),
    Change_Date     DATETIME DEFAULT GETDATE(),
    Changed_By      VARCHAR(100),
    Old_FirstName   VARCHAR(50),
    Old_LastName    VARCHAR(50),
    Old_Dateofjoin  DATETIME,
    Old_Total_sales FLOAT)


CREATE TABLE [dbo].[Dim_datee_Audit] (
    Audit_ID       INT IDENTITY(1,1) PRIMARY KEY,
    Sk_date        INT,
    Day            INT,
    Month          INT,
    Year           INT,
    Operation_Type VARCHAR(10),
    Change_Date    DATETIME DEFAULT GETDATE(),
    Changed_By     VARCHAR(100),
    Old_Day        INT,
    Old_Month      INT,
    Old_Year       INT)


CREATE TABLE [dbo].[fact_table_Audit] (
    Audit_ID             INT IDENTITY(1,1) PRIMARY KEY,
    Fact_sk              INT,
    Order_detail_Bk      VARCHAR(50),
    Order_iD_BK          VARCHAR(50),
    Cust_SK              INT,
    Sk_Add_id            INT,
    Sk_prod_id           INT,
    Sk_seller            INT,
    Order_detail_id_fk   INT,
    Ship_date_id_fk      INT,
    Ship_mode            VARCHAR(50),
    Order_prio           VARCHAR(50),
    Market               VARCHAR(50),
    Discount             FLOAT,
    Profit               FLOAT,
    Shipping_cost        FLOAT,
    Quantity             FLOAT,
    Sales                FLOAT,
    Operation_Type       VARCHAR(10),
    Change_Date          DATETIME DEFAULT GETDATE(),
    Changed_By           VARCHAR(100),
    Old_Ship_mode        VARCHAR(50),
    Old_Order_prio       VARCHAR(50),
    Old_Market           VARCHAR(50),
    Old_Discount         FLOAT,
    Old_Profit           FLOAT,
    Old_Shipping_cost    FLOAT,
    Old_Quantity         FLOAT,
    Old_Sales            FLOAT) 