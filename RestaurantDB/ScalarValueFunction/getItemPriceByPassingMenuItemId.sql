USE [RestaurantDB]
GO
/****** Object:  UserDefinedFunction [dbo].[getItemPriceByPassingMenuItemId]    Script Date: 13-09-2022 23:31:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER FUNCTION [dbo].[getItemPriceByPassingMenuItemId](@MenuItemID int)
RETURNS int
AS
BEGIN
    DECLARE @ItemPrice float;
    SELECT @ItemPrice = MenuItem.ItemPrice  FROM dbo.RestaurantMenuItem MenuItem
    WHERE MenuItemID = @MenuItemID;
     IF (@ItemPrice IS NULL)
        SET @ItemPrice = 0;
    RETURN @ItemPrice;
END;

/*  Execute Scalar function as below mentioned 
SELECT [dbo].getItemPriceByPassingMenuItemId(1) AS ItemPrice*/


