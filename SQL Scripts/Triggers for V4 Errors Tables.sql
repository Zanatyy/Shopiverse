
CREATE TRIGGER trg_Customer_Validation
ON dbo.Customer
INSTEAD OF INSERT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO dbo.Customer_Errors (Cust_ID, Kids, YOB, Full_Name, Segment, Error_Reason)
    SELECT 
        i.Cust_ID, i.Kids, i.YOB, i.Full_Name, i.Segment,
        CASE 
            WHEN i.Kids < 0 THEN 'Kids cannot be negative'
            WHEN i.YOB < 1900 THEN 'Invalid Year of Birth'
            ELSE 'Unknown validation error'
        END
    FROM inserted i
    WHERE i.Kids < 0 OR i.YOB < 1900;

    INSERT INTO dbo.Customer (Cust_ID, Kids, YOB, Full_Name, Segment)
    SELECT i.Cust_ID, i.Kids, i.YOB, i.Full_Name, i.Segment
    FROM inserted i
    WHERE i.Kids >= 0 AND i.YOB >= 1900;
END;

--########################################################################################################################


CREATE TRIGGER trg_Orders_Validation
ON dbo.Orders
INSTEAD OF INSERT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO dbo.Orders_Errors (Order_ID, Ship_Date, Order_Date, Ship_Mode, Order_Prio, Cust_ID, Address_ID, Market, Error_Reason)
    SELECT 
        i.Order_ID, i.Ship_Date, i.Order_Date, i.Ship_Mode, i.Order_Prio, i.Cust_ID, i.Address_ID, i.Market,
        CASE 
            WHEN i.Ship_Date < i.Order_Date THEN 'Ship date before order date'
            ELSE 'Unknown validation error'
        END
    FROM inserted i
    WHERE i.Ship_Date < i.Order_Date;

    INSERT INTO dbo.Orders (Order_ID, Ship_Date, Order_Date, Ship_Mode, Order_Prio, Cust_ID, Address_ID, Market)
    SELECT i.Order_ID, i.Ship_Date, i.Order_Date, i.Ship_Mode, i.Order_Prio, i.Cust_ID, i.Address_ID, i.Market
    FROM inserted i
    WHERE i.Ship_Date >= i.Order_Date;
END;


--##############################################################################################################################################


CREATE TRIGGER trg_Category_Validation
ON dbo.Category
INSTEAD OF INSERT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO dbo.Category_Errors (Category_ID, Category, Error_Reason)
    SELECT 
        i.Category_ID, i.Category,
        CASE 
            WHEN i.Category_ID <= 0 THEN 'Invalid Category_ID'
            WHEN i.Category IS NULL OR LTRIM(RTRIM(i.Category)) = '' THEN 'Category is empty'
            ELSE 'Unknown error'
        END
    FROM inserted i
    WHERE i.Category_ID <= 0 OR i.Category IS NULL OR LTRIM(RTRIM(i.Category)) = '';

    INSERT INTO dbo.Category (Category_ID, Category)
    SELECT i.Category_ID, i.Category
    FROM inserted i
    WHERE i.Category_ID > 0 AND i.Category IS NOT NULL AND LTRIM(RTRIM(i.Category)) <> '';
END;

--###################################################################################################################################################

CREATE TRIGGER trg_Subcategory_Validation
ON dbo.Subcategory
INSTEAD OF INSERT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO dbo.Subcategory_Errors 
    (Subcategory_ID, Subcategory_name, Category_ID, Error_Reason)
    SELECT 
        i.Subcategory_ID, i.Subcategory_name, i.Category_ID,
        CASE 
            WHEN i.Subcategory_ID <= 0 THEN 'Invalid Subcategory_ID'
            WHEN i.Category_ID <= 0 THEN 'Invalid Category_ID'
            WHEN i.Subcategory_name IS NULL OR LTRIM(RTRIM(i.Subcategory_name)) = '' THEN 'Subcategory_name is empty'
            ELSE 'Unknown error'
        END
    FROM inserted i
    WHERE 
        i.Subcategory_ID <= 0 OR 
        i.Category_ID <= 0 OR 
        i.Subcategory_name IS NULL OR LTRIM(RTRIM(i.Subcategory_name)) = '';

    INSERT INTO dbo.Subcategory (Subcategory_ID, Subcategory_name, Category_ID)
    SELECT i.Subcategory_ID, i.Subcategory_name, i.Category_ID
    FROM inserted i
    WHERE 
        i.Subcategory_ID > 0 AND 
        i.Category_ID > 0 AND 
        i.Subcategory_name IS NOT NULL AND LTRIM(RTRIM(i.Subcategory_name)) <> '';
END;

--###########################################################################################################################################


CREATE TRIGGER trg_Addr_Validation
ON dbo.Addr
INSTEAD OF INSERT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO dbo.Addr_Errors (Add_ID, Region, Country, State, City, Postal_Code, Error_Reason)
    SELECT 
        i.Add_ID, i.Region, i.Country, i.State, i.City, i.Postal_Code,
        'Invalid or missing address data'
    FROM inserted i
    WHERE 
        i.Add_ID <= 0 OR
        i.Region IS NULL OR LTRIM(RTRIM(i.Region)) = '' OR
        i.Country IS NULL OR LTRIM(RTRIM(i.Country)) = '' OR
        i.State IS NULL OR LTRIM(RTRIM(i.State)) = '' OR
        i.City IS NULL OR LTRIM(RTRIM(i.City)) = '' OR
        i.Postal_Code IS NULL OR LTRIM(RTRIM(i.Postal_Code)) = '';

    INSERT INTO dbo.Addr (Add_ID, Region, Country, State, City, Postal_Code)
    SELECT i.Add_ID, i.Region, i.Country, i.State, i.City, i.Postal_Code
    FROM inserted i
    WHERE 
        i.Add_ID > 0 AND
        i.Region IS NOT NULL AND LTRIM(RTRIM(i.Region)) <> '' AND
        i.Country IS NOT NULL AND LTRIM(RTRIM(i.Country)) <> '' AND
        i.State IS NOT NULL AND LTRIM(RTRIM(i.State)) <> '' AND
        i.City IS NOT NULL AND LTRIM(RTRIM(i.City)) <> '' AND
        i.Postal_Code IS NOT NULL AND LTRIM(RTRIM(i.Postal_Code)) <> '';
END;


--################################################################################################################################################

CREATE TRIGGER trg_OrderDetails_Validation
ON dbo.Order_Details
INSTEAD OF INSERT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO dbo.Order_Details_Errors 
    (order_detail_id, Quantity, Profit, Sales, Discount, Shipping_Cost, order_id, prod_id, SellerID, Error_Reason)
    SELECT 
        i.order_detail_id, i.Quantity, i.Profit, i.Sales, i.Discount, i.Shipping_Cost, 
        i.order_id, i.prod_id, i.SellerID,
        'Invalid numeric or foreign key values'
    FROM inserted i
    WHERE 
        i.Quantity < 0 OR i.Sales < 0 OR i.Profit < 0 OR i.Discount < 0 OR i.Shipping_Cost < 0 OR
        i.order_id <= 0 OR i.prod_id <= 0 OR i.SellerID <= 0;

    INSERT INTO dbo.Order_Details 
    (order_detail_id, Quantity, Profit, Sales, Discount, Shipping_Cost, order_id, prod_id, SellerID)
    SELECT 
        i.order_detail_id, i.Quantity, i.Profit, i.Sales, i.Discount, i.Shipping_Cost, 
        i.order_id, i.prod_id, i.SellerID
    FROM inserted i
    WHERE 
        i.Quantity >= 0 AND i.Sales >= 0 AND i.Profit >= 0 AND i.Discount >= 0 AND i.Shipping_Cost >= 0 AND
        i.order_id > 0 AND i.prod_id > 0 AND i.SellerID > 0;
END;

--###################################################################################################################################################


CREATE TRIGGER trg_Product_Validation
ON dbo.Product
INSTEAD OF INSERT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO dbo.Product_Errors (Prod_ID, Subcategory_ID, Product_Name, Error_Reason)
    SELECT 
        i.Prod_ID, i.Subcategory_ID, i.Product_Name,
        CASE 
            WHEN i.Prod_ID <= 0 THEN 'Invalid Prod_ID'
            WHEN i.Subcategory_ID <= 0 THEN 'Invalid Subcategory_ID'
            WHEN i.Product_Name IS NULL OR LTRIM(RTRIM(i.Product_Name)) = '' THEN 'Product_Name is empty'
            ELSE 'Unknown error'
        END
    FROM inserted i
    WHERE i.Prod_ID <= 0 OR i.Subcategory_ID <= 0 OR i.Product_Name IS NULL OR LTRIM(RTRIM(i.Product_Name)) = '';

    INSERT INTO dbo.Product (Prod_ID, Subcategory_ID, Product_Name)
    SELECT i.Prod_ID, i.Subcategory_ID, i.Product_Name
    FROM inserted i
    WHERE i.Prod_ID > 0 AND i.Subcategory_ID > 0 AND i.Product_Name IS NOT NULL AND LTRIM(RTRIM(i.Product_Name)) <> '';
END;

--########################################################################################################################################################3



CREATE TRIGGER trg_Seller_Validation
ON dbo.Seller
INSTEAD OF INSERT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO dbo.Seller_Errors (SellerID, FirstName, LastName, Date_Of_Join, Error_Reason)
    SELECT 
        i.SellerID, i.FirstName, i.LastName, i.Date_Of_Join,
        CASE 
            WHEN i.SellerID <= 0 THEN 'Invalid SellerID'
            WHEN i.FirstName IS NULL OR LTRIM(RTRIM(i.FirstName)) = '' THEN 'FirstName is empty'
            WHEN i.LastName IS NULL OR LTRIM(RTRIM(i.LastName)) = '' THEN 'LastName is empty'
            WHEN i.Date_Of_Join > GETDATE() THEN 'Date_Of_Join in the future'
            ELSE 'Unknown error'
        END
    FROM inserted i
    WHERE 
        i.SellerID <= 0 OR
        i.FirstName IS NULL OR LTRIM(RTRIM(i.FirstName)) = '' OR
        i.LastName IS NULL OR LTRIM(RTRIM(i.LastName)) = '' OR
        i.Date_Of_Join > GETDATE();

    INSERT INTO dbo.Seller (SellerID, FirstName, LastName, Date_Of_Join)
    SELECT i.SellerID, i.FirstName, i.LastName, i.Date_Of_Join
    FROM inserted i
    WHERE 
        i.SellerID > 0 AND
        i.FirstName IS NOT NULL AND LTRIM(RTRIM(i.FirstName)) <> '' AND
        i.LastName IS NOT NULL AND LTRIM(RTRIM(i.LastName)) <> '' AND
        i.Date_Of_Join <= GETDATE();
END;




--##############################################################################################################################################3