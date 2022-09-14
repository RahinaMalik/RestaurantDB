USE [RestaurantDB]
GO

/****** Object:  Table [dbo].[DiningTableTrack]    Script Date: 13-09-2022 22:47:41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DiningTableTrack](
	[DiningTableTrackID] [int] IDENTITY(1,1) NOT NULL,
	[DiningTableID] [int] NOT NULL,
	[TableStatus] [nvarchar](100) NULL,
 CONSTRAINT [PK_DiningTableTrack] PRIMARY KEY CLUSTERED 
(
	[DiningTableTrackID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[DiningTableTrack]  WITH CHECK ADD  CONSTRAINT [FK_DiningTable_DiningTableID] FOREIGN KEY([DiningTableID])
REFERENCES [dbo].[DiningTable] ([DiningTableID])
GO

ALTER TABLE [dbo].[DiningTableTrack] CHECK CONSTRAINT [FK_DiningTable_DiningTableID]
GO


