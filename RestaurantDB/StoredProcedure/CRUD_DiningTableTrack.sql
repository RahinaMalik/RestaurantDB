USE [RestaurantDB]
GO
/****** Object:  StoredProcedure [dbo].[CRUD_DiningTableTrack]    Script Date: 13-09-2022 22:59:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[CRUD_DiningTableTrack]  

@DiningTableTrackID INTEGER = 0,
@DiningTableID INTEGER,
@TableStatus  NVARCHAR(100),
@Query INT

AS
BEGIN
/*--------Insert Operation-------*/
IF (@Query = 1)
BEGIN
INSERT INTO DiningTableTrack(
DiningTableID,
TableStatus
)    
VALUES     
( 
@DiningTableID,
@TableStatus 
)

IF(@@ROWCOUNT>0)
BEGIN
SELECT 'Inserted'
END
END

/*--------Update Operation-------*/
IF(@Query = 2)
BEGIN
UPDATE DiningTableTrack
SET DiningTableID = @DiningTableID,
TableStatus = @TableStatus
WHERE DiningTableTrack.DiningTableTrackID = @DiningTableTrackID

SELECT 'Updated'
END

/*--------Delete Operation-------*/
IF(@Query = 3)
BEGIN
DELETE FROM DiningTableTrack WHERE DiningTableTrack.DiningTableTrackID = @DiningTableTrackID
SELECT 'Deleted'
END

/*--------Display Records-------*/
IF(@Query = 4)
BEGIN
SELECT * FROM DiningTableTrack
SELECT 'Display All Records'
END

/*--------Get Selected Record By ID-------*/
IF(@Query = 5)
BEGIN
SELECT * FROM DiningTableTrack WHERE DiningTableTrack.DiningTableTrackID = @DiningTableTrackID
SELECT 'Display Selected Record'
END

END