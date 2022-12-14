USE [RestaurantDB]
GO
/****** Object:  StoredProcedure [dbo].[CRUD_DiningTable]    Script Date: 13-09-2022 22:57:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[CRUD_DiningTable]  

@DiningTableID INTEGER = 0,
@RestaurantID INTEGER,
@Location  NVARCHAR(100),
@Query INT

AS
BEGIN
/*--------Insert Operation-------*/
IF (@Query = 1)
BEGIN
INSERT INTO DiningTable(
RestaurantID,
Location
)    
VALUES     
( 
@RestaurantID,
@Location 
)

IF(@@ROWCOUNT>0)
BEGIN
SELECT 'Inserted'
END
END

/*--------Update Operation-------*/
IF(@Query = 2)
BEGIN
UPDATE DiningTable
SET RestaurantID = @RestaurantID,
Location = @Location
WHERE DiningTable.DiningTableID = @DiningTableID

SELECT 'Updated'
END

/*--------Delete Operation-------*/
IF(@Query = 3)
BEGIN
DELETE FROM DiningTable WHERE DiningTable.DiningTableID = @DiningTableID
SELECT 'Deleted'
END

/*--------Display Records-------*/
IF(@Query = 4)
BEGIN
SELECT * FROM DiningTable
SELECT 'Display All Records'
END

/*--------Get Selected Record By ID-------*/
IF(@Query = 5)
BEGIN
SELECT * FROM DiningTable WHERE DiningTable.DiningTableID = @DiningTableID
SELECT 'Display Selected Record'
END

END