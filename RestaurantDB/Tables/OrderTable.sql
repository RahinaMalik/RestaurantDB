USE [RestaurantDB]
GO

/****** Object:  Table [dbo].[OrderTable]    Script Date: 13-09-2022 22:48:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[OrderTable](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[RestaurantID] [int] NOT NULL,
	[MenuItemID] [int] NOT NULL,
	[ItemQuantity] [int] NOT NULL,
	[OrderAmount] [float] NOT NULL,
	[DiningTableId] [int] NOT NULL,
 CONSTRAINT [PK_OrderID] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[OrderTable]  WITH CHECK ADD  CONSTRAINT [FK_DiningTableId] FOREIGN KEY([DiningTableId])
REFERENCES [dbo].[DiningTable] ([DiningTableID])
GO

ALTER TABLE [dbo].[OrderTable] CHECK CONSTRAINT [FK_DiningTableId]
GO

ALTER TABLE [dbo].[OrderTable]  WITH CHECK ADD  CONSTRAINT [FK_MenuItemID] FOREIGN KEY([MenuItemID])
REFERENCES [dbo].[RestaurantMenuItem] ([MenuItemID])
GO

ALTER TABLE [dbo].[OrderTable] CHECK CONSTRAINT [FK_MenuItemID]
GO

ALTER TABLE [dbo].[OrderTable]  WITH CHECK ADD  CONSTRAINT [FK_Order_RestaurantID] FOREIGN KEY([RestaurantID])
REFERENCES [dbo].[Restaurant] ([RestaurantID])
GO

ALTER TABLE [dbo].[OrderTable] CHECK CONSTRAINT [FK_Order_RestaurantID]
GO

ALTER TABLE [dbo].[OrderTable]  WITH CHECK ADD  CONSTRAINT [Check_ItemQuantity] CHECK  (([ItemQuantity]>(0)))
GO

ALTER TABLE [dbo].[OrderTable] CHECK CONSTRAINT [Check_ItemQuantity]
GO


