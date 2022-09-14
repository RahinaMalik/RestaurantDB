USE [RestaurantDB]
GO

/****** Object:  Table [dbo].[Bills]    Script Date: 13-09-2022 22:37:06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Bills](
	[BillsID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[RestaurantID] [int] NOT NULL,
	[BillAmount] [float] NOT NULL,
	[CustomerID] [int] NOT NULL,
 CONSTRAINT [PK_BillsID] PRIMARY KEY CLUSTERED 
(
	[BillsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Bills]  WITH CHECK ADD  CONSTRAINT [FK_Bills_CustomerID] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO

ALTER TABLE [dbo].[Bills] CHECK CONSTRAINT [FK_Bills_CustomerID]
GO

ALTER TABLE [dbo].[Bills]  WITH CHECK ADD  CONSTRAINT [FK_Bills_OrderID] FOREIGN KEY([OrderID])
REFERENCES [dbo].[OrderTable] ([OrderID])
GO

ALTER TABLE [dbo].[Bills] CHECK CONSTRAINT [FK_Bills_OrderID]
GO

ALTER TABLE [dbo].[Bills]  WITH CHECK ADD  CONSTRAINT [FK_Bills_RestaurantID] FOREIGN KEY([RestaurantID])
REFERENCES [dbo].[Restaurant] ([RestaurantID])
GO

ALTER TABLE [dbo].[Bills] CHECK CONSTRAINT [FK_Bills_RestaurantID]
GO


