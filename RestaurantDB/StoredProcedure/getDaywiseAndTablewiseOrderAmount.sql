USE [RestaurantDB]
GO
/****** Object:  StoredProcedure [dbo].[getDaywiseAndTablewiseOrderAmount]    Script Date: 13-09-2022 23:05:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Create procedure to list daywise, tablewise total order amounT
ALTER PROCEDURE [dbo].[getDaywiseAndTablewiseOrderAmount]  

AS
BEGIN

	SELECT res.RestaurantName,ord.OrderDate,ord.DiningTableId,DAY(ord.OrderDate) as Day,SUM(ord.OrderAmount) as TotalOrderAmount 
	FROM OrderTable ord,DiningTable tbl, Restaurant res
	WHERE ord.DiningTableId = tbl.DiningTableID AND ord.RestaurantID = res.RestaurantID AND CONVERT (Date, ord.OrderDate) = CONVERT (Date, GETDATE())
	GROUP BY DAY(ord.OrderDate),ord.DiningTableId,res.RestaurantName,ord.OrderDate

END


