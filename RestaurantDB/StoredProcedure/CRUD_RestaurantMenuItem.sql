USE [RestaurantDB]
GO
/****** Object:  StoredProcedure [dbo].[CRUD_RestaurantMenuItem]    Script Date: 13-09-2022 23:04:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[CRUD_RestaurantMenuItem]  

@MenuItemID    INTEGER = 0,
@CuisineID INTEGER,
@ItemName  NVARCHAR(100),
@ItemPrice FLOAT,
@Query INT

AS
BEGIN
/*--------Insert Operation-------*/
IF (@Query = 1)
BEGIN
INSERT INTO RestaurantMenuItem(
CuisineID,
ItemName,
ItemPrice
)    
VALUES     
( 
@CuisineID,
@ItemName,
@ItemPrice
)

IF(@@ROWCOUNT>0)
BEGIN
SELECT 'Inserted'
END
END

/*--------Update Operation-------*/
IF(@Query = 2)
BEGIN
UPDATE RestaurantMenuItem
SET CuisineID = @CuisineID,
ItemName = @ItemName,
ItemPrice = @ItemPrice
WHERE RestaurantMenuItem.MenuItemID = @MenuItemID

SELECT 'Updated'
END

/*--------Delete Operation-------*/
IF(@Query = 3)
BEGIN
DELETE FROM RestaurantMenuItem WHERE RestaurantMenuItem.MenuItemID = @MenuItemID
SELECT 'Deleted'
END

/*--------Display Records-------*/
IF(@Query = 4)
BEGIN
SELECT * FROM RestaurantMenuItem
SELECT 'Display All Records'
END

/*--------Get Selected Record By ID-------*/
IF(@Query = 5)
BEGIN
SELECT * FROM RestaurantMenuItem WHERE RestaurantMenuItem.MenuItemID = @MenuItemID
SELECT 'Display Selected Record'
END

END