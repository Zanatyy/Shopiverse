CREATE or alter PROCEDURE AddNewSeller
    @FirstName VARCHAR(50),
    @LastName VARCHAR(50),
    @SellerID INT

AS
BEGIN
    IF EXISTS (SELECT 1 FROM Seller WHERE SellerID = @SellerID)
    BEGIN
        PRINT 'Seller with this SellerID already exists.'
        RETURN
    END
    INSERT INTO Seller (FirstName, LastName, SellerID)
    VALUES (@FirstName, @LastName, @SellerID)

    PRINT 'New seller added successfully.'
END


EXEC AddNewSeller 
    @FirstName = 'Ahmed',
    @LastName = 'Ali',
    @SellerID = '1'




CREATE or alter PROCEDURE AddNewProduct
    @Prod_ID VARCHAR(50),
    @Product_Name VARCHAR(200)
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Product WHERE Prod_ID = @Prod_ID)
    BEGIN
        PRINT 'Product with this ID already exists.'
        RETURN
    END
	IF EXISTS (SELECT 1 FROM Product WHERE Product_Name = @Product_Name)
    BEGIN
        PRINT 'Product with this name already exists.'
        RETURN
    END

    INSERT INTO Product (Prod_ID, Product_Name)
    VALUES (@Prod_ID, @Product_Name)

    PRINT 'New product added successfully.'
END


EXEC AddNewProduct 
    @Prod_ID = 'FUR-ADV-10000002',
    @Product_Name = 'Wireless Mouse'







CREATE or ALTER PROCEDURE AddNewCustomer
    @Cust_ID VARCHAR(50),
    @Full_Name VARCHAR(100),
    @YOB BIGINT,
    @Kids BIGINT,
    @Segment VARCHAR(50)
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Customer WHERE Cust_ID = @Cust_ID)
    BEGIN
        PRINT 'Customer with this ID already exists.'
        RETURN
    END


    INSERT INTO Customer (Cust_ID, Full_Name, YOB, Kids, Segment)
    VALUES (@Cust_ID, @Full_Name, @YOB, @Kids, @Segment)

    PRINT 'Customer added successfully.'
END


EXEC AddNewCustomer 
    @Cust_ID = 'AH-465',
    @Full_Name = 'Omar Khaled',
    @YOB = 1990,
    @Kids = 2,
    @Segment = 'Home Office'

