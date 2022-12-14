USE [RestaurantDB]
GO
/****** Object:  StoredProcedure [dbo].[sp_geFilteredCustomerDetails]    Script Date: 14-09-2022 07:03:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Create procedure to list daywise, tablewise total order amounT
ALTER PROCEDURE [dbo].[sp_geFilteredCustomerDetails]  
		
		 @FilterBy NVARCHAR(MAX),
	     @OrderBy NVARCHAR(MAX),
		 @UserInput NVARCHAR(MAX)
AS
BEGIN
	
SELECT ord.OrderID,res.RestaurantName,ord.OrderDate,cust.CustomerName,ord.ItemQuantity,ord.OrderAmount,dining.DiningTableID,dining.Location
FROM Bills bills INNER JOIN Customer cust ON bills.CustomerID = cust.CustomerId INNER JOIN OrderTable ord on bills.OrderID=ord.OrderID  INNER JOIN Restaurant res ON bills.RestaurantID = res.RestaurantID 
INNER JOIN DiningTable dining ON ord.DiningTableId = dining.DiningTableID WHERE (@FilterBy is null or @FilterBy LIKE '%' + @UserInput + '%')  Order By + @OrderBy + ';'
  
  
EXEC sp_geFilteredCustomerDetails @FilterBy, @UserInput, @OrderBy;  
END
