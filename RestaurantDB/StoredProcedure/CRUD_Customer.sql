USE [RestaurantDB]
GO
/****** Object:  StoredProcedure [dbo].[CRUD_Customer]    Script Date: 13-09-2022 22:55:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[CRUD_Customer]  

@CustomerID INTEGER = 0,
@RestaurantID INTEGER,
@CustomerName  NVARCHAR(100),
@MobileNo NVARCHAR(10),
@Query INT

AS
BEGIN
/*--------Insert Operation-------*/
IF (@Query = 1)
BEGIN
-- Only character allowed, Not Special Character,Integer
IF (@CustomerName LIKE '%[a-zA-Z]%' AND LEN(@CustomerName) >= 10)
BEGIN
SELECT @MobileNo
	-- Allow digit only remaining to check length 
	IF(LEN(@MobileNo)=10 AND @MobileNo LIKE '%[0-9]%')
	BEGIN
			INSERT INTO Customer(
					RestaurantID,
					CustomerName,
					MobileNo
			)    
			VALUES     
			( 
					@RestaurantID,
					@CustomerName, 
					@MobileNo
			)
			IF(@@ROWCOUNT>0)
			BEGIN
			SELECT 'Inserted'
			END		
	END
	ELSE
	BEGIN
		SELECT 'Incorrect Mobile Number';
	END
END
ELSE
BEGIN
		SELECT 'Enter Appropriate Customer Name'
END
END

/*--------Update Operation-------*/
IF(@Query = 2)
BEGIN
UPDATE Customer
SET RestaurantID = @RestaurantID,
CustomerName = @CustomerName,
MobileNo = @MobileNo
WHERE Customer.CustomerID = @CustomerID

SELECT 'Updated'
END

/*--------Delete Operation-------*/
IF(@Query = 3)
BEGIN
DELETE FROM Customer WHERE Customer.CustomerID = @CustomerID
SELECT 'Deleted'
END

/*--------Display Records-------*/
IF(@Query = 4)
BEGIN
SELECT * FROM Customer
SELECT 'Display All Records'
END

/*--------Get Selected Record By ID-------*/
IF(@Query = 5)
BEGIN
SELECT * FROM Customer WHERE Customer.CustomerID = @CustomerID
SELECT 'Display Selected Record'
END

END