USE [RestaurantDB]
GO
/****** Object:  StoredProcedure [dbo].[getListOfCurrentlyVacantTables]    Script Date: 13-09-2022 23:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[getListOfCurrentlyVacantTables]  

@RestaurantID  INTEGER

AS
BEGIN
	SELECT res.RestaurantName,track.TableStatus FROM Restaurant res  INNER JOIN DiningTable dining 
	ON res.RestaurantID = @RestaurantID and dining.RestaurantID = @RestaurantID  INNER JOIN DiningTableTrack track 
	ON track.DiningTableID = dining.DiningTableID AND track.TableStatus = 'Vacant'
END