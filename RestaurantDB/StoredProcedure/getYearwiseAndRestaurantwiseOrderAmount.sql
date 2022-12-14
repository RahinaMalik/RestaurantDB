USE [RestaurantDB]
GO
/****** Object:  StoredProcedure [dbo].[getYearwiseAndRestaurantwiseOrderAmount]    Script Date: 13-09-2022 23:17:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Create a procedure to display Restaurantwise, Yearwise total order amount
ALTER PROCEDURE [dbo].[getYearwiseAndRestaurantwiseOrderAmount]  

AS
BEGIN

SELECT res.RestaurantName,YEAR(ord.OrderDate),SUM(ord.OrderAmount) 
FROM Restaurant res,OrderTable ord WHERE res.RestaurantID = ord.RestaurantID GROUP BY YEAR(ord.OrderDate),res.RestaurantName

END


