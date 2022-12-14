USE [RestaurantDB]
GO
/****** Object:  UserDefinedFunction [dbo].[getOrderDetailsByOrderID]    Script Date: 13-09-2022 23:25:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER FUNCTION [dbo].[getOrderDetailsByOrderID]
(@OrderID INT
)
RETURNS TABLE
AS
RETURN
(SELECT *
 FROM dbo.OrderTable
 WHERE OrderID = @OrderID)


/*  Execute Scalar function as below mentioned 
SELECT [dbo].getItemPriceByPassingMenuItemId(1) AS ItemPrice*/


