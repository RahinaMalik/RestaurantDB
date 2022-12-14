USE [RestaurantDB]
GO
/****** Object:  StoredProcedure [dbo].[CRUD_Bills]    Script Date: 13-09-2022 22:53:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[CRUD_Bills]  
@BillsID INTEGER,
@OrderID INTEGER,
@BillStatus NVARCHAR(100),
@CustomerID INTEGER,
@Query INT

AS
BEGIN
/*--------Insert Operation-------*/
IF (@Query = 1)
BEGIN

DECLARE @OrderDate DATETIME,
		@RestaurantID INTEGER,
		@MenuItemID INTEGER,
		@ItemQuantity INTEGER,
		@BillAmount FLOAT,
		@DiningTableId INTEGER

SELECT @OrderDate=OrderDetails.OrderDate,
	   @RestaurantID=OrderDetails.RestaurantID,
	   @MenuItemID=OrderDetails.MenuItemID,
	   @ItemQuantity=OrderDetails.ItemQuantity,
	   @BillAmount=OrderDetails.OrderAmount,
	   @DiningTableId = OrderDetails.DiningTableId
	   FROM dbo.getOrderDetailsByOrderID(@OrderID) OrderDetails

INSERT INTO Bills(
		OrderID,
		RestaurantID,
		BillAmount,
		CustomerID
)    
VALUES     
( 
		@OrderID,
		@RestaurantID, 
		@BillAmount,
		@CustomerID
)

DECLARE @Status NVARCHAR(100)
	Select @Status = D.TableStatus from DiningTableTrack D where  D.DiningTableID = @DiningTableId;
IF(@Status = 'Occupied')
BEGIN
	UPDATE DiningTableTrack
	SET TableStatus = 'Vacant'
	WHERE DiningTableTrack.DiningTableID = @DiningTableId

END


IF(@@ROWCOUNT>0)
BEGIN
SELECT 'Inserted'
END
END

/*--------Update Operation-------*/
IF(@Query = 2)
BEGIN

IF(@BillStatus = 'processed')
BEGIN

UPDATE Bills
		SET OrderID = @OrderID,
		RestaurantID = @RestaurantID,
		BillAmount = @BillAmount,
		CustomerID = @CustomerID
		WHERE Bills.BillsID = @BillsID


END
END
ELSE
BEGIN
	SELECT 'Bill Already Processed'
END

/*--------Delete Operation-------*/
IF(@Query = 3)
IF(@BillStatus = 'processed')
BEGIN
	BEGIN
			DELETE FROM Bills WHERE Bills.BillsID = @BillsID
			SELECT 'Deleted'
	END
END
ELSE
BEGIN
	SELECT 'Bill already Processed'
END

/*--------Display Records-------*/
IF(@Query = 4)
BEGIN
		SELECT * FROM Bills
		SELECT 'Display All Records'
END

/*--------Get Selected Record By ID-------*/
IF(@Query = 5)
BEGIN
		SELECT * FROM Bills WHERE Bills.BillsID = @BillsID
		SELECT 'Display Selected Record'
END

END