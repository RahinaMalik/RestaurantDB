USE [RestaurantDB]
GO
/****** Object:  StoredProcedure [dbo].[CRUD_Restaurant]    Script Date: 13-09-2022 23:02:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[CRUD_Restaurant]  

@RestaurantID  INTEGER = 0,
@RestaurantName NVARCHAR(200),
@Address        NVARCHAR(500),
@MobileNo       NVARCHAR(10),
@Query INT

AS
BEGIN
/*--------Insert Operation-------*/
IF (@Query = 1)
BEGIN

-- Address should be atleast more than 10 characters and atleast 1st letter of the address column should be numeric only 
IF(LEFT(@Address, 1) like '[0-9]%'  AND LEN(@Address) >= 10)
BEGIN
	IF(@MobileNo LIKE '%[0-9]%' AND LEN(@MobileNo)=10)
	BEGIN

		INSERT INTO Restaurant(
			RestaurantName,
			Address,
			MobileNo
		)    
		VALUES     
		( 
			@RestaurantName,
			@Address,
			@MobileNo
		)

		IF(@@ROWCOUNT>0)
		BEGIN
			SELECT 'Inserted'
		END
	END
	ELSE
		BEGIN
			SELECT 'Incorrect Number'
		END
END
ELSE
BEGIN
		SELECT 'Address should be 10 character and 1st letter should be number'
END
END

/*--------Update Operation-------*/
IF(@Query = 2)
BEGIN
UPDATE Restaurant
SET RestaurantName = @RestaurantName,
Address = @Address,
MobileNo = @MobileNo
WHERE Restaurant.RestaurantID = @RestaurantID

SELECT 'Updated'
END

/*--------Delete Operation-------*/
IF(@Query = 3)
BEGIN
DELETE FROM Restaurant WHERE Restaurant.RestaurantID = @RestaurantID
SELECT 'Deleted'
END

/*--------Display Records-------*/
IF(@Query = 4)
BEGIN
SELECT * FROM Restaurant
SELECT 'Display All Records'
END

/*--------Get Selected Record By ID-------*/
IF(@Query = 5)
BEGIN
SELECT * FROM Restaurant WHERE Restaurant.RestaurantID = @RestaurantID
SELECT 'Display Selected Record'
END

END