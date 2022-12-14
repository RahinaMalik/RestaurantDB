USE [RestaurantDB]
GO
/****** Object:  StoredProcedure [dbo].[CRUD_OrderTable]    Script Date: 13-09-2022 23:01:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[CRUD_OrderTable]  

@OrderID INTEGER = 0,
@OrderDate DATETIME = DEFAULT,
@RestaurantID INTEGER,
@MenuItemID INTEGER,
@ItemQuantity INTEGER,
@DiningTableId INTEGER,
@TableStatus NVARCHAR(100),/*Update table status in DiningTableTrack*/
@Query INT

AS
BEGIN

	/*--------Check Table Status-------*/
	DECLARE @Status NVARCHAR(100)
	Select @Status = D.TableStatus from DiningTableTrack D where  D.DiningTableID = @DiningTableId;

	
		/* Get ItemPrice by passing MenuItemID and get result from scalar function getItemPriceByPassingMenuItemId*/
	DECLARE @ItemPrice int,
	@OrderAmount FLOAT
	set @ItemPrice = [dbo].getItemPriceByPassingMenuItemId(@MenuItemID)


	/*Count Order Amount based on Item Quantity*/
	SET @OrderAmount = @ItemQuantity * @ItemPrice
	SELECT @OrderAmount

/*--------Insert Operation-------*/
IF (@Query = 1)
BEGIN

IF(@Status = 'Vacant')
BEGIN

		INSERT INTO OrderTable 
		(
		OrderDate,
		RestaurantID,
		MenuItemID,
		ItemQuantity,
		OrderAmount,
		DiningTableId
		)    
		VALUES     
		( 
		ISNULL(@OrderDate, GETDATE()),
		@RestaurantID, 
		@MenuItemID,
		@ItemQuantity,
		@OrderAmount,
		@DiningTableId
		)

		--Update Vacant table status as "Occupied" in DiningTableTrack
		UPDATE DiningTableTrack
		SET TableStatus = @TableStatus
		WHERE DiningTableTrack.DiningTableID = @DiningTableId

		IF(@@ROWCOUNT>0)
		BEGIN
		SELECT 'Inserted in OrderTable and Updated in DiningTableTrack'
		END
END
ELSE
BEGIN
		SELECT 'Table is already Occupied'
END


END

/*--------Update Operation-------*/
IF(@Query = 2)
BEGIN
	UPDATE OrderTable
	SET

	RestaurantID = @RestaurantID,
	OrderDate = @OrderDate,
	MenuItemID = @MenuItemID,
	ItemQuantity = @ItemQuantity,
	OrderAmount = @OrderAmount,
	DiningTableId = @DiningTableId
	WHERE OrderTable.OrderID = @OrderID

	SELECT 'Updated'
END

/*--------Delete Operation-------*/
IF(@Query = 3)
BEGIN
	DELETE FROM OrderTable WHERE OrderTable.OrderID = @OrderID
	SELECT 'Deleted'
END

/*--------Display Records-------*/
IF(@Query = 4)
BEGIN
	SELECT * FROM OrderTable
	SELECT 'Display All Records'
END

/*--------Get Selected Record By ID-------*/
IF(@Query = 5)
BEGIN
	SELECT * FROM OrderTable WHERE OrderTable.OrderID = @OrderID
	SELECT 'Display Selected Record'
END

END
