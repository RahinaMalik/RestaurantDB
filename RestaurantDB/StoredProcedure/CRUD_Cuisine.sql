USE [RestaurantDB]
GO
/****** Object:  StoredProcedure [dbo].[CRUD_Cuisine]    Script Date: 13-09-2022 22:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[CRUD_Cuisine]  

@CuisineID    INTEGER = 0,
@RestaurantID INTEGER,
@CuisineName  NVARCHAR(50),
@Query INT

AS
BEGIN
/*--------Insert Operation-------*/
IF (@Query = 1)
BEGIN
INSERT INTO Cuisine(
RestaurantID,
CuisineName
)    
VALUES     
( 
@RestaurantID,
@CuisineName
)

IF(@@ROWCOUNT>0)
BEGIN
SELECT 'Inserted'
END
END

/*--------Update Operation-------*/
IF(@Query = 2)
BEGIN
UPDATE Cuisine
SET RestaurantID = @RestaurantID,
CuisineName = @CuisineName
WHERE Cuisine.CuisineID = @CuisineID

SELECT 'Updated'
END

/*--------Delete Operation-------*/
IF(@Query = 3)
BEGIN
DELETE FROM Cuisine WHERE Cuisine.CuisineID = @CuisineID
SELECT 'Deleted'
END

/*--------Display Records-------*/
IF(@Query = 4)
BEGIN
SELECT * FROM Cuisine
SELECT 'Display All Records'
END

/*--------Get Selected Record By ID-------*/
IF(@Query = 5)
BEGIN
SELECT * FROM Cuisine WHERE Cuisine.CuisineID = @CuisineID
SELECT 'Display Selected Record'
END

END